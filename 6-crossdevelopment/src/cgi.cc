//------------------------
// cgi common gateway interface
//(c) H.Buchmann FHNW 2019
//------------------------
#include "cgi.h"

extern "C" char** environ;


CGI::Query::Query(CGI& cgi)
{
// std::cout<<"Query::Query\n";
 const auto& q=cgi.env.find("QUERY_STRING");
 if (q==cgi.env.end()) 
 {
  return;
 }
 const auto& s=q->second;
 unsigned i=0;
 unsigned keyBeg=0;
 unsigned keyEnd=0;
 unsigned valBeg=0;
 unsigned status=0;
 while(true)
 {
  auto ch=s[i];
//  std::cout<<ch<<"\t"<<status<<"\n";
  switch(status)
  {
   case 0: //key
    if (ch=='\0')
        {
         query[std::string(s,keyBeg,i-keyBeg)]="";
	 return;
        }
    if (ch=='&')
       {
        query[std::string(s,keyBeg,i-keyBeg)]="";
	keyBeg=++i;
	break;
       }
    if (ch=='=')
       {
        keyEnd=i;
	valBeg=++i;
	status=1;
	break;
       }
    ++i;
   break;
   case 1:
    if (ch=='\0')
       {
        query[std::string(s,keyBeg,keyEnd-keyBeg)]=std::string(s,valBeg,i-valBeg);
	return;
       }
    if (ch=='&')
       {
        query[std::string(s,keyBeg,keyEnd-keyBeg)]=std::string(s,valBeg,i-valBeg);
	keyBeg=++i;
	status=0;
	break;
       }
    ++i;
   break;
  }
 }
}

CGI::CGI()
:env(entry())
,query(*this)
{
}


CGI::Map CGI::entry()
{
 Map env;
 for(auto e=environ;*e;++e)
 {
  auto s=*e;
  unsigned i=0;
  while(true)
  {
   auto ch=s[i];
   if (ch=='\0') env[std::string(*e)]="";
   if (ch=='=') 
      {
       s[i]='\0';
       env[std::string(s)]=s+i+1;
       break;
      }
   ++i;
  }
 }
 return env; 
}

