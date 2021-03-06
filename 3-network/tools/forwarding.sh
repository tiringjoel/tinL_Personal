#----------------------
#forwarding.sh
#(c) H.Buchmann FHNW 2018
#----------------------
#INTER_NET=enp0s20u2
#INTER_NET=vpn0
INTER_NET=enp0s20f0u3u2
LOCAL_NET=eth0

sudo sysctl net.ipv4.ip_forward=1

sudo iptables -t nat -A POSTROUTING -o ${INTER_NET} -j MASQUERADE
sudo iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i ${LOCAL_NET} -o ${INTER_NET} -j ACCEPT
