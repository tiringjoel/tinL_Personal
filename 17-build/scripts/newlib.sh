#-----------------------
#eglibc
#(c) H.Buchmann FHNW 2015
#see EGLIBC.cross
#-----------------------
. scripts/common.sh
[[ ! -d newlib ]] && { mkdir newlib; }
export CFLAGS="--sysroot=${SYSROOT} -O2"
export CC=${TC_PREFIX}/bin/${TARGET}-gcc

#PATH=${TC_PREFIX}/bin/:${PATH}

cd newlib
#${NEWLIB_SRC}/newlib/configure --help
${NEWLIB_SRC}/newlib/configure \
    --srcdir=${NEWLIB_SRC}/newlib \
    --prefix=/usr \
	--build=${TARGET} \
    --target=${TARGET} \
	--with-newlib \
	--disable-multilib \
	--with-build-sysroot=${SYSROOT}

DESTDIR=${SYSROOT} \
