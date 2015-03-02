#-------------------
#gpio.sh
#(c) H.Buchmann FHNW 2015
#${1} port
#good ports:
#   47: ACT_LED
#   35: PWR_LED
#-------------------
GPIO=/sys/class/gpio
pin=${1}
echo "pin=${pin}"
echo ${GPIO}/gpio${pin}
[[ ! -d ${GPIO}/gpio${pin} ]] &&
{
 echo ${pin} > ${GPIO}/export;
 echo out  > ${GPIO}/gpio${pin}/direction
}

echo 1    > ${GPIO}/gpio${pin}/value
sleep 0.5
echo 0    > ${GPIO}/gpio${pin}/value
pin=$((pin+1))


