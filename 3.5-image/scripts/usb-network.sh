#----------------------------
#usb-network.sh
#(c) H.Buchmann FHNW 2019
#----------------------------
while [ true ]
do
 sleep 0.125
 ifconfig usb0 up
 [ ${?} == "0" ] && break
done

ifconfig usb0 192.168.7.2
/sbin/sshd 
