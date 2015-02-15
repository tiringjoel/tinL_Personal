#-----------------------
#gcc.sh build
#(c) H.Buchmann FHNW 2015
#-----------------------
. scripts/common.sh  #load common
#-------------------- we are in build
[[ ! -d gcc ]] && mkdir gcc 
cd gcc

#${GCC}/configure --help

${GCC}/configure \
 --prefix=${TARGET_PREFIX} \
 --target=${TARGET} \
 --with-sysroot=${TARGET_ROOT} \
 --disable-nls \
 --disable-werror \
 --enable-languages=c,c++\
 --disable-threads \
 --disable-nls \
 --disable-libssp \
 --disable-lto \
 --enable-shared \
 --disable-multilib \
 --disable-libgomp \
 --disable-libmudflap \
 --with-arch=armv6 \
 --with-float=hard \
 --with-fpu=vfp 

echo "proceed manually in $(pwd)"

#---------------------------- the bare compiler
#make -j4 all-gcc
#make -j4 install-gcc 
#examine the installed files

#---------------------------- the compiler lib
#make -j4 all-target-libgcc
#make -j4 install-target-libgcc
#examine the installed files

#---------------------------- the c++ libs
#make -j4 all-target-libstdc++-v3
#make install-target-libstdc++-v3
#examine the installed files
