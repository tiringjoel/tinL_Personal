#-----------------------
#gcc-bare.sh 
#(c) H.Buchmann FHNW 2015
#gcc for kernel
#-----------------------
. scripts/common.sh  #load common
[[ ! -d gcc ]] && mkdir gcc 
cd gcc

#${GCC_SRC}/configure --help

${GCC_SRC}/configure \
 --prefix=${TC_PREFIX} \
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
 --with-float=hard

# --with-arch=armv6 \
# --with-sysroot=${TARGET_ROOT} \

# --with-float=hard \
# --with-fpu=vfp 
#-------------- should work for archlinux-root
#-------------- discrepancies 
# archlinux-rootfs 
# --with-fpu=vfp ok
# yocto-rootfs
# --with-fpu=vfp
#  error


#---------------------------- the bare compiler
make -j8 all-gcc
make -j8 install-gcc 

#---------------------------- the bare compiler libgcc
make -j8 all-target-libgcc
make -j8 install-target-libgcc

#---------------------------- the c++ libs
#make -j8 all-target-libstdc++-v3
#make -j8 install-target-libstdc++-v3
#examine the installed files
