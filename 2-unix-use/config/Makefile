#-----------------------
#Makefile
#(c) H.Buchmann FHNW 2014
#we are in work
#-----------------------
SYSROOT=../../images/root-fs/
PREFIX=../../toolchain/tc/bin/arm-linux-gnueabihf-
CFLAGS=-std=c99
CC=${PREFIX}gcc -O2 --sysroot=${SYSROOT}
LD=${PREFIX}ld 
CXX=${PREFIX}g++ --sysroot=${SYSROOT} -O2
CXXFLAGS=-std=c++11
LDFLAGS=-static
VPATH=../src
minimal-1:		minimal-1.o
minimal-1.o:		minimal-1.c
hello-world-c:		hello-world-c.o
hello-world-c.o:	hello-world-c.c

hello-world-cpp:	hello-world-cpp.cc
primes: 		primes.cc

hw-access:		hw-access.c
#------------------------ special cases
direct-call:		direct-call.o
	${LD} -o${@} ${^}
direct-call.o:		direct-call.S

clean:
	rm -rf *.o hello-world-c hello-world-cpp primes direct-call
