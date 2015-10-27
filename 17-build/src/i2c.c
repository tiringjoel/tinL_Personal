/*-----------------------------
 i2c
 (c) H.Buchmann FHNW 2015
 ------------------------------*/
#include <linux/i2c-dev.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stropts.h>
#include <unistd.h>

static const char i2cPort[]="/dev/i2c-0";
static const int Addr=0x24;
int main(int argc,char** args)
{
 int fid=open(i2cPort,O_RDWR);
 perror("open");
 ioctl(fid,I2C_SLAVE_FORCE,Addr); /* I2C_SLAVE */
 perror("I2C_SLAVE_FORCE");
 unsigned char reg=0;
 write(fid,&reg,sizeof(reg));
 perror("write");
 unsigned char id;
 
 read(fid,&id,sizeof(id));
 perror("read");
 printf("id=%x\n",id);
 return 0;
}
