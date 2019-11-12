#!/bin/bash
#-------------------------
#tc.sh
#(c) H.Buchmann FHNW 2018
#-------------------------
. $(dirname ${0})/common.sh
find ${TC_PREFIX} -executable -type f -exec strip {} \;
CC=${TC_PREFIX}/bin/${TARGET}-gcc
${CC} -dumpversion
TC_NAME=tc-tinl-gcc-$(${CC} -dumpversion)-$(date '+%Y.%m.%d')

echo ${TC_NAME}
tar -czvf ${BUILD_HOME}/${TC_NAME}.tar.gz --transform="s;./;${TARGET}/;" -C ${BUILD_HOME}/tc .

