#------------------------
#rsync
#(c) H.Buchmann FHNW 2018
# depends on zlib
#------------------------
. $(dirname ${0})/config.sh  #load common
export CC="${CROSS_COMPILE}gcc --sysroot=${TARGET_ROOT}"
${NCURSES_SRC}/configure --help

${NCURSES_SRC}/configure \
--host=${TARGET} \
--enable-widec

#
${MAKE} 
${MAKE} install DESTDIR=${TARGET_ROOT}
