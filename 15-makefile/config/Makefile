#-------------------------
#Makefile
#(c) H.Buchmann FHNW 2015
#we are in work
#-------------------------
#the compiler/linker
TARGET=armv6l-unknown-linux-gnueabihf
TC=path-to-toolchain
SYSROOT=path-to-sysroot

CFLAGS=-std=c99

#for target
CC=${TC}/bin/${TARGET}-gcc --sysroot=${SYSROOT}
#for host
CC=gcc

#where to look for source files
VPATH=../src
all:	udp-server-demo udp-client-demo mouse-demo

#----------------------------- applications link
udp-server-demo:	udp-server-demo.o udp.o
udp-client-demo:	udp-client-demo.o udp.o

#----------------------------- compile 
udp-server-demo.o:	udp-server-demo.c udp.h
udp-client-demo.o:	udp-client-demo.c udp.h
udp.o:			udp.c udp.h

clean:
	rm -f *.o udp-server-demo udp-client-demo mouse-demo
