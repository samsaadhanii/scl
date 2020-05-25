%{
#include "struct.h"
#include "paths.h"
extern char ques[LARGE];
extern char p1[MEDIUM];
extern char p2[MEDIUM];
extern char p1_utf[MEDIUMUTF];
extern char p2_utf[MEDIUMUTF];
extern void upasarjana_cgi_interface();
extern int chk_kqw();
%}
%option nounput
%option noinput

prA	[a-zA-Z]+

praWamA	(su|O|jas)
xviwIyA	(am|Ot|Sas)
wqwIyA	(tA|ByAm3|Bis)
cawurWI	(fe|ByAm4|Byas4)
paFcamI	(fasi|ByAm5|Byas5)
RaRTI	(fas|os6|Am)
sapwamI	(fi|os7|sup)


sup	(su|O|jas|am|Ot|Sas|tA|ByAm3|Bis|fe|ByAm4|Byas4|fasi|ByAm5|Byas5|fas|os6|Am|fi|os7|sup)
word	{prA}\+{sup}

SONdAxi	(SONda|XUrwa|kiwava|vyAda|pravINa|saMvIwa|anwara|aXi|patu|paNdita|kuRala|capala|nipuNa|surARtra|baxXa)
safKyA	(eka|xvi|wri|cawvAri|paFca|RaRTa|sapwa|aRTa|nava|xaSa|ekAxaSa|xvAxaSa|wrayoxaSa|cawurxaSa|paFcaxaSa|RodaSa|sapwaxaSa|aRTAxaSa|navaxaSa|viMSawi|ekaviMSawi|xvAviMSawi|wrayoviMSawi|cawurviMSaWi|paFcaviMSawi|RadviMSaWi|sapwaviMSawi|aRtAviMSawi|navaviMSawi|wriMSaw|ekawriMSaw|xvAwriMSaw|wrayaswriMSaw|cawuswriMSaw|paFcawriMSaw|RatwriMSaw|sapwawriMSaw|aRTAwriMSaw|navawriMSaw|cawvAriMSaw|ekacawvAriMSaw|xvicawvAriMSaw|wricawvAriMSaw|cawuscawvAriMSaw|paFcacawvAriMSaw|RatcawvAriMSaw|sapwacawvAriMSaw|aRtAcawvAriMSaw|navacawvAriMSaw|paFcASaW)
avy216	(upa|aXi|anu|nir|apa|xur|awi|prawi|pari|yAvax|A|saha|anwar)
xik	(pUrva|apara|uwwara|xakRiNa)
praSaMsA	(mawallikA|macarcikA|prakANdam|uxXa|wallaja)
yAjakAxi	(yAjaka|pUjaka|paricAraka|pariveRaka|pariRecaka|snApaka|aXyApaka|uwsAha|uxvarwaka|howq|Bawq|raWagaNaka|pawwigaNaka)
vyAGrAxi	(vyAGra|siMha|qkRa|qRaBa|canxana|vqka|vqRa|varAha|haswin|waru|kuFjara|ruru|pqRaw|puNdarika|palASa|kiwava)
%%

^{avy216}[ ]{word}[ ]\(2\.1\.6\)	{upasarjana_cgi_interface("NULL",1,"");}

^{word}[ ]{avy216}[ ]\(2\.1\.6\)	{upasarjana_cgi_interface("NULL",2,"");}

^yaWA[ ]{word}[ ]\(2\.1\.7\)	{
				sprintf(ques,"यथा इति अव्ययम् असादृश्यार्थे अस्ति(Y/N)?"); 
				upasarjana_cgi_interface(ques,1,"");
				}

^{word}[ ]yaWA[ ]\(2\.1\.7\)	{
				sprintf(ques,"यथा इति अव्ययम् असादृश्यार्थे अस्ति(Y/N)?"); 
				upasarjana_cgi_interface(ques,2,"");
				}

^yAvaw[ ]{word}[ ]\(2\.1\.8\)	{ 
				sprintf(ques,"यावत् इति अव्ययम् अवधारणार्थे अस्ति(Y/N)?");  
				upasarjana_cgi_interface(ques,1,"");
				}

^{word}[ ]yAvaw[ ]\(2\.1\.8\)	{ 
				 sprintf(ques,"यावत् इति अव्ययम् अवधारणार्थे अस्ति(Y/N)?");
				 upasarjana_cgi_interface(ques,2,"");
				}

^{word}[ ]prawi[ ]\(2\.1\.9\)	{ 
				sprintf(ques,"प्रति इति अव्ययम् मात्रार्थे अस्ति(Y/N)?");  
				upasarjana_cgi_interface(ques,1,"");
				}

^prawi[ ]{word}[ ]\(2\.1\.9\)	{ 
				 sprintf(ques,"यावत् इति अव्ययम् अवधारणार्थे अस्ति(Y/N)?"); 
				 upasarjana_cgi_interface(ques,2,"");
				}
		
	
^(akRa|SalAkA|{safKyA})\+{wqwIyA}[ ]pari[ ]\(2\.1\.10\)	{ upasarjana_cgi_interface("NULL",1,"");}

^pari[ ](akRa|SalAkA|{safKyA})\+{wqwIyA}[ ]\(2\.1\.10\)	{ upasarjana_cgi_interface("NULL",2,"");}

^(apa|pari|bahis)[ ]{prA}\+{paFcamI}[ ]\(2\.1\.12\)	{  upasarjana_cgi_interface("NULL",1,"");}

^{prA}\+{paFcamI}[ ](apa|pari|bahis)[ ]\(2\.1\.12\)	{  upasarjana_cgi_interface("NULL",2,"");}

^A[ ]{word}[ ]\(2\.1\.13\)	{
				sprintf(ques,"आङ् इति अव्ययम् मार्यादा एवम् अभिविधि अर्थे वर्तते(Y/N)?");  
				upasarjana_cgi_interface(ques,1,"");
				}

^{word}[ ]A[ ]\(2\.1\.13\)	{ 
				 sprintf(ques,"आङ् इति अव्ययम् मार्यादा एवम् अभिविधि अर्थे वर्तते(Y/N)?");
				 upasarjana_cgi_interface(ques,2,"");
				}

^(aBi|prawi)[ ]{word}[ ]\(2\.1\.14\)	{ 
				 	 sprintf(ques,"अभिप्रती आभिमुक्यार्थे वर्तेते एवम् इदम् पदम् %s चिह्नवाचकम् वा(Y/N)?" ,p2_utf);  
					 upasarjana_cgi_interface(ques,1,"");
						}

^{word}[ ](aBi|prawi)[ ]\(2\.1\.14\)	{ 
					 sprintf(ques,"अभिप्रती आभिमुक्यार्थे वर्तेते एवम् इदम् पदम् %s चिह्नवाचकम् वा(Y/N)?",p1_utf);  
					 upasarjana_cgi_interface(ques,2,"");
					}
^anu[ ]{word}[ ]\(2\.1\.15\)	{ 
				 sprintf(ques,"किम् अनु इति अव्ययम् समयार्थे वर्तते एवम् इदम् पदम् %s चिह्नवाचकम् वा(Y/N)?",p2_utf); 
				 upasarjana_cgi_interface(ques,1,"");
				}

^{word}[ ]anu[ ]\(2\.1\.15\)	{ 
				 sprintf(ques,"किम् अनु इति अव्ययम् समयार्थे वर्तते एवम् इदम् पदम् %s इस् चिह्नवाचकम् वा(Y/N)?",p1_utf);
				 upasarjana_cgi_interface(ques,2,"");
				}
^anu[ ]{word}[ ]\(2\.1\.16\)	{
				 sprintf(ques,"अनुना दैर्घ्यं उच्यते(Y/N)?");  
				 upasarjana_cgi_interface(ques,1,"");
				}
^{word}[ ]anu[ ]\(2\.1\.16\)	{
				 sprintf(ques,"अनुना दैर्घ्यं उच्यते(Y/N)?"); 
				 upasarjana_cgi_interface(ques,2,"");
				}
^(pAre|mAXye)[ ]{prA}\+{RaRTI}[ ]\(2\.1\.18\)	{ upasarjana_cgi_interface("NULL",1,"");}

^{prA}\+{RaRTI}[ ](pAre|mAXye)[ ]\(2\.1\.18\)	{ upasarjana_cgi_interface("NULL",2,"");}

^({safKyA})\+{xviwIyA}[ ]{word}[ ]\(2\.1\.19\)	{ 
						 sprintf(ques,"%s इति पदम् वंश्य वाचकं वा(Y/N)?",p2_utf);  
						 upasarjana_cgi_interface(ques,1,"");
					}

^{word}[ ]({safKyA})\+{xviwIyA}[ ]\(2\.1\.19\)	{ 
						 sprintf(ques,"%s इति पदम् वंश्य वाचकं वा(Y/N)?",p1_utf); 
						 upasarjana_cgi_interface(ques,2,"");
						}
^({safKyA})\+{RaRTI}[ ](yamunA|goxAvarI|kqRNA|gafgA)\+{sup}[ ]\(2\.1\.20\)	{ upasarjana_cgi_interface("NULL",1,"");}

^(yamunA|goxAvarI|kqRNA|gafgA)\+{sup}[ ]({safKyA})\+{RaRTI}[ ]\(2\.1\.20\)	{ upasarjana_cgi_interface("NULL",2,"");}

^{word}[ ](yamunA|gafgA|goxAvarI)\+{praWamA}[ ]\(2\.1\.21\)	{ 
								sprintf(ques,"अनेन समासेन सञ्ज्ञा एवम् अन्यपदार्थः उच्यते(Y/N)?");  
								upasarjana_cgi_interface(ques,1,"");
								}

^(yamunA|gafgA|goxAvarI)\+{praWamA}[ ]{word}[ ]\(2\.1\.21\)	{ 
								 sprintf(ques,"अनेन समासेन सञ्ज्ञा एवम् अन्यपदार्थः उच्यते(Y/N)?");
								 upasarjana_cgi_interface(ques,2,"");
								}

^{prA}\+{xviwIyA}[ ](Sriwa|awIwa|pawiwa|gawa|awyaswa|prApwa|Apanna)\+{sup}[ ]\(2\.1\.24\)	{ upasarjana_cgi_interface("NULL",1,"");}

^(Sriwa|awIwa|pawiwa|gawa|awyaswa|prApwa|Apanna)\+{sup}[ ]{prA}\+{xviwIyA}[ ]\(2\.1\.24\)	{ upasarjana_cgi_interface("NULL",2,"");}

^svayam[ ]{word}[ ]\(2\.1\.25\)	{ if(chk_kqw(p2,"kwa")) {upasarjana_cgi_interface("NULL",1);} else {upasarjana_cgi_interface("NULL",0,"");}}

^{word}[ ]svayam[ ]\(2\.1\.25\)	{ if(chk_kqw(p1,"kwa")) { upasarjana_cgi_interface("NULL",2); }else {upasarjana_cgi_interface("NULL",0,"");} }

^KatvA\+{xviwIyA}[ ]{word}[ ]\(2\.1\.26\)	{ if(chk_kqw(p2,"kwa")) {upasarjana_cgi_interface("NULL",1,"");} else {upasarjana_cgi_interface("NULL",0,"");}}

^{word}[ ]KatvA\+{xviwIyA}[ ]\(2\.1\.26\)	{ if(chk_kqw(p1,"kwa")) { upasarjana_cgi_interface("NULL",2,""); } else {upasarjana_cgi_interface("NULL",0,"");}}

^sAmi[ ]{word}[ ]\(2\.1\.27\)	{ if(chk_kqw(p2,"kwa")) {upasarjana_cgi_interface("NULL",1,"");} else {upasarjana_cgi_interface("NULL",0,"");}}

^{word}[ ]sAmi[ ]\(2\.1\.27\)	{ if(chk_kqw(p1,"kwa")) { upasarjana_cgi_interface("NULL",2,""); }else {upasarjana_cgi_interface("NULL",0,"");}}

^{prA}\+{xviwIyA}[ ](pramiwa|mukwa|pawiwa|kqwa)\+{sup}[ ]\(2\.1\.28\)	{upasarjana_cgi_interface("NULL",1,"");}

^(pramiwa|mukwa|pawiwa|kqwa)\+{sup}[ ]{prA}\+{xviwIyA}[ ]\(2\.1\.28\)	{upasarjana_cgi_interface("NULL",2,"");}

^{prA}\+{xviwIyA}[ ]{word}[ ]\(2\.1\.29\)	{ 
	 					 sprintf(ques,"अनेन समासेन अत्यन्तसंयोगः उच्यते(Y/N)?"); 
						 upasarjana_cgi_interface(ques,1,"");
						}

^{word}[ ]{prA}\+{xviwIyA}[ ]\(2\.1\.29\)	{ 
						 sprintf(ques,"अनेन समासेन अत्यन्तसंयोगः उच्यते(Y/N)?");
						 upasarjana_cgi_interface(ques,2,"");
						}
^{prA}\+{wqwIyA}[ ](manWa|arWa|paFcama)\+{praWamA}[ ]\(2\.1\.30\)     {upasarjana_cgi_interface("NULL",1,"");}


^(manWa|arWa)\+{praWamA}[ ]{prA}\+{wqwIyA}[ ]\(2\.1\.30\)     {upasarjana_cgi_interface("NULL",2,"");}

^{prA}\+{wqwIyA}[ ]{word}[ ]\(2\.1\.30\)	{
						 sprintf(ques,"किम् अनेन समासेन तत्कृतार्थः उच्यते(Y/N)?");  
					         upasarjana_cgi_interface(ques,1,"");
						}

^{word}[ ]{prA}\+{wqwIyA}[ ]\(2\.1\.30\)	{ 
						 sprintf(ques,"किम् अनेन समासेन तत्कृतार्थः उच्यते(Y/N)?");    
						 upasarjana_cgi_interface(ques,2,"");
						}

^{prA}\+{wqwIyA}[ ](pUrva|saxqSa|sama|Una|vikala|kalaha|nipuNa|miSra|SlakRNa)\+{sup}[ ]\(2\.1\.31\)	{upasarjana_cgi_interface("NULL",1,"");}

^(pUrva|saxqSa|sama|Una|vikala|kalaha|nipuNa|miSra|SlakRNa)\+{sup}[ ]{prA}\+{wqwIyA}[ ]\(2\.1\.31\)	{upasarjana_cgi_interface("NULL",2,"");}

^{prA}\+{wqwIyA}[ ]{word}[ ]\(2\.1\.32\)		{ if(chk_kqw(p2,"kwa")) {upasarjana_cgi_interface("NULL",1,"");} else {upasarjana_cgi_interface("NULL",0,"");}}

^{word}[ ]{prA}\+{wqwIyA}[ ]\(2\.1\.32\)		{ if(chk_kqw(p1,"kwa")) { upasarjana_cgi_interface("NULL",2,""); } else {upasarjana_cgi_interface("NULL",0,"");}}

 /* 2.1.33 kqwya_pratyaya */	

^{prA}\+{wqwIyA}[ ](anna|oxana)\+{praWamA}[ ]\(2\.1\.34\)	{ 
					sprintf(ques,"%s इति पदं व्यञ्जनवाचकम् एवम् %s इति पदम् अन्नवाचकं वा(Y/N)?",p1_utf,p2_utf);  
				        upasarjana_cgi_interface(ques,1,"");
									}

^(anna|oxana)\+{praWamA}[ ]{prA}\+{wqwIyA}[ ]\(2\.1\.34\)	{ 
						sprintf(ques,"%s इति पदं व्यञ्जनवाचकम् एवम् %s इति पदम् अन्नवाचकं वा(Y/N)?",p2_utf,p1_utf);
						upasarjana_cgi_interface(ques,2,"");
								}
^{prA}\+{wqwIyA}[ ]{prA}\+{praWamA}[ ]\(2\.1\.35\)	{ 
					    sprintf(ques,"%s इति पदं मिश्रीकरणवाचकं एवं %s इति पदम् भक्ष्यवाचकं वा(Y/N)?",p1_utf,p2_utf);  
					    upasarjana_cgi_interface(ques,1,"");
					                        }
^{prA}\+{praWamA}[ ]{prA}\+{wqwIyA}[ ]\(2\.1\.35\)	{ 
							    sprintf(ques,"%s इति पदं मिश्रीखरणवाचकं एवं %s इति पदम् भक्ष्यवाचकं वा(Y/N)?",p2_utf,p1_utf);  
							    upasarjana_cgi_interface(ques,2,"");
								}
^{prA}\+{cawurWI}[ ](bali|hiwa|suKa|rakRiwa|arWa|paxa)\+{praWamA}[ ]\(2\.1\.36\)  {upasarjana_cgi_interface("NULL",1,"");} 

^(bali|hiwa|suKa|rakRiwa|arWa|paxa)\+{praWamA}[ ]{prA}\+{cawurWI}[ ]\(2\.1\.36\)  { upasarjana_cgi_interface("NULL",2,""); }
												
^{prA}\+{cawurWI}[ ]{prA}\+{sup}[ ]\(2\.1\.36\)	{ 
				  	   sprintf(ques,"%s इदम् पदम् %s अस्य पदस्य तदर्थो वा (Y/N)?",p1_utf,p2_utf);
                                           upasarjana_cgi_interface(ques,1,"");
                                                }
^{prA}\+{sup}[ ]{prA}\+{cawurWI}[ ]\(2\.1\.36\)	{ 
					sprintf(ques,"%s इदम् पदम् %s अस्य पदस्य तदर्थो वा (Y/N)?",p2_utf,p1_utf);
                                        upasarjana_cgi_interface(ques,2,"");
						}

^{prA}\+{paFcamI}[ ](Baya)\+{sup}[ ]\(2\.1\.37\)	{upasarjana_cgi_interface("NULL",1,"");}

^(Baya)\+{sup}[ ]{prA}\+{paFcamI}[ ]\(2\.1\.37\)	{upasarjana_cgi_interface("NULL",2,"");}

^{prA}\+{paFcamI}[ ](apewa|apoDa|mukwa|pawiwa|Apawraswa)\+{praWamA}[ ]\(2\.1\.38\)	{ 
					sprintf(ques,"%s इदम् पदम् अल्पपञ्चम्यं वर्तते वा (Y/N)?",p1_utf);  
					upasarjana_cgi_interface(ques,1,"");
									}
^(apewa|apoDa|mukwa|pawiwa|Apawraswa)\+{praWamA}[ ]{prA}\+{paFcamI}[ ]\(2\.1\.38\)	{ 
							sprintf(ques,"%s इदम् पदम् अल्पपञ्चम्यं वर्तते वा (Y/N)?",p1_utf);
							upasarjana_cgi_interface(ques,2,"");
											}

^(swoka|anwika|xUra|aByASa|viprakqRta|kqcCra)\+{paFcamI}[ ]{word}[ ]\(2\.1\.39\)  		{ if(chk_kqw(p2,"kwa")) {upasarjana_cgi_interface("NULL",1,"");} else {upasarjana_cgi_interface("NULL",0,"");}}

^{word}[ ](swoka|anwika|xUra|aByASa|viprakqRta|kqcCra)\+{paFcamI}[ ]\(2\.1\.39\) { if(chk_kqw(p1,"kwa")) { upasarjana_cgi_interface("NULL",2,""); } else {upasarjana_cgi_interface("NULL",0,"");}}

^{prA}\+{sapwamI}[ ]{SONdAxi}\+{sup}[ ]\(2\.1\.40\)	{upasarjana_cgi_interface("NULL",1,"");}

^{SONdAxi}\+{sup}[ ]{prA}\+{sapwamI}[ ]\(2\.1\.40\)	{upasarjana_cgi_interface("NULL",2,"");}

^{prA}\+{sapwamI}[ ](sixXa|SuRka|pakva|banXa)\+{sup}[ ]\(2\.1\.41\)	{upasarjana_cgi_interface("NULL",1,"");}

^(sixXa|SuRka|pakva|banXa)\+{sup}[ ]{prA}\+{sapwamI}[ ]\(2\.1\.41\)	{upasarjana_cgi_interface("NULL",2,"");}

^{prA}\+{sapwamI}[ ](XvAfKRa)\+{praWamA}[ ]\(2\.1\.42\) { 
							 sprintf(ques,"अनेन समासेन क्षेपार्थः उच्यते(Y/N)?"); 
				        		 upasarjana_cgi_interface(ques,1,"");
							}

^(XvAfKRa)\+{praWamA}[ ]{prA}\+{sapwamI}[ ]\(2\.1\.42\) { 
							 sprintf(ques,"अनेन समासेन क्षेपार्थः उच्यते(Y/N)?");
							 upasarjana_cgi_interface(ques,2,"");
							}
	/* 2.1.43 kqwya_pratyaya */		

^{prA}\+{sapwamI}[ ]{word}[ ]\(2\.1\.43\)  {
					    sprintf(ques,"अनेन समासेन आवश्यकार्थः उच्यते(Y/N)?"); 
				            upasarjana_cgi_interface(ques,1,"");
			                   }

^{word}[ ]{prA}\+{sapwamI}[ ]\(2\.1\.43\) { 
					   sprintf(ques,"अनेन समासेन आवश्यकार्थः उच्यते(Y/N)?");
					   upasarjana_cgi_interface(ques,2,"");
					  }

^{word}[ ]{prA}\+{sapwamI}[ ]\(2\.1\.44\) { 
					    sprintf(ques,"अनेन समासेन सञ्ज्ञा उच्यते(Y/N)?"); 
					    upasarjana_cgi_interface(ques,2,"");
					  }

^{prA}\+{sapwamI}[ ]{word}[ ]\(2\.1\.44\) { 
					    sprintf(ques,"अनेन समासेन सञ्ज्ञा गम्यते(Y/N)?"); 
				            upasarjana_cgi_interface(ques,1,"");
					  }

^{prA}\+{sapwamI}[ ]{word}[ ]\(2\.1\.45\) { 
                                            if (chk_kqw(p2,"kwa")) {
					      sprintf(ques,"किम् %s इति पदम् अहोरात्रवयवः वा(Y/N)?",p1_utf);
					      upasarjana_cgi_interface(ques,1,"");
                                            } else { upasarjana_cgi_interface("NULL",0,"");}
                                          }

^{word}[ ]{prA}\+{sapwamI}[ ]\(2\.1\.45\) { 
                                            if (chk_kqw(p1,"kwa")) {
						sprintf(ques,"किम् %s इति पदम् अहोरात्रवयवः वा(Y/N)?",p2_utf);
						upasarjana_cgi_interface(ques,2,"");
                                            } else { upasarjana_cgi_interface("NULL",0,"");}
					  }

^wawra[ ]{word}[ ]\(2\.1\.46\)  		{ if(chk_kqw(p2,"kwa")) {upasarjana_cgi_interface("NULL",1,"");} else {upasarjana_cgi_interface("NULL",0,"");}}

^{word}[ ]wawra[ ]\(2\.1\.46\)  		{ if(chk_kqw(p1,"kwa")) { upasarjana_cgi_interface("NULL",2,""); }else {upasarjana_cgi_interface("NULL",0,"");}}

^{prA}\+{sapwamI}[ ]{word}[ ]\(2\.1\.47\) { 
					    sprintf(ques,"अनेन समासेन क्षेपार्थः उच्यते(Y/N)?"); 
					    upasarjana_cgi_interface(ques,1,"");
					  }

^{word}[ ]{prA}\+{sapwamI}[ ]\(2\.1\.47\) { 
					    sprintf(ques,"अनेन समासेन क्षेपार्थः उच्यते(Y/N)?"); 
					    upasarjana_cgi_interface(ques,2,"");
					  }

		/* 2.1.48 GaNapATha */

^(eka|sarva|jaraw|purANa|nava|kevala)\+{praWamA}[ ]{word}[ ]\(2\.1\.49\)	{upasarjana_cgi_interface("NULL",1,"");}

^{word}[ ](eka|sarva|jaraw|purANa|nava|kevala)\+{praWamA}[ ]\(2\.1\.49\)	{upasarjana_cgi_interface("NULL",2,"");}
		/* 2.1.49 pUrvakAla */

^({safKyA}|{xik})\+{praWamA}[ ]{word}[ ]\(2\.1\.50\)	{ 
							  sprintf(ques,"अनेन समासेन सञ्ज्ञा गम्यते(Y/N)?"); 
							  upasarjana_cgi_interface(ques,1,"");
							}
^{word}[ ]({safKyA}|{xik})\+{praWamA}[ ]\(2\.1\.50\)	{ 
							  sprintf(ques,"अनेन समासेन सञ्ज्ञा गम्यते(Y/N)?"); 
							  upasarjana_cgi_interface(ques,2,"");
							}
			/* 2.1.51 waxXiwArWowwarapaxasamAhAre ca */

^{safKyA}\+{RaRTI}[ ]{word}[ ]\(2\.1\.52\)	{ 
					         sprintf(ques,"अनेन समासेन द्विगुः अथवा समाहारः उच्यते(Y/N)?"); 
					         upasarjana_cgi_interface(ques,1,"");
						}	

^{word}[ ]{safKyA}\+{RaRTI}[ ]\(2\.1\.52\)	{ 
						 sprintf(ques,"अनेन समासेन द्विगुः अथवा समाहारः उच्यते(Y/N)?"); 
						 upasarjana_cgi_interface(ques,2,"");
						}

^{word}[ ]{word}[ ]\(2\.1\.53\)	{
				sprintf(ques,"%s इति पदम् %s इति पदस्य निन्दार्थः वा(Y/N)?",p1_utf,p2_utf);
				upasarjana_cgi_interface(ques,1,"निन्दा");
				}
   /* We have to ask reverse question as well */

^(pApa|aNaka)\+{praWamA}[ ]{word}[ ]\(2\.1\.54\)	{ 
					                  sprintf(ques,"किम् %s इति पदम् निन्दार्थे वर्तते(Y/N)?",p1_utf); 
					                  upasarjana_cgi_interface(ques,1,"");
							}

^{word}[ ](pApa|aNaka)\+{praWamA}[ ]\(2\.1\.54\)	{ 
							 sprintf(ques,"किम् %s इति पदम् निन्दार्थे वर्तते(Y/N)?",p2_utf);
							 upasarjana_cgi_interface(ques,2,"");
							}

^{word}[ ]{word}[ ]\(2\.1\.55\)	{ 
				sprintf(ques,"किं %s पदम् %s पदस्य उपमानं वा(Y/N)?",p2_utf,p1_utf);
				upasarjana_cgi_interface(ques,1,"उपमान");
			        }
   /* We have to ask reverse question as well */

^{word}[ ]{vyAGrAxi}[ ]\(2\.1\.56\)	{
				sprintf(ques,"किम्  %s पदम् %s पदस्य उपमेयः वा(Y/N)?",p1_utf,p2_utf);
				upasarjana_cgi_interface(ques,1,"");
				}
^{vyAGrAxi}[ ]{word}[ ]\(2\.1\.56\)	{
				sprintf(ques,"किम्  %s पदम् %s पदस्य उपमेयः वा(Y/N)?",p2_utf,p1_utf);
				upasarjana_cgi_interface(ques,2,"");
				}

^{word}[ ]{word}[ ]\(2\.1\.57\)	{ 
				sprintf(ques,"किं %s पदं %s पदस्य विशेषणं वा(Y/N)?", p1_utf,p2_utf);
				upasarjana_cgi_interface(ques,1,"विशेषण");
                                }
   /* We have to ask reverse question as well */

^(pUrva|apara|praWama|carama|jaGanya|samAna|maXya|maXyama|vIra)\+{praWamA}[ ]{word}[ ]\(2\.1\.58\)	{upasarjana_cgi_interface("NULL",1,"");}

^{word}[ ](pUrva|apara|praWama|carama|jaGanya|samAna|maXya|maXyama|vIra)\+{praWamA}[ ]\(2\.1\.58\)	{upasarjana_cgi_interface("NULL",2,"");}

		/* 2.1.59 SreNyAxayaH kqwAxiBiH */
		/* 2.1.60 kwena naFviSiRtenAnaF */

^{word}[ ](vqnxAraka|nAga|kuFjara)\+{praWamA}[ ]\(2\.1\.62\)	{ 
								 sprintf(ques,"अनेन समासेन पूज्यमानार्थः गम्यते(Y/N)?"); 
								 upasarjana_cgi_interface(ques,1,"");
								}

^(vqnxAraka|nAga|kuFjara)\+{praWamA}[ ]{word}[ ]\(2\.1\.62\)	{ 
								 sprintf(ques,"अनेन समासेन पूज्यमानार्थः गम्यते(Y/N)?");
								 upasarjana_cgi_interface(ques,2,"");
								}

^(kawara|kawama)\+{praWamA}[ ]{word}[ ]\(2\.1\.63\)	{ 
							 sprintf(ques,"किम् %s इति पदम् जातिपरिप्रश्नार्थं सूचयति(Y/N)?",p1_utf); 
							 upasarjana_cgi_interface(ques,1,"");
						        }

^{word}[ ](kawara|kawama)\+{praWamA}[ ]\(2\.1\.63\)	{ 
							 sprintf(ques,"किम् %s इति पदम् जातिपरिप्रश्नार्थं सूचयति(Y/N)?",p2_utf); 
							 upasarjana_cgi_interface(ques,2,"");
						        }

^kim[ ]{word}[ ]\(2\.1\.64\)	{ 
				 sprintf(ques,"किम् इति अव्ययम् क्षेपार्थे वर्तते(Y/N)?"); 
				 upasarjana_cgi_interface(ques,1,"");
				}

^{word}[ ]kim[ ]\(2\.1\.64\)	{ 
				  sprintf(ques,"किम् इति अव्ययम् क्षेपार्थे वर्तते(Y/N)?"); 
				  upasarjana_cgi_interface(ques,2,"");
				}

^{prA}\+{sup}[ ]{prA}\+{sup}[ ]\(2\.1\.60\)	{
  /* We assume that p1_utf and p2_utf  are negations of each other. So we do not allow kqwa=aBukwa kind of samAsas.  p1_utf and p2_utf are assumed to be kqws from the same XAwu, one with negation and other without */
					 if( chk_kqw(p1,"kwa") &&
                                            ((!strcmp(p1,p2+1) && p2[0] == 'a') || 
                                            (!strcmp(p1,p2+2) && (p2[0] == 'a') && (p2[1] == 'n')))
                                           ) { upasarjana_cgi_interface("NULL",1,""); } 
					 else if( chk_kqw(p2,"kwa") &&
                                            ((!strcmp(p2,p1+1) && p1[0] == 'a') || 
                                            (!strcmp(p2,p1+2) && (p1[0] == 'a') && (p2[1] == 'n')))
                                           ) { upasarjana_cgi_interface("NULL",2,""); } 
                                         else {upasarjana_cgi_interface("NULL",0,"");}
				}

^{word}[ ](potA|yuvawi|swoka|kawipas|gqRti|Xenu|vaSA|vehaw|baRkayaNI|pravakkwq|Srowriya|aXyApaka|XUrWa)\+{praWamA}[ ]\(2\.1\.65\)	{ 
						sprintf(ques,"किम् %s इति पदम् जातिवाचकः वा(Y/N)?",p1_utf); 
						upasarjana_cgi_interface(ques,1,"");
						}

^(potA|yuvawi|swoka|kawipas|gqRti|Xenu|vaSA|vehaw|baRkayaNI|pravakkwq|Srowriya|aXyApaka|XUrWa)\+{praWamA}[ ]{word}[ ]\(2\.1\.65\)	{ 
								sprintf(ques,"किम् %s इति पदम् जातिवाचकं वा(Y/N)?",p2_utf);
							        upasarjana_cgi_interface(ques,2,"");
							}

^{word}[ ]{praSaMsA}\+{praWamA}[ ]\(2\.1\.66\)	{ 
						sprintf(ques,"किम् %s इति पदम् जातिवाचकं वा(Y/N)?",p1_utf); 
						upasarjana_cgi_interface(ques,1,"");
						} 

^{praSaMsA}\+{praWamA}[ ]{word}[ ]\(2\.1\.66\)	{ 
						 sprintf(ques,"किम् %s इति पदम् जातिवाचकः वा(Y/N)?",p2_utf);
						 upasarjana_cgi_interface(ques,2,"");
						}

^yuvan\+{praWamA}[ ](KalawI|paliwa|valina|jarawI)\+{praWamA}[ ]\(2\.1\.67\)	{upasarjana_cgi_interface("NULL",1,"");}

^(KalawI|paliwa|valina|jarawI)\+{praWamA}[ ]yuvan\+{praWamA}[ ]\(2\.1\.67\)	{upasarjana_cgi_interface("NULL",2,"");}

		/* 2.1.68 kqwyawulyAKyA ajAwyA */

^{word}[ ]{word}[ ]\(2\.1\.69\)	{ 
				sprintf(ques,"%s %s किम् उभावपि पदौ वर्णवाचकौ(Y/N)?",p2_utf,p1_utf); 
			        upasarjana_cgi_interface(ques,1,"");
				}

^kumArI\+{praWamA}[ ](SramaNA|pravrajiwA|garBiNI)\+{praWamA}[ ]\(2\.1\.70\)	{ upasarjana_cgi_interface("NULL",1,"");}

^(SramaNA|pravrajiwA|garBiNI)\+{praWamA}[ ]kumArI\+{praWamA}[ ]\(2\.1\.70\)	{ upasarjana_cgi_interface("NULL",2,"");}

^{word}[ ]garBiNI\+{praWamA}[ ]\(2\.1\.71\)	{ 
						 sprintf(ques,"किम् %s इति पदम् चतुष्पाज्जातिवाचको वा (Y/N)?",p1_utf); 
						 upasarjana_cgi_interface(ques,1,"");
						}

^garBiNI\+{praWamA}[ ]{word}[ ]\(2\.1\.71\)	{ 
						  sprintf(ques,"किम् %s इति पदम् चतुष्पाज्जातिवाचको वा (Y/N)?",p2_utf); 
						  upasarjana_cgi_interface(ques,2,"");
						}

^(pUrva|apara|aXara|uwwara)\+{sup}[ ]{word}[ ]\(2\.2\.1\)  { 
							    sprintf(ques,"किम्  %s इति पदम् %s पदस्य अवयवो वा (Y/N)?",p1_utf,p2_utf); 
							    upasarjana_cgi_interface(ques,1,"");
						}

^{word}[ ](pUrva|apara|aXara|uwwara)\+{sup}[ ]\(2\.2\.1\)  { 
							    sprintf(ques,"किम्  %s इति पदम् %s पदस्य अवयवो वा(Y/N)?",p2_utf,p1_utf);
							    upasarjana_cgi_interface(ques,2,"");
						           }

^arXa\+{praWamA}[ ]{word}[ ]\(2\.2\.2\)	{ 
					sprintf(ques,"किम् %s इति पदम् अवयवी वा %s इति पदस्य (Y/N)?",p1_utf,p2_utf);
					upasarjana_cgi_interface(ques,1,"");
						}

^{word}[ ]arXa\+{praWamA}[ ]\(2\.2\.2\)	{ 
					 sprintf(ques,"किम्  %s इति पदम् %s पदस्य अवयवो वा (Y/N)?",p2_utf,p1_utf);
					 upasarjana_cgi_interface(ques,2,"");
				        }

^(xviwIya|wqwIya|cawurWa|wurya)\+{praWamA}[ ]{word}[ ]\(2\.2\.3\)	{ 
					sprintf(ques,"किम् %s इति पदं %s इति पदस्य अवयवः वा (Y/N)?",p1_utf,p2_utf); 
					upasarjana_cgi_interface(ques,1,"");
						}

^{word}[ ](xviwIya|wqwIya|cawurWa|wurya)\+{praWamA}[ ]\(2\.2\.3\)	{
	                                            sprintf(ques,"किम् %s इति पदं %s इति पदस्य अवयवः वा (Y/N)?",p2_utf,p1_utf); 
						    upasarjana_cgi_interface(ques,2,"");
									}

^{prA}\+{xviwIyA}[ ](prApwa|Apanna)\+{praWamA}[ ]\(2\.2\.4\)	{upasarjana_cgi_interface("NULL",1,"");}

^(prApwa|Apanna)[ ]{prA}\+{xviwIyA}[ ]\(2\.2\.4\)	{upasarjana_cgi_interface("NULL",2,"");}

^{word}[ ]{prA}\+{RaRTI}[ ]\(2\.2\.5\)   { 
					sprintf(ques,"किम् %s इति पदं कालवाचकः एवम् %s इति पदं परिच्छेद्यवाचकः वा(Y/N)?",p1_utf,p2_utf);
					upasarjana_cgi_interface(ques,1,"");
						}

^{prA}\+{RaRTI}[ ]{word}[ ]\(2\.2\.5\)   { 
					sprintf(ques,"किम् %s इति पदं कालवाचकः एवम् %s इति पदं परिच्छेद्यवाचकः वा(Y/N)?" ,p2_utf,p1_utf);
					upasarjana_cgi_interface(ques,2,"");
						}
		
^na[ ]{word}[ ]\(2\.2\.6\)      {upasarjana_cgi_interface("NULL",1,"");}

^{word}[ ]na[ ]\(2\.2\.6\)      {upasarjana_cgi_interface("NULL",2,"");}

^IRaw[ ]{word}[ ]\(2\.2\.7\)  		{ if(!chk_kqw(p2,"kwa")) {upasarjana_cgi_interface("NULL",1,"");} else {upasarjana_cgi_interface("NULL",0,"");}}

{word}[ ]^IRaw[ ]\(2\.2\.7\)  		{ if(!chk_kqw(p1,"kwa")) {upasarjana_cgi_interface("NULL",2,"");} else {upasarjana_cgi_interface("NULL",0,"");}}

^{prA}\+{RaRTI}[ ]{word}[ ]\(2\.2\.8\)	{ 
					 upasarjana_cgi_interface("NULL",1,"");
					}

^{word}[ ]{prA}\+{RaRTI}[ ]\(2\.2\.8\)	{
					 upasarjana_cgi_interface("NULL",2,"");
					}

^{prA}\+{RaRTI}[ ]{yAjakAxi}\+{praWamA}[ ]\(2\.2\.9\)	{upasarjana_cgi_interface("NULL",1,"");}

^{yAjakAxi}\+{praWamA}[ ]{prA}\+{RaRTI}[ ]\(2\.2\.9\)	{upasarjana_cgi_interface("NULL",2,"");}

^{word}[ ]{prA}\+{RaRTI}[ ]\(2\.2\.10\)   { 
					   sprintf(ques,"किम् %s इति पदम् निर्धारणे वर्तते(Y/N)?",p2_utf);
				           upasarjana_cgi_interface(ques,2,"");
				          }

^{prA}\+{RaRTI}[ ]{word}[ ]\(2\.2\.10\)   { 
					   sprintf(ques,"किम् %s इति पदम् निर्धारणे वर्तते(Y/N)?",p1_utf);
					   upasarjana_cgi_interface(ques,1,"");
					  }
		/* 2.2.11 pUraNaguNasuhiwArWasaxavyayawavyasamAnAXikaraNena */
		/* 2.2.12 kwena ca pUjAyAm */
		/* 2.2.13 aXikaraNavAcinA ca */


^{word}[ ]{prA}\+{RaRTI}[ ]\(2\.2\.17\)	{upasarjana_cgi_interface("NULL",2,"");}

^{prA}\+{RaRTI}[ ]{word}[ ]\(2\.2\.17\)	{upasarjana_cgi_interface("NULL",1,"");}

^{word}[ ](ku|pra|para|apa|sam|anu|ava|nis|nir|xus|xur|vi|A|ni|aXi|awi|api|su|ux|aBi|prawi|para|upa)[ ]\(2\.2\.18\)	{upasarjana_cgi_interface("NULL",2,"");}

^(ku|pra|para|apa|sam|anu|ava|nis|nir|xus|xur|vi|A|ni|aXi|awi|api|su|ux|aBi|prawi|para|upa)[ ]{word}[ ]\(2\.2\.18\)	{upasarjana_cgi_interface("NULL",1,"");}

^{word}[ ]{prA}\+{praWamA}[ ]\(2\.2\.18\)	{upasarjana_cgi_interface("NULL",2,"");}

^{prA}\+{praWamA}[ ]{word}[ ]\(2\.2\.18\)	{upasarjana_cgi_interface("NULL",1,"");}

 /* 2.2.19: upapaxam awif */
^{prA}\+{xviwIyA}[ ]{word}[ ]\(2\.2\.19\)	{upasarjana_cgi_interface("NULL",2,"");}


^{word}[ ]({word}|avy)[ ]\(2\.2\.19\)	{upasarjana_cgi_interface("NULL",1,"");}

^uccEH[ ]{prA}[ ]\(2\.2\.22\)                 { if(chk_kqw(p2,"kwvA")) {upasarjana_cgi_interface("NULL",1,"");} else {upasarjana_cgi_interface("NULL",0,"");}}

^{prA}[ ]uccEH[ ]\(2\.2\.22\)                 { if(chk_kqw(p2,"kwvA")) {upasarjana_cgi_interface("NULL",1,"");} else {upasarjana_cgi_interface("NULL",0,"");}}

^{prA}\+{sapwamI}[ ]{word}[ ]\(3\.1\.92\)	{upasarjana_cgi_interface("NULL",1,"");}

^{word}[ ]{prA}\+{sapwamI}[ ]\(3\.1\.92\)	{upasarjana_cgi_interface("NULL",2,"");}

^(su|awi)[ ]{word}[ ]\(5\.4\.69\)	{upasarjana_cgi_interface("NULL",1,"");}

^{word}[ ](su|awi)[ ]\(5\.4\.69\)	{upasarjana_cgi_interface("NULL",2,"");}

^xvis[ ]wAvawI\+{praWamA}[ ]\(5\.4\.84\)	{upasarjana_cgi_interface("NULL",1,"");}

^wAvawI\+{praWamA}[ ]xvis[ ]\(5\.4\.84\)	{upasarjana_cgi_interface("NULL",2,"");}

^.*						{upasarjana_cgi_interface("NULL",1,"");}
%%
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>


char ques[LARGE];

char p1_utf[MEDIUMUTF]; /* utf takes 3 times space */
char p2_utf[MEDIUMUTF]; /* utf takes 3 times space */

char encoding[MEDIUM];
char avigraha[MEDIUM];
char p1[MEDIUM];
char p2[MEDIUM];
char sup1[SMALL];
char sup2[SMALL];
char samAsaprakAra[MEDIUM];
char viXAyakasUwra[LARGE];
char samAsAnwa[MEDIUM];
char samAsaprakAra[MEDIUM];

void call_pUrvanipAwa_xvanxva();
void call_pUrvanipAwa_bahuvrIhi();
void cnvrtwx2utf();
void cnvrtutfd2r();
void call_gawilex();
void call_upasarjanalex();
int chk_kqw();
int rAjaxanwAxigaNa();
int GI();
int count_ac();
int ajAxi();
int axanwa();


int main (int argc, char *argv[]) {
char input[MEDIUM];
char p1_utfr[MEDIUMUTF]; /* utf takes 3 times space */
char p2_utfr[MEDIUMUTF]; /* utf takes 3 times space */

  strcpy(encoding,argv[1]);
  strcpy(avigraha,argv[2]);
  strcpy(p1,argv[3]);
  strcpy(sup1,argv[4]);
  strcpy(p2,argv[5]);
  strcpy(sup2,argv[6]);
  strcpy(viXAyakasUwra,argv[7]);
  strcpy(samAsaprakAra,argv[8]);
  strcpy(samAsAnwa,argv[9]);
  
  strcpy(input,avigraha);
  strcat(input," (");
  strcat(input,viXAyakasUwra);
  strcat(input,")");

  cnvrtwx2utf(p1,p1_utf);
  cnvrtwx2utf(p2,p2_utf);

  if(!strcmp(encoding,"RMN")){
    cnvrtwx2utf(p1_utf,p1_utfr);
    cnvrtwx2utf(p2_utf,p1_utfr);

    strcpy(p1_utfr, p1_utf);
    strcpy(p2_utfr, p2_utf);
  }


  if ( !strcmp(samAsaprakAra,"wawpuruRa") || 
       !strcmp(samAsaprakAra,"avyayIBAvaH")
     ) {
           if (!strcmp(viXAyakasUwra,"2.2.18")) 
                call_gawilex(avigraha);
           else call_upasarjanalex(input);
       }
  else if (!strcmp(samAsaprakAra,"bahuvrIhi"))
         call_pUrvanipAwa_bahuvrIhi (p1,sup1,p2,sup2);
  else if (!strcmp(samAsaprakAra,"xvanxva"))
         call_pUrvanipAwa_xvanxva (p1,sup1,p2,sup2);
  return 1;
}

void call_upasarjanalex(char *in){
  yy_scan_string(in);
  yylex();
}

int yywrap()
{
return 1;
}

void upasarjana_cgi_interface(char *question, int position, char *condition){
 char questionr[LARGE];

     if(strcmp(question,"NULL")){
        printf("</tr><td colspan=\"3\"><form name=\"f3\" method=\"post\" />");
     } else {
        printf("<td><form name=\"f3\" method=\"post\" />");
     }
       printf("<input type=\"hidden\" name=\"encodingupasarjana\" id=\"encodingupasarjana\" value=\"%s\" />",encoding);
       printf("<input type=\"hidden\" name=\"vigrahaupasarjana\" id=\"vigrahaupasarjana\" value=\"%s\" />",avigraha);
       printf("<input type=\"hidden\" name=\"p1upasarjana\" id=\"p1upasarjana\" value=\"%s\" />",p1);
       printf("<input type=\"hidden\" name=\"p2upasarjana\" id=\"p2upasarjana\" value=\"%s\" />",p2);
       printf("<input type=\"hidden\" name=\"s1upasarjana\" id=\"s1upasarjana\" value=\"%s\" />",sup1);
       printf("<input type=\"hidden\" name=\"s2upasarjana\" id=\"s2upasarjana\" value=\"%s\" />",sup2);
       printf("<input type=\"hidden\" name=\"samAsaprakAraupasarjana\" id=\"samAsaprakAraupasarjana\" value=\"%s\" />",samAsaprakAra);
       //printf("in upasarjana lex samAsAnwau = %s",samAsAnwa);
       printf("<input type=\"hidden\" name=\"samAsAnwaupasarjana\" id=\"samAsAnwaupasarjana\" value=\"%s\" />",samAsAnwa);
       printf("<input type=\"hidden\" name=\"viXAyakasUwraupasarjana\" id=\"viXAyakasUwraupasarjana\" value=\"%s\" />",viXAyakasUwra);
       printf("<input type=\"hidden\" name=\"positionupasarjana\" id=\"positionupasarjana\" value=\"%d\" />",position);
       printf("<input type=\"hidden\" name=\"dividupasarjana\" id=\"dividupasarjana\" value=\"#output3\" />");
     if(strcmp(question,"NULL")){
         if(!strcmp(encoding,"RMN")) {
           cnvrtutfd2r(question,questionr);
           printf("%s",questionr);
         } else {
           printf("%s",question);
         }
        printf("<input type=\"hidden\" name=\"upacond\" id=\"upacond\" value=\"%s\" />",condition);
        printf("<input type=\"submit\" name=\"ansupasarjana\" value=\"Yes\" id=\"ansupasarjana\" onclick=\"return upasarjanayescgi()\" />");
        if(!strcmp(condition,"")) {
           printf("<input type=\"submit\" name=\"ansupasarjana\" value=\"No\" id=\"ansupasarjana\" onclick=\"return upasarjananocgi()\" />");
        } else {
           printf("<input type=\"submit\" name=\"ansupasarjana\" value=\"No\" id=\"ansupasarjana\" onclick=\"return upasarjananocontcgi()\" />");
        }
       printf("<input type=\"hidden\" name=\"p1utf\" id=\"p1utf\" value=\"%s\" />",p1_utf);
       printf("<input type=\"hidden\" name=\"p2utf\" id=\"p2utf\" value=\"%s\" />",p2_utf);
       }
     else
       if((position == 1) || (position == 2))
         if (!strcmp(encoding,"RMN")) {
           printf("<input type=\"submit\" name=\"ansupasarjana\" value=\"Continue\" id=\"ansupasarjana\" onclick=\"return upasarjanaNullcgi()\"/>");
         } else {
           printf("<input type=\"submit\" name=\"ansupasarjana\" value=\"Continue\" id=\"ansupasarjana\" onclick=\"return upasarjanaNullcgi()\"/>");
         }
       else if (!strcmp(encoding,"RMN")) {
              printf("<input type=\"submit\" name=\"ansupasarjana\" value=\" upasarjana saṃjñā nirdhāraṇa\" id=\"ansupasarjana\" onclick=\"return upasarjanaNullcgi()\"/>");
           } else {
             printf("<input type=\"submit\" name=\"ansupasarjana\" value=\"उपसर्जन संज्ञा निर्धारण\" id=\"ansupasarjana\" onclick=\"return upasarjanaNullcgi()\"/>");
          }
        printf("</form></td></tr></table>");
 }

int chk_kqw(char *str, char *kqw_str){
FILE *fp;
char ans[SMALL];
char cmd[LARGE];
char fin[MEDIUM];
char fout[MEDIUM];
int pid;

pid = getpid();

sprintf(fin,"/tmp/SKT_TEMP/tmp%d",pid);
sprintf(fout,"/tmp/SKT_TEMP/result%d",pid);

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

void call_pUrvanipAwa_bahuvrIhi (char *p1, char *s1, char *p2, char *s2) {
   char question[LARGE];
   char questionr[LARGE];
   int position;
   char sUwra[MEDIUMUTF];

   if(!strcmp(s1,"fi") || !strcmp(s1,"os") || !strcmp(s1,"sup")) {
          position = 1;
          strcpy(sUwra,"सप्तमी विशेषणे बहुव्रीहौ 2.2.35");
   } else if(!strcmp(s2,"fi") || !strcmp(s2,"os") || !strcmp(s2,"sup")){
          position = 2;
   } else {
          sprintf(question," किम् %s पदम् %s पदस्य विशेषणं वा(Y/N)" ,p1_utf,p2_utf);
          strcpy(sUwra,"सप्तमी विशेषणे बहुव्रीहौ 2.2.35");
          position = 0;
   }

     if(strcmp(question,"NULL")){
        printf("</tr><td colspan=\"3\"><form name=\"f3\" method=\"post\" />");
     } else {
        printf("<td><form name=\"f3\" method=\"post\" />");
     }
       printf("<input type=\"hidden\" name=\"encodingpUrvanipAwa\" id=\"encodingpUrvanipAwa\" value=\"%s\" />",encoding);
       printf("<input type=\"hidden\" name=\"vigrahapUrvanipAwa\" id=\"vigrahapUrvanipAwa\" value=\"%s\" />",avigraha);
       printf("<input type=\"hidden\" name=\"p1pUrvanipAwa\" id=\"p1pUrvanipAwa\" value=\"%s\" />",p1);
       printf("<input type=\"hidden\" name=\"p2pUrvanipAwa\" id=\"p2pUrvanipAwa\" value=\"%s\" />",p2);
       printf("<input type=\"hidden\" name=\"s1pUrvanipAwa\" id=\"s1pUrvanipAwa\" value=\"%s\" />",sup1);
       printf("<input type=\"hidden\" name=\"s2pUrvanipAwa\" id=\"s2pUrvanipAwa\" value=\"%s\" />",sup2);
       printf("<input type=\"hidden\" name=\"samAsaprakArapUrvanipAwa\" id=\"samAsaprakArapUrvanipAwa\" value=\"%s\" />",samAsaprakAra);
       printf("<input type=\"hidden\" name=\"samAsAnwapUrvanipAwa\" id=\"samAsAnwapUrvanipAwa\" value=\"%s\" />",samAsAnwa);
       printf("<input type=\"hidden\" name=\"viXAyakasUwra\" id=\"viXAyakasUwra\" value=\"%s\" />",viXAyakasUwra);
       printf("<input type=\"hidden\" name=\"positionpUrvanipAwa\" id=\"positionpUrvanipAwa\" value=\"%d\" />",position);
       printf("<input type=\"hidden\" name=\"sUwrapUrvanipAwa\" id=\"sUwrapUrvanipAwa\" value=\"%s\" />",sUwra);
       printf("<input type=\"hidden\" name=\"dividpUrvanipAwa\" id=\"dividpUrvanipAwa\" value=\"#output3\" />");
     if(strcmp(question,"NULL")){
         if(!strcmp(encoding,"RMN")) {
           cnvrtutfd2r(question,questionr);
           printf("%s",questionr);
         } else {
           printf("%s",question);
         }
         printf("<input type=\"submit\" name=\"anspUrvanipAwa\" value=\"Yes\" id=\"anspUrvanipAwa\" onclick=\"return pUrvanipAwayescgi()\" />");
         printf("<input type=\"submit\" name=\"anspUrvanipAwa\" value=\"No\" id=\"anspUrvanipAwa\" onclick=\"return pUrvanipAwanocgi()\" />");
       }
     else
         printf("<input type=\"submit\" name=\"anspUrvanipAwa\" value=\"Continue\" id=\"anspUrvanipAwa\" onclick=\"return pUrvanipAwaNullcgi()\"/>");
     printf("</form></td></tr></table>");
}

void call_pUrvanipAwa_xvanxva (char *p1, char *s1, char *p2, char *s2) {
   int position;
   char sUwrastring[MEDIUMUTF];
   position = 1;
   sUwrastring[0] = '\0';
   if(rAjaxanwAxigaNa(p1,p2)) {
         /* exchange p1_utf,2 and also sup1,2 */
          position=2;
          strcpy(sUwrastring,"rAjaxanwAxiRu param 2.2.31");
          /* printf("Case 1\n");*/
   } else if(strcmp(p1,"ahan") && strcmp(p2,"rAwri")) {
          if(!GI(p1)){
            if(GI(p2)){
               position=2;
               strcpy(sUwrastring,"द्वन्द्वे घि 2.2.32");
          /*printf("Case 2\n"); */
            } else if(strcmp(p1,"apara") && strcmp(p2,"para")){
               if(count_ac(p2)< count_ac(p1)){
                   position=2;
                   strcpy(sUwrastring,"अल्पाच्तरम् 2.2.34");
          /*printf("Case 4\n");*/
                } else {
                 if(count_ac(p1)< count_ac(p2)){
                   position=1;
                   strcpy(sUwrastring,"अल्पाच्तरम् 2.2.34");
          /*printf("Case 4\n");*/
                 } else {
                   if(!ajAxi(p1) || !axanwa(p1)){
                     if(ajAxi(p2) && axanwa(p2)){
                      position=2;
                      strcpy(sUwrastring,"अजाद्यदन्तम् 2.2.33");
          /*printf("Case 3\n");*/
                     }
                   }
                }
               }
           }
       }else {strcpy(sUwrastring,"द्वन्द्वे घि 2.2.32");}
    }
    //printf("Within pUrvanipAwa_xvanxva position = %d",position);

     printf("<td><form name=\"f3\" method=\"post\" />");
     printf("<input type=\"hidden\" name=\"encodingpUrvanipAwa\" id=\"encodingpUrvanipAwa\" value=\"%s\" />",encoding);
     printf("<input type=\"hidden\" name=\"vigrahapUrvanipAwa\" id=\"vigrahapUrvanipAwa\" value=\"%s\" />",avigraha);
     printf("<input type=\"hidden\" name=\"p1pUrvanipAwa\" id=\"p1pUrvanipAwa\" value=\"%s\" />",p1);
     printf("<input type=\"hidden\" name=\"p2pUrvanipAwa\" id=\"p2pUrvanipAwa\" value=\"%s\" />",p2);
     printf("<input type=\"hidden\" name=\"s1pUrvanipAwa\" id=\"s1pUrvanipAwa\" value=\"%s\" />",sup1);
     printf("<input type=\"hidden\" name=\"s2pUrvanipAwa\" id=\"s2pUrvanipAwa\" value=\"%s\" />",sup2);
     printf("<input type=\"hidden\" name=\"samAsaprakArapUrvanipAwa\" id=\"samAsaprakArapUrvanipAwa\" value=\"%s\" />",samAsaprakAra);
     printf("<input type=\"hidden\" name=\"samAsAnwapUrvanipAwa\" id=\"samAsAnwapUrvanipAwa\" value=\"%s\" />",samAsAnwa);
     printf("<input type=\"hidden\" name=\"viXAyakasUwra\" id=\"viXAyakasUwra\" value=\"%s\" />",viXAyakasUwra);
     printf("<input type=\"hidden\" name=\"positionpUrvanipAwa\" id=\"positionpUrvanipAwa\" value=\"%d\" />",position);
     printf("<input type=\"hidden\" name=\"sUwrapUrvanipAwa\" id=\"sUwrapUrvanipAwa\" value=\"%s\" />",sUwrastring);
     printf("<input type=\"hidden\" name=\"dividpUrvanipAwa\" id=\"dividpUrvanipAwa\" value=\"#output3\" />");
     printf("<input type=\"submit\" name=\"anspUrvanipAwa\" value=\"Continue\" id=\"anspUrvanipAwa\" onclick=\"return pUrvanipAwaNullcgi()\"/>");
     printf("</form></td></tr></table>");
}

int rAjaxanwAxigaNa(char *p1,char *p2) {
   if(!strcmp(p1,"rAjan") && !strcmp(p2,"xanwa")) { return 1;}
   if(!strcmp(p2,"rAjan") && !strcmp(p1,"xanwa")) { return 1;}
   return 0;
}

int ajAxi(char *p){
 char ac[14];
 strcpy(ac,"aAiIuUqQLeEoO");
 if(index(ac,p[0])) { return 1;} else {return 0;}
}

int axanwa(char *p){
 if(p[strlen(p)-1] == 'a') { return 1;} else {return 0;}
}

int count_ac(char *p){
 int len,count;
 char ac[14];
 int i;
 len = strlen(p);
 count=0;
 strcpy(ac,"aAiIuUqQLeEoO");
 for(i=0;i<len;i++){
   if(index(ac,p[i])) { count++;}
 }
return count;
}

int GI(char *p) {
  char str[VERYSMALL];
  strcpy(str,"iIuU");
  if(index(str,p[strlen(p)-1])) { return 1;}
  else { return 0;}
}
