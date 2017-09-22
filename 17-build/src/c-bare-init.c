/*------------------------
  bare-init
  (c) H.Buchmann FHNW 2015 
  using syscall for
    ssize_t write(int fildes, const void *buf, size_t nbyte)

  kernel parameter   
    console=ttyAMA0,115200 root=/dev/mmcblk0p3 rootfstype=ext4 rootwait init=/c-bare-init
  ------------------------*/
#include <unistd.h> 
#include <syscall.h>
static const char Msg[]="Hello World";
void _start()
{
#if 1
 syscall(__NR_write,
        0, //fildes
	Msg,
	sizeof(Msg)-1);
#endif
 while(1)
 {
 }
}   
