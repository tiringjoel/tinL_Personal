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

static void init(RingBuffer* rb)
{
 rb->putI=0;
 rb->getI=0;
 rb->size=0;
}

static void put(RingBuffer* rb,unsigned d)
{
 rb->data[rb->putI++]=d;
 if (rb->putI==RINGBUFFER) rb->putI=0;
 if (rb->size<RINGBUFFER)
    {
     ++rb->size;
    }
    else /* buffer full */
    {
     ++rb->getI;
     if (rb->getI==RINGBUFFER) rb->getI=0;
    }
}


static unsigned get(RingBuffer* rb)
{
 if (rb->size==0)
    {
     printf("------------------------ exception empty buffer ------------------------\n");
     exit(1); 
    }
 char d=rb->data[rb->getI++];
 if (rb->getI==RINGBUFFER) rb->getI=0;
 --rb->size;
 return d;   
}

static void show(RingBuffer* rb)
{
 unsigned i=rb->getI;
 unsigned size=rb->size;
 while(size>0)
 {
  printf("%u\n",rb->data[i++]);
  if (i==RINGBUFFER) 
     {
      i=0;
     }
  --size;
 }
 
}

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
