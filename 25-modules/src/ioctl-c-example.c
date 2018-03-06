/*------------------------
ioctl-c-example.c
 terminal/serial line
(c) H.Buchmann FHNW 2018
 see manual page ioctl_tty
 TODO set speed
------------------------*/
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <termios.h>
#include <stdio.h>
#include <sys/ioctl.h>


static const char Terminal[]="/dev/ttyUSB0";
int main(int argc,char** args)
{
 int fid=open(Terminal,O_RDWR);
 perror("open");
 if (fid<0) return 0;
 struct termios term;
 int cod=ioctl(fid,TCGETS,&term);
// int cod=tcgetattr(fid,&term); //works too
 perror("ioctl");
 if (cod<0)
    {
     close(fid);
     return 0;
    }
 speed_t speed=cfgetospeed(&term);
 printf("speed = %d\n",speed);
 close(fid);
 return 0;
}
