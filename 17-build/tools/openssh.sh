#------------------------
#openssh
#(c) H.Buchmann FHNW 2015
# depends on zlib
#------------------------
. $(dirname ${0})/common.sh
BUILD=${PWD}/openssh
[[ ! -d ${BUILD} ]] && mkdir ${BUILD}

cd ${BUILD}

#${OPENSSH_SRC}/configure --help

export CC="${CROSS_COMPILE}gcc --sysroot=${SYSROOT}"
${OPENSSH_SRC}/configure \
--host=${TARGET} \
--prefix=/ \
--build=x86_64-unknown-linux-gnu \
--disable-strip \
--disable-option-checking \
--with-sandbox=seccomp_filter \
--without-stackprotect 
#--without-openssl 
#only for test
#--with-ldflags='-static'

#remove check-config from makefile
${MAKE} 
${MAKE} install DESTDIR=${SYSROOT}
