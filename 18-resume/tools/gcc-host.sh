#!/bin/bash
#!/bin/bash
#-----------------------
#gcc-host.sh build
#(c) H.Buchmann FHNW 2018
#-----------------------
. $(dirname ${0})/config.sh

#-------------------- we are in build
[[ ! -d gcc-host ]] && mkdir gcc-host 
cd gcc-host
export LD_LIBRARY_PATH=${TC}/lib
${GCC_SRC}/configure \
 --prefix=${TC} \
 --with-gmp=${TC} \
 --with-mpfr=${TC} \
 --with-mpc-include=${TC}/include \
 --with-mpc-lib=${TC}/lib \
 --disable-nls \
 --disable-werror \
 --enable-threads \
 --enable-languages=c,c++\
 --disable-nls \
 --disable-libssp \
 --disable-lto \
 --enable-clocale=generic \
 --enable-shared \
 --disable-host-shared \
 --disable-multilib \
 --disable-libgomp \
 --disable-libmudflap 

${MAKE}
${MAKE} install


