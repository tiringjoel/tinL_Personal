#------------------------
#openssl
#(c) H.Buchmann FHNW 2015
# depends on zlib
#------------------------
. scripts/common.sh
BUILD_HOME=$(basename ${OPENSSL_SRC})
[[ ! -d ${BUILD_HOME} ]] &&
{
 tar -xzf ${OPENSSL_SRC}.tar.gz -C .
}
cd ${BUILD_HOME}
export CC=${CROSS_COMPILE}gcc --sysroot=${SYSROOT}
export AS=${CROSS_COMPILE}as

./Configure linux-elf no-asm shared --prefix=${SYSROOT}/usr --
#export CC=${CROSS_COMPILE}gcc --sysroot=${SYSROOT}
##${OPENSSL_SRC}/ \
##--prefix=${SYSROOT} \
##--host=${TARGET}
#check target-root/include
${MAKE} 
${MAKE} install
