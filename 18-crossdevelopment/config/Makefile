#-------------------
#Makefile
#(c) H.Buchmann FHNW 2020
#-------------------
#we are in work

#------------------------------- the tools we use
PREFIX=arm-linux-gnueabihf
TC=${PWD}/../tc/bin/${PREFIX}
CC=${TC}-gcc
CXX=${TC}-g++
LD=${TC}-ld
#------------------------------- tools congfiguration 
CFLAGS=-O2
CXXFLAGS=${CFLAGS}
#------------------------------- where are the source files
VPATH=../src

#------------------------------- first simple programs
#hello-world:    	LDFLAGS=-static
hello-world:		hello-world.c

#cpp-hello-world:	LDFLAGS=-static
cpp-hello-world: 	cpp-hello-world.cc

#------------------------------- using  C++
#thread-demo-1:		LDFLAGS=-lpthread
thread-demo-1:		thread-demo-1.cc

#------------------------------- shows the difference of speed
#execute 
# (a) BBG 
# (b) Host
primes: 		primes.cc

#-------------------------------  direct call without any posix
#made with assembler
s-without-posix:	s-without-posix.o;${LD} -o${@} ${^}
s-without-posix.o:	s-without-posix.S

#made with c
c-without-posix:	c-without-posix.o;${LD} -o${@} ${^} -lc
c-without-posix.o:	c-without-posix.c


