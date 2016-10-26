#-----------------------
#polipo.sh direct call
#(c) H.Buchmann FHNW 2015
#-----------------------
#we are in 3-network
CACHE=polipo-cache
[[ ! -d ${CACHE} ]] && mkdir ${CACHE}
polipo -c config/polipo.conf diskCacheRoot=$(pwd)/${CACHE}
