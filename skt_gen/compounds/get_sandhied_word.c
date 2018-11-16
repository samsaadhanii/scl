#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include "struct.h"
#include "paths.h"

extern void fgetword();

void get_sandhied_word (char *prAwipaxikam1, char *prAwipaxikam2, char *sandhiw)
{
    char cmd[LARGE];
    FILE *fp;
    char fout[MEDIUM];
    char f1out[MEDIUM];
    char tmp[MEDIUM];

    int pid;

    pid = getpid();
    sprintf(fout,TFPATH);
    sprintf(tmp,"/sandhi%d",pid);
    strcat(fout,tmp);
    sprintf(f1out,TFPATH);
    sprintf(tmp,"/1sandhi%d",pid);
    strcat(f1out,tmp);

    cmd[0]='\0';
    sprintf(cmd,"%s/skt_gen/compounds/main_sandhi.pl %s+%s > %s",SCLINSTALLDIR,prAwipaxikam1,prAwipaxikam2,fout);
    system(cmd);
    sprintf(cmd,"cut -d, -f1 %s > %s ",fout,f1out);
    system(cmd);
    if((fp=fopen(f1out,"r"))==NULL)
    {
      printf("@Error @in @opening %s\n",f1out);
      exit(0);
    } else {
      fgetword(fp,sandhiw,'\n');
      fclose(fp);
    }
    sprintf(cmd,"rm %s %s",fout,f1out);
    system(cmd);
}
