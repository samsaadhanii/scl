%{
#include "struct.h"
extern char ques[LARGE];
extern char p1_utf[MEDIUMUTF];
extern char p2_utf[MEDIUMUTF];
extern void gawi_cgi_interface();
%}
%option nounput
%option noinput

prA [a-zA-Z]+

sup \+(su|O|jas|am|Ot|Sas|tA|ByAm3|Bis|fe|ByAm4|Byas4|fasi|ByAm5|Byas5|fas|os6|Am|fi|os7|sup)
word {prA}{sup}

%%
^saw{sup}[ ]{word}	{ 
			 sprintf(ques,"किम् %s इति  आदरवाची वा (Y/N)?", p1_utf);
			 gawi_cgi_interface(ques,1,"1.4.62");
			}
^alam[ ]{word}	{ 
			 sprintf(ques,"किम् %s इति  भूषणार्थे  वा (Y/N)?", p1_utf);
			 gawi_cgi_interface(ques,1,"1.4.63");
			}
^antar[ ]{word}	{ 
			 sprintf(ques,"किम् %s इति  अपरिग्रहार्थे अस्ति वा (Y/N)?", p1_utf);
			 gawi_cgi_interface(ques,1,"1.4.64");
			}
^kaNe[ ]{word}	{ 
			 sprintf(ques,"किम् %s इति  श्रद्धायां वर्तते वा (Y/N)?", p1_utf);
			 gawi_cgi_interface(ques,1,"1.4.65");
			}
^manasi[ ]{word}	{ 
			 sprintf(ques,"किम् %s इति  प्रतीघाते वर्तते वा (Y/N)?", p1_utf);
			 gawi_cgi_interface(ques,1,"1.4.65");
			}
^puras[ ]{word}	{ 
			 gawi_cgi_interface("NULL",1,"1.4.66");
			}
^aswam[ ]{word}	{ 
			 sprintf(ques,"किम् %s इति    आदरवाची वा (Y/N)?", p1_utf);
			 gawi_cgi_interface(ques,1,"1.4.67");
			}
^acCa[ ](gawi|vada)	{ 
			 sprintf(ques,"किम् %s इति  गत्यर्थको वा  (Y/N)?", p2_utf);
			 gawi_cgi_interface(ques,1,"1.4.68");
			}
^adas{sup}[ ]{word}	{ 
			 sprintf(ques,"किम् %s इति  अनुपदेशे वर्तते वा (Y/N)?", p1_utf);
			 gawi_cgi_interface(ques,1,"1.4.69");
			}
^wiras{sup}[ ]{word}	{ 
			 sprintf(ques,"किम् %s इति  अन्तर्धौ वर्तते वा (Y/N)?", p1_utf);
			 gawi_cgi_interface(ques,1,"1.4.70");
			}

^wiras{sup}[ ]kqwvA	{ 
			 sprintf(ques,"किम् %s इति    आदरवाची वा (Y/N)?", p1_utf);
			 gawi_cgi_interface(ques,1,"1.4.72");
			}
^(upAje|anvAje)[ ]kqwvA	{ 
			 sprintf(ques,"किम् %s इति    आदरवाची वा (Y/N)?", p1_utf);
			 gawi_cgi_interface(ques,1,"1.4.73");
			}
^(urasi|manasi)[ ]kqwvA	{ 
			 sprintf(ques,"किम् %s इति  अनत्याधानार्थे वर्तते (Y/N)?", p1_utf);
			 gawi_cgi_interface(ques,1,"1.4.75");
			}
^(maXye|paxe|nivecane)[ ]kqwvA	{ 
			 gawi_cgi_interface("NULL",1,"1.4.76");
			}
^(haswe|pANO)[ ]kqwvA	{ 
			 sprintf(ques,"किम् %s इति  औपम्ये वर्तते (Y/N)?", p1_utf);
			 gawi_cgi_interface(ques,1,"1.4.77");
			}
^prAXvam{sup}[ ]{word}	{ 
			 sprintf(ques,"किम् %s इति  बन्धने वर्तते वा (Y/N)?", p1_utf);
			 gawi_cgi_interface(ques,1,"1.4.78");
			}
^(jIvika|upaniRaw){sup}[ ]{word}	{ 
			 sprintf(ques,"किम् %s इति  औपम्ये वर्तते वा (Y/N)?", p1_utf);
			 gawi_cgi_interface(ques,1,"1.4.79");
			}

^(ku|pra|para|apa|sam|anu|ava|nis|nir|xus|xur|vi|A|ni|aXi|awi|api|su|ux|aBi|prawi|para|upa)[ ]{word}	{
			 gawi_cgi_interface("NULL",1,"2.2.18");
			}
^{word}[ ](ku|pra|para|apa|sam|anu|ava|nis|nir|xus|xur|vi|A|ni|aXi|awi|api|su|ux|aBi|prawi|para|upa)	{
			 gawi_cgi_interface("NULL",2,"2.2.18");
			}
^.*			{
			 printf("No sUwra is applicable. Exiting ...\n");
                         exit(0);
			}
%%
extern char encoding[MEDIUM];
extern char avigraha[MEDIUM];
extern char p1[MEDIUM];
extern char p2[MEDIUM];
extern char p1_utf[MEDIUMUTF];
extern char p2_utf[MEDIUMUTF];
extern char sup1[MEDIUM];
extern char sup2[MEDIUM];
extern char samAsaprakAra[MEDIUM];
extern char viXAyakasUwra[LARGE];
extern char samAsAnwa[MEDIUM];

void call_gawilex(char *in){
  yy_scan_string(in);
  gawilex();
}

int gawiwrap()
{
return 1;
}

void gawi_cgi_interface(char *question,int position, char *sUwra){ 
        
       if (strcmp(question,"NULL"))
         printf("</tr></table><form name=\"f3\" method=\"post\">");
       else 
         printf("<td colspan=\"3\"><form name=\"f3\" method=\"post\">");

       printf("<input type=\"hidden\" name=\"encodinggawi\" id=\"encodinggawi\" value=\"%s\" />",encoding);
       printf("<input type=\"hidden\" name=\"vigrahagawi\" id=\"vigrahagawi\" value=\"%s\" />",avigraha);
       printf("<input type=\"hidden\" name=\"p1gawi\" id=\"p1gawi\" value=\"%s\" />",p1);
       printf("<input type=\"hidden\" name=\"p2gawi\" id=\"p2gawi\" value=\"%s\" />",p2);
       printf("<input type=\"hidden\" name=\"s1gawi\" id=\"s1gawi\" value=\"%s\" />",sup1);
       printf("<input type=\"hidden\" name=\"s2gawi\" id=\"s2gawi\" value=\"%s\" />",sup2);
       printf("<input type=\"hidden\" name=\"samAsaprakAragawi\" id=\"samAsaprakAragawi\" value=\"%s\" />",samAsaprakAra);
       printf("<input type=\"hidden\" name=\"samAsAnwagawi\" id=\"samAsAnwagawi\" value=\"%s\" />",samAsAnwa);
       printf("<input type=\"hidden\" name=\"viXAyakasUwragawi\" id=\"viXAyakasUwragawi\" value=\"%s\" />",viXAyakasUwra);

       printf("<input type=\"hidden\" name=\"positiongawi\" id=\"positiongawi\" value=\"%d\" />",position);
       printf("<input type=\"hidden\" name=\"gawisUwra\" id=\"gawisUwra\" value=\"%s\" />",sUwra);
       if(strcmp(question,"NULL")){
         printf("%s",question);
         printf("<input type=\"submit\" name=\"ansgawi\" value=\"Yes\" id=\"ansgawi\" onclick=\"return gawiyescgi()\" />");
         printf("<input type=\"submit\" name=\"ansgawi\" value=\"No\" id=\"ansgawi\" onclick=\"return gawinocgi()\" />");
       } else if ((position == 1) || (position == 2)){
                 if (!strcmp(encoding,"RMN")) {
                   printf("<input type=\"submit\" name=\"ansgawi\" value=\"Continue\" id=\"ansgawi\" onclick=\"return gawiNullcgi()\"/>");
                 } else {
                   printf("<input type=\"submit\" name=\"ansgawi\" value=\"Continue\" id=\"ansgawi\" onclick=\"return gawiNullcgi()\"/>");
                 }
              } else {
	         printf("No sUwra is applicable. Exiting ...\n");
                 exit(0);
       }
       if (strcmp(question,"NULL"))
          printf("</form>");
       else
          printf("</form></td></tr></table>");
}
