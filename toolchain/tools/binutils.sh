#!/bin/bash
#--------------------------
#binutils.sh
#(c) H.Buchmann FHNW 2016
#--------------------------
#we are in toolchain
#TODO libfl.so not available in ubuntu
#--------------------------
. ./tools/defines.sh

cd build/binutils
${BINUTILS_SRC}/configure \
 --prefix=${TC_HOME} \
 --target=${TARGET} \
 --with-sysroot=${SYSROOT} \
 --without-libiberty \
 --disable-libiberfty \
 --disable-nls \
 --disable-werror
${MAKE}
${MAKE} install
