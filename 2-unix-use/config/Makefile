#-----------------------
#Makefile
#(c) H.Buchmann FHNW 2018
#we are in work
#-----------------------
TARGET=${PWD}/../target-root/
PREFIX=../tc/bin/arm-linux-gnueabihf-
CFLAGS=-std=c99
#CPPFLAGS=-I${TARGET}/usr/include/arm-linux-gnueabihf/
#LDFLAGS=${TARGET}/usr/lib/arm-linux-gnueabihf/crti.o

CC=${PREFIX}gcc  -O2 
LD=${PREFIX}ld 
CXX=${PREFIX}g++ 
CXXFLAGS=-std=c++11
LDFLAGS=-static
VPATH=../src 
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
