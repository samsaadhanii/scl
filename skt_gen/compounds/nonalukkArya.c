#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "struct.h"

void subluk();
void cnvrtwx2utf();
void cnvrtutfd2r();
void fgetword();
void call_pUrvapaxalex();

char encoding[MEDIUM];
char p1_utf[MEDIUMUTF];
char p2_utf[MEDIUMUTF];
struct prAwipaxikam prAwi;
char subanwam[MEDIUM];
char samAsAnwa[MEDIUM];
char samAsaprakAra[MEDIUM];
int divid;
char p1[MEDIUM];
char p2[MEDIUM];

int main (int argc, char *argv[]) {

char sup1[MEDIUM];
char sup2[MEDIUM];
char p1_utfr[MEDIUMUTF];
char p2_utfr[MEDIUMUTF];

  strcpy(encoding,argv[1]);
  strcpy(p1,argv[2]);
  strcpy(sup1,argv[3]);
  strcpy(p2,argv[4]);
  strcpy(sup2,argv[5]);
  strcpy(samAsAnwa,argv[6]);
  strcpy(samAsaprakAra,argv[7]);
  divid = atoi(argv[8]);

  cnvrtwx2utf(p1,p1_utf);
  cnvrtwx2utf(p2,p2_utf);

  if(!strcmp(encoding,"RMN")){
    cnvrtwx2utf(p1_utf,p1_utfr);
    cnvrtwx2utf(p2_utf,p1_utfr);

    strcpy(p1_utfr, p1_utf);
    strcpy(p2_utfr, p2_utf);
  }

  // printf("calling subluk with samAsAnwa = %s",samAsAnwa);
  subluk(p1_utf,sup1,p2_utf,sup2,samAsAnwa);
  call_pUrvapaxalex();
  return 1;
}

void subluk (char *p1, char *s1, char *p2, char *s2, char *sp) {

 char s1utf[SMALLUTF]; /* utf takes 3 times space */
 char s2utf[SMALLUTF]; /* utf takes 3 times space */
 char tmp[SMALLUTF]; 
 char sputf[MEDIUM];

 char s1utfr[SMALLUTF];
 char s2utfr[SMALLUTF];
 char sputfr[MEDIUM];

 char p1_utfr[MEDIUM];
 char p2_utfr[MEDIUM];

 cnvrtwx2utf(s1,tmp);
 if(!strcmp(tmp," ") || (tmp[0] == '\0')) s1utf[0] = '\0'; else sprintf(s1utf,"+[%s]",tmp);
 cnvrtwx2utf(s2,tmp);
 if(!strcmp(tmp," ") || (tmp[0] == '\0')) s2utf[0] = '\0'; else sprintf(s2utf,"+[%s]",tmp); 
 cnvrtwx2utf(sp,sputf);

 if(!strcmp(encoding,"RMN")) {
    cnvrtutfd2r(s1utf,s1utfr);
    cnvrtutfd2r(s2utf,s2utfr);
    cnvrtutfd2r(sputf,sputfr);
    cnvrtutfd2r(p1_utf,p1_utfr);
    cnvrtutfd2r(p2_utf,p2_utfr);
 }
 printf("<table><tr><td>");
 if(sp[0] == '\0')
   if (!strcmp(encoding,"RMN"))
   printf("<font color=\"blue\">%s%s %s%s  <font color=\"red\"> supo dhātuprātipadikayoḥ 2.4.71</font> </td> ", p1_utfr,s1utfr,p2_utfr,s2utfr);
    else 
     printf("<font color=\"blue\">%s%s %s%s  <font color=\"red\">सुपो धातुप्रातिपदिकयोः 2.4.71</font> </td>", p1,s1utf,p2,s2utf);
 else 
   if (!strcmp(encoding,"RMN"))
     printf("<font color=\"blue\">%s%s %s%s %s <font color=\"red\"> supo dhātuprātipadikayoḥ 2.4.71</font> </td> ", p1_utfr,s1utfr,p2_utfr,s2utfr,sputfr);
    else 
     printf("<font color=\"blue\">%s%s %s%s %s <font color=\"red\">सुपो धातुप्रातिपदिकयोः 2.4.71</font> </td>", p1,s1utf,p2,s2utf,sputf);
}
