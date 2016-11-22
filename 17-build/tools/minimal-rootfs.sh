#-----------------------
#minimal-rootfs.sh
#(c) H.Buchmann FHNW 2015
# we are in 17-build
#-----------------------
ROOTFS=minimal-rootfs

tar -czvf ${ROOTFS}.tar.gz \
--exclude='man' \
--exclude='ect/id_rsa' \
--exclude='ect/id_rsa.pub' \
--exclude='etc/moduli' \
--exclude='etc/ssh*' \
--exclude='usr/include' \
--exclude='lib/*.a' \
--exclude='share/info/*' \
-C target-root .
