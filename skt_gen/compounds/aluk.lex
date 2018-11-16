%{
#include "struct.h"
extern char ques[LARGE];
extern char alukviBARA[MEDIUM];
extern char sUwrastr[LARGE];
extern char p1_utf[MEDIUMUTF];
extern char p2_utf[MEDIUMUTF];
extern void aluk_cgi_interface();
%}
%option nounput
%option noinput

%x aluk
HAL [hyvrlfmFNnJBgDXjbgdxKPCTWctwkpSRs]

prA [a-zA-Z]+
sup (su|O|jas|am|Ot|Sas|tA|ByAm3|Bis|fe|ByAm4|Byas4|fasi|ByAm5|Byas5|fas|os6|Am|fi|os7|sup)
praWamA (su|O|jas)
wqwIyA (tA|ByAm3|Bis)
cawurWI (fe|ByAm4|Byas4)
paFcamI (fasi|ByAm5|Byas5)
RaRTI (fas|os6|Am)
sapwamI (fi|os7|sup)

word {prA}\+{sup}
%%

^(swoka|anwika|xUra|kqcCra|samIpa|aByASa)\+{paFcamI}	{aluk_cgi_interface("NULL",1,"पञ्चम्याः स्तोकादिभ्यः(6.3.2)");}
%(swoka|anwika|xUra|kqcCra|samIpa|aByASa)\+(fasi|ByAm5|Byas5)	{aluk_cgi_interface("NULL",1,"पञ्चम्याः स्तोकादिभ्यः(6.3.2)");}
^(ojas|sahas|amBas|wamas)\+{sup}[ ]{word}			{aluk_cgi_interface("NULL",1,"ओजःसहोऽम्भस्तमसस्तृतीयायाः(6.3.3)");}
^manas\+{wqwIyA}[ ]AjFAyin\+{praWamA}			{aluk_cgi_interface("NULL",1,"आज्ञायिनि च(6.3.5)");}
^manas\+{wqwIyA}[ ]{word}       				{
                             				 sprintf(ques,"अनेन समासेन संज्ञा गम्यते (Y/N)?");
                            				 aluk_cgi_interface(ques,1,"मनसः संज्ञायाम्(6.3.4)");
                             				}
^Awman\+{cawurWI}[ ](paxa|BARA)\+{praWamA}			{aluk_cgi_interface("NULL",1,"वैयाकरणाख्यायाम् चतुर्थ्याः(6.3.7)");}
^Awman\+{sup}[ ]{word}					{aluk_cgi_interface("NULL",1,"आत्मनश्च(6.3.6)");} 
^para\+{cawurWI}[ ](paxa|BARA)\+{praWamA}			{aluk_cgi_interface("NULL",1,"परस्य च(6.3.8)");}
^(.*a|.*{HAL})\+{sapwamI}[ ](kArRApaNa|mARaka|wripaxikA)\+{praWamA}     {
                                                                          sprintf(ques,"किं %s प्राक्देशकारार्थे वर्तते एवं समासेन संज्ञा गम्यते(Y/N)?",p1_utf);
                                                                          aluk_cgi_interface(ques,1,"कारनाम्नि च प्राचं हलादौ(6.3.10)");
                                                                        }

^(prAvqR|Saraw|kAla|xiv)\+{sapwamI}[ ]ja\+{praWamA}	{aluk_cgi_interface("NULL",1,"प्रावृट्छरत्कालदिवां जे(6.3.15)");}
^(varRa|kRara|Sara|vara)\+{sapwamI}[ ]ja\+{praWamA}      {aluk_cgi_interface("NULL",2,"विभाषा वर्षक्षरशरवरात्(6.3.16)");}
^(.*a|.*{HAL})\+{sapwamI}[ ]banXa\+{praWamA}		{aluk_cgi_interface("NULL",2,"बन्धे च विभाषा(6.3.13)");}
^maXya\+{sapwamI}[ ]guru\+{praWamA}				{aluk_cgi_interface("NULL",1,"मध्याद् गुरौ(6.3.11)");}
^(.*a|.*{HAL})\+{sapwamI}[ ]{prA}\+{praWamA}		{
                                					 sprintf(ques,"अनेन समासेन संज्ञा गम्यते(Y/N)?");
                                 					 aluk_cgi_interface(ques,1,"हलदन्तात्सप्तम्याः संज्ञायाम्(6.3.9)");
								        }
  /* araNya and vana were also listed in the previous suutra. I have delted them since *.a takes care of these words */
	/* 6.3.14 wawpuruRe kqwi bahulam */
	/* 6.3.16 
%^[ ](warap|wamap|kAla|wana)	{strcpy(tmp,"0"); strcpy(sUwrastr,"घकालतनेषु कालनाम्नः(6.3.17)"); BEGIN 0;}
         Check how to write not equal to */
^{prA}\+{sapwamI}[ ](wara|wama|kAla|wana)\+{sapwamI}     {aluk_cgi_interface("NULL",2,"घकालतनेषु कालनाम्नः(6.3.17)");}
^{prA}\+{sapwamI}[ ](Saya|vAsa|vAsI)\+{praWamA}		{
                                                         sprintf(ques,"किमिदं %s कालभिन्नवाचकः(Y/N)?",p1_utf);
                                                         aluk_cgi_interface(ques,2,"शयवासवासिष्वकालात्(6.3.18)");
						        }
^{prA}\+{sapwamI}[ ](.*in|sixXa|baxXa)\+{praWamA}	{aluk_cgi_interface("NULL",0,"नेन्सिद्धबध्नातिषु च(6.3.19)");}
^{prA}\+{sapwamI}[ ]{prA}\+{praWamA}           		{
                                                	 sprintf(ques,"किमिदं %s स्वाङ्गवाचकं वर्तते एवं समासेन संज्ञा प्रतीयते(Y/N)?",p1_utf);
                                                	 aluk_cgi_interface(ques,1,"अमूर्धमस्तकात् स्वाङ्गात् अकामे(6.3.12)");
					      		}
^{prA}\+{sapwamI}[ ]{word}  				{
                                  			 sprintf(ques,"किमिदं %s भाषायां वर्तते (Y/N)?",p1_utf);
                                  			 aluk_cgi_interface(ques,0,"स्थे च भाषायाम्(6.3.20)");
			    				}
^{prA}q\+{RaRTI}[ ]puwra\+{praWamA}			{
					                 sprintf(ques,"किं %s विद्यासम्बन्धार्थे वर्तते अथवा योनिसम्बन्धार्थे(Y/N)?",p1_utf);
                                                         aluk_cgi_interface(ques,1,"ऋतो विद्यायोनिसम्बन्धेभ्यः(6.3.23)");
							}
^{prA}q\+{RaRTI}[ ](svasq|pawi)\+{praWamA}		{
							 aluk_cgi_interface("NULL",2,"विभाषा स्वसृपत्योः(6.3.24)");
                                                        }
^{prA}\+{RaRTI}[ ]puwra\+{praWamA}			{
					 		 sprintf(ques,"किं समासेन निन्दार्थः गम्यते(Y/N)?");
                                         		 aluk_cgi_interface(ques,2,"पुत्रेऽन्यतरस्याम्(6.3.22)");
                                        		}
^{prA}\+{RaRTI}[ ]{word}              			{
                                           		 sprintf(ques,"किम् अनेन समासेन आक्रोशार्थः गम्यते(Y/N)?");
                                           		 aluk_cgi_interface(ques,1,"षष्ठ्या आक्रोशे(6.3.21)");
				      		 	}
^.*							{aluk_cgi_interface("NULL",0,"NULL");}

%%

char ques[LARGE];
char p1_utf[MEDIUMUTF];
char p2_utf[MEDIUMUTF];
char p1_utfr[MEDIUMUTF];
char p2_utfr[MEDIUMUTF];
char p1[MEDIUM];
char p2[MEDIUM];
char sup1[MEDIUM];
char sup2[MEDIUM];
char samAsaprakAra[MEDIUM];
char viXAyakasUwra[LARGE];
char samAsAnwa[MEDIUM];
char avigraha[MEDIUM];
char encoding[MEDIUM];
int divid;

void aluk_cgi_interface();
void call_aluklex();
void cnvrtwx2utf();
void cnvrtutfd2r();
int yywrap();

void call_aluklex(char *in){
  yy_scan_string(in);
  yylex();
}

int yywrap()
{
return 1;
}

void aluk_cgi_interface (char *question, int alukviBARA, char *sUwra)
{
    char questionr[MEDIUMUTF];
   //  printf("samAsAnwa within aluk_cgi_interface = %s",samAsAnwa);
   //  printf("within aluk_cgi_interface sUwra= %s",sUwra);
   //  printf("within aluk_cgi_interface alukviBARA= %d",alukviBARA);
     if(strcmp(question,"NULL"))
        printf("</tr></table><form name=\"f4\" method=\"post\">");
      else 
        printf("<td colspan=\"3\"><form name=\"f4\" method=\"post\">");

     printf("<input type=\"hidden\" name=\"encodingaluk\" id=\"encodingaluk\" value=\"%s\" />",encoding);
     printf("<input type=\"hidden\" name=\"p1aluk\" id=\"p1aluk\" value=\"%s\" />",p1);
     printf("<input type=\"hidden\" name=\"p2aluk\" id=\"p2aluk\" value=\"%s\" />",p2);
     printf("<input type=\"hidden\" name=\"s1aluk\" id=\"s1aluk\" value=\"%s\" />",sup1);
     printf("<input type=\"hidden\" name=\"s2aluk\" id=\"s2aluk\" value=\"%s\" />",sup2);
     printf("<input type=\"hidden\" name=\"samAsaprakAraaluk\" id=\"samAsaprakAraaluk\" value=\"%s\" />",samAsaprakAra);
     printf("<input type=\"hidden\" name=\"samAsAnwaaluk\" id=\"samAsAnwaaluk\" value=\"%s\" />",samAsAnwa);
     printf("<input type=\"hidden\" name=\"dividaluk\" id=\"dividaluk\" value=\"#output%d\" />",divid);
     printf("<input type=\"hidden\" name=\"alukviBARA\" id=\"alukviBARA\" value=\"%d\" />",alukviBARA);
     printf("<input type=\"hidden\" name=\"sUwraaluk\" id=\"sUwraaluk\" value=\"%s\" />",sUwra);
     if(strcmp(question,"NULL")){
       if(!strcmp(encoding,"RMN")){
         cnvrtutfd2r(question,questionr);
         printf("%s ",questionr);
       } else {
         printf("%s ",question);
       }
       printf("<input type=\"submit\" name=\"ansaluk\" value=\"Yes\" id=\"ansaluk\" onclick=\"return alukyescgi()\"/>");
       printf("<input type=\"submit\" name=\"ansaluk\" value=\"No\" id=\"ansaluk\" onclick=\"return aluknocgi()\"/>");
     } else
       if (!strcmp(encoding,"RMN")) {
         printf("<input type=\"submit\" name=\"ansaluk\" value=\"Continue\" id=\"ansaluk\" onclick=\"return alukNullcgi()\"/>");
       } else {
         printf("<input type=\"submit\" name=\"ansaluk\" value=\"Continue\" id=\"ansaluk\" onclick=\"return alukNullcgi()\"/>");
       }
     if(strcmp(question,"NULL"))
          printf("</form>");
     else 
          printf("</form></td></tr></table>");
}

int main (int argc, char *argv[]) {

  strcpy(encoding,argv[1]);
  strcpy(avigraha,argv[2]);
  strcpy(p1,argv[3]);
  strcpy(sup1,argv[4]);
  strcpy(p2,argv[5]);
  strcpy(sup2,argv[6]);
  strcpy(samAsaprakAra,argv[7]);
  strcpy(samAsAnwa,argv[8]);
  divid = atoi(argv[9]);

   // printf("encoding = %s",argv[1]);
  //  printf("%s %s %s %s %s %s %s %s %s",argv[1],argv[2],argv[3],argv[4],argv[5],argv[6],argv[7],argv[8],argv[9]);
  cnvrtwx2utf(p1,p1_utf);
  cnvrtwx2utf(p2,p2_utf);

  if(!strcmp(encoding,"RMN")){
    cnvrtwx2utf(p1_utf,p1_utfr);
    cnvrtwx2utf(p2_utf,p1_utfr);

    strcpy(p1_utf, p1_utfr);
    strcpy(p2_utf, p2_utfr);
  }
  // printf("aluk.lex samAsAnwa = %s",samAsAnwa);
  call_aluklex(avigraha);
 return 1;
}
