/*-------------------------
 udp.c
 (c) H.Buchmann FHNW 2015
---------------------------*/
#include "udp.h"

int udp_open_server(udp_Port port,
                    udp_ServerSocket* sock)
{
 struct sockaddr_in addr=
   {
     sin_family: AF_INET,
     sin_port:   htons(port),
     sin_addr:   {s_addr:htonl(INADDR_ANY)}
   };
 sock->id=socket(PF_INET,SOCK_DGRAM,0);
 if (sock->id<0) return sock->id;
 if (bind(sock->id,(struct sockaddr*)&addr,sizeof(addr))<0) return -1;
}		    


int udp_read_server(udp_ServerSocket* sock,
                    udp_Address*      fromClient,
                    void* data,
	            unsigned len)
{
 
  unsigned socklen=sizeof(fromClient->addr);
  return recvfrom(sock->id,
                  data,len,
		  0,
		  (struct sockaddr*)&(fromClient->addr),
		  &socklen);
}


int udp_write_server(udp_ServerSocket* sock,
                     udp_Address*      toClient,
                     void* data,
		     unsigned len)
{
 return sendto(sock->id,
	data,len,
	0,
	(struct sockaddr*)&(toClient->addr),sizeof(toClient->addr)
        );
}

int udp_open_client(const char* hostName,udp_Port port,
		    udp_ClientSocket* sock)
{
 struct hostent* host=gethostbyname(hostName);  /* TODO see man page */
 if (host==0) return -1;
 sock->id=socket(PF_INET,SOCK_DGRAM,0);
 if (sock->id<0) return sock->id;
 struct sockaddr_in addr;      /* see man 7 udp resp man 7 ip */
 memset(&addr,0,sizeof(addr));
 addr.sin_family=AF_INET;
 addr.sin_port  =htons(port);
 addr.sin_addr.s_addr=*(unsigned*)(*(host->h_addr_list));
 if (connect(sock->id,
            (struct sockaddr*)&addr,  /* very ugly c */
	     sizeof(addr))<0) return -1;
}

int udp_read_client(udp_ClientSocket* sock,
		    void* data,
 		    unsigned len)
{
 return recv(sock->id,data,len,0);
}
		    
int udp_write_client(udp_ClientSocket* sock,
                     void* data,
	             unsigned len)
{
 return send(sock->id,data,len,0);
}		     
