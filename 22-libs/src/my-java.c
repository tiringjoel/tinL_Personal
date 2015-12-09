/*------------------------
  my-java.c
  (c) H.Buchmann FHNW 2015
 -------------------------*/
#include "MyJava.h"
#include <stdio.h>
#include "my-lib.h"
#include <dlfcn.h>

JNIEXPORT void JNICALL Java_MyJava_myJNInit
  (JNIEnv* env, jclass clazz)
{
 printf("------------ myJNInit\n");
 printf("p=%p\n",dlopen("libmy-java.so",RTLD_NOW|RTLD_GLOBAL));
}

JNIEXPORT void JNICALL Java_MyJava_myJNICall
  (JNIEnv* env, jclass clazz)
{
 printf("------------ myJNICall\n");
 my_hello();
}
