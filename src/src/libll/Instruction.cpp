/* 
   SESC: Super ESCalar simulator
   Copyright (C) 2003 University of Illinois.

   Contributed by Jose Renau
                  Luis Ceze

This file is part of SESC.

SESC is free software; you can redistribute it and/or modify it under the terms
of the GNU General Public License as published by the Free Software Foundation;
either version 2, or (at your option) any later version.

SESC is    distributed in the  hope that  it will  be  useful, but  WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should  have received a copy of  the GNU General  Public License along with
SESC; see the file COPYING.  If not, write to the  Free Software Foundation, 59
Temple Place - Suite 330, Boston, MA 02111-1307, USA.
*/

/* This code is inspired in smt:scodes.c It translates MIPS codes to a
 * easier to manipulate format. MIPSInstruction.cpp, Instruction.h,
 * and ExecutionFlow.h should be the only files to modify if VESC is
 * ported to another fronted (embra,i386...)
 *
 */

#include "icode.h"
#include "opcodes.h"
#include "globals.h"

#include "Instruction.h"
#include "PPCDecoder.h"
#include "SescConf.h"
#include "TraceFlow.h"
#ifdef SESC_RSTTRACE
#include "RSTFlow.h"
#endif
#ifdef QEMU_DRIVEN
#include "qemu_sesc.h"
#endif

#if (defined MIPS_EMUL)
#include "EmulInit.h"
#else
void mint_init(int argc, char **argv, char **envp);
#endif
OP(mint_getpid);
int isFirstInFuncCall(unsigned int addr);
char *print_instr_regs(icode_ptr picode, thread_ptr pthread, int maxlen);

// iBJUncond is also true for all the conditional instruction
// marked as likely. If the compiler tells me that most of the
// time is taken. Do you believe the compiler?
// For crafty, the results are worse.

// Following the ISA advice can backfire through two places:
//
// 1-You have a very good predictor, and it's better than the ISA
// suggested.
//
// After playing with it for a while, I recommend not to follow the
// ISA advice
//
//#define FOLLOW_MIPSPRO_ADVICE 1

static const char *opcode2NameTable[] = {
  "iOpInvalid",
  "iALU",
  "iMult",
  "iDiv",
  "iBJ",
  "iLoad",
  "iStore",
  "fpALU",
  "fpMult",
  "fpDiv",
  "iFence",
  "iEvent"
};

static const char *InstSub_to_NameTable[] = {
  "iSubInvalid",
  "iNop",          // Nop
  "iMemory",       // Load & Store
  "iAtomicMemory", // Atomic Read or Write
  "iFetchOp",      // Fetch&Op IMem opcode
  "iMemFence",     // Release Consistency iMem opcode
  "iAcquire",      // Release Consistency iMem opcode
  "iRelease",      // Release Consistency iMem opcode
  "BJUncond",      // iBJ opcode
  "BJCall",        // iBJ opcode
  "BJRet",         // iBJ opcode
  "BJCond",        // iBJ opcode
  "iFake"
};


icode_ptr Instruction::LowerLimit;
icode_ptr Instruction::UpperLimit;

int Instruction::maxFuncID=0;

Instruction *Instruction::InstTable = 0;
Instruction::InstHash Instruction::instHash;

size_t Instruction::InstTableSize = 0;

void Instruction::initialize(int argc
                             ,char **argv
                             ,char **envp)
{
#ifdef SESC_RSTTRACE
  RSTFlow::setTraceFile(argv[2]);
#elif QEMU_DRIVEN
  ThreadContext::staticConstructor();
  qemu_loader(argc, argv);
#elif TRACE_DRIVEN
  const char *traceMode = SescConf->getCharPtr("","traceMode");
  printf("getting the trace mode parameter parameter from the Instruction.cpp file");
  if(argc < 1) {
    MSG("No trace parameter given");
    exit(0);
  }

  TraceFlow::setTraceFile(argv[2]);

  if(strcmp(traceMode, "ppctt6") == 0) {
    initializePPCTrace(argc, argv, envp);
  } else if(strcmp(traceMode, "simics") == 0) {
    //initializeSimicsTrace(argc, argv, envp);
  }
#elif (defined MIPS_EMUL)
  emulInit(argc, argv, envp);
#else
  initializeMINT(argc, argv, envp);
#endif
}  


void Instruction::finalize()
{
#ifdef TRACE_DRIVEN
  //TODO: go through the instHash deleting the insts
#else
    free(InstTable);
    InstTable = 0;
#endif
}

const char *Instruction::opcode2Name(InstType op)
{
  return opcode2NameTable[op];
}

const char *Instruction::subCode_to_Name(InstSubType op)
{
  return InstSub_to_NameTable[op];
}

void Instruction::dump(const char *str) const
{
  MSG("%s:0x%8x: reg[%2d] = reg[%2d] [%8s:%2d] reg[%2d] (uEvent=%d)", str,
      (int)getAddr(), dest, src1, opcode2Name(opcode), subCode, src2, uEvent);

#if !((defined TRACE_DRIVEN)||(defined MIPS_EMUL))
  // This is mint-only junk
  Itext[currentID()]->dump();
#endif
}
