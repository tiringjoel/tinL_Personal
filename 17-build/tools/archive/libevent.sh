#------------------------
#libevent
#(c) H.Buchmann FHNW 2015
# depends on zlib
#------------------------
. $(dirname ${0})/common.sh
[[ ! -d libevent ]] && mkdir libevent

cd libevent

#${LIBEVENT_SRC}/configure --help

export CC="${CROSS_COMPILE}gcc --sysroot=${SYSROOT}"
${LIBEVENT_SRC}/configure \
--host=${TARGET} \
--prefix=/ \

#remove check-config from makefile
${MAKE} 
${MAKE} install DESTDIR=${SYSROOT}
