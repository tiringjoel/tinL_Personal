#!/bin/bash
#--------------------------
#create-toolchain.sh
#(c) H.Buchmann 2016
#--------------------------
#we are in 17-build
find tc/ -executable -type f -exec strip '{}' \;
TOOLCHAIN=gcc-7.2.0-arm-64bit
tar --transform "s,^.,${TOOLCHAIN}," -czvf ${TOOLCHAIN}.tar.gz -C tc .
