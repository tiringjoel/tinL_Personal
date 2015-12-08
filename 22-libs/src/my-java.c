/*------------------------
  my-java.c
  (c) H.Buchmann FHNW 2015
 -------------------------*/
#include "MyJava.h"
#include <stdio.h>
//#include "my-lib.h"

JNIEXPORT void JNICALL Java_MyJava_myJNICall
  (JNIEnv* env, jclass clazz)
{
 printf("------------ myJNICall\n");
// my_hello();
}
