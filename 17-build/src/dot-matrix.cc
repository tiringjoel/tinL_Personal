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

DotMatrix::DotMatrix()
:max7219(Device)
{
 max7219.decode(0).set();
 max7219.intensity(0).set();
 max7219.scanLimit(7).set();
 max7219.enable().set();
 for(unsigned d=0;d<8;++d) max7219.pattern(d,0).set();
 unsigned pattern=1;
 for(unsigned d=0;d<8;++d)
 {
//  pattern>>=1;
  max7219.pattern(d,pattern).set();
//  pattern=pattern|(pattern<<1);
  pattern|=(pattern<<1);
 }
}


int main(int argc,char** args)
{
 DotMatrix dm;
 return 0;
}
