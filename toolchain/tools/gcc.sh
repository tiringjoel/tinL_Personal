#!/bin/bash
#----------------------
#gcc
#(c) H.Buchmann FHNW 2014
#we are in toolchain
#TODO remove link in /lib/cpp
#TODO solve the libgcc problems
#     why you have to use --with-sysroot
#----------------------

. ./tools/defines.sh

cd build/gcc
${GCC_SRC}/configure -v\
 --prefix=${TC_HOME}\
 --target=${TARGET} \
 --enable-languages=c,c++\
 --disable-threads \
 --disable-nls \
 --disable-libssp \
 --disable-lto \
 --enable-shared \
 --disable-multilib \
 --disable-libgomp \
 --disable-libmudflap \
 --with-sysroot=${SYSROOT} \
 --with-arch=armv7-a \
 --with-float=hard \
 --with-fpu=vfpv3-d16



#${MAKE}
#${MAKE} install 

# --with-as=${TOOLS}/as \
# --with-ld=${TOOLS}/ld \

#make all-target-libstdc++-v3
#make -j4 all-target-libgcc
#make install-target-libgcc
#make -j4 all-gcc
#make all #dont works only for c not for c++
#make -j4 install-gcc
#
# --disable-__cxa_atexit \
# --without-newlib\
# --disable-libquadmath \
# --disable-libatomic 

#configure taken from target
#--prefix=/usr 
#--libdir=/usr/lib 
#--libexecdir=/usr/lib 
#--mandir=/usr/share/man 
#--infodir=/usr/share/info 
#--with-bugurl=https://github.com/archlinuxarm/PKGBUILDs/issues 
#--enable-languages=c,c++,fortran,go,lto,objc,obj-c++ 
#--enable-shared 
#--enable-threads=posix 
#--with-system-zlib 
#--enable-__cxa_atexit 
#--disable-libunwind-exceptions 
#--enable-clocale=gnu 
#--disable-libstdcxx-pch 
#--disable-libssp 
#--enable-gnu-unique-object 
#--enable-linker-build-id 
#--enable-cloog-backend=isl 
#--disable-cloog-version-check 
#--enable-lto 
#--enable-plugin 
#--enable-install-libiberty 
#--with-linker-hash-style=gnu 
#--disable-multilib 
#--disable-werror 
#--enable-checking=release 
#--host=armv6l-unknown-linux-gnueabihf 
#--build=armv6l-unknown-linux-gnueabihf 
#--with-arch=armv6 
#--with-float=hard 
#--with-fpu=vfp
