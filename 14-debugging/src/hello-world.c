/*-------------------------
  hello-world.c
  (c) H.Buchmann FHNW 2015
  printf/fprintf
  -------------------------*/
#include <stdio.h>
  
int main(int argc,char** args)
{
  printf(       "------------- printf\n");
 fprintf(stderr,"----- fprintf(stderr\n");
 fprintf(stdout,"----- fprintf(stdout\n");
 return 0;
}
