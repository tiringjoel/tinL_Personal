#!/bin/bash
#-------------------------
#binutils.sh
#(c) H.Buchmann FHNW 2018
#-------------------------
. $(dirname ${0})/common.sh   #load common
BUILD=${PWD}/mpc
[[ ! -d ${BUILD} ]] && mkdir ${BUILD} 
cd ${BUILD}
#${MPC_SRC}/configure --help
${MPC_SRC}/configure \
 --prefix=${TC_PREFIX} \
 --with-gmp=${TC_PREFIX} \
 --with-mpfr=${TC_PREFIX}
# 
${MAKE} 
${MAKE} install
