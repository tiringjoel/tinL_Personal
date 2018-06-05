/*---------------------------
  queue.c
  (c) H.Buchmann FHNW 2018
  ---------------------------*/
#include <stdio.h>
#include <stdlib.h>

/* generic queue */
typedef struct QItem /* without any data */
{
 struct QItem* next;
} QItem;

typedef struct Queue
{
 QItem* first;
 QItem* last;
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

static void put(Queue* q,QItem* qi)
{
 qi->next=0;
 if (q->first==0)
    {
     q->first=qi;
    }
    else
    {
     q->last->next=qi;
    }
 q->last=qi;
}

static QItem* get(Queue* q)
{
 QItem* qi=q->first;
 if (qi==0)
    {
     printf("----------- empty\n");
     return qi;
    }
 q->first=qi->next;
 return qi;
}


static void show(Queue* q)
{
 QItem* qi=q->first;
 while(qi)
 {
  printf("0x%p\n",qi);
  qi=qi->next;
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
    QItem* qi=malloc(sizeof(QItem));
    put(&queue,qi);
   }
   break;
   
   case '2':
   {
    QItem* qi=get(&queue);
    printf("get 0x%p\n",qi);
    free(qi);
   }
   break;

   case '3':
    show(&queue);
   break;
  }     
 }
 return 0;
}
