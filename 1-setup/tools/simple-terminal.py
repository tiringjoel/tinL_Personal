#!/bin/env python
#--------------------------
#simple-terminal.py
#(c) H.Buchmann FHNW 2017
#--------------------------
import argparse
import serial
import sys
import threading
import termios
import atexit

parser=argparse.ArgumentParser()
parser.add_argument('device',help="the serial devices")
parser.add_argument('-b','--baud',default=115200,help='baudrate[115200]')
args=parser.parse_args()

port=serial.Serial(port=args.device,baudrate=args.baud)


#threading.Thread(target=rx).start()
#threading.Thread(target=tx).start()

class TX:
 def __init__(self):
  self.old = termios.tcgetattr(sys.stdin)
  atexit.register(self.restore)
  new = termios.tcgetattr(sys.stdin)
  new[3] = new[3] & ~(termios.ICANON | termios.ECHO) # & ~termios.ISIG
  termios.tcsetattr(sys.stdin, termios.TCSANOW, new)
  threading.Thread(target=self.run).start()
  
 def run(self):
  while True:
   port.write(sys.stdin.read(1).encode('utf-8'))  

 def restore(self):
     termios.tcsetattr(sys.stdin, termios.TCSAFLUSH, self.old)

class RX:
 def __init__(self):
  threading.Thread(target=self.run).start()

 def run(self):
  while True:
   sys.stdout.write(port.read(1).decode('utf-8'))
   sys.stdout.flush()

RX()
TX()

