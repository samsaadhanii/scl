#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include "struct.h"
#include "paths.h"

extern void fgetword();

void cnvrtutfd2r(char in[LARGE], char out[LARGE]){
  int pid;
  FILE *fp;
  char fin[MEDIUM];
  char fout[MEDIUM];
  char cmd[LARGE];
  char tmp[MEDIUM];

  pid = getpid();
  /*sprintf(fin,SCLINSTALLDIR);*/
  sprintf(fin,TFPATH);
  sprintf(tmp,"/tmp%d",pid);
  strcat(fin,tmp);
  /*sprintf(fout,SCLINSTALLDIR);*/
  sprintf(fout,TFPATH);
  sprintf(tmp,"/result%d",pid);
  strcat(fout,tmp);

  if((fp = fopen(fin,"w"))==NULL){
   printf("Error in opening %s for writing\n",fin);
   exit(0);
  }
  fprintf(fp,"%s ",in);
  fclose(fp);

  sprintf(cmd,"%s/converters/utfd2r.sh %s < %s > %s",SCLINSTALLDIR,SCLINSTALLDIR,fin,fout);
  system(cmd);

  if((fp = fopen(fout,"r"))==NULL){
   printf("Error in opening %s for reading\n",fin);
   exit(0);
  }
  fgetword(fp,out,'\n');
  fclose(fp);

  sprintf(cmd,"rm %s %s",fin,fout);
  system(cmd);
}
