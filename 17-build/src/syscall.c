/*-------------------------
  syscall.c
  (c) H.Buchmann FHNW 2015
  docu man syscall
 --------------------------*/
#include <unistd.h>   
#include <sys/syscall.h>

int main(int argc,char** args)
{
 static const char msg[]="Hello Syscall\n";
                       /* 01234567890123 */
/*
 posix call
 write(ssize_t write(int fd, const void *buf, size_t count);
*/	       
 syscall(__NR_write,0,msg,14);
/*      |           |-------------- fd=stdout
        |--------------------------- id f
*/
 return 0;
}
