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
   for(unsigned i=0;i<2*N;++i) tx[i]=0;
  }

  ~Max7219()
  {
   if (fd>0) ::close(fd);
  }
  
  Max7219& decode(unsigned n,unsigned val){return cmd(n,9,val);}
  Max7219& decode(unsigned val){return cmd(9,val);}
  
  Max7219& intensity(unsigned n,unsigned val){return cmd(n,10,val);}
  Max7219& intensity(unsigned val){return cmd(10,val);}

  Max7219& scanLimit(unsigned n,unsigned val){return cmd(n,11,val);}
  Max7219& scanLimit(unsigned val){return cmd(11,val);}
  Max7219& enable(unsigned n){return cmd(n,12,1);}
  Max7219& enable(){return cmd(12,1);}
  Max7219& disable(unsigned n){return cmd(n,12,0);}
  Max7219& disable(){return cmd(12,0);}
  
  Max7219& pattern(unsigned n,   //0<=n<N
                   unsigned pos, //0<=pos<=scanLimit
		   unsigned pat) //bits 7..0
  {
   return cmd(n,1+(pos&(8-1)),pat);
  }
  
  Max7219& pattern(unsigned pos, //0<=pos<=scanLimit
		   unsigned pat) //bits 7..0
  {
   return cmd(1+(pos&(8-1)),pat);
  }

  void set(){::write(fd,tx,2*N);}
  
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
  unsigned char tx[2*N];
  Max7219& cmd(unsigned n,unsigned key,unsigned val)
  {
   if (n>=N) return *this;
   unsigned ci=2*n;
   tx[ci  ]=(unsigned char)(key&0x0f);
   tx[ci+1]=(unsigned char)(val&0xff);
   return *this;
  }

  Max7219& cmd(unsigned key,unsigned val)
  {
   for(unsigned n=0;n<N;++n)cmd(n,key,val);
   return *this;
  }
};
