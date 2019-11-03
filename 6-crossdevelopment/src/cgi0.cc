//---------------------------
//cgi0.cc
//(c) H.Buchmann FHNW 2019
//---------------------------
#include <iostream>

int main(int argc,char** args,char** env)
{
 std::cout<<"Content-type: text/plain\n\n"
            "message...";
 for(char** e=env;*e;e++)
 {
  std::cout<<*e<<"\n";
 }	    
 return 0;
}
