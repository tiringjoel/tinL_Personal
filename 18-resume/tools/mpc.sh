#!/bin/bash
#-------------------------
#binutils.sh
#(c) H.Buchmann FHNW 2018
#-------------------------
. $(dirname ${0})/config.sh  #load common
#-------------------- we are in build
[[ ! -d mpc ]] && mkdir mpc 
cd mpc
#${MPC_SRC}/configure --help
${MPC_SRC}/configure \
 --prefix=${TC} \
 --with-gmp=${TC} \
 --with-mpfr=${TC}
# 
{MAKE} 
{MAKE} install
