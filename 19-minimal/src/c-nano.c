/*--------------------------
 nano.c
 (c) H.Buchmann FHNW 2017
  using syscall for
  ssize_t write(int fildes, const void *buf, size_t nbyte)
 --------------------------*/

#define __NR_write	4

static const char Msg[]="Hello: "__FILE__"\n";

void _start()
{
 while(1)
 {
  syscall(__NR_write,
         0, //filedes
         Msg,
         sizeof(Msg)-1   /* exclusive terminating zero */
         );
 }
}
 
