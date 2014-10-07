cp trans.conf_1 trans.conf
cp sesc.conf_1 sesc.conf
# ./sesc.trans ../benchmarks/stamp/bayes.mips.tm -t16 -v32 -r1024 -n2 -p20 -s0 -i2 -e2 >core1.bayes 2>&1
# mail -s 'core1.bayes' maoze365@gmail.com < core1.bayes
./sesc.trans ../benchmarks/stamp/vacation.mips.tm -c16 -n2 -q90 -u98 -r16384 -t409 >core1.vacation 2>&1
mail -s 'core1.vacation' maoze365@gmail.com < core1.vacation


cp trans.conf_2 trans.conf
cp sesc.conf_2 sesc.conf
# ./sesc.trans ../benchmarks/stamp/bayes.mips.tm -t16 -v32 -r1024 -n2 -p20 -s0 -i2 -e2 >core2.bayes 2>&1
# mail -s 'core2.bayes' maoze365@gmail.com < core2.bayes
./sesc.trans ../benchmarks/stamp/vacation.mips.tm -c16 -n2 -q90 -u98 -r16384 -t409 >core2.vacation 2>&1
mail -s 'core2.vacation' maoze365@gmail.com < core2.vacation


cp trans.conf_4 trans.conf
cp sesc.conf_4 sesc.conf
# ./sesc.trans ../benchmarks/stamp/bayes.mips.tm -t16 -v32 -r1024 -n2 -p20 -s0 -i2 -e2 >core4.bayes 2>&1
# mail -s 'core4.bayes' maoze365@gmail.com < core4.bayes
./sesc.trans ../benchmarks/stamp/vacation.mips.tm -c16 -n2 -q90 -u98 -r16384 -t409 >core4.vacation 2>&1
mail -s 'core4.vacation' maoze365@gmail.com < core4.vacation


cp trans.conf_8 trans.conf
cp sesc.conf_8 sesc.conf
# ./sesc.trans ../benchmarks/stamp/bayes.mips.tm -t16 -v32 -r1024 -n2 -p20 -s0 -i2 -e2 >core8.bayes 2>&1
# mail -s 'core8.bayes' maoze365@gmail.com < core8.bayes
./sesc.trans ../benchmarks/stamp/vacation.mips.tm -c16 -n2 -q90 -u98 -r16384 -t409 >core8.vacation 2>&1
mail -s 'core8.vacation' maoze365@gmail.com < core8.vacation

cp trans.conf_16 trans.conf
cp sesc.conf_16 sesc.conf
# ./sesc.trans ../benchmarks/stamp/bayes.mips.tm -t16 -v32 -r1024 -n2 -p20 -s0 -i2 -e2 >core16.bayes 2>&1
# mail -s 'core16.bayes' maoze365@gmail.com < core16.bayes
./sesc.trans ../benchmarks/stamp/vacation.mips.tm -c16 -n2 -q90 -u98 -r16384 -t409 >core16.vacation 2>&1
mail -s 'core16.vacation' maoze365@gmail.com < core16.vacation
