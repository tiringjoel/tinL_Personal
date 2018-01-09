/*----------------------------
  read-device
  (c) H.Buchmann FHNW 2012
  ----------------------------
 calling read-device name 
*/
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc,char** args)
{
 if (argc!=2)
    {
     fprintf(stderr,"usage %s device\n",args[0]);
     return 1;
    }
 int fid=open(args[1],O_RDWR);
 if (fid<0)
    {
     perror("open");
     return 1;
    }
 char buffer[1000];
 unsigned cnt=24;
 while(1)
 {
  int l=read(fid,buffer,sizeof(buffer));
  if (l<0)
     {
      perror("read");
      return 1;
     }
  if (l==0) break;   
  write(STDERR_FILENO,buffer,l);
 }
 
 printf("\n");
 return 0;
}
  
