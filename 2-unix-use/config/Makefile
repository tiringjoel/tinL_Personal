#-----------------------
#Makefile
#(c) H.Buchmann FHNW 2018
#we are in work
#-----------------------
VPATH=../src 

TARGET=${PWD}/../target-root/
PREFIX=../tc/bin/arm-linux-gnueabihf-
SYSROOT=${TARGET}
CFLAGS=-std=c99  -march=armv7-a -mfloat-abi=hard -mfpu=vfpv3-d16

CPPFLAGS=-I${TARGET}/usr/include/arm-linux-gnueabihf/
#LOADLIBES=-L${TARGET}/lib
#LDLIBS=-lc
#
CC=${PREFIX}gcc -O2 --sysroot=${SYSROOT}
LD=${PREFIX}ld 
CXX=${PREFIX}g++  --sysroot=${SYSROOT}
CXXFLAGS=-std=c++11 -march=armv7-a -mfloat-abi=hard -mfpu=vfpv3-d16

#--------------------------- link rule
#%:      %.o 
#	${LD} -${@} \
#	--sysroot=${SYSROOT}  \
#	-dynamic-linker /lib/ld-linux-armhf.so.3 \
#	${SYSROOT}/usr/lib/arm-linux-gnueabihf/crt1.o \
#	${SYSROOT}/usr/lib/arm-linux-gnueabihf/crti.o \
#	-L${SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/4.9 \
#	-L${SYSROOT}/usr/lib/arm-linux-gnueabihf \
#	-L${SYSROOT}/usr/lib/ \
#	-L${SYSROOT}/lib/arm-linux-gnueabihf \
#	-L${SYSROOT}/usr/lib/arm-linux-gnueabihf \
#	-L${SYSROOT}/lib/arm-linux-gnueabihf \
#	${^} \
#	-lgcc --as-needed \
#	-lgcc_s \
#	--no-as-needed \
#	-lc -lgcc \
#	--as-needed \
#	-lm \
#	-lgcc_s \
#	--no-as-needed \
#	${SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/4.9/crtend.o \
#	${SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/4.9/../../../arm-linux-gnueabihf/crtn.o


%:      %.o 
	${LD} \
	--sysroot=${SYSROOT} \
	--build-id \
	--eh-frame-hdr \
	-dynamic-linker /lib/ld-linux-armhf.so.3 \
	-X \
	--hash-style=gnu \
	-m armelf_linux_eabi \
	-o ${@} \
	${SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/4.9/../../../arm-linux-gnueabihf/crt1.o \
	${SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/4.9/../../../arm-linux-gnueabihf/crti.o \
	${SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/4.9/crtbegin.o \
	-L${SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/4.9 \
	-L${SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/4.9/../../../arm-linux-gnueabihf \
	-L${SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/4.9/../../.. \
	-L${SYSROOT}/usr/lib/arm-linux-gnueabihf \
	-L${SYSROOT}/lib/arm-linux-gnueabihf \
	${^} \
	-rpath-link=${SYSROOT}/lib/arm-linux-gnueabihf/ \
	-lstdc++ -lm -lgcc_s -lgcc -lc -lgcc_s -lgcc \
	${SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/4.9/crtend.o \
	${SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/4.9/../../../arm-linux-gnueabihf/crtn.o


#LDFLAGS=-static


hello-world-c:		hello-world-c.o
hello-world-c.o:	hello-world-c.c
hello-world-cpp:	hello-world-cpp.o
hello-world-cpp.o:	hello-world-cpp.cc


primes: 		primes.o
primes.o:		primes.cc

hw-access:		hw-access.c
#------------------------ special cases
direct-call:		direct-call.o
	${LD} -o${@} ${^}
direct-call.o:		direct-call.S

clean:
	rm -rf *.o hello-world-c hello-world-cpp primes direct-call
