/*---------------------
  source 
 (c) H.Buchmann FHNW 2015
 
 compile: 
  gcc -c -o source.o path-to-source.c
   source.o
 link: 
  gcc -o source source.o
 
 inspection:
  objdump -d source.o
  objdump -d source
  readelf -a source.o
  readelf -a source
  
 verbose:
  use -v option
 
 source->assembler
   gcc -s -o source.s path-to-source.c
 
 assembler->objectcode
   as -o source.o source.s
 
 objectcode->executable
   gcc -o source source.o  
 ----------------------*/
#include <stdio.h>
int main(int argc,char** args)
{
 printf("This File %s is a C-source file\n",__FILE__); 
 return 0;
}  
