#pragma once
/*-----------------------
 udp.h
 (c) H.Buchmann FHNW 2015
-------------------------*/
/* TODO opaque types */
#include <stdlib.h>
#include <stdio.h>
#include <netdb.h>
#include <sys/types.h>
#include <string.h>
#include <errno.h>
#include <sys/socket.h>

typedef struct 
{
 int id;  //socket id
}udp_ServerSocket;


typedef struct
{
 int id;  //socket id
} udp_ClientSocket;

typedef struct
{
 struct sockaddr_in addr;
} udp_Address;

typedef unsigned short udp_Port;


/*----------------------------------------- server */
extern int udp_open_server(udp_Port port,
                           udp_ServerSocket* sock);

extern int udp_read_server(udp_ServerSocket* sock,
                           udp_Address*      fromClient,
                           void* data,
			   unsigned len);

extern int udp_write_server(udp_ServerSocket* sock,
                            udp_Address*      toClient,
                            void* data,
			    unsigned len);

/*----------------------------------------- client */
extern int udp_open_client(const char* host,
                           udp_Port port,
                           udp_ClientSocket* sock);
			   
extern int udp_read_client(udp_ClientSocket* sock,
                           void* data,
			   unsigned len);
extern int udp_write_client(udp_ClientSocket* sock,
                            void* data,
			    unsigned len);
