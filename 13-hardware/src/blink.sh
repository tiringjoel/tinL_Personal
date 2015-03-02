#---------------------
#blink.sh using hw-access
#(c) H.Buchmann FHNW 2015
# copy into work
#---------------------
PIO=$((1<<15))
PORT_ON=0x20200020
PORT_OFF=0x2020002C
while true
do
./hw-access wr ${PORT_ON} ${PIO}
sleep 0.5
./hw-access wr ${PORT_OFF} ${PIO}
sleep 0.5
done
