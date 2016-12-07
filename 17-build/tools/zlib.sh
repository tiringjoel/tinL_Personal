#---------------------------
#zlib
#(c) H.Buchmann FHNW 2015
#---------------------------
. $(dirname ${0})/common.sh
[[ ! -d zlib-1.2.8 ]] && 
{
 tar -xzf ${ZLIB_SRC}.tar.gz -C .
}

cd zlib-1.2.8
export CC=${CROSS_COMPILE}gcc --sysroot=${SYSROOT}
#./configure --help
./configure \
--prefix=${SYSROOT} \
--includedir=${SYSROOT}/usr/include 

${MAKE}
${MAKE} install
