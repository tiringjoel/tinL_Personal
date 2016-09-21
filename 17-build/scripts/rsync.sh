#------------------------
#rsync
#(c) H.Buchmann FHNW 2015
# depends on zlib
#------------------------
. scripts/common.sh
[[ ! -d rsync ]] && mkdir rsync

cd rsync

#${RSYNC_SRC}/configure --help

export CC=${CROSS_COMPILE}gcc --sysroot=${SYSROOT}
${RSYNC_SRC}/configure \
--host=${TARGET} \
--prefix=/ \
--build=x86_64-unknown-linux-gnu 

${MAKE} 
${MAKE} install DESTDIR=${SYSROOT}
