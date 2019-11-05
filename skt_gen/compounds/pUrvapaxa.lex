%{
#include "struct.h"
#include "paths.h"

extern char ques[LARGE];
extern char paxa[LARGE];
extern char sUwrastr[LARGE];
extern char p1_utf[MEDIUMUTF];
extern char p2_utf[MEDIUMUTF];
extern struct prAwipaxikam prAwi;
extern char p1[MEDIUM];
extern char p2[MEDIUM];
extern void pUrvapaxa_cgi_interface();
extern void prAwipaxika_info();
extern int chk_kqw();
%}
%option nounput
%option noinput

ac [aAiIuUqQleEoO]	
HAL [hyvrlfmFNnJBgDXjbgdxKPCTWctwkpSRs]
prA [a-zA-Z]+
samasaprakara (xvanxva|bahuvrIhi|wawpuruRa|avyayIBAvaH)
sup (su|O|jas|am|Ot|Sas|tA|ByAm3|Bis|fe|ByAm4|Byas4|fasi|ByAm5|Byas5|fas|os6|Am|fi|os7|sup)
saMKyAbahuvrIhyaSIwi	(ekam|xve|wrINi|wri|cawvAri|paFca|RaRTa|sapwa|aRTa|nava|xaSa|ekAxaSa|xvAxaSa|wrayoxaSa|cawurxaSa|paFcaxaSa|RodaSa|sapwaxaSa|aRTAxaSa|navaxaSa|viMSawi|ekaviMSawi|xvAviMSawi|wrayoviMSawi|cawurviMSaWi|paFcaviMSawi|RadviMSaWi|sapwaviMSawi|aRtAviMSawi|navaviMSawi|wriMSaw|ekawriMSaw|xvAwriMSaw|wrayaswriMSaw|cawuswriMSaw|paFcawriMSaw|RatwriMSaw|sapwawriMSaw|aRTAwriMSaw|navawriMSaw|cawvAriMSaw|ekacawvAriMSaw|xvicawvAriMSaw|wricawvAriMSaw|cawuscawvAriMSaw|paFcacawvAriMSaw|RatcawvAriMSaw|sapwacawvAriMSaw|aRtAcawvAriMSaw|navacawvAriMSaw|paFcASaW)

%x TMP

%%
^{prA}[vy][vrl]	{strncpy(paxa,yytext,yyleng-1); strcpy(sUwrastr,"लोपो व्योर्वलि 6.1.66"); BEGIN TMP;}
<TMP>{prA}[ ]{prA}[ ]{samasaprakara}	{strcat(paxa,yytext); pUrvapaxa_cgi_interface("NULL",paxa,p1,sUwrastr);}
^(mahawI|mahaw)[ ]{prA}[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","mahA","","आन्महतः समानाधिकरणजातीययोः 6.3.46"); }
 /* Though the sUwra has the word mahaw, it is to be interpretated as mahaw/mahawI, and w -> A, followed by a sandhi rule a+A -> A. All these steps are compressed into one. */
^uRas[ ]{prA}[ ]xvanxva      { 
			  	 sprintf(ques,"अनेन समासेन देवतार्थः उच्यते(Y/N)?");
		        	 pUrvapaxa_cgi_interface(ques,"uRAsA",p1,"उषासोषसः 6.3.31");
			        }
^agni[ ](soma|varuNa)[ ]{samasaprakara}		{pUrvapaxa_cgi_interface("NULL","agnI",p1,"ईदग्नेः सोमवरुणयोः 6.3.27");}
^mAwq[ ]piwq			{pUrvapaxa_cgi_interface("NULL","mAwara",p1,"मातरपितरवुदीचाम् 6.3.32");}
^xvi[ ]aSIwi[ ]bahuvrIhi	{pUrvapaxa_cgi_interface("NULL","xvA",p1,"द्व्यष्टनः संख्यायामबहुव्षीह्यशीत्योः 6.3.47");}
^xiv[ ]pqWivI[ ]{samasaprakara}			{pUrvapaxa_cgi_interface("NULL","xivas/xyAvA",p1,"दिवसश्च पृथिव्याम् 6.3.30");}
^xiv[ ]{prA}[ ]{samasaprakara}		{pUrvapaxa_cgi_interface("NULL","xyAvA",p1,"दिवो द्यावा 6.3.29");} 
^xvi[ ]{saMKyAbahuvrIhyaSIwi}[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","xvA",p1,"द्व्यष्टनः संख्यायमबहुव्रीह्यशीत्योः 6.3.47");} 
^aRtan[ ]{saMKyAbahuvrIhyaSIwi}[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","aRtA",p1,"द्व्यष्टनः संख्यायमबहुव्रीह्यशीत्योः 6.3.47");}
^wri[ ]{saMKyAbahuvrIhyaSIwi}[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","wrayas",p1,"त्रेस्त्रयः 6.3.48");} 
^hqxaya[ ](leKa|lAsa)[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","hqw",p1,"हृदयस्य हृल्लेखयदण्लासेषु 6.3.50");} /* to add yax and aN */
^hqxaya[ ](Soka|roga)[ ]{samasaprakara}		{pUrvapaxa_cgi_interface("NULL","hqw",p1,"वा शोकष्यञ्रोगेषु 6.3.51");} 
^pAxa[ ](ga|Aji|Awi|upahawa)[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","paxa",p1,"पादस्य पदाज्यातिगोपहतेषु 6.3.52");}
 /* paxyawyawaxarWe 6.3.53 waxXiwa Morph is needed */
^pAxa[ ](hima|kARi|hawi)[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","pax",p1,"हिमकाषिहतिषु च 6.3.54");}
^pAxa[ ](GoRa|miSra|Sabxa)[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","paw",p1,"वा घोषमिश्रशब्देषु 6.3.56");}
^uxaka[ ](manWa|oxana|sakwu|binxu|vajra|BAra|vIvaXa|gAha)[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","uxa",p1,"मन्थौदनसक्तुबिन्डुवज्रभारवीवधगाहेषु च 6.3.60");}
^uxaka[ ]{prA}[ ]wawpuruRa	 { 
				   sprintf(ques,"अनेन समासेन सञ्ज्ञा गम्यते(Y/N)?");
				   pUrvapaxa_cgi_interface(ques,"uxa",p1,"उदकस्योदः सञ्ज्ञायाम् 6.3.57");
			         }
^uxaka[ ](peRa|vAsa|vAhana|Xi)[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","uxa",p1,"पेषंवासवाहनधिषु च 6.3.58");}
 /* ekahalAxO pUrayiwavyeZnyawarasyAm 6.3.59 how to implement ekahalAxO?*/
 /* iko hrasvoZfyo gAlavasya 6.3.61 morph */
^ekA[ ]{prA}[ ]{samasaprakara}		{pUrvapaxa_cgi_interface("NULL","eka",p1,"एक तद्धिते च 6.3.62");}
 /* fyApoH saFjFACanxasorbahulam 6.3.63 morph information */
 /* wve ca 6.3.64 waxXiwa suffix	Not Implemented */ 
^iRtakA[ ]ciwa[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","iRtaka",p1,"इष्टकेषिकामालानाम् चिततूलभारिषु 6.3.65");} /* yatha samkhya */
^iRIkA[ ]wUla[ ]{samasaprakara}		{pUrvapaxa_cgi_interface("NULL","iRIka",p1,"इष्टकेषिकामालानाम् चिततूलभारिषु 6.3.65");}
^mAlA[ ]BArI[ ]{samasaprakara}		{pUrvapaxa_cgi_interface("NULL","mAla",p1,"इष्टकेषिकामालानाम् चिततूलभारिषु 6.3.65");}
 /* 6.3.66 to 6.3.69 are not related to samAsAs */
^sawya[ ]kAra[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","sawyam",p1,"कारे सत्यागदस्य 6.3.70");} /* sUwrastr is split */
^agaxa[ ]kAra[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","agaxam",p1,"कारे सत्यागदस्य 6.3.70");}
^rAwri[ ]cara[ ]{samasaprakara}	{
			  if(chk_kqw(p2,"kwa")){
			   pUrvapaxa_cgi_interface("NULL","rAwriM",p1,"रात्रेः कृति विभाषा 6.3.72"); 
			  }
			} 

 /* 6-3-75 naBrANnapAnnavexAnAsawyAnamucinakulanaKanapuMsakanakRawranakranAkeRu prakqwyA */
 /* 6-3-76 ekAxiH ca Ekasya ca xuk */
^na[ ]ga[ ]wawpuruRa      {
                             sprintf(ques,"अनेन समासेन प्राणिभिन्नः उच्यते(Y/N)?");
                             pUrvapaxa_cgi_interface(ques,"na","a","नगः अप्राणिषु अन्यतरस्याम् 6.3.77");
                           }
^na[ ]{HAL}[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","a",p1,"नलोपो नञः 6.3.73");}
^na[ ]{ac}[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","an",p1,"तस्मान्नुडचि 6.3.74");}

^saha[ ]{prA}[ ]avyayIBAvaH   {
			         sprintf(ques,"अनेन समासेन सञ्ज्ञा गम्यते(Y/N)?");
			         pUrvapaxa_cgi_interface(ques,"sa",p1,"सहस्य सः सञ्ज्ञायाम् 6.3.78");
/* There is something wrong in the following code. How can the control reach overe here?  */
                                 sprintf(ques,"%s इति पदं कालभिन्नवाचकम्(Y/N)?",p2_utf);
                                 pUrvapaxa_cgi_interface("NULL","sa",p1,"अव्ययीभावे च अकाले 6.3.81");
                                 pUrvapaxa_cgi_interface("NULL","saha",p1,"अव्ययीभावे च अकाले 6.3.81"); /* else */
                               }

 /* 6-3-79 granWAnwAXike ca */
 /* 6-3-80 xviwIye ca anupAKye */
  /* 6-3-82 vA upasarjanasya */
 /* 6-3-83 prakqwyA ASiRi */
 /* 6-3-84 samAnasya Canxasi amUrXapraBqwyuxarkeRu */
^samAna[ ](jyowis|janapaxa|rAwri|nABi|nAma|gowra|rUpa|sWAna|varNa|vaya|vacana|banXu)[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","sa",p1,"ज्योतिर्जनपदरात्रिनाभिनामगोत्ररूपस्थनवर्णवयोवचनबन्धुषू 6.3.85");}
^samAna[ ]brahmacArI[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","sa",p1,"चरणे ब्रह्मचारिनि 6.3.86");}
 /* 6-3-87 wIrWe ye morph*/
 /* 6-3-88 viBARA uxare morph*/
^samAna[ ](xqk|xqS)[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","sa",p1,"दृग्दृशवतुषु 6.3.89");}
^ixam[ ](xqk|xqS)[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","I",p1,"इदङ्किमोरीश्की 6.3.90");}
^kim[ ](xqk|xqS)[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","kI",p1,"इदङ्किमोरीश्की 6.3.90");}
 /* 6-3-97 xvyanwarupasargeByaH apaH Iw */
 /* 6-3-98 UxanoH xeSe */
^anya[ ](ASis|ASA|AswA|AsWiwa|uwsuka|Uwi|kAraka|rAga)[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","anyax",p1,"अषष्ठ्यतृतीयास्थान्यस्य दुगाशीराशास्थास्थितोत्सुकोतिकारकरागच्छेषु 6.3.99");}
 /* 6-3-100 arWe viBARA Not Implemented */ 
 /* 6-3-105 IRaxarWe */
 /* 6-3-109 pqRoxarAxIni yaWopaxiRtam how to implement this one?*/
 /* 6-3-114 saMhiwAyAm */
 /* 6-3-115 karNe lakRaNasya aviRtARtapaFcamaNiBinnacCinnacCixrasruvasvaswikasya negation */
 /* 6-3-116 nahivqwivqRivyaXirucisahiwaniRu kvO morph */
 /* 6-3-117 vanagiryoH saFjFAyAM kotarakiMSulukAxInAm */
 /* 6-3-118 vale morph*/
 /* 6-3-119 mawO bahvacaH anajirAxInAm morph*/
 /* 6-3-120 SarAxInAM ca morph*/
 /* 6-3-121 ikaH vaheH apIloH morph */
 /* 6-3-122 upasargasya GaFi amanuRye bahulam morph*/
 /* 6-3-125 aRtanaH saFjFAyAm */
 /* 6-3-129 nare saFjFAyAm */
 /* 6-3-139 samprasAraNasya */
^anya[ ]arWa[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","anyax",p1,"अर्थे विभाषा 6.3.100");}
^ku[ ](raWa|vaxa)[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","kax",p1,"रथवदयोश्च 6.3.102");}
^ku[ ]wqNa[ ]{samasaprakara}		{pUrvapaxa_cgi_interface("NULL","kax",p1,"तृणे च जातो 6.3.103");}
^ku[ ](paWi|akRa)[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","kA",p1,"कापथ्यक्षयोः 6.3.104");}
^ku[ ]puruRa[ ]{samasaprakara}		{pUrvapaxa_cgi_interface("NULL","kA",p1,"विभाषा पुरुषै 6.3.106");}
^ku[ ](uRNa)[ ]{samasaprakara}		{pUrvapaxa_cgi_interface("NULL","kava/kA/kax",p1,"कवं चोष्णे 6.3.107");}
^ku[ ]{ac}[ ]{samasaprakara}		{pUrvapaxa_cgi_interface("NULL","kax",p1,"कोः कत्तत्पुरुषेऽचि 6.3.101");}
^(vi|ni|aXi|awi|api|aBi|prawi)[ ]kASa[ ]{samasaprakara}	{
			 pUrvapaxa_cgi_interface("NULL","vI/NI/aXI/apI/aBI/prawI/awI",p1,"इकः काशे 6.3.123");
                        }
^viSva[ ]miwra[ ]bahuvrIhi	{
				  sprintf(ques,"अनेन समासेन ऋषिः उच्यते(Y/N)?");
			          pUrvapaxa_cgi_interface(ques,"viSvA",p1,"मित्रे चर्षौ 6.3.130");
                                }
^ku[ ]wumburu[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","kus",p1,"कुस्तुम्बुरुणि जातिः 6.1.143");}
^apara[ ]para[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","aparas",p1,"अपरस्पराः क्रियासातत्ये 6.1.144");}
^go[ ]paxa[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","goR",p1,"गोष्पदम् सेवितासेवितप्रमाणेषु 6.1.145");}
^A[ ]paxa[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","As",p1,"आस्पदम् प्रतिष्ठायाम् 6.1.146");}
^A[ ]carya[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","As",p1," आश्चर्य्मनित्ये 6.1.147");}
^ava[ ]kara[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","avas",p1,"वर्चस्केऽवस्करः 6.1.148");}
^apa[ ]kara[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","apas",p1,"अपस्करो रथान्गम् 6.1.149");}
^vi[ ]kira[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","viR",p1,"विष्किरः शकुनौ वा 6.1.150");}
^prawi[ ]kaSa[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","prawiR",p1,"प्रतिष्कशश्च कशेः 6.1.152");}
^pra[ ]kaNva[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","pras",p1,"प्रस्कण्वहरिश्चन्द्रवृषी 6.1.153");} /* Note: sUwrastr is split */
^hari[ ]canxra[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","haris",p1,"प्रस्कण्वहरिश्चन्द्रवृषी 6.1.153");}

^ku[ ]{prA}[ ]wawpuruRa   {
                            sprintf(ques,"किम् कु इति ईषदर्थे वर्तते(Y/N)?");
                            pUrvapaxa_cgi_interface(ques,"kA",p1,"ईषदर्थे 6.3.105");
		          }
^kA[ ]wIra[ ]bahuvrIhi   {
                            sprintf(ques,"अनेन समासेन नगरार्थः प्रतीयते(Y/N)?");
 /* Is it a saFjFA or any nagara ? */
                            pUrvapaxa_cgi_interface(ques,"kAs",p1,"कास्तीराजस्तुन्दे नगरे 6.1.155");
		         }
^aja[ ]wunxa[ ]wawpuruRa	{ 
                                  sprintf(ques,"अनेन समासेन नगरार्थः प्रतीयते(Y/N)?"); 
                                  pUrvapaxa_cgi_interface(ques,"ajas",p1,"कास्तीराजस्तुन्दे नगरे 6.1.155");
		                }
^kAra[ ]kara[ ]{samasaprakara}	{pUrvapaxa_cgi_interface("NULL","kAras",p1,"कारस्करो वृक्षः 6.1.156");}
^(pAra|kAra)[ ]kara[ ]{samasaprakara}	{strcpy(p1,paxa); strcat(paxa,"s"); pUrvapaxa_cgi_interface("NULL",paxa,"","पारस्करप्रभृतीनि संज्ञायाम् 6.1.157");}
^{prA}q[ ]{prA}[ ]{samasaprakara}	{
                         strcpy(paxa,p1);
		         paxa[strlen(paxa)-1] = 'A';
		         strcpy(sUwrastr,"आनङृतो द्वन्द्वे 6.3.25");
			 pUrvapaxa_cgi_interface("NULL",paxa,p1,sUwrastr);
		}
^{prA}[ ]{prA}[ ]{samasaprakara}	{ 
                          strcpy(paxa,p1); 
			  prAwipaxika_info(paxa,&prAwi);
			  if(!strcmp(prAwi.jAwi,"xevawA")) {
		             paxa[strlen(paxa)-1] = 'A';
			     strcpy(sUwrastr,"देवता द्वन्द्वे च 6.3.26"); 
			     pUrvapaxa_cgi_interface("NULL",paxa,p1,sUwrastr);
			  } else
			     pUrvapaxa_cgi_interface("NULL",p1,p1,"");
		}

%%
extern int divid;
extern char samAsAnwa[MEDIUM];
extern char samAsaprakAra[MEDIUM];
extern char encoding[MEDIUM];
extern char p1[MEDIUM];
extern char p2[MEDIUM];
extern char p1_utf[MEDIUMUTF];
extern char p2_utf[MEDIUMUTF];
extern void cnvrtutfd2r();
extern void cnvrtwx2utfr();

char paxa[LARGE];
char sUwrastr[LARGE];
char ques[LARGE];

void call_pUrvapaxalex(){
  char in[MEDIUM];
  strcpy(in,p1);
  strcat(in," ");
  strcat(in,p2);
  strcat(in," ");
  strcat(in,samAsaprakAra);
  yy_scan_string(in);
  pUrvapaxalex();
  //pUrvapaxa_cgi_interface("NULL","","");
}

int pUrvapaxawrap()
{
return 1;
}

/* If the condition is true, then p1 changes to pstrmod
If the condition is false, the it is punstrmod.

If the condition is NULL, then p1 changes to pstrmod, in this case punstrmod iss irrelevant, it may be set to p1unstrmod.
*/
void pUrvapaxa_cgi_interface(char *condition, char *pstrmod, char *pstrunmod, char *sstr){
     
    char conditionr[LARGE];

       if(strcmp(condition,"NULL"))
          printf("</tr><form name=\"f5\" method=\"post\" />");
       else 
       printf("<td colspan=\"3\"><form name=\"f5\" method=\"post\" />");

       printf("<input type=\"hidden\" name=\"encodingpUrva\" id=\"encodingpUrva\" value=\"%s\" />",encoding);
       printf("<input type=\"hidden\" name=\"p1pUrva\" id=\"p1pUrva\" value=\"%s\" />",p1);
       printf("<input type=\"hidden\" name=\"p2pUrva\" id=\"p2pUrva\" value=\"%s\" />",p2);
       printf("<input type=\"hidden\" name=\"samAsaprakArapUrva\" id=\"samAsaprakArapUrva\" value=\"%s\" />",samAsaprakAra);
       printf("<input type=\"hidden\" name=\"samAsAnwapUrva\" id=\"samAsAnwapUrva\" value=\"%s\" />",samAsAnwa);
       printf("<input type=\"hidden\" name=\"dividpUrva\" id=\"dividpUrva\" value=\"#output%d\" />",divid);
       printf("<input type=\"hidden\" name=\"strmodpUrva\" id=\"strmodpUrva\" value=\"%s\" />",pstrmod);
       printf("<input type=\"hidden\" name=\"strunmodpUrva\" id=\"strunmodpUrva\" value=\"%s\" />",pstrunmod);
       printf("<input type=\"hidden\" name=\"sUwrastrpUrva\" id=\"sUwrastrpUrva\" value=\"%s\" />",sstr);
     if(strcmp(condition,"NULL")){
         if(!strcmp(condition,"RMN")){
            cnvrtutfd2r(condition,conditionr);
            printf("%s",conditionr);
         } else {
            printf("%s",condition);
         }
         printf("<input type=\"submit\" name=\"anspUrva\" value=\"Yes\" id=\"anspUrva\" onclick=\"return pUrvapaxayescgi()\" />");
         printf("<input type=\"submit\" name=\"anspUrva\" value=\"No\" id=\"anspUrva\" onclick=\"return pUrvapaxanocgi()\" />");
       }
     else 
         printf("<input type=\"submit\" name=\"anspUrva\" value=\"Continue\" id=\"anspUrva\" onclick=\"return pUrvapaxaNullcgi()\"/>");
     if(strcmp(condition,"NULL"))
       printf("</form>");
     else 
       printf("</form></td></tr></table>");
 }

int chk_kqw(char *str, char *kqw_str){
FILE *fp;
char ans[VERYSMALL];
char cmd[LARGE];
char fin[MEDIUM];
char fout[MEDIUM];
char tmp[MEDIUM];
int pid;

pid = getpid();

sprintf(fin,TFPATH);
sprintf(tmp,"/tmp%d",pid);
strcat(fin,tmp);
sprintf(fin,TFPATH);
sprintf(tmp,"/result%d",pid);
strcat(fout,tmp);

if((fp = fopen(fin,"w"))==NULL){
  printf("Error in opening %s for writing\n",fin);
  exit(0);
}
fprintf(fp,"%s\n",str);
fclose(fp);

sprintf(cmd,"%s -c %s/morph_bin/all_morf.bin < %s | grep -c 'kqw_prawyayaH:%s' > %s",LTPROCBIN,SCLINSTALLDIR,fin,kqw_str,fout);
system(cmd);

if((fp = fopen(fout,"r"))==NULL){
  printf("Error in opening %s for reading\n",fout);
  exit(0);
}
fscanf(fp,"%c",ans);
fclose(fp);

 sprintf(cmd,"rm %s %s",fin,fout);
 system(cmd);
if(ans[0] == '1') { return 1; } else { return 0;} 
}
