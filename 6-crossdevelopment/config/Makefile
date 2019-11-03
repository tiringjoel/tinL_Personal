#--------------------------
#Makefile
#(c) H.Buchmann FHNW 2019
#--------------------------
#we are in target-work
# directory layout
# tc             toolchain
# src            the source files
# config
#   Makefile
# target-work
#   Makefile --> ../config/Makefile
#   <------- here we are
# target-root
#   either sshfs or copy

#own definitions
SYSROOT=${PWD}/../target-root

#where are the source files
VPATH=../src/

#toolchain
CXX=${PWD}/../tc/bin/arm-linux-gnueabihf-g++ --sysroot=${SYSROOT}
CC=${CXX}
CPPFLAGS=-I../src/

#------------------ compile rules
led-direct-1.o:	led-direct-1.cc mem.h
led-direct-2.o:	led-direct-2.cc mem.h
mem.o:		mem.cc mem.h
cgi0.o: 	cgi0.cc
cgi.o:		cgi.cc cgi.h
gpio.o: 	gpio.cc gpio.h
cgi-test.o:	cgi-test.cc cgi.h
cgi-led.o:	cgi-led.cc cgi.h gpio.h mem.h
#------------------ link rules
led-direct-1:	led-direct-1.o mem.o
led-direct-2:	led-direct-2.o mem.o
cgi0:		cgi0.o
cgi-test:	cgi-test.o cgi.o
cgi-led:	cgi-led.o gpio.o cgi.o  mem.o
