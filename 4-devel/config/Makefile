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

#compile/link in one step
hello-world-c:		hello-world-c.c
minimal-1:		minimal-1.c
minimal-2:		minimal-2.c

#------------------------ link
udp-client-demo:	udp-client-demo.o udp.o
udp-server-demo:	udp-server-demo.o udp.o

#------------------------ compile
udp-client-demo.o:	udp-client-demo.c udp.h
udp-server-demo.o:	udp-server-demo.c udp.h
udp.o:			udp.c udp.h

#------------------------ special cases
direct-call:		direct-call.o
	${LD} -o${@} ${^}
direct-call.o:		direct-call.S

clean:
	rm -rf *.o hello-world-c direct-call
