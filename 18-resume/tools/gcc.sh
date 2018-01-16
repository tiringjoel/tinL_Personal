#!/bin/bash
#-----------------------
#gcc.sh build
#(c) H.Buchmann FHNW 2015
#gcc for kernel
#-----------------------
. $(dirname ${0})/config.sh

#-------------------- we are in build
[[ ! -d gcc ]] && mkdir gcc 
cd gcc


${GCC_SRC}/configure \
 --prefix=${TC} \
 --target=${TARGET} \
 --disable-nls \
 --disable-werror \
 --enable-threads \
 --enable-languages=c,c++\
 --with-sysroot=${TARGET_ROOT} \
 --disable-nls \
 --disable-libssp \
 --disable-lto \
 --enable-clocale=generic \
 --enable-shared \
 --disable-multilib \
 --disable-libgomp \
 --disable-libmudflap \
 --with-float=hard \
 --with-arch=armv7-a 
${MAKE}
${MAKE} install
#---------------------------- the bare compiler
#make -j8 all-gcc
#make -j8 install-gcc 
#examine the installed files

#---------------------------- the compiler libgcc
make -j8 all-target-libgcc
make -j8 install-target-libgcc
#examine the installed files

