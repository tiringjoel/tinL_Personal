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
CC=${PREFIX}gcc -v
LD=${PREFIX}ld
CFLAGS=--sysroot=${TARGET_ROOT}
LDFLAGS=--sysroot=${TARGET_ROOT}
#--------------------------------- src 
VPATH=../src

s-nano:		s-nano.o
		${LD} -o${@} ${^}
s-nano.o:	s-nano.S
		${AS} -o${@} ${^}
		@echo "----->copy ${@} to SD-Card/linuxrc"

c-nano:		c-nano.o
		${LD} -o${@} ${^} ${TARGET_ROOT}/usr/lib/libc.a
		@echo "----->copy ${@} to SD-Card/linuxrc"
c-nano.o:	c-nano.c


mini-static:	LDFLAGS=-static
mini-static:	mini
		cp mini mini-static
		@echo "----->copy ${@} to SD-Card/linuxrc"

mini-dynamic:	mini
		cp mini mini-dynamic
		@echo "----->copy ${@} to SD-Card/linuxrc"

mini:		mini.c

.PHONY: clean
clean:
	rm -f *.o s-nano c-nano mini-static mini-dynamic mini


