#!/bin/bash
#----------------------
#make-distro.sh
#(c) H.Buchmann FHNW 2015
#----------------------
DISTRO=beaglebone-black-toolchain-64bit
find tc -executable -and -type f -exec strip '{}' \;
tar -cvjf ${DISTRO}.tar.bz2 tc
