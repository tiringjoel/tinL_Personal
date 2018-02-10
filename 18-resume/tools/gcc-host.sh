#!/bin/bash
#-----------------------
#gcc.sh build
#(c) H.Buchmann FHNW 2018
#-----------------------
. $(dirname ${0})/config.sh

#-------------------- we are in build
[[ ! -d gcc-host ]] && mkdir gcc-host 
cd gcc-host
${GCC_SRC}/configure \
 --prefix=${TC} \
 --disable-nls \
 --disable-werror \
 --enable-threads \
 --enable-languages=c,c++\
 --disable-nls \
 --disable-libssp \
 --disable-lto \
 --enable-clocale=generic \
 --enable-shared \
 --disable-host-shared \
 --disable-multilib \
 --disable-libgomp \
 --disable-libmudflap 

${MAKE}
${MAKE} install

#---------------------------- copy libraries
cp ${TC}/${TARGET}/lib/{libstdc++.so.6.0.24,libgcc_s.so.1} ${TARGET_ROOT}/usr/lib
pushd ${TARGET_ROOT}/usr/lib > /dev/null
ln -sf libstdc++.so.6.0.24 libstdc++.so.6
popd                         > /dev/null
#tc/arm-linux-gnueabihf/lib/libstdc++.so.6.0.24
#---------------------------- the bare compiler
#make -j8 all-gcc
#make -j8 install-gcc 
#examine the installed files

#---------------------------- the compiler libgcc
#make -j8 all-target-libgcc
#make -j8 install-target-libgcc
#examine the installed files

