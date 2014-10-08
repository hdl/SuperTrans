cp trans.conf_1 trans.conf
cp sesc.conf_1 sesc.conf
#./sesc.trans ../benchmarks/stamp/bayes.mips.tm -t1 -v32 -r1024 -n2 -p20 -s0 -i2 -e2 >core1.bayes 2>&1
#mail -s 'core1.bayes' maoze365@gmail.com < core1.bayes
./sesc.trans ../benchmarks/stamp/vacation.mips.tm -c1 -n2 -q90 -u98 -r16384 -t409 >core1.vacation.eager 2>&1
mail -s 'core1.vacation.eager' maoze365@gmail.com < core1.vacation.eager


cp trans.conf_2 trans.conf
cp sesc.conf_2 sesc.conf
./sesc.trans ../benchmarks/stamp/bayes.mips.tm -t2 -v32 -r1024 -n2 -p20 -s0 -i2 -e2 >core2.bayes 2>&1
mail -s 'core2.bayes' maoze365@gmail.com < core2.bayes
./sesc.trans ../benchmarks/stamp/vacation.mips.tm -c2 -n2 -q90 -u98 -r16384 -t409 >core2.vacation.eager 2>&1
mail -s 'core2.vacation.eager' maoze365@gmail.com < core2.vacation.eager


cp trans.conf_4 trans.conf
cp sesc.conf_4 sesc.conf
./sesc.trans ../benchmarks/stamp/bayes.mips.tm -t4 -v32 -r1024 -n2 -p20 -s0 -i2 -e2 >core4.bayes 2>&1
mail -s 'core4.bayes' maoze365@gmail.com < core4.bayes
./sesc.trans ../benchmarks/stamp/vacation.mips.tm -c4 -n2 -q90 -u98 -r16384 -t409 >core4.vacation.eager 2>&1
mail -s 'core4.vacation.eager' maoze365@gmail.com < core4.vacation.eager


cp trans.conf_8 trans.conf
cp sesc.conf_8 sesc.conf
./sesc.trans ../benchmarks/stamp/bayes.mips.tm -t8 -v32 -r1024 -n2 -p20 -s0 -i2 -e2 >core8.bayes 2>&1
mail -s 'core8.bayes' maoze365@gmail.com < core8.bayes
./sesc.trans ../benchmarks/stamp/vacation.mips.tm -c8 -n2 -q90 -u98 -r16384 -t409 >core8.vacation.eager 2>&1
mail -s 'core8.vacation.eager' maoze365@gmail.com < core8.vacation.eager

cp trans.conf_16 trans.conf
cp sesc.conf_16 sesc.conf
./sesc.trans ../benchmarks/stamp/bayes.mips.tm -t16 -v32 -r1024 -n2 -p20 -s0 -i2 -e2 >core16.bayes 2>&1
mail -s 'core16.bayes' maoze365@gmail.com < core16.bayes
./sesc.trans ../benchmarks/stamp/vacation.mips.tm -c16 -n2 -q90 -u98 -r16384 -t409 >core16.vacation.eager 2>&1
mail -s 'core16.vacation.eager' maoze365@gmail.com < core16.vacation.eager
