#!/bin/bash
#-----------------------------
#clean-all.sh
#(c) H.Buchmann FHNW 2016
#-----------------------------
DIRS=(tc)
DIRS=(target-root)
for d in ${DIRS[@]}
do
 rm -rf $d
 mkdir $d
done
#BUILD=(binutils gcc-bare kernel)
BUILD=(musl)
pushd build 	>/dev/null
for d in ${BUILD[@]}
do
 rm -rf $d
done
popd 		>/dev/null

