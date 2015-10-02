#-----------------------
#Makefile
#(c) H.Buchmann FHNW 2014
#we are in work
#-----------------------
SYSROOT=../target-root
PREFIX=../tc/bin/arm-linux-gnueabihf-
CFLAGS=-std=c99
CC=${PREFIX}gcc -O2 --sysroot=${SYSROOT}
LD=${PREFIX}ld 
CXX=${PREFIX}g++ --sysroot=${SYSROOT} -O2
CXXFLAGS=-std=c++11
###LDFLAGS=-static
VPATH=../src

#compile/link in ome step
hello-world-c:		hello-world-c.c
minimal-1:		minimal-1.c
minimal-2:		minimal-2.c

#------------------------ special cases
direct-call:		direct-call.o
	${LD} -o${@} ${^}
direct-call.o:		direct-call.S

clean:
	rm -rf *.o hello-world-c direct-call
