#------------------------
#sshfs
#(c) H.Buchmann FHNW 2015
# depends on zlib
#------------------------
. scripts/common.sh
[[ ! -d sshfs ]] && mkdir sshfs

cd sshfs

${SSHFS_SRC}/configure --help

#export CC="${CROSS_COMPILE}gcc --sysroot=${SYSROOT}"
#${SSHFS_SRC}/configure \
#--host=${TARGET}

#--prefix=${TARGET_ROOT} \
##remove check-config from makefile
#${MAKE} 
#${MAKE} install DESTDIR=${SYSROOT}
