%{
#include "struct.h"
extern char ques[LARGE];
extern char ustr[MEDIUMUTF];
extern char sUwrastr[LARGE];
extern void uwwarapaxa_cgi_interface();
%}
%option nounput
%option noinput

prA [a-zA-Z]+

safKyA	(ekam|xve|wrINi|cawvAri|paFca|RaRTa|sapwa|aRTa|nava|xaSa|ekAxaSa|xvAxaSa|wrayoxaSa|cawurxaSa|paFcaxaSa|RodaSa|sapwaxaSa|aRTAxaSa|navaxaSa|viMSawi|ekaviMSawi|xvAviMSawi|wrayoviMSawi|cawurviMSaWi|paFcaviMSawi|RadviMSaWi|sapwaviMSawi|aRtAviMSawi|navaviMSawi|wriMSaw|ekawriMSaw|xvAwriMSaw|wrayaswriMSaw|cawuswriMSaw|paFcawriMSaw|RatwriMSaw|sapwawriMSaw|aRTAwriMSaw|navawriMSaw|cawvAriMSaw|ekacawvAriMSaw|xvicawvAriMSaw|wricawvAriMSaw|cawuscawvAriMSaw|paFcacawvAriMSaw|RatcawvAriMSaw|sapwacawvAriMSaw|aRtAcawvAriMSaw|navacawvAriMSaw|paFcASaW)
haswyAxi (haswin|kuxxAla|aSva|kaSika|kuruwa|katola|katolaka|gaNdola|gaNdolaka|kaNdola|kaNdolaka|aja|kapowa|jAla|gaNda|mahilA|xAsI|gaNikA|kusUla)
kumBAxi	(kumBa|eka|jAla|SUla|muni|guNa|Sawa|sUwra|goXA|kalaSI|vi|wqNa|xvi|wri|Rat|xAsI|Siwi|viRNu|su|niR|Arxra|kuNi|kqRNa|Suci|xroNI|xroNa|xru|sUkara|Sakqw|aRTA|sWUNA|a|sUcI)
%%

^akRi[ ]BrU[ ].*  {uwwarapaxa_cgi_interface("NULL","Bruva","अचतुरविचतुर.. 5.4.77");}
^({safKyA}|su)[ ]xanwa[ ]bahuvrIhi { 
                                    sprintf(ques,"अनेन समासेन वयः उच्यते(Y/N)?");
                                    uwwarapaxa_cgi_interface(ques,"xawq","वयसि दन्तस्य दतृ 5.4.141");
			           }
^(agra|SuxXa|SuBra|vqRa|varAha)[ ]xanwa[ ].*	{uwwarapaxa_cgi_interface("NULL","xawq","अग्रान्तशुद्धशुभ्रवृषवराहेभ्यश्च 5.4.145");}

^(SyAva|aroka)[ ]xanwa[ ].*	{uwwarapaxa_cgi_interface("NULL","xawq","विभाषा श्यावरोकाभ्याम् 5.4.144");}

^{prA}[ ]xanwa[ ]bahuvrIhi    {
                                sprintf(ques,"अनेन समासेन सञ्ज्ञा एवं स्त्रीत्वं गम्यते(Y/N)?");
                                uwwarapaxa_cgi_interface(ques,"xawq","स्त्रियाम् सञ्ज्ञायाम् 5.4.143");
                              }
^wri[ ]kakuxa[ ]bahuvrIhi    { 
                                sprintf(ques,"किमनेन समासेन पर्वतः उच्यते(Y/N)?");
                                uwwarapaxa_cgi_interface(ques,"kakux","त्रिककुत्पर्वते 5.4.147");
                             }
^{prA}[ ]kakuxa[ ]bahuvrIhi    { 
                                 sprintf(ques,"किम् अनेन समासेन अवस्था उच्यते(Y/N)?");
                                 uwwarapaxa_cgi_interface(ques,"kakux","ककुदस्यावस्थायाम् लोपः 5.4.146");
                               }
^(uw|vi)[ ]kAkuxa[ ].*	{uwwarapaxa_cgi_interface("NULL","kAkux","उद्विभ्याम्काकुदस्य 5.4.148");}

^pUrNa[ ]kAkuxa[ ].*	{uwwarapaxa_cgi_interface("NULL","kAkux","पूर्णाद्विभाषा 5.4.149");}

^sWulA[ ]nAsikA[ ].*		{uwwarapaxa_cgi_interface("NULL","","अञ्नासिकायाः संज्ञायाम् नसं चास्थुलात् 5.4.118");}
^(xru|Kara)[ ]nAsikA[ ].*		{uwwarapaxa_cgi_interface("NULL","nasa","अञ्नासिकायाः संज्ञायाम् नसं चास्थुलात् 5.4.118");}
^(pra|para|apa|sam|anu|ava|nis|nir|xus|xur|vi|Af|ni|aXi|awi|api|su|ux|aBi|prawi|pari|upa)[ ]nAsikA[ ].*  {uwwarapaxa_cgi_interface("NULL","nasa","उपसर्गाच्च 5.4.119");}

^(pra|sam)[ ]jAnu[ ].*	{uwwarapaxa_cgi_interface("NULL","jFu","प्रसंभ्याम् जानुनोर्ज्ञुः 5.4.129");}
^UrXva[ ]jAnu[ ].*	{uwwarapaxa_cgi_interface("NULL","jFu","ऊर्ध्वाद्विभाषा 5.4.130");}
^(xvi|anwar|pra|para|apa|sam|anu|ava|nis|nir|xus|xur|vi|A|ni|aXi|api|awi|su|uw|aBi|prawi|pari|upa)[ ]ap[ ].*      {uwwarapaxa_cgi_interface("NULL","Ip","द्व्यन्तरुपसर्गेभ्यः अपः ईत् 6.3.97");}
^{prA}[ ]ciwi[ ].*		{uwwarapaxa_cgi_interface("NULL","ciwI","चितेः कपि 6.3.127");}
^(Sara|ikRu|plakRa|Amra|kArRya|Kaxira|pIyUkRA)[ ]vana[ ].*	{uwwarapaxa_cgi_interface("NULL","vaNa","प्रनिरन्तःशरेक्षुप्लक्षाम्रकार्ष्यखदिरपीयूक्षाभ्योऽसंज्ञायामपि 8.4.5");}
^(pra|nir|anwar)[ ]vana[ ].*	{uwwarapaxa_cgi_interface("NULL","vaNa","प्रनिरन्तःशरेक्षुप्लक्षाम्रकार्ष्यखदिरपीयूक्षाभ्योऽसंज्ञायामपि 8.4.5");}
^(puragA|miSrakA|siXrakA|sArikA|kotara|agra)[ ]vana[ ].*	{uwwarapaxa_cgi_interface("NULL","vaNa"); strcpy(sUwrastr,"वनं पुरगामिश्रकासिध्रकासारिकाकोटराग्रेभ्यः 8.4.4");}
^(sarva|saMkyAwa|pUrva|maXya)[ ]ahan[ ].*	{uwwarapaxa_cgi_interface("NULL","ahna","अह्नोऽह्न एतेभ्यः 5.4.88");}
^{safKyA}[ ]ahan[ ].*	{ uwwarapaxa_cgi_interface("NULL","","न संख्यादेः समाहारे 5.4.89");}
^(puNya|eka)[ ]ahan[ ].*	{ uwwarapaxa_cgi_interface("NULL","","उत्तमैकाभ्याम् च 5.4.90");}
^{kumBAxi}[ ]pAxa[ ]bahuvrIhi    {
                                   sprintf(ques,"किमयं समासः स्त्रियां वर्तते(Y/N)?");
 /* In case of bahuvrIhi should we not always ask the lifga? */
                                   uwwarapaxa_cgi_interface(ques,"paxI","कुम्भपदीषु च 5.4.139");
                                 }
^{haswyAxi}[ ]pAxa[ ].*	{ uwwarapaxa_cgi_interface("NULL","pAxa","पादस्य लोपोऽहस्त्यादिभ्यः 5.4.138");} 
^({safKyA}|su)[ ]pAxa[ ].*	{ uwwarapaxa_cgi_interface("NULL","pAx","सङ्ख्यासुपूर्वस्य 5.4.140");} 
^{prA}[ ]pAxa[ ].*	{ uwwarapaxa_cgi_interface("NULL","pAx","पादस्य लोपोऽहस्त्यादिभ्यः 5.4.138");} 
^su[ ]hqxaya[ ]bahuvrIhi  {  
                           sprintf(ques,"किमनेन समासेन मित्रार्थः उच्यते(Y/N)?");
                           uwwarapaxa_cgi_interface(ques,"hqw","सुहृद्दुर्हृदौ मित्रामित्रयोः 5.4.150");
                          }
^xur[ ]hqxaya[ ]bahuvrIhi { 
                            sprintf(ques,"किम् अनेन समासेन अमित्रार्थः उच्यते(Y/N)?");
                            uwwarapaxa_cgi_interface(ques,"hqw","सुहृद्दुर्हृदौ मित्रामित्रयोः 5.4.150");
                          }
^agni[ ]swuw[ ].*		{ uwwarapaxa_cgi_interface("NULL","Rtuw","अग्नेः स्तुत्स्तोमसोमाः 8.3.82");}
^agni[ ]swoma[ ].*	{ uwwarapaxa_cgi_interface("NULL","Rtoma","अग्नेः स्तुत्स्तोमसोमाः 8.3.82");}
^agni[ ]soma[ ].*		{ uwwarapaxa_cgi_interface("NULL","Roma","अग्नेः स्तुत्स्तोमसोमाः 8.3.82");}
^(jyowis|Ayus)[ ]swoma[ ].*	{ uwwarapaxa_cgi_interface("NULL","Rtoma","ज्योतिरायुषः स्तोमः 8.3.83");}
^.*r*a[ ]ahna[ ].*      	{ uwwarapaxa_cgi_interface("NULL","ahNa","अह्नोऽदन्तात् 8.4.7");}
^.*	{uwwarapaxa_cgi_interface("NULL","","");}

%%
char ques[LARGE];
char sUwrastr[LARGE];
char ustr[MEDIUMUTF];
char p1[MEDIUM];
char p2[MEDIUM];
char samAsAnwa[MEDIUM];
char samAsaprakAra[MEDIUM];
char encoding[MEDIUM];
int divid;

void uwwarapaxa_cgi_interface();
void call_uwwarapaxalex();
extern void cnvrtutfd2r();

int main (int argc, char *argv[]) {
char in[MEDIUM];

  strcpy(encoding,argv[1]);
  strcpy(p1,argv[2]);
  strcpy(p2,argv[3]);
  strcpy(samAsAnwa,argv[4]);
  strcpy(samAsaprakAra,argv[5]);
  divid = atoi(argv[6]);
  
  strcpy(in,p1);
  strcat(in," ");
  strcat(in,p2);
  strcat(in," ");
  strcat(in,samAsaprakAra);
 // printf("Calling uwwarapaxa lex = %s",in);
  call_uwwarapaxalex(in);
 return 1;
}

void call_uwwarapaxalex(char *in){
  yy_scan_string(in);
  yylex();
}

int yywrap()
{
return 1;
}

void uwwarapaxa_cgi_interface(char *condition, char *ustr, char *sstr){ 
    char conditionr[LARGE];

     if(strcmp(condition,"NULL")){
        printf("</tr></table><form name=\"f6\" method=\"post\" />");
     } else {
        printf("<td><form name=\"f6\" method=\"post\" />");
     }
       printf("<input type=\"hidden\" name=\"encodinguwwara\" id=\"encodinguwwara\" value=\"%s\" />",encoding);
       printf("<input type=\"hidden\" name=\"p1uwwara\" id=\"p1uwwara\" value=\"%s\" />",p1);
       printf("<input type=\"hidden\" name=\"p2uwwara\" id=\"p2uwwara\" value=\"%s\" />",p2);
       printf("<input type=\"hidden\" name=\"samAsAnwauwwara\" id=\"samAsAnwauwwara\" value=\"%s\" />",samAsAnwa);
       printf("<input type=\"hidden\" name=\"samAsaprakArauwwara\" id=\"samAsaprakArauwwara\" value=\"%s\" />",samAsaprakAra);
       printf("<input type=\"hidden\" name=\"uwwarapaxastr\" id=\"uwwarapaxastr\" value=\"%s\" />",ustr);
       printf("<input type=\"hidden\" name=\"sUwrastruwwara\" id=\"sUwrastruwwara\" value=\"%s\" />",sstr);
       printf("<input type=\"hidden\" name=\"dividuwwara\" id=\"dividuwwara\" value=\"#output%d\" />",divid);
     if(strcmp(condition,"NULL")){
        if(!strcmp(encoding,"RMN")){
           cnvrtutfd2r(condition,conditionr);
           printf("%s",condition);
        } else {
           printf("%s",condition);
        }
         printf("<input type=\"submit\" name=\"ansuwwara\" value=\"Yes\" id=\"ansuwwara\" onclick=\"return uwwarapaxayescgi()\" />");
         printf("<input type=\"submit\" name=\"ansuwwara\" value=\"No\" id=\"ansuwwara\" onclick=\"return uwwarapaxanocgi()\" />");
       }
     else 
           if (!strcmp(encoding,"RMN")) {
              printf("<input type=\"submit\" name=\"ansuwwara\" value=\"Continue\" id=\"ansuwwara\" onclick=\"return uwwarapaxaNullcgi()\"/>");
           } else {
              printf("<input type=\"submit\" name=\"ansuwwara\" value=\"Continue\" id=\"ansuwwara\" onclick=\"return uwwarapaxaNullcgi()\"/>");
           }
     if(strcmp(condition,"NULL")){
        printf("</form>");
     } else {
        printf("</form></td></tr></table>");
     }
 }
