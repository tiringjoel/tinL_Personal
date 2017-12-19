#!/bin/bash
#-----------------------
#gcc.sh build
#(c) H.Buchmann FHNW 2015
#gcc for kernel
#-----------------------
. $(dirname ${0})/common.sh

#-------------------- we are in build
[[ ! -d gcc ]] && mkdir gcc 
cd gcc

#${GCC_SRC}/configure --help
#exit 0

${GCC_SRC}/configure \
 --prefix=${TC_PREFIX} \
 --target=${TARGET} \
 --disable-nls \
 --disable-werror \
 --enable-threads \
 --enable-languages=c,c++\
 --with-sysroot=${TARGET_ROOT} \
 --disable-nls \
 --disable-libssp \
 --disable-lto \
 --disable-clocale \
 --enable-shared \
 --disable-multilib \
 --disable-libgomp \
 --disable-libmudflap \
 --with-float=hard \
 --with-arch=armv7-a \


# --with-fpu=vfpv3-d16
 

# --with-sysroot=${TC_PREFIX}/libc \

# --with-fpu=vfp
# --disable-threads \
 
# --with-arch=armv6 \

# --with-float=hard \
# --with-fpu=vfp 
#-------------- should work for archlinux-root
#-------------- discrepancies 
# archlinux-rootfs 
# --with-fpu=vfp ok
# yocto-rootfs
# 
#  error
#${MAKE}
#${MAKE} install
#echo "--------------------------------------"
#echo "----------- proceed manually in $(pwd)"
#echo "--------------------------------------"


#/home/buchmann/devel/gcc/dist/gcc-7.2.0/libstdc++-v3/config/os/generic/ctype_base.h
#./arm-linux-gnueabihf/libstdc++-v3/include/arm-linux-gnueabihf/bits/ctype_base.h

#/home/buchmann/devel/gcc/dist/gcc-7.2.0/libstdc++-v3/config/os/generic/ctype_configure_char.cc

#./arm-linux-gnueabihf/libstdc++-v3/src/c++11/ctype_configure_char.cc
#OS_INC_SRCDIR in arm-linux-gnueabihf/libstdc++-v3/src/c++11/Makefile
 

#---------------------------- the bare compiler
make -j8 all-gcc
make -j8 install-gcc 
#examine the installed files

#---------------------------- the compiler libgcc
make -j8 all-target-libgcc
make -j8 install-target-libgcc
#examine the installed files

#----------------------------- configuration
#libstdc++-v3 
make configure-target-libstdc++-v3
echo ${GCC_SRC}/libstdc++-v3/config/os/generic/
echo ${TARGET}/libstdc++-v3/include/${TARGET}/bits
ln -sf ${GCC_SRC}/libstdc++-v3/config/os/generic/ctype_base.h \
${TARGET}/libstdc++-v3/include/${TARGET}/bits
ln -sf ${GCC_SRC}/libstdc++-v3/config/os/generic/ctype_configure_char.cc \
${TARGET}/libstdc++-v3/src/c++11/

#---------------------------- the c++ libs
#make -j8 all-target-libstdc++-v3
#make -j8 install-target-libstdc++-v3
#examine the installed files
