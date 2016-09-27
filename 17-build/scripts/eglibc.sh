#-----------------------
#eglibc
#(c) H.Buchmann FHNW 2015
#see EGLIBC.cross
#-----------------------
. scripts/common.sh
[[ ! -d eglibc ]] && { mkdir eglibc; }
export CFLAGS="--sysroot=${SYSROOT} -O2"
export CC=${TC_PREFIX}/bin/${TARGET}-gcc

cd eglibc
cp ${CONFIG}/option-groups.config .
#${EGLIBC_SRC}/libc/configure --help
DESTDIR=${SYSROOT} \
${EGLIBC_SRC}/libc/configure \
    --prefix=/usr \
    --host=${TARGET}\
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
