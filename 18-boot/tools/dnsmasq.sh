#-----------------------
#dnsmasq.sh
#(c) H.Buchmann FHNW 2015
#-----------------------
MAC=54:4a:16:c9:7e:bf
IFC=enp0s20u3
sudo ifconfig ${IFC} 192.168.0.1 up
sudo dnsmasq \
	--interface=${IFC} \
	--no-daemon \
	--conf-file=config/dnsmasq.conf
