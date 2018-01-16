#!/bin/bash
#-----------------------
#gcc-bare.sh 
#(c) H.Buchmann FHNW 2015
#gcc for kernel
#-----------------------
. $(dirname ${0})/config.sh  #load common
[[ ! -d gcc-bare ]] && mkdir gcc-bare
cd gcc-bare

#${GCC_SRC}/configure --help

${GCC_SRC}/configure \
 --prefix=${TC} \
 --target=${TARGET} \
 --disable-nls \
 --disable-werror \
 --enable-languages=c\
 --disable-threads \
 --disable-nls \
 --disable-libssp \
 --disable-lto \
 --disable-shared \
 --disable-multilib \
 --disable-libgomp \
 --disable-libmudflap \
 --without-headers \
 --with-arch=armv7-a \
 --with-fpu=vfpv3-d16 \
 --with-float=hard

#---------------------------- the bare compiler
${MAKE} all-gcc
${MAKE} install-gcc 

#---------------------------- the bare compiler libgcc
${MAKE} all-target-libgcc
${MAKE} install-target-libgcc

