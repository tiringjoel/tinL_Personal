#----------------------------
#Makefile
#(c) H.Buchmann FHNW 2017
# we are in work
#----------------------------

#--------------------------------- target-root
TARGET_ROOT=${PWD}/../../17-build/target-root
#--------------------------------- toolchain
TC=${PWD}/../tc/
PREFIX=${TC}/bin/arm-linux-gnueabihf-
AS=${PREFIX}as
CC=${PREFIX}g++
CXX=${PREFIX}g++

LD=${PREFIX}ld
CFLAGS=--sysroot=${TARGET_ROOT}
CXXFLAGS=${CFLAGS}
LDFLAGS=--sysroot=${TARGET_ROOT}
#--------------------------------- src 
VPATH=../src

s-nano:		s-nano.o
		${LD} -o${@} ${^}
		@echo "----->copy ${@} to SD-Card/linuxrc"

s-nano.o:	s-nano.S
		${AS} -o${@} ${^}

c-nano:		c-nano.o
		${LD} -o${@} ${^} --dynamic-linker="/usr/lib/libc.so" -L${TARGET_ROOT}/usr/lib/ -lc
c-nano.o:	c-nano.c



c-mini:	        c-mini.o
c-mini.o:       c-mini.c

cc-mini:        cc-mini.o
cc-mini.o:      cc-mini.cc

cc-mini:        cc-mini.o
cc-mini.o:      cc-mini.cc

cc-threads:     cc-threads.cc

.PHONY: clean
clean:
	rm -f *.o s-nano c-nano c-mini cc-mini cc-threads


