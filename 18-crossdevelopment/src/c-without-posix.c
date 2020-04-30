/*------------------------
  c-without-posix.c
  (c) H.Buchmann FHNW 2020 
  using syscall for
    ssize_t write(int fildes, const void *buf, size_t nbyte)
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
