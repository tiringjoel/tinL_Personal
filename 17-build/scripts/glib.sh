#------------------------
#glib
#(c) H.Buchmann FHNW 2015
# depends on zlib
#https://developer.gnome.org/glib/stable/glib-cross-compiling.html
#------------------------
. scripts/common.sh
[[ ! -d glib ]] && mkdir glib

cd glib

#${GLIB_SRC}/configure --help

export CC="${CROSS_COMPILE}gcc --sysroot=${SYSROOT}"
${GLIB_SRC}/configure --cache-file=${CONFIG}/glib.cache \
--prefix=${TARGET_ROOT} \
--host=${TARGET} \
--build=x86_64-unknown-linux-gnu

##remove check-config from makefile
#${MAKE} 
#${MAKE} install DESTDIR=${SYSROOT}
