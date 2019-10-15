#!/bin/bash
#---------------------------
#ntp.sh
#(c) H.Buchmann FHNW 2019
#---------------------------
. $(dirname ${0})/config.sh

#${LIBEVENT_SRC}/configure --help

export CC="${CROSS_COMPILE}gcc --sysroot=${TARGET_ROOT}"

${LIBEVENT_SRC}/configure \
 --host=${TARGET} \

${MAKE}
${MAKE} DESTDIR=${TARGET_ROOT} install
