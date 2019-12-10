//---------------------------
//uevent.cc
//(c) H.Buchmann FHNW 2019
//---------------------------
#include "uevent.h"
#include <iostream>
#include <sys/socket.h>
#include <linux/netlink.h>
#include <cstdio>
#include <cstring>
#include <unistd.h>
UEvent::UEvent(Listener& li)
:li(li)
,sok(socket(PF_NETLINK, SOCK_RAW, NETLINK_KOBJECT_UEVENT))
{
 if (sok<0)
    {
     std::perror("socket");
     return;
    }
 struct sockaddr_nl nls;
 std::memset(&nls,0,sizeof(nls));
 nls.nl_family = AF_NETLINK;
 nls.nl_pid = getpid();
 nls.nl_groups = 1;
 int res = ::bind(sok, (struct sockaddr *)&nls, sizeof(nls));
 if (res<0)
    {
     std::perror("socket");
     return;
    }
 ok=true;
}

void UEvent::result(char s[],int len)
{
 Listener::Result res;
 unsigned beg=0;
 for(int i=0;i<len;++i)
 {
  if (s[i]=='\0')
     {
      res.push_back(std::string(s+beg,s+i));
      beg=i+1;
     }
 }
 li.onEvent(res);
}


void UEvent::listen()
{
 if (!ok)
   {
    std::cerr<<"not listening\n";
    return;
   }
 char buffer[BUFFER];
 while(true)
 {
  int len=::recv(sok, buffer, BUFFER, 0); //listen the read of sockets
  if (len>0)
     {
      buffer[len]='\0';
      result(buffer,len);
     }
     else
     {
      std::perror("receive");
     }
 }
}
