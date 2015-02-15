#--------------------
#common.sh
#(c) H.Buchmann FHNW 2015
#--------------------
#we are in 12-toolchain
SIGNATURE=.674c09cf-ac29-40e4-a768-5608a462a3e1
#empty file generated with
# touch .$(uuidgen)
#check if we are in 12-toolchain
[[ ! -f ${SIGNATURE} ]] && 
  {
   echo "your are not in toolchain"
   exit 1  
  }
TOOLCHAIN=$(pwd) # absolute path  to here
#the paths

SCRIPTS=${TOOLCHAIN}/scripts

TARGET=armv6l-unknown-linux-gnueabihf
#why this name

TARGET_PREFIX=${TOOLCHAIN}/tc
#used in --prefix

TARGET_ROOT=${TOOLCHAIN}/foo

#used in --with-sysroot

#the source code of the binutils
BINUTILS=${HOME}/devel/gcc/dist/binutils-2.25
GCC=${HOME}/devel/gcc/dist/gcc-4.9.2

#--------------------- create build directory
[[ ! -d build ]] && mkdir build
cd build

#the make command 
MAKE="make -j4"

