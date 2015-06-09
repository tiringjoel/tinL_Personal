#---------------------
#blink.sh using hw-access
#(c) H.Buchmann FHNW 2015
# copy into work
#---------------------
ACT_LED=$((1<<15))
PWR_LED=$((1<<3))
PORT_ON=0x20200020
PORT_OFF=0x2020002C
PIO=${ACT_LED}
while true
do
./direct-memory wr ${PORT_ON} ${PIO}
sleep 0.5
./direct-memory wr ${PORT_OFF} ${PIO}
sleep 0.5
done
