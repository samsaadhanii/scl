#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include "struct.h"
#include "paths.h"

extern void fgetword();

void cnvrtwx2utf(char in[LARGE], char out[LARGE]){
  int pid;
  FILE *fp;
  char fin[MEDIUM];
  char fout[MEDIUM];
  char cmd[LARGE];
  char tmp[MEDIUM];

  pid = getpid();
  sprintf(fin,TFPATH);
  sprintf(tmp,"/tmp%d",pid);
  strcat(fin,tmp);
  sprintf(fout,TFPATH);
  sprintf(tmp,"result%d",pid);
  strcat(fout,tmp);

  if((fp = fopen(fin,"w"))==NULL) {
     printf("Error in %s opening for writing\n",fin);
     exit (0);
  }

  fprintf(fp,"%s ",in);
  fclose(fp);

  sprintf(cmd,"%s/converters/ri_skt < %s | %s/converters/iscii2utf8.py 1 > %s",SCLINSTALLDIR,fin,SCLINSTALLDIR,fout);
  system(cmd);

  if((fp = fopen(fout,"r"))==NULL) {
     printf("Error in %s opening for reading\n",fout);
     exit (0);
  }
  fgetword(fp,out,'\n');
  fclose(fp);
  sprintf(cmd,"rm %s %s",fin,fout);
  system(cmd);
}
