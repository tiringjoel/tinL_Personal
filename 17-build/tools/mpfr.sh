#!/bin/bash
#-------------------------
#binutils.sh
#(c) H.Buchmann FHNW 2018
#-------------------------
. $(dirname ${0})/common.sh  #load common
BUILD=${PWD}/mpfr 

[[ ! -d ${BUILD} ]] && mkdir ${BUILD} 
cd ${BUILD}
#${MPFR_SRC}/configure --help
${MPFR_SRC}/configure \
 --prefix=${TC_PREFIX} \
 --with-gmp=${TC_PREFIX}
# 
${MAKE} 
${MAKE} install
