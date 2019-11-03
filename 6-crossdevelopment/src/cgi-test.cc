//---------------------------
//cgi-test.cc
//(c) H.Buchmann FHNW 2019
//---------------------------
#include <iostream>
#include "cgi.h"
CGI cgi;

int main(int argc,char** args)
{
 std::cout<<"Content-type: text/plain\n\n"
            "message...\n";
// cgi.show(std::cout);
 for(const auto& v:cgi.query())
 {
  std::cout<<v.first<<"\t->"<<v.second<<"\n";
 }
 return 0;
}
