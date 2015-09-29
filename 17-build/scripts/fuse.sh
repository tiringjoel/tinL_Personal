#------------------------
#fuse
#(c) H.Buchmann FHNW 2015
#------------------------
. scripts/common.sh
[[ ! -d fuse ]] && mkdir fuse

cd fuse

#${FUSE_SRC}/configure --help

export CC=${CROSS_COMPILE}gcc --sysroot=${SYSROOT}
${FUSE_SRC}/configure \
--prefix=${TARGET_ROOT} \
--host=${TARGET}
#
##remove check-config from makefile
${MAKE} 
${MAKE} install DESTDIR=${SYSROOT}