/*---------------------------
 ring-buffer.c
 (c) H.Buchmann FHWN 2018
  ---------------------------*/
#include <stdio.h>
#include <stdlib.h>
 
#define RINGBUFFER 16

typedef struct RingBuffer
{
 unsigned putI;
 unsigned getI;
 unsigned size;
 unsigned data[RINGBUFFER];
}  RingBuffer;


int main(int argc,char** args)
{
 RingBuffer rb;
 init(&rb);
 
 while(1)
 {
  printf("ringbuffer-test\n"
         " 0:exit\n"
         " 1:put\n"
         " 2:get\n"
         " 3:show\n"
         "your choice: ");
  char ch;
  scanf("%c",&ch);  
  switch(ch)
  {
   case '0':
    return 0;
   break;
   
   case '1':
   {
    unsigned val;
    scanf("%u",&val);
    put(&rb,val);
   }
   break;
   
   case '2':
    printf("get %u\n",get(&rb));
   break;

   case '3':
    show(&rb);
   break;
  }     
 }
 return 0;
}
