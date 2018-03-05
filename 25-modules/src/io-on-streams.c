/*------------------------
  io-on-streams.c 
  (c) H.Buchmann FHNW 2018
  POSIX
 -------------------------*/
#include <stdio.h>

static const char FileName[]="../src/io-on-streams.c";


int main(int argc,char** args)
{
 FILE* fid=fopen(FileName,"r");
 perror("fopen");
#define BUFFER 64
 char buffer[BUFFER];
 while(1)
 {
  int len=fread(buffer,1,BUFFER,fid);
  if (len<0)
     {
      perror("fread");
      break;
     }
  if (len>0)
     {
      fwrite(buffer,1,len,stdout);
     }
  if (len<BUFFER)
     {
      break;
     }
 }
 fclose(fid);
 return 0;
}
