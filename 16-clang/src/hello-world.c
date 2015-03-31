/*--------------------
 c-hello-world.c
(c) H.Buchmann FHNW 2015
  --------------------*/
/*  
native compile/link
 clang ../src/c-hello-world.c -o c-hello-world
native compile
 clang -c ../src/c-hello-world.c -o c-hello-world.o 
native link
 clang c-hello-world.o -o c-hello-world
ir compile 
 clang -c -emit-llvm ../src/c-hello-world.c -o c-hello-world.ir
interpret:
 lli c-hello-world.ir
*/

#include <stdio.h>
int main(int argc,char** args)
{
 printf("Hello World\n");
 return 0;
}
