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

static void init(Queue* q)
{
 q->first=0;
 q->last=0;
}

static unsigned empty(Queue* q)
{
 return q->first==0;
}

static void put(Queue* q,unsigned val)
{
 Entry* e=malloc(sizeof(Entry));
 e->data=val;
 e->next=0;
 if (q->first==0)
    {
     q->first=e;
    }
    else
    {
     q->last->next=e;
    }
 q->last=e;
}

static unsigned get(Queue* q)
{
 Entry* e=q->first;
 if (e==0)
    {
     printf("----------- empty\n");
     exit(1);
    }
 q->first=e->next;
 unsigned d=e->data;
 free(e);
 return d;
}


static void show(Queue* q)
{
 Entry* e=q->first;
 while(e)
 {
  printf("%d\n",e->data);
  e=e->next;
 }   
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
