#!/bin/bash
#--------------------------
#binutils.sh
#(c) H.Buchmann FHNW 2016
#--------------------------
#we are in toolchain
#TODO libfl.so not available in ubuntu
#--------------------------
. ./tools/defines.sh

SOURCE=${HOME}/devel/gcc/dist/binutils-2.24

cd build/binutils
${SOURCE}/configure \
 --prefix=${TC_HOME} \
 --target=${TARGET} \
 --with-sysroot=${SYSROOT} \
 --without-libiberty \
 --disable-libiberfty \
 --disable-nls \
 --disable-werror
${MAKE}
${MAKE} install
# --with-sysroot=/ \
# --with-sysroot=${SYSROOT} \
