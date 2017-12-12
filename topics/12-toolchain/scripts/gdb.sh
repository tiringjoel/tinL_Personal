#-----------------------
#gcc.sh build
#(c) H.Buchmann FHNW 2015
#-----------------------
. scripts/common.sh  #load common
#-------------------- we are in build
[[ ! -d gdb ]] && mkdir gdb 
cd gdb

#${GDB}/configure --help

${GDB}/configure \
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

${MAKE}
${MAKE} install

