/*---------------------------
  queue.c
  (c) H.Buchmann FHNW 2018
  ---------------------------*/
#include <stdio.h>
#include <stdlib.h>

typedef struct Entry
{
 unsigned      data;
 struct Entry* next;
} Entry;

typedef struct Queue
{
 Entry* first;
 Entry* last;
} Queue;

/*
 q
  first=0
  last=0
*/
static void init(Queue* q)
{
}

static unsigned empty(Queue* q)
{
}


/* before
 first                last
  |                   |
  d--next-->d--next-->d--next-->0
  
  after
 first                          last
  |                             |
  d--next-->d--next-->d--next-->d-next-->0
                                |--------------- the new entry
*/
static void put(Queue* q,unsigned val)
{
}

/* before
 first                last
  |                   |
  d--next-->d--next-->d--next-->0
  
  after
           first      last
            |         |
            d--next-->d--next-->0
*/
static unsigned get(Queue* q)
{
}


static void show(Queue* q)
{
}

int main(int argc,char** args)
{
 Queue queue;
 init(&queue);
 while(1)
 {
  printf("queue-test\n"
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
    put(&queue,val);
   }
   break;
   
   case '2':
    printf("get %d\n",get(&queue));
   break;

   case '3':
    show(&queue);
   break;
  }     
 }
 return 0;
}
