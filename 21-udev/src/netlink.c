/*-----------------------------
  netlink
  (c) H.Buchmann FHNW 2015
  compile/link with 
  gcc ../src/netlink.c -o netlink -I /usr/include/libnl3/ -lnl-3
  -----------------------------*/
#include <netlink/netlink.h>
#include <stdio.h>
#include <string.h>

static int callBack(struct nl_msg *msg, void *arg)
{
 printf("-------------- call back\n");
 return 0;
}

int main(int argc,char** args)
{
 struct nl_sock* sk=nl_socket_alloc();
 printf("s=%p\n",sk);
 nl_socket_disable_seq_check(sk);
// nl_socket_modify_cb(sk, NL_CB_VALID, NL_CB_CUSTOM, callBack, NULL);
 printf("nl_socket_modify_cb=%d\n",
        nl_socket_modify_cb(sk, NL_CB_MSG_IN, NL_CB_DEBUG, callBack, NULL));
// nl_connect(sk, NETLINK_ROUTE);
 nl_connect(sk, NETLINK_KOBJECT_UEVENT);
// nl_socket_add_memberships(sk, RTNLGRP_LINK, 0);
 printf("err=%d\n",nl_socket_add_memberships(sk, 1, 0));
 while(1)
 {
    nl_recvmsgs_default(sk);
 }
 nl_socket_free(sk);
 return 0;
}
