#-----------------------
#Makefile
#(c) H.Buchmann FHNW 2014
#we are in work
#-----------------------
TARGET=../../17-build/target-root
PREFIX=../../17-build/tc/bin/arm-fhnw-linux-gnueabi-
CFLAGS=-std=c99
CC=${PREFIX}gcc -O2 --sysroot=${TARGET}
CXX=${PREFIX}g++ --sysroot=${TARGET} -O2
CXXFLAGS=-std=c++11
CC=${CXX}
LDFLAGS=-static
VPATH=../src
gpioctl:		gpioctl.c
hw-access:		hw-access.c
direct-memory:		direct-memory.cc
led:			led.o mmap.o
led.o:			led.cc mmap.h
mmap.o: 		mmap.cc mmap.h

