/*-------------------------
  hello-world.c
  (c) H.Buchmann FHNW 2015
  printf/fprintf
  -------------------------*/
#include <stdio.h>
  
int main(int argc,char** args)
{
  printf(       "------------- printf\n");
    /* output on stdout */
 fprintf(stderr,"----- fprintf(stderr\n");
 fprintf(stdout,"----- fprintf(stdout\n");
    /* same as printf */
 return 0;
}
