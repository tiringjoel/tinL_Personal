#!/bin/bash
#-------------------------
#binutils.sh
#(c) H.Buchmann FHNW 2018
#-------------------------
. $(dirname ${0})/config.sh  #load common
#-------------------- we are in build
#${GMP_SRC}/configure --help
${GMP_SRC}/configure \
 --prefix=${TC} \
 
${MAKE} 
${MAKE} install
