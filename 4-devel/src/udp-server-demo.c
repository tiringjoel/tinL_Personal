/*------------------------
  udp-demo.c
  (c) H.Buchmann FHNW 2015
-------------------------*/
#include "udp.h"
#include <stdio.h>

int main(int argc,char** args)
{
 udp_ServerSocket server;
 int port=1234;
 printf("listening on port %d\n",port);
 int cod=udp_open_server((udp_Port)port,&server); 
                         /* TODO proper suffix for unsigned short */
 udp_Address client;
 char data[1024];
 while(1)
 {
  int siz=udp_read_server(&server,&client,data,sizeof(data));
  if (siz<0)
     {
      perror("udp_read_server");
      return 0;
     }
  printf("%s\n",data); 
  if (udp_write_server(&server,&client,data,siz)<0)
     {
      perror("udp_write_server");
      return 0;
     }
 }
}
  
