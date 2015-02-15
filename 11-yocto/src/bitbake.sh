#-------------------
#bitbake.sh
#(c) H.Buchmann FHNW 2014
#-------------------
BITBAKE=${HOME}/devel/yocto/poky/bitbake
export BBPATH=$(pwd)
export PATH=${BITBAKE}/bin:${PATH}
PERSISTENT_DIR=$(pwd)/persistent_dir
bitbake ${@}
