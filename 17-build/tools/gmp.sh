#!/bin/bash
#-------------------------
#binutils.sh
#(c) H.Buchmann FHNW 2018
#-------------------------
. $(dirname ${0})/common.sh  #load common
BUILD=${PWD}/gmp 
[[ ! -d ${BUILD} ]] && mkdir ${BUILD}
cd ${BUILD}
#${GMP_SRC}/configure --help
${GMP_SRC}/configure \
 --prefix=${TC_PREFIX} \
 
${MAKE} 
${MAKE} install
