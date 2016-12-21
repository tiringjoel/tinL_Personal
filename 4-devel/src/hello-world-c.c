/*----------------------
  hello-world
  (c) H.Buchmann FHNW 2014
------------------------*/
#include <stdio.h>
int main(int argc,char** args)
{
 unsigned val=100;
 printf("Hello World "__DATE__" %d\n",val);
 return 0;
}
