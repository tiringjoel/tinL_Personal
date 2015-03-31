//-------------------
//hello-world
//(c) H.Buchmann FHNW 2015
// native compile/link
//  clang++ ../src/cc-hello-world.cc -o hello-world
// native compile
//  clang++ -c ../src/cc-hello-world.cc -o hello-world.o 
// native link
//  clang++ cc-hello-world.o -o hello-world
// ir compile 
//  clang++ -c -emit-llvm ../src/cc-hello-world.cc -o cc-hello-world.ir
// interpret
//  lli cc-hello-world.ir
// problem:
// 
//-------------------
#include <iostream>
extern "C"
{
 void __dso_handle()
 {
 }
}

class HelloWorld
{
 public:
   HelloWorld();
  ~HelloWorld();

};

HelloWorld::HelloWorld()
{
 std::cout<<"Hello ";
}

HelloWorld::~HelloWorld()
{
 std::cout<<"world\n";
}

int main(int argc,char** args)
{
 HelloWorld hw;
 return 0;
}
