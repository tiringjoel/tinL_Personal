#!/bin/bash
#-------------------------
#mpfr.sh
#(c) H.Buchmann FHNW 2018
#-------------------------
. $(dirname ${0})/config.sh  #load common
#${MPFR_SRC}/configure --help
${MPFR_SRC}/configure \
 --prefix=${TC} \
 --with-gmp=${TC}
# 
${MAKE} 
${MAKE} install
