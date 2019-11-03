#pragma once
//------------------------
// cgi common gateway interface
//(c) H.Buchmann FHNW 2019
//------------------------
#include <string>
#include <map>
#include <iostream>
#include <vector>

class CGI
{
 public:
  typedef std::map<std::string,std::string> Map;
  CGI();
  const std::string& operator[](const char key[]) const;
  const std::string&operator[](const std::string& key) const;
  
 class Query
 {
  public:
   const std::string& operator[](const std::string& key) const
   {
    static const std::string No="";
    auto f=query.find(key);
    if (f==query.end()) return No;
    return f->second;
   }
  private:
   friend class CGI;
   Map query;
   Query(CGI& cgi);
 };
  
 private:
  static Map entry();
  Map env;
  
 public:
  Query query;
};

