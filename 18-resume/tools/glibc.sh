#!/bin/bash
#-----------------------
#glibc
#(c) H.Buchmann FHNW 2018
#-----------------------
. $(dirname ${0})/config.sh

export CFLAGS="--sysroot=${TARGET_ROOT} -O2"
export CC=${TC}/bin/${TARGET}-gcc

DESTDIR=${TARGET_ROOT} \
${GLIBC_SRC}/configure \
    --prefix=/usr \
    --host=${TARGET} \
    --build=x86_64-unknown-linux-gnu \
    --with-headers=${TARGET_ROOT}/usr/include \
    --disable-profile --without-gd --without-cvs --enable-add-ons\
    --enable-hacker-mode\
    --with-elf \
    --enable-kernel=2.6.20 \
    --disable-sanity-checks \
    --disable-werror

${MAKE} 
${MAKE} install install_root=${TARGET_ROOT}
