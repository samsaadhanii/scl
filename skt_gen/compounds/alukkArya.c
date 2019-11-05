#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

#include "struct.h"
#include "paths.h"

void get_viBakwi_vacanam();
void subanwa_kArya();
void get_sandhied_word();
void fgetword();
extern void prAwipaxika_info();
extern void cnvrtwx2utf();
extern void cnvrtutfd2r();

int main (int argc, char *argv[]) {
char prAwipaxikam1[MEDIUM];
char prAwipaxikam2[MEDIUM];
char sup1[MEDIUM];
char sup2[MEDIUM];
struct prAwipaxikam prAwi;
int vacanam;
char subanwam[MEDIUM];
char subanwautf[MEDIUMUTF];
char subanwautfr[MEDIUMUTF];
char sandhiw[MEDIUM];
char sandhiwutf[MEDIUMUTF];
char sandhiwutfr[MEDIUMUTF];
char encoding[MEDIUM];

  strcpy(encoding,argv[1]);
  strcpy(prAwipaxikam1,argv[2]);
  strcpy(sup1,argv[3]);
  strcpy(prAwipaxikam2,argv[4]);
  strcpy(sup2,argv[5]);

  prAwipaxika_info(prAwipaxikam1,&prAwi);

  vacanam = 1;
  subanwa_kArya(prAwipaxikam1,sup1,prAwi.lifgam,vacanam,subanwam);
  cnvrtwx2utf(subanwam,subanwautf);
  if (!strcmp(encoding,"RMN")) {
    cnvrtutfd2r(subanwautf,subanwautfr);
    printf("subantam: %s<br/>",subanwautfr);
  } else {
    printf("सुबन्तम्: %s<br/>",subanwautf);
  }
  get_sandhied_word(subanwam,prAwipaxikam2,sandhiw);
  cnvrtwx2utf(sandhiw,sandhiwutf);
  if (!strcmp(encoding,"RMN")) {
    cnvrtutfd2r(sandhiwutf,sandhiwutfr);
    printf("samastaprātipadikam : %s",sandhiwutfr);
  } else {
    printf("समस्तप्रातिपदिकम्: %s",sandhiwutf);
  }
return 1;
}

void subanwa_kArya(char *prawi, char *iwsup, char *lifgam, int vacanam, char *subanwa) {
int viBakwiH,sup_vacanam;
char cmd[LARGE]; 
FILE *fp;
char fout[MEDIUM];
int pid;

pid = getpid();

get_viBakwi_vacanam(iwsup,&viBakwiH,&sup_vacanam);
if(vacanam == 1){ vacanam = sup_vacanam;}

 sprintf(fout,"%s/tmp_gen%d",TFPATH,pid); 

sprintf(cmd,"/bin/echo \"^%s<vargaH:nA><lifgam:%s><viBakwiH:%d><vacanam:%d><level:1>$\" | LTPROCBIN -c -g %s/morph_bin/sup_gen.bin > %s",prawi,lifgam,viBakwiH,vacanam,SCLINSTALLDIR,fout);
system(cmd);

if((fp=fopen(fout,"r"))==NULL)
 {
    printf("@Error @in @opening %s\n",fout);
    exit(0);
 } else {
    fgetword(fp,subanwa,'\n');
    fclose(fp);
    if(subanwa[0] == '#') { strcpy(subanwa,subanwa+1);}
 }
 sprintf(cmd,"rm %s",fout);
 system(cmd);
}

void get_viBakwi_vacanam(char *iwsup, int *viBakwiH, int *vacanam){
if(!strcmp(iwsup,"su")) { *viBakwiH = 1; *vacanam = 1;}
if(!strcmp(iwsup,"O")) { *viBakwiH = 1; *vacanam = 2;}
if(!strcmp(iwsup,"jas")) { *viBakwiH = 1; *vacanam = 3;}
if(!strcmp(iwsup,"am")) { *viBakwiH = 2; *vacanam = 1;}
if(!strcmp(iwsup,"Ot")) { *viBakwiH = 2; *vacanam = 2;}
if(!strcmp(iwsup,"Sas")) { *viBakwiH = 2; *vacanam = 3;}
if(!strcmp(iwsup,"tA")) { *viBakwiH = 3; *vacanam = 1;}
if(!strcmp(iwsup,"ByAm")) { *viBakwiH = 345; *vacanam = 2;}
if(!strcmp(iwsup,"Bis")) { *viBakwiH = 3; *vacanam = 3;}
if(!strcmp(iwsup,"fe")) { *viBakwiH = 4; *vacanam = 1;}
if(!strcmp(iwsup,"Byas")) { *viBakwiH = 45; *vacanam = 3;}
if(!strcmp(iwsup,"fasi")) { *viBakwiH = 5; *vacanam = 1;}
if(!strcmp(iwsup,"fas")) { *viBakwiH = 6; *vacanam = 1;}
if(!strcmp(iwsup,"os")) { *viBakwiH = 67; *vacanam = 2;}
if(!strcmp(iwsup,"Am")) { *viBakwiH = 6; *vacanam = 3;}
if(!strcmp(iwsup,"fi")) { *viBakwiH = 7; *vacanam = 1;}
if(!strcmp(iwsup,"sup")) { *viBakwiH = 7; *vacanam = 3;}
}
