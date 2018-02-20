#!/bin/bash
#-------------------------
#tc.sh
#(c) H.Buchmann FHNW 2018
#-------------------------
. $(dirname ${0})/config.sh
#find ${TC} -executable -type f -exec strip {} \;
CC=${TC}/bin/${TARGET}-gcc
${CC} -dumpversion
TC_NAME=tc-tinl-gcc-$(${CC} -dumpversion)-$(date '+%Y.%m.%d')

tar -czvf ${BUILD_HOME}/${TC_NAME}.tar.gz --transform="s;./;${TARGET}/;" -C ${BUILD_HOME}/tc .

