#!/bin/bash
#-------------------------
#mpc.sh
#(c) H.Buchmann FHNW 2018
#-------------------------
. $(dirname ${0})/config.sh  #load common

#${MPC_SRC}/configure --help
${MPC_SRC}/configure \
 --prefix=${TC} \
 --with-gmp=${TC} \
 --with-mpfr=${TC}
# 
${MAKE} 
${MAKE} install
