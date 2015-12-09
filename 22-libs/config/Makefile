#--------------------------
#Makefile
#(c) H.Buchmann FHNW 2015
#--------------------------
VPATH=.:../src
JAVA_HOME=/usr/lib/jvm/java-8-openjdk/
CPPFLAGS=-I. -I../src -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux
CC=gcc
CFLAGS=-g
#------------------------ uncomment for dynamic library
CFLAGS+=-fPIC
#LDLIBS=-ldl
LOADLIBES=-L.
LDLIBS=-lmy-lib
lib%.so:	%.o; ${CC} -shared -o${@} ${^}

libmy-lib.so:	my-lib.o
libmy-java.so:	my-java.o
#------------------------ uncomment for dynamic library
my-lib-use:	my-lib-use.o libmy-lib.so
#my-lib-use:	my-lib-use.o my-lib.o

my-lib-use.o:	my-lib-use.c my-lib.h
my-lib.o:	my-lib.c  my-lib.h


my-java.o:	my-java.c MyJava.h

clean:
	rm *.o *.so
