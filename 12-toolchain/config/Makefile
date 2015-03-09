#-------------------
#Makefile
#(c) H.Buchmann FHNW 2015
#-------------------
#we are in work
TC=../tc/bin/armv6l-unknown-linux-gnueabihf-
#the compiler linker
TARGET_ROOT=../../resources/yocto-toolchain/sysroots/armv6-vfp-poky-linux-gnueabi/
#TARGET_ROOT=../../resources/archlinux-root
CC=${TC}gcc --sysroot=${TARGET_ROOT}
CXX=${TC}g++ --sysroot=${TARGET_ROOT}
#where to look for source files
VPATH=../src

#compile link C File
c-source: 	c-source.c

#compile link C++ File
cc-source:	cc-source.cc

clean:
	rm *.o
