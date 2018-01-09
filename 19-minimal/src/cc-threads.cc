//--------------------
//cc-threads.cc
//(c) H.Buchmann FHNW 2017
//--------------------
#include <thread>
#include <iostream>

void run()
{
 while(true)
 {
  std::cout<<"--\n";
 }
}

int main(int argc,char** args)
{
 std::thread th(run);
 th.join();
 return 0;
}
