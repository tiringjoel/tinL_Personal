#-----------------------
#eglibc
#(c) H.Buchmann FHNW 2015
#see EGLIBC.cross
#-----------------------
. scripts/common.sh
[[ ! -d glibc ]] && { mkdir glibc; }
export CFLAGS="--sysroot=${SYSROOT} -O2"
export CC=${TC_PREFIX}/bin/${TARGET}-gcc

cd glibc
cp ${CONFIG}/option-groups.config .
#${GLIBC_SRC}/libc/configure --help
DESTDIR=${SYSROOT} \
${GLIBC_SRC}/configure \
    --prefix=/usr \
    --host=${TARGET} \
    --build=x86_64-unknown-linux-gnu \
    --with-headers=${SYSROOT}/usr/include \
    --disable-profile --without-gd --without-cvs --enable-add-ons\
    --enable-hacker-mode\
    --with-elf \
    --enable-kernel=2.6.20 \
    --disable-sanity-checks

#    --enable-rpc\
${MAKE} 
${MAKE} install install_root=${SYSROOT}
