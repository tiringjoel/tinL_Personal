#------------------------
#fuse
#(c) H.Buchmann FHNW 2015
#------------------------
. $(dirname ${0})/common.sh  #load common
[[ ! -d fuse ]] && mkdir fuse

cd fuse

#${FUSE_SRC}/configure --help

export CC="${CROSS_COMPILE}gcc --sysroot=${SYSROOT}"
${FUSE_SRC}/configure \
--host=${TARGET}
#
#--prefix=${TARGET_ROOT} \
##remove check-config from makefile
${MAKE} 
${MAKE} install DESTDIR=${SYSROOT}