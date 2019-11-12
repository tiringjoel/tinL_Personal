#!/bin/bash
#--------------------
#toybox.sh
#(c) H.Buchmann FHNW 2017
# toybox.sh args
# not yet in final form
# TODO separate source from build directory
#args 
# help
# menuconfig
# install
# see kernel.sh
#--------------------
#we are in build
. $(dirname ${0})/common.sh
BUILD=${PWD}/$(basename ${TOYBOX_SRC})

[[ ! -d ${BUILD} ]] && 
{ 
 tar xf ${TOYBOX_SRC}.tar.gz 
}
cd ${BUILD}
PREFIX=${SYSROOT}/toybox
TOYBOX_MAKE="${MAKE} CC=gcc CFLAGS="--sysroot=${SYSROOT}" CROSS_COMPILE=${CROSS_COMPILE}  PREFIX=${PREFIX}"
[[ ! -f .config ]] &&
{
 ${TOYBOX_MAKE} defconfig
}

${TOYBOX_MAKE} ${@}
#${TOYBOX_MAKE} install
