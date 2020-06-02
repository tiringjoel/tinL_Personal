#------------------------
#Makefile
#(c) H.Buchmann FHNW 2018
#------------------------
TARGET=${PWD}/../tc/bin/arm-linux-gnueabihf-
TARGET_ROOT=${PWD}/../../17-build/target-root
VPATH=../src

CC=${TARGET}gcc -O2 --sysroot=${TARGET_ROOT}
CXX=${TARGET}g++ -O2 --sysroot=${TARGET_ROOT}

syscall-c:		syscall-c.c
