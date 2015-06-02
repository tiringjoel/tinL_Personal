//-------------------------
//stmpe
//(c) H.Buchmann FHNW 2015
//-------------------------
#include <iostream>
#include <sys/stat.h>
#include <fcntl.h>
#include <linux/spi/spidev.h>
#include <unistd.h>

class STMPE
{
 public:
   STMPE();
  ~STMPE();
 private:
  static const char Device[];
  int fd=-1;
};

const char STMPE::Device[]="/dev/spidev0.1";

STMPE::STMPE()
:fd(::open(Device,O_RDWR))
{
 if (fd<0)
    {
     std::cerr<<"error opening "<<Device<<"\n";
     return;
    }
 unsigned char id=0x80;
 int res=::write(fd,&id,sizeof(id));
 std::cerr<<"write res="<<res<<"\n";
 static const unsigned ANS=2;
 unsigned char ans[ANS];
 for(unsigned i=0;i<ANS;++i)
 {
  unsigned char out=0;
//  ::write(fd,&out,sizeof(out));
  unsigned char in=0;
  ::read(fd,&in,sizeof(in));
  std::cerr<<"ans["<<i<<"]="<<std::hex<<(unsigned)in<<"\n";
 }
}

STMPE::~STMPE()
{
 if (fd>0) ::close(fd);
}

int main(int argc,char** args)
{
 STMPE stmpe;
}
