#pragma once
//---------------------------
//uevent.h
//(c) H.Buchmann FHNW 2019
//---------------------------
#include <string>
#include <vector>
class UEvent
{
 public:
  class Listener
  {
   public:
    typedef std::vector<std::string> Result;
    virtual void onEvent(const Result&)=0;
  };
  UEvent(Listener& li);
  void listen();
 private:
  static const unsigned BUFFER=4096; //why
  Listener& li;
  int  sok;
  bool ok=false;
  void result(char s[],int len);
};
