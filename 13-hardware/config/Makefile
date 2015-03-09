#-----------------------
#Makefile
#(c) H.Buchmann FHNW 2014
#we are in work
#-----------------------
TARGET=../../resources/archlinux-root
PREFIX=../tc/bin/armv6l-unknown-linux-gnueabihf-
CFLAGS=-std=c99
CC=${PREFIX}gcc -O2 --sysroot=${TARGET}
CXX=${PREFIX}g++ --sysroot=${TARGET} -O2
CXXFLAGS=-std=c++11
CC=${CXX}
LDFLAGS=-static
VPATH=../src
hw-access:		hw-access.c
direct-memory:		direct-memory.cc
led:			led.o mmap.o
led.o:			led.cc mmap.h
mmap.o: 		mmap.cc mmap.h

