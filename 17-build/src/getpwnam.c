/*------------------------
  getpwnam
  (c) H.Buchmann FNNW 2015
  ------------------------*/
#include <stdio.h>
#include <sys/types.h>
#include <pwd.h>
int main(int argc,char** args)
{
 if (argc!=2)
    {
	 fprintf(stderr,"usage %s user\n",args[0]);
	 return 1;
	}
 struct passwd* pw=getpwnam(args[1]);
 if (pw==0) 
    {
	 fprintf(stderr,"no user %s \n",args[1]);
     return 1;
	}
 printf("pw_name   %s\n"
        "pw_passwd %s\n"
		"pw_uid    %d\n"
		"pw_gid    %d\n"
		"pw_gecos  %s\n"
		"pw_dir    %s\n"
		"pw_shell  %s\n",
		pw->pw_name,
		pw->pw_passwd,
		pw->pw_uid,
		pw->pw_gid,
		pw->pw_gecos,
		pw->pw_dir,
		pw->pw_shell);
 return 0;
}

  
