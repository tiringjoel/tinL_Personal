/*--------------------
 minimal-1
 (c) H.Buchmann FHNW 2014
 $Id$
----------------------*/
#include <unistd.h>

int main(int argc,char** args)
{
 static const char MSG[]="Hello World from '"__FILE__ "'\t '" __DATE__ "'\n";
 write(STDOUT_FILENO,MSG,sizeof(MSG));
 while(1){}
}
  
