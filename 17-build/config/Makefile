#-------------------
#Makefile
#(c) H.Buchmann FHNW 2015
#-------------------
#we are in work
TC=../tc/
PREFIX=arm-fhnw-linux-gnueabi
SYSROOT=../target-root
CROSS_COMPILE=${TC}/bin/${PREFIX}-
CC=${CROSS_COMPILE}gcc --sysroot=${SYSROOT}
CFLAGS=-O2 
CXX=${CROSS_COMPILE}g++ --sysroot=${SYSROOT} 
CXXFLAGS=${CFLAGS} -std=c++11
LD=${CROSS_COMPILE}ld
#CC=gcc
#LD=ld
#LDFLAGS=-static
VPATH=../src:../src/3rdparty:../modules
CPPFLAGS=-I../src -I../src/3rdparty -I../modules

hello-world:	hello-world.c

#------------------------- made with S
s-bare-init:	s-bare-init.o;${LD} -o${@} ${^}
s-bare-init.o:	s-bare-init.S

#------------------------- made with c
c-bare-init:	c-bare-init.o;${LD} -static -o ${@} ${^} -l c
c-bare-init.o:	c-bare-init.c

libc-bare-init: 	libc-bare-init.o
libc-bare-init.o:	libc-bare-init.c

#------------------------- made with c++
cpp-hello-world:	LDFLAGS=-static
cpp-hello-world: cpp-hello-world.cc

#------------------ not yet working
thread-demo-1:	LDFLAGS=-static -lpthread
thread-demo-1:	thread-demo-1.cc

#------------------ Dot-test
Dot_test:	Dot_test.o bcm2835.o
Dot_test.o:	Dot_test.c bcm2835.h
bcm2835.o:	bcm2835.c bcm2835.h

spidev_fdx:	spidev_fdx.c
spidev_test:	spidev_test.c

stmpe:		stmpe.o
stmpe.o:	stmpe.cc

dot-matrix:	dot-matrix.o max7219.o
max7219.o:	max7219.cc max7219.h
dot-matrix.o:	dot-matrix.cc max7219.h 

nmea-demo:	nmea-demo.cc

syscall:	LDFLAGS=-static
syscall:	syscall.c

call-ioctl:	call-ioctl.o
call-ioctl.o:	call-ioctl.c simple-ioctl.h

direct-memory:	direct-memory.cc

userspace-led:	userspace-led.o
userspace-led.o:	userspace-led.c simple-hw.h
