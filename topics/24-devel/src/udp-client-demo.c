/*------------------------
  udp-client-demo.c
  (c) H.Buchmann FHNW 2015
--------------------------*/
#include "udp.h"
#include <stdio.h>

int main(int argc,char** args)
{
 if (argc!=2)
    {
     printf("usage: %s host\n",args[0]);
     return 0;
    }
 udp_ClientSocket client;
 int cod=udp_open_client(args[1],
                         (udp_Port)0x12345,&client);
 if (cod<0)
    {
     perror("udp_open_client");
     return 0;
    }
 char out[1024];
 sprintf(out,"Hello World\n");
 int siz=udp_write_client(&client,out,sizeof(out));
 if (siz<0)
    {
     perror("udp_write_client");
     return 0;
    }
    
 char in[1024];
 siz=udp_read_client(&client,in,sizeof(in));
 if (siz<0)
    {
     perror("udp_read_client");
     return 0;
    }
 
 printf("%s\n",in);
 return 0;
}
  
