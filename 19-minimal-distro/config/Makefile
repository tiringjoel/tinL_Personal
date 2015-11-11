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
CFLAGS=-O2 
CXX=${CROSS_COMPILE}g++ --sysroot=${SYSROOT} 
CXXFLAGS=${CFLAGS} -std=c++11
LD=${CROSS_COMPILE}ld
#CC=gcc
#LD=ld
#LDFLAGS=-static
VPATH=../src
CPPFLAGS=-I../src 

all:	hello-world cpp-hello-world
hello-world:	hello-world.c
cpp-hello-world: cpp-hello-world.cc

