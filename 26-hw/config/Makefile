#----------------------------
#Makefile
#(c) H.Buchmann FHNW 2018
#----------------------------
KERNEL=${PWD}/../../18-resume/build/kernel/

TC=../tc/bin
PREFIX=arm-linux-gnueabihf-
TARGET_ROOT=../../18-resume/target-root
CXX=${TC}/${PREFIX}g++ --sysroot=${TARGET_ROOT}
CC=${TC}/${PREFIX}gcc --sysroot=${TARGET_ROOT}


VPATH=../src

led:    led.cc
swi:    swi.cc
queue-list:     queue-list.c
