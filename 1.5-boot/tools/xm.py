#---------------------------
#xmodem
#(c) H.Buchmann FHNW 2015
#---------------------------
import serial
import crc16
import sys
import argparse

uart =None #serial.Serial('/dev/ttyUSB0',115200)
image=None
size=0

EOT =b'\4'
ACK =b'\6'
NACK=b'\15'
C   =b'C'

def arguments():
	parser=argparse.ArgumentParser(description='AM335x Sitara xmodem boot')
	parser.add_argument('-d','--dev',help='serial line (/dev/tty*)')
	parser.add_argument('image'  ,help='the image file')
	global image
	args=parser.parse_args()
	image=open(args.image,'rb');
	global uart
	uart=serial.Serial(args.dev,115200)
	
class Packet:
	Len=1024
	STX=2
	def __init__(self,n):
		pl=image.read(Packet.Len)                        #the payload
		self.len=len(pl)
		if (self.len<Packet.Len):
			pl+=bytes(Packet.Len-self.len)               # padding
		crc=crc16.crc16xmodem(pl)
		self.pac=bytes([Packet.STX,n,(~n)&0xff])+pl+bytes([(crc>>8)&0xff,crc&0xff])

	def last(self):return self.len<Packet.Len

	def size(self):return self.len

	def empty():return self.len==0
		
	def tx(self):
		if self.len==0:return False
		uart.write(self.pac)
		return True

def connect():
	print('connect to: ','"'+uart.name+'"',end='')
	while uart.read()!=C:
		pass
	print(' ok')

def tryIt(action,retry=5):
	while retry>0:
		resp=uart.read()
		if resp==ACK:return
		if resp!=NACK:raise Exception('unexpected response',resp)	
		retry-=1
		action()
	raise Exception('max retry')
#	return

def transmit():
	print('transmit','"'+image.name+'"')
	pacN=1	#the packet number
	global size
	while True:
		p=Packet(pacN)
		if not p.tx():break
		tryIt(lambda :p.tx)
		size+=p.size()
		print('\t0x0'+format(size,'08x'))
		if p.last():break;
		pacN+=1
		pacN&=0xff

def close():
	uart.write(EOT)
	tryIt(lambda :uart.write(EOT))
	print('success',size,' bytes')


arguments()
connect()
transmit()
close()
