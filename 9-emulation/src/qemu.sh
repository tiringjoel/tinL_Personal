#---------------------
#qemu.sh
#(c) H.Buchmann FHNW 2014
#---------------------
[[ ! -e ${1} ]] && 
{
 echo "usage ${0} imageFile"
 exit 1
}
KERNEL=../../resources/kernel-qemu
#KERNEL=../../5-kernel/build/arch/arm/boot/zImage dont works
qemu-system-arm -kernel ${KERNEL} \
-cpu arm1176 -m 256 -M versatilepb \
-append "root=/dev/sda1 panic=1" \
-hda ${1} \
-redir tcp:5022::22
