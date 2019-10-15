#!/bin/bash
#---------------------------
#ntp.sh
#(c) H.Buchmann FHNW 2019
#---------------------------
. $(dirname ${0})/config.sh

#${NTP_SRC}/configure --help

export CC="${CROSS_COMPILE}gcc --sysroot=${TARGET_ROOT}"

${NTP_SRC}/configure \
 --host=${TARGET} \
 --with-yielding-select=yes

${MAKE}
${MAKE} DESTDIR=${TARGET_ROOT} install
