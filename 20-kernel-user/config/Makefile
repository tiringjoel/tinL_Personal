#-------------------
#Makefile
#(c) H.Buchmann FHNW 2015
#-------------------
#we are in work
TC=../tc/
PREFIX=arm-linux-gnueabihf
SYSROOT=../target-root
CROSS_COMPILE=${TC}/bin/${PREFIX}-
CC=${CROSS_COMPILE}gcc --sysroot=${SYSROOT}
ASFLAGS=-mthumb -march=armv7-a
CFLAGS=-O2 ${ASFLAGS}
CXX=${CROSS_COMPILE}g++ --sysroot=${SYSROOT} 
CXXFLAGS=${CFLAGS} -std=c++2a
CC=${CXX}
LD=${CXX}
#CC=gcc
#LD=ld
#LDFLAGS=-static
VPATH=../src
CPPFLAGS=-I../src

uevent-userspace:	uevent-userspace.c
split:			split.c

uevent-demo:		uevent-demo.o uevent.o
uevent-demo.o:		uevent-demo.cc uevent.h
uevent.o:		uevent.cc uevent.h
