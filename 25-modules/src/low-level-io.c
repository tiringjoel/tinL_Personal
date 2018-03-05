/*------------------------
  low-level-io.c 
  (c) H.Buchmann FHNW 2018
  POSIX
 -------------------------*/
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>

static const char FileName[]="../src/low-level-io.c";


int main(int argc,char** args)
{
 int fid=open(FileName,O_RDONLY);
 perror("open");
#define BUFFER 64
 char buffer[BUFFER];
 while(1)
 {
  int len=read(fid,buffer,BUFFER);
  if (len<0)
     {
      perror("read");
      break;
     }
  if (len>0)
     {
      write(STDOUT_FILENO,buffer,len);
     }
  if (len<BUFFER)
     {
      break;
     }
 }
 close(fid);
 return 0;
}
