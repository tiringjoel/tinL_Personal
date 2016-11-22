#------------------------
#minicom
#(c) H.Buchmann FHNW 2015
# depends on zlib
#------------------------
. scripts/common.sh
[[ ! -d minicom ]] && mkdir minicom

cd minicom

#${MINICOM_SRC}/configure --help

export CC=${CROSS_COMPILE}gcc --sysroot=${SYSROOT}
${MINICOM_SRC}/configure \
--host=${TARGET} \
--prefix=/ \
--build=x86_64-unknown-linux-gnu 

#${MAKE} 
#${MAKE} install DESTDIR=${SYSROOT}
