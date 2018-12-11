#!/bin/bash
#-------------------------
#binutils.sh
#(c) H.Buchmann FHNW 2018
#-------------------------
. $(dirname ${0})/common.sh  #load common

#------------------------------------------ create build directory
BUILD=${PWD}/binutils
[[ ! -d ${BUILD} ]] && mkdir ${BUILD}
cd ${BUILD}

#uncomment for configure help
#${BINUTILS_SRC}/configure --help 

#------------------------------------------ configure
${BINUTILS_SRC}/configure \
 --prefix=${TC_PREFIX} \
 --target=${TARGET} \
 --without-libiberty \
 --with-sysroot=${TARGET_ROOT} \
 --disable-libiberfty \
 --disable-nls \
 --disable-werror
#------------------------------------------ make
${MAKE} 
${MAKE} install
