#--------------------
#install-rule
#(c) H.Buchmann FHNW 2015
#${1} the rule
#--------------------
 
sudo cp ${1} /etc/udev/rules.d/

#----------------- restart udev 
sudo udevadm control -R
