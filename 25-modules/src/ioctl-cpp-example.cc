//---------------------
//ioctl-cpp-example.cc
//(c) H.Buchmann FHNW 2018
//-----------------------
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <termios.h>
#include <sys/ioctl.h>
#include <iostream>

class Terminal
{
 public:
   Terminal(const char id[]);
  ~Terminal();
  speed_t speed()const{return speed_;}
 private:
  termios term;
  int fid      =-1; 
  speed_t speed_=B0;
};

Terminal::Terminal(const char id[])
:fid(::open(id,O_RDWR))
{
 perror("open");
 if (fid<0) return;
 int cod=ioctl(fid,TCGETS,&term);
 perror("ioctl");
 if (cod<0)
    {
     return;
    }
 speed_=cfgetospeed(&term);
}

Terminal::~Terminal()
{
 if (fid>0) 
    {
     ::close(fid);
    }
}
static const char Name[]="/dev/ttyUSB0";

int main(int argc,char** args)
{
 Terminal t(Name);
 std::cout<<"speed "<<t.speed()<<"\n";
}
