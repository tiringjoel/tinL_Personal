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
#KERNEL=../../5-kernel/build/arch/arm/boot/zImage 
#KERNEL=/home/edu/tinl/5-kernel/build/arch/arm/boot/zImage
#dont works
qemu-system-arm -kernel ${KERNEL} \
-cpu arm1176 -m 256 -M versatilepb \
-append "console=ttyAMA0,115200 init=//usr/share/systemd root=/dev/sda1" \
-hda ${1} \
-serial stdio \
-redir tcp:5022::22
