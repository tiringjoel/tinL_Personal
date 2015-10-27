#-------------------------
#power-rail.sh
#(c) H.Buchmann FHNW
#-------------------------
I2C=0x24
GET="i2cget -y -f 0 ${I2C}"
SET="i2cset -y -f 0 ${I2C}"
${GET} 0x0

#---------------------
# 0001 0110
# 0111 1101
# 0110 1011 6  
PWD=0x0b
ENABLE=0x16
MASK=0x7d
${SET} ${PWD} $((MASK ^ ENABLE))
#
${SET} ${ENABLE} 0x6e
