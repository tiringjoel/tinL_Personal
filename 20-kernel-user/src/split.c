/*---------------------------
  split.c
  (c) H.Buchmann FHNW 2018
  ---------------------------*/
#include <stdio.h>

int main(int argc,char** args)
{
 while(1)
 {
  char ch;
  size_t len=fread(&ch,1,sizeof(ch),stdin);
  if (len<0) break;
  if (ch=='\0')
     {
      printf("\n");
     }
     else
     {
      printf("%c",ch);
     }
 }
 
 return 0;
} 
