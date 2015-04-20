#------------------------
#sshfs
#(c) H.Buchmann FHNW 2015
# depends on zlib
#------------------------
. scripts/common.sh
[[ ! -d glib ]] && mkdir glib

cd glib

#${GLIB_SRC}/configure --help

export CC="${CROSS_COMPILE}gcc --sysroot=${SYSROOT}"
${GLIB_SRC}/configure \
--prefix=${TARGET_ROOT} \
--host=${TARGET} \
--build=x86_64-unknown-linux-gnu

##remove check-config from makefile
#${MAKE} 
#${MAKE} install DESTDIR=${SYSROOT}
