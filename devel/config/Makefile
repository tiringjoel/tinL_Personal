#-----------------------
#Makefile
#(c) H.Buchmann FHNW 2014
#we are in work
#-----------------------
TARGET=../target-root/
PREFIX=../tc/bin/armv6l-unknown-linux-gnueabihf-
CC=${PREFIX}gcc -O2 --sysroot=${TARGET}
LD=${PREFIX}ld
CXX=${PREFIX}g++ --sysroot=${TARGET} -O2
CXXFLAGS=-std=c++11
VPATH=../src

hello-world-c:		hello-world-c.o
hello-world-c.o:	hello-world-c.c

hello-world-cpp:	hello-world-cpp.cc
primes: 		primes.cc

#------------------------ special cases
direct-call:		direct-call.o
	${LD} -o${@} ${^}
direct-call.o:		direct-call.S

clean:
	rm -rf *.o hello-world-c hello-world-cpp primes direct-call
