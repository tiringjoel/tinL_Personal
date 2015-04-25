#pragma once
//--------------------------------
//max7219 
// Serially Interfaced, 8-Digit LED Display Drivers
//(c) H.Buchmann FHNW 2015
//--------------------------------
#include <iostream>
#include <sys/stat.h>
#include <fcntl.h>
#include <linux/spi/spidev.h>
#include <unistd.h>

template<unsigned N> //N the number of the serial connected chips 
class Max7219
{
 public:
  enum Key {NOP=0,
            DIG0=1,DIG1=2,DIG2=3,DIG3=4,DIG4=5,DIG5=6,DIG6=7,DIG7=8,
	    DECODE_MODE= 9,
	    INTENSITY  =10,
	    SCAN_LIMIT =11,
	    SHUTDOWN   =12,
	    TEST       =15
	   };
  struct Cmd
  {
   Key      key;
   unsigned val;
  };

  Max7219(const char dev[])
  :fd(::open(dev,O_RDWR))
  {
   if (fd<0) std::cerr<<"error opening '"<<dev<<"'\n";
  }

  ~Max7219()
  {
   if (fd>0) ::close(fd);
  }
  
  bool isOpen(){return fd>0;}
  void cmd(const Cmd c[])
  {
   unsigned char tx[2*N];
   unsigned txI=0;
   for(unsigned ci=0;ci<N;++ci)
   {
    const Cmd& cc=c[ci];
    tx[txI++]=(unsigned char)(cc.key&0x0f);
    tx[txI++]=(unsigned char)(cc.val&0xff);
   }
   ::write(fd,tx,2*N);
  }
  
  void cmd(const Cmd& c)
  {
   unsigned char tx[2*N];
   unsigned txI=0;
   for(unsigned ci=0;ci<N;++ci)
   {
    tx[txI++]=(unsigned char)(c.key&0x0f);
    tx[txI++]=(unsigned char)(c.val&0xff);
   }
   ::write(fd,tx,2*N);
  }
  
 private:
  int fd=-1; 
};
