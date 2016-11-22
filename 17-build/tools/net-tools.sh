#------------------------
#openssl
#(c) H.Buchmann FHNW 2015
# depends on zlib
#------------------------
. scripts/common.sh
BUILD_HOME=$(basename ${NET_TOOLS_SRC})
[[ ! -d ${BUILD_HOME} ]] &&
{
 tar -xzf ${NET_TOOLS_SRC}.tar.gz -C .
}
cd ${BUILD_HOME}
export CC="${CROSS_COMPILE}gcc --sysroot=${SYSROOT}"
export AS=${CROSS_COMPILE}as
${MAKE}  DESTDIR=${SYSROOT}   install
#${MAKE} install
