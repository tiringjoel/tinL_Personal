#!/bin/bash
#-----------------------
#gcc-bare.sh 
#(c) H.Buchmann FHNW 2018
#gcc for kernel
# depends gmp
#         mpfr
#         mpc
#-----------------------
. $(dirname ${0})/config.sh  #load common

export LD_LIBRARY_PATH=${TC}/lib
${GCC_SRC}/configure \
 --prefix=${TC} \
 --with-gmp=${TC} \
 --with-mpfr=${TC} \
 --with-mpc-include=${TC}/include \
 --with-mpc-lib=${TC}/lib \
 --target=${TARGET} \
 --disable-nls \
 --disable-newlib \
 --without-headers \
 --with-local-prefix=${TC} \
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


# --with-arch=armv7-a \
# --with-fpu=vfpv3-d16 \
# --with-float=hard

#---------------------------- the bare compiler
${MAKE} all-gcc
${MAKE} install-gcc 

#---------------------------- the bare compiler libgcc
${MAKE} all-target-libgcc
${MAKE} install-target-libgcc

