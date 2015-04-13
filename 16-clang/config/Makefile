#-------------------------
#Makefile
#(c) H.Buchmann FHNW 2015
#we are in work
#-------------------------
#the compiler/linker
TARGET=armv6l-unknown-linux-gnueabihf
TC=../../12-toolchain/tc/
SYSROOT=../../resources/target-root/

CFLAGS=-std=c99

#for target
CC=${TC}/bin/${TARGET}-gcc --sysroot=${SYSROOT}
#for host
#CC=gcc
CC=clang --target=arm-none-linux-gnueabi --sysroot=${SYSROOT}
LD=${TC}/bin/${TARGET}-gcc --sysroot=${SYSROOT}
AS=${TC}/bin/${TARGET}-as


#----------------------------- linker pattern
%:	%.o;${LD} ${^} -o ${@}
%.o:	%.c;clang --target=arm-none-linux-gnueabi --sysroot=${SYSROOT} -S ${<} -o - | \
	${AS} -o ${@}
#where to look for source files
VPATH=../src
all:	hello-world

#----------------------------- applications link
hello-world:		hello-world.o

#----------------------------- compile 
hello-world.o:		hello-world.c

clean:
	rm -f *.o hello-world
