//--------------------------
//dot-matrix
//(c) H.Buchmann FHNW 2015
//[1] 
//--------------------------
#include <iostream>
#include <iomanip>

#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <linux/spi/spidev.h>
#include <sys/ioctl.h>

class DotMatrix
{
 public:
   DotMatrix();
  ~DotMatrix();
   
 private:
  struct Cmd
  {
   enum Key {NOP=0,
             DIG0=1,DIG1=2,DIG2=3,DIG3=4,DIG4=5,DIG5=6,DIG6=7,DIG7=8,
	     DECODE_MODE= 9,
	     INTENSITY  =10,
	     SCAN_LIMIT =11,
	     SHUTDOWN   =12,
	     TEST       =15
	    };
   Key      key;
   unsigned val;
  };
  int fd;
  void cmd(Cmd::Key key0,unsigned val0,
           Cmd::Key key1,unsigned val1);
  void cmd(Cmd::Key key,unsigned val){cmd(key,val,key,val);}
  void cmd(const Cmd& c0,const Cmd& c1){cmd(c0.key,c0.val,c1.key,c1.val);}
  void cmd(const Cmd& c){cmd(c,c);}
  void digit(unsigned d,unsigned pattern){cmd((Cmd::Key)(Cmd::DIG0+d),pattern);}
  static const char Device[];
  static const Cmd  Init[];
};

const char DotMatrix::Device[]="/dev/spidev0.0";
const DotMatrix::Cmd  DotMatrix::Init[]=
{
 {Cmd::DECODE_MODE,0x00},
 {Cmd::INTENSITY  ,0x00},
 {Cmd::SCAN_LIMIT ,0x07},
 {Cmd::SHUTDOWN,   0x01},
 {Cmd::TEST       ,0x00},
};

DotMatrix::DotMatrix()
:fd(::open(Device,O_RDWR))
{
 if (fd<0)
    {
     std::cerr<<"Error opening device '"<<Device<<"\n";
     return;
    }
 for(const Cmd& c:Init)  cmd(c);
 unsigned pattern=1;
 for(unsigned d=0;d<8;++d)
 {
  digit(d,pattern);
  pattern<<=1;
 }
}

DotMatrix::~DotMatrix()
{
 if (fd>0) ::close(fd);
}

void DotMatrix::cmd(Cmd::Key key0,unsigned val0,
                    Cmd::Key key1,unsigned val1)
{
 unsigned char tx[4]={(unsigned char)(key0&0x0f),
                      (unsigned char)(val0&0xff),
                      (unsigned char)(key1&0x0f),
                      (unsigned char)(val1&0xff)};
 ::write(fd,tx,4);
}	    

int main(int argc,char** args)
{
 DotMatrix dm;
 return 0;
}
