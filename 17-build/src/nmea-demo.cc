//-----------------------
//nmea-demo gps
//(c) H.Buchmann FHNW 2015
//-----------------------
#include <iostream>
#include <fstream>
#include <iomanip>
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>

class Demo
{
 public:
   Demo();
  ~Demo();
 private:
  static const unsigned MSG=1024;
  char msg[MSG];
  unsigned msgLen;
  
  void read();
  void readMsg();
  static const char Device[];
  std::ifstream src;
  int fd=-1;
  static unsigned digit(char ch);
};


const char Demo::Device[]="/dev/ttyAMA0";

Demo::Demo()
//:fd(::open(Device,O_RDWR))
:src(Device)
{
 if (!src) 
    {
     std::cerr<<"error opening '"<<Device<<"'\n";
     return;
    }
 readMsg();
}

Demo::~Demo()
{
 if (fd>0) ::close(fd);
}

void Demo::read()
{
 while(true)
 {
  int ch=src.get();
  if (ch<0) break;
  std::cerr<<(char)ch;
 }
}

unsigned Demo::digit(char ch)
{
 if (('0'<=ch)&&(ch<='9')) return ch-'0';
 if (('a'<=ch)&&(ch<='f')) return ch-'a'+10;
 return ch-'A'+10;
}

void Demo::readMsg()
{
 unsigned i=0;
 int crc=0;
 unsigned status=0;
 while(true)
 {
  int ch=src.get(); 
  switch(status)
  {
   case 0: //outside
    if (ch=='$')
       {
        i=0;
	crc=0;
	status=1;
       }
   break;
   case 1: //inside
    if (ch=='*')
       {
        msg[i]='\0';
	status=2;
	break;
       }
    msg[i++]=(char)ch;
    crc^=ch;
   break;
   case 2: //crc first
    crc^=(digit(ch)<<4);
    status=3;
   break;
   case 3:
    crc^=digit(ch);
    status=0;
    std::cerr<<msg<<"\t"<<std::hex<<crc<<"\n";
   break;
  } 
 }
}

int main(int argc,char** args)
{
 Demo demo;
 return 0;
}
