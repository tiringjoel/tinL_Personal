//--------------------------
//uevent-demo.cc
//(c) H.Buchmann FHNW 2019
//--------------------------
#include "uevent.h"
#include <iostream>
class App: UEvent::Listener
{
 public:
  App();
 private:
  UEvent uevent;
  void onEvent(const UEvent::Listener::Result& res);
};

App::App()
:uevent(*this)
{
 uevent.listen();
}

void App::onEvent(const UEvent::Listener::Result& res)
{
 for(unsigned i=0;auto s:res)
 {
  std::cout<<(i++)<<"\t"<<s<<"\n";
 } 
}

App app;

int main(int argc,char** args)
{
 
 return 0;
}
