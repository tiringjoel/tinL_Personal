#------------------------
#ntp
#(c) H.Buchmann FHNW 2015
# depends on zlib
#------------------------
. $(dirname ${0})/common.sh
[[ ! -d ntp ]] && mkdir ntp

cd ntp

#${NTP_SRC}/configure --help

export CC="${CROSS_COMPILE}gcc --sysroot=${SYSROOT}"
#export CFLAGS="-static"
#export LT_SYS_LIBRARY_PATH="${SYSROOT}/lib"
${NTP_SRC}/configure \
--host=${TARGET} \
--prefix=${SYSROOT} \
--with-sysroot=${SYSROOT} \
--with-yielding-select=no \
--without-sntp

#remove check-config from makefile
${MAKE} 
${MAKE} install 
