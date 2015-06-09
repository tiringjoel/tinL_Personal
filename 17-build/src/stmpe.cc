//-------------------------
//stmpe
//(c) H.Buchmann FHNW 2015
//-------------------------
#include <iostream>
#include <sys/stat.h>
#include <fcntl.h>
#include <linux/ioctl.h>
#include <linux/spi/spidev.h>
#include <unistd.h>
#include <stropts.h>
class STMPE
{
 public:
   STMPE();
  ~STMPE();
 private:
  static const char Device[];
  int fd=-1;
  void transfer(unsigned char* tx,unsigned char* rx,unsigned l);
  void transfer(unsigned char* tx,unsigned len);
};

const char STMPE::Device[]="/dev/spidev0.1";



void STMPE::transfer(unsigned char* tx,unsigned char* rx,unsigned l)
{
 struct spi_ioc_transfer transfer
 {
  .tx_buf=(long unsigned)tx,
  .rx_buf=(long unsigned)rx,
  .len   =l,
  .speed_hz=500000,
  .delay_usecs=0,
  .bits_per_word=8,
  .cs_change=0,
  
  .pad=0
 };
 int status=ioctl(fd,SPI_IOC_MESSAGE(1), &transfer);
 std::cerr<<"status="<<status<<"\n";
 for(unsigned i=0;i<l;++i)
 {
  std::cerr<<i<<"\t"<<std::hex<<(unsigned)tx[i]<<"\t"
                              <<(unsigned)rx[i]<<"\n";
 }
}

void STMPE::transfer(unsigned char* tx,unsigned len)
{
 unsigned char rx[len];
 transfer(tx,rx,len);
}

#if 0
void STMPE::transfer() //very experimental
{
 static const unsigned LEN=32;   
 unsigned char tx[LEN];
 unsigned char rx[LEN];
 unsigned l=0;
 tx[l++]=0x80;
 tx[l++]=0x81;
 tx[l++]=0x82;
 tx[l++]=0x04;tx[l++]=0xe;
 tx[l++]=(0x80|0x04);  
 tx[l++]=0x80;
 tx[l++]=0x80;
 
 struct spi_ioc_transfer transfer
 {
  .tx_buf=(long unsigned)tx,
  .rx_buf=(long unsigned)rx,
  .len   =l,
  .speed_hz=500000,
  .delay_usecs=0,
  .bits_per_word=8,
  .cs_change=0,
  .pad=0
 };
 int status=ioctl(fd,SPI_IOC_MESSAGE(1), &transfer);
 std::cerr<<"status="<<status<<"\n";
 for(unsigned i=0;i<l;++i)
 {
  std::cerr<<i<<"\t"<<std::hex<<(unsigned)tx[i]<<" "<<(unsigned)rx[i]<<"\n";
 }
}
#endif

STMPE::STMPE()
:fd(::open(Device,O_RDWR))
{
 if (fd<0)
    {
     std::cerr<<"error opening "<<Device<<"\n";
     return;
    }
unsigned char id[]={0x80,0x81,0x82,0x83,0x80|0x04,0x00};
transfer(id,sizeof(id));

unsigned char CTRL2[]={0x04,0x0};
transfer(CTRL2,sizeof(CTRL2));

transfer(id,sizeof(id));
unsigned char GPIO_SET_DIR[]={0x13,(0x3<<2)};
transfer(GPIO_SET_DIR,sizeof(GPIO_SET_DIR));
unsigned char GPIO_GET_DIR[]={(0x80|0x13),0};
transfer(GPIO_GET_DIR,sizeof(GPIO_GET_DIR));

unsigned char GPIO_SET_PIN[]={0x11,(3<<2)};
transfer(GPIO_SET_PIN,sizeof(GPIO_SET_PIN));

unsigned char GPIO_SET_PIN_GET[]={0x80|0x11,0};
transfer(GPIO_SET_PIN_GET,sizeof(GPIO_SET_PIN_GET));
// transfer();
#if 0
 std::cerr<<std::hex<<rd(0)<<"\n"
          <<std::hex<<rd(1)<<"\n";
#endif
}

STMPE::~STMPE()
{
 if (fd>0) ::close(fd);
}

int main(int argc,char** args)
{
 STMPE stmpe;
}
