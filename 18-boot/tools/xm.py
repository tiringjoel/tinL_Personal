#---------------------------
#xmodem
#(c) H.Buchmann FHNW 2015
#---------------------------
import serial
import crc16
import sys

uart=serial.Serial('/dev/ttyUSB0',115200)
src=open('image','rb')

EOT =b'\4'
ACK =b'\6'
NACK=b'\15'
C   =b'C'

class Packet:
	Len=1024
	STX=2
	def __init__(self,n):
		pl=src.read(Packet.Len)                          #the payload
		sys.exit(1)
		l=len(pl)
		self.lenn=len(pl)
		if (self.lenn<Packet.Len):
			pl+=bytes(Packet.Len-self.lenn)               # padding
		crc=crc16.crc16xmodem(pl)
		self.pac=bytes([Packet.STX,n,(~n)&0xff])+pl+bytes([(crc>>8)&0xff,crc&0xff])
		
	def last(self):return self.lenn<Packet.Len

	def length(self):return self.lenn

	def empty():return self.lenn==0
		
	def tx(self):
		if self.lenn==0:return False
		uart.write(self.pac)
		return True

while uart.read()!=C:
	pass

print('connected')

pacN=1	#the packet number

len=0
while True:
	p=Packet(pacN)
	if not p.tx():break
	resp=uart.read()
	len+=p.length()
	print(format(len,'8x'),uart.read())
	if p.last():break;
	pacN+=1
	pacN&=0xff

uart.write(EOT)
print(uart.read())
