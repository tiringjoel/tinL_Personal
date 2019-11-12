#!/bin/bash
#-----------------------------
#python.sh
#(c) H.Buchmann FHNW 2016
#-----------------------------
. $(dirname ${0})/common.sh
[[ ! -d python ]] && { mkdir python; }

cd python
export CC=${CROSS_COMPILE}gcc 
export PATH=${PATH}:${TC_PREFIX}/bin

#${PYTHON_SRC}/configure --help
${PYTHON_SRC}/configure --prefix=${SYSROOT} \
       --build=x86_64-pc-linux-gnu \
	--host=${TARGET} \
	--disable-ipv6 \
	ac_cv_file__dev_ptmx=no \
	ac_cv_file__dev_ptc=no

#x86_64-pc-linux-gnu
#checking for /dev/ptmx... not set
#configure: error: set ac_cv_file__dev_ptmx to yes/no in your CONFIG_SITE file wh
${MAKE}
${MAKE} install
