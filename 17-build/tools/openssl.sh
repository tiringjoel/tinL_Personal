#------------------------
#openssl
#(c) H.Buchmann FHNW 2015
# depends on zlib
#------------------------
. $(dirname ${0})/common.sh
BUILD=${PWD}/openssl
[[ ! -d ${BUILD} ]] &&
{
 mkdir ${BUILD}
 tar -xzf ${OPENSSL_SRC}.tar.gz --strip-components=1 -C ${BUILD}
}

cd ${BUILD}
export CC="${CROSS_COMPILE}gcc --sysroot=${SYSROOT}"
export AS=${CROSS_COMPILE}as
./Configure linux-elf no-asm shared --prefix=${SYSROOT}/usr
#export CC=${CROSS_COMPILE}gcc --sysroot=${SYSROOT}
##${OPENSSL_SRC}/ \
##--prefix=${SYSROOT} \
##--host=${TARGET}
#check target-root/include
${MAKE}
${MAKE} install
