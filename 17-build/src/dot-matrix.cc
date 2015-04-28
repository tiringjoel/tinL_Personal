//--------------------------
//dot-matrix
//(c) H.Buchmann FHNW 2015
//[1] MAX7219-MAX7221.pdf
//--------------------------
#include <iostream>
#include <iomanip>
#include "max7219.h"
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <linux/spi/spidev.h>
#include <sys/ioctl.h>

class DotMatrix
{
 public:
   DotMatrix();
   typedef Max7219<2> Max;
   Max max7219;
 private:
  static const char Device[];
  static const Max::Cmd  Init[];
};

const char DotMatrix::Device[]="/dev/spidev0.0";
const DotMatrix::Max::Cmd DotMatrix::Init[]=
{
 {Max::DECODE_MODE,0x00},
 {Max::INTENSITY  ,0x00},
 {Max::SCAN_LIMIT ,0x07},
 {Max::SHUTDOWN,   0x01},
 {Max::TEST	  ,0x00},
};

DotMatrix::DotMatrix()
:max7219(Device)
{
 for(const Max::Cmd& c:Init)  max7219.cmd(c);
 unsigned pattern=1;
 for(unsigned d=0;d<8;++d)
 {
//  digit(d,pattern);
  pattern<<=1;
 }
}


int main(int argc,char** args)
{
 DotMatrix dm;
 return 0;
}
