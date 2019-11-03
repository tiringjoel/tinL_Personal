#----------------------------
#wifi-network.sh
#(c) H.Buchmann FHNW 2019
#----------------------------
#see 3-network
ip link set wlan0 up
wpa_supplicant -B -D wext -i wlan0 -c /etc/wpa.conf

udhcpc -i wlan0 -s /etc/udhcpc.sh
