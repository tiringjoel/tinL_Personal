#------------------------
#openssh
#(c) H.Buchmann FHNW 2015
# depends on zlib
#------------------------
. scripts/common.sh
[[ ! -d openssh ]] && mkdir openssh

cd openssh

#${OPENSSH_SRC}/configure --help

export CC=${CROSS_COMPILE}gcc --sysroot=${SYSROOT}
${OPENSSH_SRC}/configure \
--host=${TARGET} \
--prefix=/ \
--build=x86_64-unknown-linux-gnu \
--disable-strip \
--disable-option-checking

#remove check-config from makefile
${MAKE} 
${MAKE} install DESTDIR=${SYSROOT}