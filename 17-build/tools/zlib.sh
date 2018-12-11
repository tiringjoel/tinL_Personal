#---------------------------
#zlib
#(c) H.Buchmann FHNW 2018
#---------------------------
. $(dirname ${0})/common.sh
BUILD=${PWD}/zlib
[[ ! -d ${BUILD} ]] && 
{
 mkdir ${BUILD}
 tar -xzf ${ZLIB_SRC}.tar.gz --strip-components=1 -C ${BUILD}
}



cd ${BUILD}
export CC="${CROSS_COMPILE}gcc --sysroot=${SYSROOT}"
#./configure --help
./configure \
--prefix=${SYSROOT} \
--includedir=${SYSROOT}/usr/include 

${MAKE}
${MAKE} install
