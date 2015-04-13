#---------------------------
#zlib
#(c) H.Buchmann FHNW 2015
#---------------------------
. scripts/common.sh
[[ ! -d zlib-1.2.8 ]] && 
{
 tar -xzf ${ZLIB_SRC}.tar.gz -C .
}

cd zlib-1.2.8
export CC=${CROSS_COMPILE}gcc --sysroot=${SYSROOT}
#./configure --help
./configure \
--prefix=${SYSROOT}
#check target-root/include
${MAKE}
${MAKE} install
