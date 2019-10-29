#------------------------
#rsync
#(c) H.Buchmann FHNW 2018
# depends on zlib
#------------------------
. $(dirname ${0})/config.sh  #load common
export CC=${CROSS_COMPILE}gcc --sysroot=${TARGET_ROOT}
${NANO_SRC}/configure --help
${NANO_SRC}/configure \
--host=${TARGET} 

#--host=${TARGET} \
#--prefix=/ \
#--build=x86_64-unknown-linux-gnu 
#
${MAKE} 
${MAKE} install DESTDIR=${TARGET_ROOT}
