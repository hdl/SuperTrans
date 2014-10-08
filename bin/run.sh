cp trans.conf_1 trans.conf
cp sesc.conf_1 sesc.conf
#./sesc.trans ../benchmarks/stamp/bayes.mips.tm -t1 -v32 -r1024 -n2 -p20 -s0 -i2 -e2 >core1.bayes.lazy 2>&1
#mail -s 'core1.bayes.lazy' maoze365@gmail.com < core1.bayes.lazy
./sesc.trans ../benchmarks/stamp/vacation.mips.tm -c1 -n2 -q90 -u98 -r16384 -t409 >core1.vacation.lazy 2>&1
mail -s 'core1.vacation.lazy' maoze365@gmail.com < core1.vacation.lazy


cp trans.conf_2 trans.conf
cp sesc.conf_2 sesc.conf
./sesc.trans ../benchmarks/stamp/bayes.mips.tm -t2 -v32 -r1024 -n2 -p20 -s0 -i2 -e2 >core2.bayes.lazy 2>&1
mail -s 'core2.bayes.lazy' maoze365@gmail.com < core2.bayes.lazy
./sesc.trans ../benchmarks/stamp/vacation.mips.tm -c2 -n2 -q90 -u98 -r16384 -t409 >core2.vacation.lazy 2>&1
mail -s 'core2.vacation.lazy' maoze365@gmail.com < core2.vacation.lazy


cp trans.conf_4 trans.conf
cp sesc.conf_4 sesc.conf
./sesc.trans ../benchmarks/stamp/bayes.mips.tm -t4 -v32 -r1024 -n2 -p20 -s0 -i2 -e2 >core4.bayes.lazy 2>&1
mail -s 'core4.bayes.lazy' maoze365@gmail.com < core4.bayes.lazy
./sesc.trans ../benchmarks/stamp/vacation.mips.tm -c4 -n2 -q90 -u98 -r16384 -t409 >core4.vacation.lazy 2>&1
mail -s 'core4.vacation.lazy' maoze365@gmail.com < core4.vacation.lazy


cp trans.conf_8 trans.conf
cp sesc.conf_8 sesc.conf
./sesc.trans ../benchmarks/stamp/bayes.mips.tm -t8 -v32 -r1024 -n2 -p20 -s0 -i2 -e2 >core8.bayes.lazy 2>&1
mail -s 'core8.bayes.lazy' maoze365@gmail.com < core8.bayes.lazy
./sesc.trans ../benchmarks/stamp/vacation.mips.tm -c8 -n2 -q90 -u98 -r16384 -t409 >core8.vacation.lazy 2>&1
mail -s 'core8.vacation.lazy' maoze365@gmail.com < core8.vacation.lazy

cp trans.conf_16 trans.conf
cp sesc.conf_16 sesc.conf
./sesc.trans ../benchmarks/stamp/bayes.mips.tm -t16 -v32 -r1024 -n2 -p20 -s0 -i2 -e2 >core16.bayes.lazy 2>&1
mail -s 'core16.bayes.lazy' maoze365@gmail.com < core16.bayes.lazy
./sesc.trans ../benchmarks/stamp/vacation.mips.tm -c16 -n2 -q90 -u98 -r16384 -t409 >core16.vacation.lazy 2>&1
mail -s 'core16.vacation.lazy' maoze365@gmail.com < core16.vacation.lazy
