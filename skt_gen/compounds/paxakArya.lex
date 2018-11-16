%{
#include "struct.h"
extern char paxa[LARGE];
extern char sUwrastr[LARGE];
extern char samAsAnwa[MEDIUM];
%}
%option nounput
%option noinput

%x ppaxa
%x upaxa
%%

^ppaxa		{BEGIN ppaxa;}
^upaxa		{BEGIN upaxa;}

<ppaxa>[a-zA-Z]+n	{ 
	                 strcpy(paxa,yytext); 
		         if (strcmp(paxa,"ahan") && strcmp(paxa,"an")) { 
                             /* In ppaxa it is not necessary to chk samAsAnwaprawyaya. Cmp with upaxa */
		            paxa[yyleng-1] = '\0'; 
		             /* ahan is taken care by the apavAda-sandhi rules 
		                ruwva-> uwva-> guNa";$ans2="roZsupi (8.2.69)(prApwe) -> rUparAwri raWanwareRuruwvam vAcyam (vA 4847)-> haSi ca (6.1.114)-> Ax guNaH (6.1.87)
		             */
		            strcpy(sUwrastr,"न लोपः प्रातिपदिकान्तस्य 8.2.7"); }
                         else { strcpy(sUwrastr,""); }
                         BEGIN 0;
		        }
<ppaxa>.*	{
		 strcpy(paxa,yytext); strcpy(sUwrastr,""); 
                 BEGIN 0;
		}
<upaxa>[a-zA-Z]+n	{ 
			  strcpy(paxa,yytext); 
		          if ((samAsAnwa[0] == '\0') && strcmp(paxa,"ahan") && strcmp(paxa,"an") && strcmp(paxa,"rAjan")) {
		             paxa[yyleng-1] = '\0'; 
		             /* ahan is taken care by the apavAda-sandhi rules 
		                ruwva-> uwva-> guNa";$ans2="roZsupi (8.2.69)(prApwe) -> rUparAwri raWanwareRuruwvam vAcyam (vA 4847)-> haSi ca (6.1.114)-> Ax guNaH (6.1.87)
		             */
		             strcpy(sUwrastr,"न लोपः प्रातिपदिकान्तस्य 8.2.7"); }
                           else { strcpy(paxa,yytext); strcpy(sUwrastr,""); }
		        }
<upaxa>.*wvA	{ 
                  strcpy(paxa,yytext); /* Temp fix to handle wvA -> lyap */
		  paxa[yyleng-2] = '\0'; 
                  strcat(paxa,"ya");
		  paxa[yyleng] = '\0'; 
                }
<upaxa>.*	{
		 strcpy(paxa,yytext); strcpy(sUwrastr,""); 
		}

%%

char sUwrastr[LARGE];
char p1_utf[MEDIUMUTF];
char p2_utf[MEDIUMUTF];
char p1[MEDIUM];
char p2[MEDIUM];
char samAsAnwa[MEDIUM];
char samAsaprakAra[MEDIUM];
char paxa[LARGE];
char in[MEDIUM];
char putf[MEDIUMUTF]; /* utf takes 3 times space */
char encoding[MEDIUM];

int divid;

void do_samAsAnwaprawyaya_kArya();
void get_sandhied_word();
void do_tilopa();
void do_apaxAnwa_sandhi();
void get_iw();
void call_paxalex();
int ajAxi();
int isvowel();
extern void cnvrtwx2utf();
extern void cnvrtutfd2r();

int main (int argc, char *argv[]) {
char sandhiwutfr[MEDIUMUTF]; /* utf takes 3 times space */
char sandhiwutf[MEDIUMUTF];
char sandhiw[MEDIUM];
char putfr[MEDIUMUTF];
char paxautf[MEDIUMUTF]; /* utf takes 3 times space */
char paxautfr[MEDIUMUTF];
char sUwrastr2utfr[LARGE];

  strcpy(encoding,argv[1]);
  strcpy(p1,argv[2]);
  strcpy(p2,argv[3]);
  strcpy(samAsAnwa,argv[4]);
  strcpy(samAsaprakAra,argv[5]);
  divid = atoi(argv[6]);
 
  strcpy(in,"ppaxa");
  strcat(in,p1);
  call_paxalex(in);
  if(strcmp(p1,paxa)){
     cnvrtwx2utf(p1, putf);
     cnvrtwx2utf(paxa, paxautf);
     if (!strcmp(encoding,"RMN")) {
        cnvrtutfd2r(putf,putfr);
        cnvrtutfd2r(paxautf,paxautfr);
        cnvrtutfd2r(sUwrastr,sUwrastr2utfr);
        printf("<font color=\"blue\"> %s -> %s</font> <font color=\"red\"> %s </font> <br />", putfr, paxautfr, sUwrastr2utfr);
     } else {
        printf("<font color=\"blue\"> %s -> %s</font> <font color=\"red\"> %s </font> <br />", putf, paxautf, sUwrastr);
     }
  }
  strcpy(p1_utf,paxa);

  strcpy(in,"upaxa");
  strcat(in,p2);
  call_paxalex(in);
  if(strcmp(p2,paxa)){
     cnvrtwx2utf(p2, putf);
     cnvrtwx2utf(paxa, paxautf);
     if (!strcmp(encoding,"RMN")) {
        cnvrtutfd2r(putf,putfr);
        cnvrtutfd2r(paxautf,paxautfr);
        cnvrtutfd2r(sUwrastr,sUwrastr2utfr);
        printf("<font color=\"blue\"> %s -> %s</font> <font color=\"red\"> %s </font> <br />", putfr, paxautfr, sUwrastr2utfr);
     } else {
        printf("<font color=\"blue\"> %s -> %s</font> <font color=\"red\"> %s </font> <br />", putf, paxautf, sUwrastr);
     }
  }
  strcpy(p2_utf,paxa);

  do_samAsAnwaprawyaya_kArya(p2_utf,samAsAnwa,samAsaprakAra,paxa);
  if(strcmp(p2_utf,paxa)){
     cnvrtwx2utf(p2_utf, putf);
     cnvrtwx2utf(paxa, paxautf);
     if (!strcmp(encoding,"RMN")) {
        cnvrtutfd2r(putf,putfr);
        cnvrtutfd2r(paxautf,paxautfr);
        cnvrtutfd2r(sUwrastr,sUwrastr2utfr);
        printf("<font color=\"blue\"> %s -> %s</font> <font color=\"red\"> %s </font> <br />", putfr, paxautfr, sUwrastr2utfr);
     } else {
       printf("<font color=\"blue\"> %s -> %s</font> <font color=\"red\"> %s </font> <br />", putf, paxautf, sUwrastr);
     }
  }
  strcpy(p2_utf,paxa);

  get_sandhied_word(p1_utf,paxa,sandhiw);
  cnvrtwx2utf(sandhiw,sandhiwutf);
     if (!strcmp(encoding,"RMN")) {
       cnvrtutfd2r(sandhiwutf,sandhiwutfr);
       printf("<font color=\"green\">samastaprātipadikam:</font><font color=\"blue\"> %s</font>",sandhiwutfr);
     } else {
       printf("<font color=\"green\">समस्तप्रातिपदिकम्:</font><font color=\"blue\"> %s</font>",sandhiwutf);
     }
 return 1;
}

void call_paxalex(char *in){
  yy_scan_string(in);
  yylex();
}

int yywrap()
{
return 1;
}

void do_samAsAnwaprawyaya_kArya(char *inp, char *sp, char *prakAra, char *out) {
char sp_noiw[MEDIUM];
char paxa[MEDIUM];

/* It is assumed that the samAsAnwa prawyaya are waxXiwa prawyayas */
if(strcmp(sp,"")){
   get_iw(sp, sp_noiw);
 //   printf("Within do_samAsAnwaprawyaya_kArya");
 //  printf("sp = %s samAsaprakAra = %s inp = %s",sp,samAsaprakAra,inp);
 //  printf("inp -1 = %c inp -2 = %c",inp[strlen(inp)-1],inp[strlen(inp)-2]);

   if((!strcmp(sp,"tac")  || !strcmp(sp,"Ra")) &&
      (!strcmp(samAsaprakAra,"avyayIBAvaH") ||
      !strcmp(samAsaprakAra,"wawpuruRa") || !strcmp(samAsaprakAra,"bahuvrIhi"))  &&
      (inp[strlen(inp)-1]=='n') &&
      (inp[strlen(inp)-2]=='a')) {
       //  printf("calling do_tilopa");
        do_tilopa(inp,paxa);
        strcpy(inp,paxa);
   }
   if(ajAxi(sp_noiw)  && 
      ((inp[strlen(inp)-1] == 'i') || 
       (inp[strlen(inp)-1] == 'a'))
     ) {
       inp[strlen(inp)-1] = '\0';
   }

   do_apaxAnwa_sandhi(inp,sp_noiw,out);
} else {strcpy(out,inp);}
}

void do_tilopa(char *inp, char *outp){
int len;
len = strlen(inp);
while(!isvowel(inp[len])) len--;
inp[len] = '\0';
strcpy(outp,inp);
}

void do_apaxAnwa_sandhi(char *in1, char *in2, char*out){
int len1,len2;
strcpy(out,in1);
strcat(out,in2);
len1 = strlen(in1);
len2 = strlen(in2);
out[len1+len2] = '\0';
}

int ajAxi(char *p){
 char ac[14];
 strcpy(ac,"aAiIuUqQLeEoO");
 if(index(ac,p[0])) { return 1;} else {return 0;}
}

void get_iw(char *sp, char *sp_noiw) {
strcpy(sp_noiw,sp);
if(!strcmp(sp,"tac")) { strcpy(sp_noiw,"a");}
if(!strcmp(sp,"ac")) { strcpy(sp_noiw,"a");}
if(!strcmp(sp,"Rac")) { strcpy(sp_noiw,"a");}
if(!strcmp(sp,"Ra")) { strcpy(sp_noiw,"a");}
if(!strcmp(sp,"ap")) { strcpy(sp_noiw,"a");}
if(!strcmp(sp,"asic")) { strcpy(sp_noiw,"as");}
if(!strcmp(sp,"anic")) { strcpy(sp_noiw,"an");}
if(!strcmp(sp,"ic")) { strcpy(sp_noiw,"i");}
if(!strcmp(sp,"anaf")) { strcpy(sp_noiw,"an");}
if(!strcmp(sp,"kap")) { strcpy(sp_noiw,"ka");}
}

int isvowel(int ch){
switch (ch){
 case 'a':
 case 'A':
 case 'i':
 case 'I':
 case 'u':
 case 'U':
 case 'q':
 case 'Q':
 case 'L':
 case 'e':
 case 'E':
 case 'o':
 case 'O': return 1; break;
 default: return 0;
}
}

