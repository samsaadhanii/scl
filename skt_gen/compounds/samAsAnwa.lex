%{
#include "struct.h"
extern char ques[LARGE];
extern char samAsaprakAra[MEDIUM];
extern char p1_utf[MEDIUMUTF];
extern char p2_utf[MEDIUMUTF];
extern void samAsAnwa_cgi_interface();
%}
%option nounput
%option noinput

prA [a-zA-Z]+
 //sup \+(su|O|jas|am|Ot|Sas|tA|ByAm3|Bis|fe|ByAm4|Byas4|fasi|ByAm5|Byas5|fas|os6|Am|fi|os7|sup)
 //sup \+(11|12|13|21|22|23|31|32|33|41|42|43|51|52|53|61|62|63|71|72|73)
sup [suOjamtSAByifep34567]*
praWamA (su|O|jas)
word {prA}\+{sup}

avy216	(upa|aXi|anu|nir|apa|xur|awi|prawi|pari|yAvax|A)
pUraNI (praWamA|xviwIyA|wqwIyA|cawurWI|paFcamI|RaRTI|sapwamI|aRTamI|navamI|xaSamI)
safKyA	(ekam|xve|wrINi|cawvAri|paFca|RaRTa|sapwa|aRTa|nava|xaSa|ekAxaSa|xvAxaSa|wrayoxaSa|cawurxaSa|paFcaxaSa|RodaSa|sapwaxaSa|aRTAxaSa|navaxaSa|viMSawi|ekaviMSawi|xvAviMSawi|wrayoviMSawi|cawurviMSaWi|paFcaviMSawi|RadviMSaWi|sapwaviMSawi|aRtAviMSawi|navaviMSawi|wriMSaw|ekawriMSaw|xvAwriMSaw|wrayaswriMSaw|cawuswriMSaw|paFcawriMSaw|RatwriMSaw|sapwawriMSaw|aRTAwriMSaw|navawriMSaw|cawvAriMSaw|ekacawvAriMSaw|xvicawvAriMSaw|wricawvAriMSaw|cawuscawvAriMSaw|paFcacawvAriMSaw|RatcawvAriMSaw|sapwacawvAriMSaw|aRtAcawvAriMSaw|navacawvAriMSaw|paFcASaW)
saMKyeyAbahugaNa	(ekam|xve|wrINi|cawvAri|paFca|RaRTa|sapwa|aRTa|nava|xaSa|ekAxaSa|xvAxaSa|wrayoxaSa|cawurxaSa|paFcaxaSa|RodaSa|sapwaxaSa|aRTAxaSa|navaxaSa|viMSawi|ekaviMSawi|xvAviMSawi|wrayoviMSawi|cawurviMSaWi|paFcaviMSawi|RadviMSaWi|sapwaviMSawi|aRtAviMSawi|navaviMSawi|wriMSaw|ekawriMSaw|xvAwriMSaw|wrayaswriMSaw|cawuswriMSaw|paFcawriMSaw|RatwriMSaw|sapwawriMSaw|aRTAwriMSaw|navawriMSaw|cawvAriMSaw|ekacawvAriMSaw|xvicawvAriMSaw|wricawvAriMSaw|cawuscawvAriMSaw|paFcacawvAriMSaw|RatcawvAriMSaw|sapwacawvAriMSaw|aRtAcawvAriMSaw|navacawvAriMSaw|paFcASaW)
SarawpraBqwi	(Sarax|vipAS|anas|manas|upAnah|xiv|himavaw|anaduh|xiS|xqS|viS|cewas|cawur|wyax|wax|yax|kiyaw)
uraHpraBqwi	(uras|sarpis|upAnah|pumAn|anadvAn|payaH|nOH|lakRmIH|xaXimaXu|SAlI|SAliH)
%%

^kim[ ]{word}[ ].* 	 { 
		 	  sprintf(ques,"किम् इति निन्दार्थे वर्तते(Y/N)?");
		    	  samAsAnwa_cgi_interface(ques,"","किमः क्षेपे 5.4.70");
		         } /* kim rAjan+su */
^{word}[ ]kim[ ].* 	 { 
		 	  sprintf(ques,"किम् इति निन्दार्थे वर्तते(Y/N)?");
		    	  samAsAnwa_cgi_interface(ques,"","किमः क्षेपे 5.4.70");
		         } /* kim rAjan+su */
^na[ ]paWin{sup}[ ].*	 { samAsAnwa_cgi_interface("NULL","ac","पथो विभाषा 5.4.72");}
^paWin{sup}[ ]na[ ].*	 { samAsAnwa_cgi_interface("NULL","ac","पथो विभाषा 5.4.72");}
^na[ ]{word}[ ]wawpuruRa	{  
				  samAsAnwa_cgi_interface("NULL","","नञस्तत्पुरुषात् 5.4.71");
				} /* na rAjan+su */
^{word}[ ]na[ ]wawpuruRa	{  
				  samAsAnwa_cgi_interface("NULL","","नञस्तत्पुरुषात् 5.4.71");
				} /* na rAjan+su */
^{saMKyeyAbahugaNa}{sup}[ ]{word}[ ]bahuvrIhi	{ 
		 	                          sprintf(ques," %s इति पदम् संख्येयार्थे अस्ति (Y/N)?", p1_utf);
		    	                          samAsAnwa_cgi_interface(ques,"dac","बहुव्रीहो संख्येये डजबहुगणात् 5.4.73");
						} 
^{word}[ ]{saMKyeyAbahugaNa}{sup}[ ]bahuvrIhi	{ 
		 	                          sprintf(ques," %s इति पदम् संख्येयार्थे अस्ति (Y/N)?", p1_utf);
		    	                          samAsAnwa_cgi_interface(ques,"dac","बहुव्रीहो संख्येये डजबहुगणात् 5.4.73");
						} 
^akRa{sup}[ ]Xur{sup}[ ].*		{ samAsAnwa_cgi_interface("NULL","","ऋक्पूरब्धूः पथामानक्षे 5.4.74"); } 
^Xur{sup}[ ]akRa{sup}[ ].*		{ samAsAnwa_cgi_interface("NULL","","ऋक्पूरब्धूः पथामानक्षे 5.4.74"); } 
 ^({word}|pra|para|apa|sam|anu|ava|nis|nir|xus|xur|vi|A|ni|aXi|api|awi|su|uw|aBi|prawi|pari|upa)[ ](qk|ap|pur|Xur|paWin){sup}[ ].*  	{samAsAnwa_cgi_interface("","ap","ऋक्पूरब्धूः पथामानक्षे 5.4.74"); } 
^(qk|ap|pur|Xur|paWin){sup}[ ]({word}|pra|para|apa|sam|anu|ava|nis|nir|xus|xur|vi|A|ni|aXi|api|awi|su|uw|aBi|prawi|pari|upa)[ ].*	 {samAsAnwa_cgi_interface("","ap","ऋक्पूरब्धूः पथामानक्षे 5.4.74"); } 
^(prawi|anu|ava)[ ](sAman|loman){sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","अच्प्रत्यन्ववपूर्वत्सामलोम्नः 5.4.75"); }
^(sAman|loman)[ ](prawi|anu|ava){sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","अच्प्रत्यन्ववपूर्वत्सामलोम्नः 5.4.75"); }
^(na|vi|su)[ ]cawur{sup}[ ].*			|
^cawur{sup}[ ](na|vi|su)[ ].*			|
^swrI{sup}[ ]puMs{sup}[ ].*			|
^puMs{sup}[ ]swrI{sup}[ ].*			|
^Xenu{sup}[ ]anaduh{sup}[ ].*			|
^anaduh{sup}[ ]Xenu{sup}[ ].*			|
^qc{sup}[ ]sAman{sup}[ ].*			|
^sAman{sup}[ ]qc{sup}[ ].*			|
^vAc{sup}[ ]manas{sup}[ ].*			|
^manas{sup}[ ]vAc{sup}[ ].*			|
^akRi{sup}[ ]BrU{sup}[ ].*			|
^BrU{sup}[ ]akRi{sup}[ ].*			|
^xAra{sup}[ ]go{sup}[ ].*			|
^go{sup}[ ]xAra{sup}[ ].*			|
^UrU{sup}[ ]aRTIvaw{sup}[ ].*			|
^aRTIvaw{sup}[ ]UrU{sup}[ ].*			|
^pAxa{sup}[ ]aRTIvaw{sup}[ ].*			|
^aRTIvaw{sup}[ ]pAxa{sup}[ ].*			|
^xivA[ ]nakwa[ ].*				|
^nakwa[ ]xivA[ ].*				|
^rAwri{sup}[ ]xivA{sup}[ ].*			|
^xivA{sup}[ ]rAwri{sup}[ ].*			|
^ahan{sup}[ ]xivA{sup}[ ].*			|
^xivA{sup}[ ]ahan{sup}[ ].*			|
^rajas{sup}[ ]saha[ ].*				|
^saha[ ]rajas{sup}[ ].*				|
^nis[ ]Sreyas{sup}[ ].*				|
^Sreyas{sup}[ ]nis[ ].*				|
^puruRa{sup}[ ]Ayus{sup}[ ].*			|
^Ayus{sup}[ ]puruRa{sup}[ ].*			|
^(xvi|wri){sup}[ ]Ayus{sup}[ ].*		|
^Ayus{sup}[ ](xvi|wri){sup}[ ].*		|
^qc{sup}[ ]yajus{sup}[ ].*			|
^yajus{sup}[ ]qc{sup}[ ].*			|
^(jAwa|mahAn|vqxXa){sup}[ ]ukRan{sup}[ ].*	|
^ukRan{sup}[ ](jAwa|mahAn|vqxXa){sup}[ ].*	|
^go{sup}[ ]Svan{sup}[ ].*			|
^Svan{sup}[ ]go{sup}[ ].*			|
^Svan{sup}[ ]upa[ ].*			|
^upa[ ]Svan{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","अचतुरविचतुरसुचतुरस्त्रीपुंसधेन्वनडुहर्क्सामवाङ्मनसाक्षिभ्रुवदारगवोर्वष्ठीवपदष्ठीवनक्तन्दिवरात्रिन्दिवाहर्दिवसरजसनिःश्रेयसपुरुषायुषद्व्यायुषत्र्यायुषर्ग्यजुषजातोक्षमहोक्षवृद्धोक्षोपशुनगोष्ठष्वाः 5.4.77"); }
^{word}[ ]akRi\+{sup}[ ].*		{
		 	          sprintf(ques,"किम् अक्षिशब्दः अदर्शनार्थे वर्तते(Y/N)?");
		    	          samAsAnwa_cgi_interface(ques,"ac","अक्ष्णोऽदर्शनात् 5.4.76");
		                } 
^akRi\+{sup}[ ]{word}[ ].*		{
		 	          sprintf(ques,"किम् अक्षिशब्दः अदर्शनार्थे वर्तते(Y/N)?");
		    	          samAsAnwa_cgi_interface(ques,"ac","अक्ष्णोऽदर्शनात् 5.4.76");
		                } 
^varcas{sup}[ ](brahman|haswin){sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","ब्रह्महस्तिभ्यां वर्चसः 5.4.78"); }
^(brahman|haswin){sup}[ ]varcas{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","ब्रह्महस्तिभ्यां वर्चसः 5.4.78"); }
^(ava|sam|anXa){sup}[ ]wamas{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","अवसमन्धेभ्यस्तमसः 5.4.79"); }
^wamas{sup}[ ](ava|sam|anXa){sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","अवसमन्धेभ्यस्तमसः 5.4.79"); }
^Svas{sup}[ ](vasIyas|Sreyas){sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","श्वसो वसीयःश्रेयसः 5.4.80"); }
^(vasIyas|Sreyas){sup}[ ]Svas{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","श्वसो वसीयःश्रेयसः 5.4.80"); }
^wapwa{sup}[ ]rahas{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","अन्ववतप्ताद्रहसः 5.4.81"); }
^rahas{sup}[ ]wapwa{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","अन्ववतप्ताद्रहसः 5.4.81"); }
^(anu|ava)[ ]rahas{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","अन्ववतप्ताद्रहसः 5.4.81"); }
^rahas{sup}[ ](anu|ava)[ ][ ].*	{samAsAnwa_cgi_interface("NULL","ac","अन्ववतप्ताद्रहसः 5.4.81"); }
^prawi[ ]uras{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","प्रतेरुरसः सप्तमीस्थात् 5.4.82"); }
^uras[ ]prawi{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","प्रतेरुरसः सप्तमीस्थात् 5.4.82"); }
^anu[ ]go{sup}[ ]avyayIBAvaH[ ].*	{
				  sprintf(ques,"अनु इति अव्ययम् आयामर्थे वर्तते(Y/N)?");
				  samAsAnwa_cgi_interface(ques,"ac","अनुगवमायामे 5.4.83");
				}
^go{sup}[ ]anu[ ]avyayIBAvaH[ ].*	{
				  sprintf(ques,"अनु इति अव्ययम् आयामर्थे वर्तते(Y/N)?");
				  samAsAnwa_cgi_interface(ques,"ac","अनुगवमायामे 5.4.83");
				}
^(xvis|wris)[ ]wAvawI{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","द्विस्तावात्रिस्तावा वेदिः 5.4.84"); }
^wAvawI{sup}[ ](xvis|wris)[ ].*	{samAsAnwa_cgi_interface("NULL","ac","द्विस्तावात्रिस्तावा वेदिः 5.4.84"); }
^(pra|parA|apa|sam|anu|ava|nis|nir|xus|xur|vi|Af|ni|aXi|awi|api|su|ux|aBi|prawi|para|upa)[ ]aXvan{sup}[ ].*	{samAsAnwa_cgi_interface("","ac","उपसर्गादध्वनः 5.4.85"); }
^aXvan{sup}[ ](pra|parA|apa|sam|anu|ava|nis|nir|xus|xur|vi|Af|ni|aXi|awi|api|su|ux|aBi|prawi|para|upa)[ ].*	{samAsAnwa_cgi_interface("","ac","उपसर्गादध्वनः 5.4.85"); }
^{safKyA}{sup}[ ]afguli{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","तत्पुरुषस्याङ्गुलेः सङ्ख्याव्ययादेः 5.4.86"); }
^afguli{sup}[ ]{safKyA}{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","तत्पुरुषस्याङ्गुलेः सङ्ख्याव्ययादेः 5.4.86"); }
^(ahan|sarva|saMKyAwa|puNya|{safKyA}){sup}[ ]rAwri{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","अहस्सर्वैकदेशसंख्यातपुण्याच्च रात्रेः 5.4.87"); }
^rAwri{sup}[ ](ahan|sarva|saMKyAwa|puNya|{safKyA}){sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","अहस्सर्वैकदेशसंख्यातपुण्याच्च रात्रेः 5.4.87"); }
^(rAjan|ahan|saKi)\+{praWamA}[ ]{word}[ ].*	{samAsAnwa_cgi_interface("NULL","tac","राजाहस्सखिभ्यष्टच् 5.4.91");}
^{word}[ ](rAjan|ahan|saKi)\+{praWamA}[ ].*	{samAsAnwa_cgi_interface("NULL","tac","राजाहस्सखिभ्यष्टच् 5.4.91");}
  /* 5.4.92 -- taddhita pratyaya */
^uras{sup}[ ]{word}[ ]wawpuruRa	{ 
	 	                 sprintf(ques,"अनेन समासेन मुख्यार्थः उच्यते(Y/N)?");
	   	                 samAsAnwa_cgi_interface(ques,"tac","अग्राख्यायामुरसः 5.4.93");
	                        }
^{word}[ ]uras{sup}[ ]wawpuruRa	{ 
	 	                 sprintf(ques,"अनेन समासेन मुख्यार्थः उच्यते(Y/N)?");
	   	                 samAsAnwa_cgi_interface(ques,"tac","अग्राख्यायामुरसः 5.4.93");
	                        }
^{word}[ ](anas|aSman|aingyas|saras){sup}[ ]wawpuruRa	{
		 				          sprintf(ques,"अनेन समासेन जातिः अथवा संज्ञा गम्यते(Y/N)?");
		                                          samAsAnwa_cgi_interface(ques,"tac","अनोश्मायस्सरसां जातिसंज्ञयोः 5.4.94");
						        }
^(anas|aSman|aingyas|saras){sup}[ ]{word}[ ]wawpuruRa	{
		 				          sprintf(ques,"अनेन समासेन जातिः अथवा संज्ञा गम्यते(Y/N)?");
		                                          samAsAnwa_cgi_interface(ques,"tac","अनोश्मायस्सरसां जातिसंज्ञयोः 5.4.94");
						        }
^(grAma|kOta){sup}[ ]wakRan{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","tac","ग्रामकौटाभ्यां च तक्ष्णः 5.4.95"); }
^wakRan{sup}[ ](grAma|kOta){sup}[ ].*	{samAsAnwa_cgi_interface("NULL","tac","ग्रामकौटाभ्यां च तक्ष्णः 5.4.95"); }
^awi[ ]Svan{sup}[ ].*			{samAsAnwa_cgi_interface("NULL","tac","अतेः शुनः 5.4.96"); }
^Svan{sup}[ ]awi[ ].*			{samAsAnwa_cgi_interface("NULL","tac","अतेः शुनः 5.4.96"); }
^(su|awi)[ ]{word}[ ]wawpuruRaH		{
				         sprintf(ques,"%s इति पदं पूजार्थे वर्तते(Y/N)?", p1_utf);
 				         samAsAnwa_cgi_interface(ques," ","न पूजनात् 5.4.69");
			                }
^{word}[ ](su|awi)[ ]wawpuruRaH		{
				         sprintf(ques,"%s इति पदं पूजार्थे वर्तते(Y/N)?", p1_utf);
 				         samAsAnwa_cgi_interface(ques," ","न पूजनात् 5.4.69");
			                }
 /* su+su rAjan+su */
^sakWi{sup}[ ](uwwara|mqga|pUrva|Palaka){sup}[ ].*	{ samAsAnwa_cgi_interface("NULL","tac","उत्तरमृगपूर्वाच्च सक्थ्नः 5.4.98");}
^(uwwara|mqga|pUrva|Palaka){sup}[ ]sakWi{sup}[ ].*	{ samAsAnwa_cgi_interface("NULL","tac","उत्तरमृगपूर्वाच्च सक्थ्नः 5.4.98");}
^(eka|xvi|wri){sup}[ ]nO{sup}[ ].*		{samAsAnwa_cgi_interface("NULL","tac","नावो द्विगोः 5.4.99"); }
^nO{sup}[ ](eka|xvi|wri){sup}[ ].*		{samAsAnwa_cgi_interface("NULL","tac","नावो द्विगोः 5.4.99"); }
^nO{sup}[ ]arXa{sup}[ ].*			{samAsAnwa_cgi_interface("NULL","tac","अर्धाच्च 5.4.100");}
^arXa{sup}[ ]nO{sup}[ ].*			{samAsAnwa_cgi_interface("NULL","tac","अर्धाच्च 5.4.100");}
^(eka|xvi|wri|arXa){sup}[ ]KArI{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","tac","खार्याः प्राचाम् 5.4.101"); }
^KArI{sup}[ ](eka|xvi|wri|arXa){sup}[ ].*	{samAsAnwa_cgi_interface("NULL","tac","खार्याः प्राचाम् 5.4.101"); }
^(xvi|wri){sup}[ ]aFjali{sup}[ ].*		{samAsAnwa_cgi_interface("NULL","tac","द्वित्रिभ्यामञ्जलेः 5.4.102"); }
^aFjali{sup}[ ](xvi|wri){sup}[ ].*		{samAsAnwa_cgi_interface("NULL","tac","द्वित्रिभ्यामञ्जलेः 5.4.102"); }
  /* 5.4.103 -- Canxasi */
^ku[ ]brahman{sup}[ ].*			{samAsAnwa_cgi_interface("NULL","tac","कुमहद्भ्यामन्यतरस्याम् 5.4.105"); }
^brahman{sup}[ ]ku[ ].*			{samAsAnwa_cgi_interface("NULL","tac","कुमहद्भ्यामन्यतरस्याम् 5.4.105"); }
^{word}[ ]brahman{sup}[ ]wawpuruRa	{
		 		         sprintf(ques,"अनेन समासेन जानपदाख्यार्थः उच्यते(Y/N)?");
		                         samAsAnwa_cgi_interface(ques,"tac","ब्रह्मणो जानपदाख्यायाम् 5.4.104");
				        }
^brahman{sup}[ ]{word}[ ]wawpuruRa	{
		 		         sprintf(ques,"अनेन समासेन जानपदाख्यार्थः उच्यते(Y/N)?");
		                         samAsAnwa_cgi_interface(ques,"tac","ब्रह्मणो जानपदाख्यायाम् 5.4.104");
				        }
^(ku|mahaw){sup}[ ]brahman{sup}[ ].*		{samAsAnwa_cgi_interface("NULL","tac","कुमहद्भ्यामन्यतरस्याम् 5.4.105"); }
^brahman{sup}[ ](ku|mahaw){sup}[ ].*		{samAsAnwa_cgi_interface("NULL","tac","कुमहद्भ्यामन्यतरस्याम् 5.4.105"); }
^{word}[ ]{prA}[cCjJFxRh]\+{praWamA}[ ]xvanxva	{
				                 samAsAnwa_cgi_interface("NULL","tac","द्वन्द्वाच्चुदषहान्तात्समाहारे 5.4.106");
				                }
^{prA}[cCjJFxRh]\+{praWamA}[ ]{word}[ ]xvanxva	{
				                 samAsAnwa_cgi_interface("NULL","tac","द्वन्द्वाच्चुदषहान्तात्समाहारे 5.4.106");
				                }
^(aXi|upa)[ ]{prA}an{sup}[ ].*			{samAsAnwa_cgi_interface("NULL","tac","अनश्च 5.4.108"); }
^{prA}an{sup}[ ](aXi|upa)[ ].*			{samAsAnwa_cgi_interface("NULL","tac","अनश्च 5.4.108"); }
^upa[ ](naxI|pOrNamAsI|AgrahAyaNI){sup}[ ].*		{samAsAnwa_cgi_interface("NULL","tac","नदीपौउर्णमाश्याग्रहायणीभ्यः 5.4.110"); }
^(naxI|pOrNamAsI|AgrahAyaNI){sup}[ ]upa[ ].*		{samAsAnwa_cgi_interface("NULL","tac","नदीपौउर्णमाश्याग्रहायणीभ्यः 5.4.110"); }
^{SarawpraBqwi}{sup}[ ]{avy216}[ ]avyayIBAvaH	{samAsAnwa_cgi_interface("NULL","tac","अव्ययीभावे शरत्प्रभृतिभ्यः 5.4.107"); }
^{avy216}[ ]{SarawpraBqwi}{sup}[ ]avyayIBAvaH	{samAsAnwa_cgi_interface("NULL","tac","अव्ययीभावे शरत्प्रभृतिभ्यः 5.4.107"); }
^(upa|pra|para|ava|sam)[ ]{prA}[JBGDXjbgdxKPCTWcwkp]{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","tac","झयः 5.4.111"); }
^{prA}[JBGDXjbgdxKPCTWcwkp]{sup}[ ](upa|pra|para|ava|sam)[ ].*	{samAsAnwa_cgi_interface("NULL","tac","झयः 5.4.111"); }
^upa[ ]giri{sup}[ ].*				{samAsAnwa_cgi_interface("NULL","tac","गिरेश्च सेनकस्य 5.4.112"); }
^giri{sup}[ ]upa[ ].*				{samAsAnwa_cgi_interface("NULL","tac","गिरेश्च सेनकस्य 5.4.112"); }
^{word}[ ](sakWi|akRi){sup}[ ]bahuvrIhi		{
		 		                 sprintf(ques,"अनेन समासेन स्वाङ्गार्थः उच्यते(Y/N)?");
		                                 samAsAnwa_cgi_interface(ques,"Rac","बहुव्रीहौ सक्थ्यक्ष्णौः स्वाङ्गात् षच् 5.4.113");
				                }
^(sakWi|akRi){sup}[ ]{word}[ ]bahuvrIhi		{
		 		                 sprintf(ques,"अनेन समासेन स्वाङ्गार्थः उच्यते(Y/N)?");
		                                 samAsAnwa_cgi_interface(ques,"Rac","बहुव्रीहौ सक्थ्यक्ष्णौः स्वाङ्गात् षच् 5.4.113");
				                }
^{word}[ ]afguli{sup}[ ].*				{samAsAnwa_cgi_interface("NULL","Rac","अङ्गुलेर्दारुणि 5.4.114"); }
^afguli{sup}[ ]{word}[ ].*				{samAsAnwa_cgi_interface("NULL","Rac","अङ्गुलेर्दारुणि 5.4.114"); }
^(xvi|wri){sup}[ ]mUrXan{sup}[ ].*			{samAsAnwa_cgi_interface("NULL","Ra","द्वित्रिभ्यां ष मूर्ध्नः 5.4.115"); }
^mUrXan{sup}[ ](xvi|wri){sup}[ ].*			{samAsAnwa_cgi_interface("NULL","Ra","द्वित्रिभ्यां ष मूर्ध्नः 5.4.115"); }
^{word}[ ](pramANI|{pUraNI}){sup}[ ]bahuvrIhi	{samAsAnwa_cgi_interface("NULL","ap","अप् पूरणीप्रमाण्योः 5.4.116"); }
^(pramANI|{pUraNI}){sup}[ ]{word}[ ]bahuvrIhi	{samAsAnwa_cgi_interface("NULL","ap","अप् पूरणीप्रमाण्योः 5.4.116"); }
^(anwar|bahis)[ ]loman{sup}[ ].*			{samAsAnwa_cgi_interface("NULL","ap","अन्तर्बहिर्भ्याम् च लोम्नः 5.4.117"); }
^loman{sup}[ ](anwar|bahis)[ ].*			{samAsAnwa_cgi_interface("NULL","ap","अन्तर्बहिर्भ्याम् च लोम्नः 5.4.117"); }
^sWulA{sup}[ ]nAsikA{sup}[ ]bahuvrIhi		{samAsAnwa_cgi_interface("NULL","","अञ्नासिकायाः संज्ञायाम् नसं चास्थुलात् 5.4.118"); }
^nAsikA{sup}[ ]sWulA{sup}[ ]bahuvrIhi		{samAsAnwa_cgi_interface("NULL","","अञ्नासिकायाः संज्ञायाम् नसं चास्थूलात् 5.4.118"); }
^{word}[ ]nAsikA{sup}[ ]bahuvrIhi		{
						 samAsAnwa_cgi_interface("NULL","ac","अञ्नासिकायाः संज्ञायाम् नसं चास्थूलात् 5.4.118"); 
				       		}
^nAsikA{sup}[ ]{word}[ ]bahuvrIhi		{
						 samAsAnwa_cgi_interface("NULL","ac","अञ्नासिकायाः संज्ञायाम् नसं चास्थुलात् 5.4.118"); 
				       		}
^(pra|para|apa|sam|anu|ava|nis|nir|xus|xur|vi|Af|ni|aXi|awi|api|su|ux|aBi|prawi|pari|upa)[ ]nAsikA\+{praWamA}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","उपसर्गाच्च 5.4.119"); }
^nAsikA\+{praWamA}[ ](pra|para|apa|sam|anu|ava|nis|nir|xus|xur|vi|Af|ni|aXi|awi|api|su|ux|aBi|prawi|pari|upa)[ ].*	{samAsAnwa_cgi_interface("NULL","ac","उपसर्गाच्च 5.4.119"); }
^(prAwar|xivA|Svas|kukRi|aSri|paxa){sup}[ ](su|SAri|cawur|eNI|aja|proRTa){sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","सुप्रातसुश्वसुदिवशारिकुक्षचतुरश्रैणिपदाजपदप्रोष्ठपदाः 5.4.120"); }
^(su|SAri|cawur|eNI|aja|proRTa){sup}[ ](prAwar|xivA|Svas|kukRi|aSri|paxa){sup}[ ].*	{samAsAnwa_cgi_interface("NULL","ac","सुप्रातसुश्वसुदिवशारिकुक्षचतुरश्रैणिपदाजपदप्रोष्ठपदाः 5.4.120"); }
^(a|xus|su)[ ](hali|sakWi){sup}[ ].*			{samAsAnwa_cgi_interface("NULL","ac","नञ्दुःसुभ्यो हलिसक्थ्योरन्यतर्स्याम् 5.4.121"); }
^(hali|sakWi){sup}[ ](a|xus|su)[ ].*			{samAsAnwa_cgi_interface("NULL","ac","नञ्दुःसुभ्यो हलिसक्थ्योरन्यतर्स्याम् 5.4.121"); }
^(a|xus|su)[ ](prajA|meXA){sup}[ ].*			{samAsAnwa_cgi_interface("NULL","asic","नित्यमसिच्प्रजामेधयोः 5.4.122"); }
^(prajA|meXA){sup}[ ](a|xus|su)[ ].*			{samAsAnwa_cgi_interface("NULL","asic","नित्यमसिच्प्रजामेधयोः 5.4.122"); }
  /* 5.4.123 -- Canxasi */
^{word}[ ]Xarma{sup}[ ].*				{samAsAnwa_cgi_interface("NULL","anic","धर्मादनिच्केवलात् 5.4.124"); }
^Xarma{sup}[ ]{word}[ ].*				{samAsAnwa_cgi_interface("NULL","anic","धर्मादनिच्केवलात् 5.4.124"); }
^(su|hariwa|wqNa|soma){sup}[ ]jamBa{sup}[ ].*	{samAsAnwa_cgi_interface("NULL","anic","जम्भासुहरिततृणसोमेभ्यः 5.4.125"); }
^jamBa{sup}[ ](su|hariwa|wqNa|soma){sup}[ ].*	{samAsAnwa_cgi_interface("NULL","anic","जम्भासुहरिततृणसोमेभ्यः 5.4.125"); }
^xakRiNa{sup}[ ]Irma{sup}[ ]bahuvrIhi		{
		                       		  sprintf(ques,"अनेन समासेन लुब्धयोगः उच्यते(Y/N)?");
		                       		  samAsAnwa_cgi_interface(ques,"anic","दक्षिणेर्मा लुब्धयोगे 5.4.126");
				       	        }
^Irma{sup}[ ]xakRiNa{sup}[ ]bahuvrIhi		{
		                       		  sprintf(ques,"अनेन समासेन लुब्धयोगः उच्यते(Y/N)?");
		                       		  samAsAnwa_cgi_interface(ques,"anic","दक्षिणेर्मा लुब्धयोगे 5.4.126");
				       	        }
^XanuR{sup}[ ]{word}[ ]bahuvrIhi		{
                                                 sprintf(ques,"अनेन समासेन संज्ञा गम्यते(Y/N)?");
                                                 samAsAnwa_cgi_interface(ques,"anaf","वा संज्ञायां 5.4.133");
                                                }
^{word}[ ]XanuR{sup}[ ]bahuvrIhi		{
                                                 sprintf(ques,"अनेन समासेन संज्ञा गम्यते(Y/N)?");
                                                 samAsAnwa_cgi_interface(ques,"anaf","वा संज्ञायां 5.4.133");
                                                }
^xaNda{sup}[ ]xvi{sup}[ ]bahuvrIhi		{samAsAnwa_cgi_interface("NULL","ic","द्विदण्ड्याडिभ्यस्च 5.4.128");}
^xvi{sup}[ ]xaNda{sup}[ ]bahuvrIhi		{samAsAnwa_cgi_interface("NULL","ic","द्विदण्ड्याडिभ्यस्च 5.4.128");}
^UXas{sup}[ ]{word}[ ]bahuvrIhi			{samAsAnwa_cgi_interface("NULL","anaf","ऊधसोऽनङ् 5.4.131");}
^{word}[ ]UXas{sup}[ ]bahuvrIhi			{samAsAnwa_cgi_interface("NULL","anaf","ऊधसोऽनङ् 5.4.131");}
^XanuR{sup}[ ]{word}[ ].*				{samAsAnwa_cgi_interface("NULL","anaf","धनुषश्च 5.4.132"); }
^{word}[ ]XanuR{sup}[ ].*				{samAsAnwa_cgi_interface("NULL","anaf","धनुषश्च 5.4.132"); }
^{word}[ ]jAyA{sup}[ ].*				{samAsAnwa_cgi_interface("NULL","nif","जायाय निङ् 5.4.134"); }
^jAyA{sup}[ ]{word}[ ].*				{samAsAnwa_cgi_interface("NULL","nif","जायाय निङ् 5.4.134"); }
^ganXa{sup}[ ](pUwi|suraBi){sup}[ ].*		{samAsAnwa_cgi_interface("NULL","i","गन्धस्येदुत्पूतिसुसुरभिभ्यः 5.4.135"); }
^(pUwi|suraBi){sup}[ ]ganXa{sup}[ ].*		{samAsAnwa_cgi_interface("NULL","i","गन्धस्येदुत्पूतिसुसुरभिभ्यः 5.4.135"); }
^ganXa{sup}[ ](uw|su)[ ].*				{samAsAnwa_cgi_interface("NULL","i","गन्धस्येदुत्पूतिसुसुरभिभ्यः 5.4.135"); }
^(uw|su)[ ]ganXa{sup}[ ].*				{samAsAnwa_cgi_interface("NULL","i","गन्धस्येदुत्पूतिसुसुरभिभ्यः 5.4.135"); }
^ganXa{sup}[ ]sUpa{sup}[ ]bahuvrIhi	        {
                                                 sprintf(ques,"अनेन समासेन अल्पार्थः गम्यते(Y/N)?");
                                                 samAsAnwa_cgi_interface(ques,"i","अल्पाख्यायाम् 5.4.136");
                                                }
^sUpa{sup}[ ]ganXa{sup}[ ]bahuvrIhi	        {
                                                 sprintf(ques,"अनेन समासेन अल्पार्थः गम्यते(Y/N)?");
                                                 samAsAnwa_cgi_interface(ques,"i","अल्पाख्यायाम् 5.4.136");
                                                }
^ganXa{sup}[ ]{word}[ ]bahuvrIhi  	   {
                                              sprintf(ques,"किम् %s पदम् %s पदस्य उपमानं वा(Y/N)?", p1_utf,p2_utf);
                                              samAsAnwa_cgi_interface(ques,"i","उपमानाच्च 5.4.137");
                                            }
^{word}[ ]ganXa{sup}[ ]bahuvrIhi  	   {
                                              sprintf(ques,"किम् %s पदम् %s पदस्य उपमानं वा(Y/N)?", p1_utf,p2_utf);
                                              samAsAnwa_cgi_interface(ques,"i","उपमानाच्च 5.4.137");
                                            }
  /* 5.4.142 -- Canxasi */
^{uraHpraBqwi}{sup}[ ]{word}[ ]bahuvrIhi	{samAsAnwa_cgi_interface("NULL","kap","उरःप्रभृतिभ्यः कप् 5.4.151");}
^{word}[ ]{uraHpraBqwi}{sup}[ ]bahuvrIhi	{samAsAnwa_cgi_interface("NULL","kap","उरःप्रभृतिभ्यः कप् 5.4.151");}
^{prA}in{sup}[ ]{word}[ ]bahuvrIhi	{
					  sprintf(ques,"किम् अनेन समासेन स्त्रीत्वं द्योत्यते(Y/N)?");
					  samAsAnwa_cgi_interface(ques,"kap","इनः स्त्रियाम् 5.4.152");
					} 
^{word}[ ]{prA}in{sup}[ ]bahuvrIhi	{
					  sprintf(ques,"किम् अनेन समासेन स्त्रीत्वं द्योत्यते(Y/N)?");
					  samAsAnwa_cgi_interface(ques,"kap","इनः स्त्रियाम् 5.4.152");
					} 
^pravANI{sup}[ ]nir[ ]bahuvrIhi		{
		                         samAsAnwa_cgi_interface(ques," ","निष्प्रवाणिश्च 5.4.160");
                                        }
^nir[ ]pravANI{sup}[ ]bahuvrIhi		{
		                         samAsAnwa_cgi_interface(ques," ","निष्प्रवाणिश्च 5.4.160");
                                        }
  /* 5.4.156 taddhita pratyaya */
BrAwq{sup}[ ]({word}|su)[ ]bahuvrIhi	{
		                         sprintf(ques,"किमिदं  %s पुजार्थे वर्तते(Y/N)?", p2_utf);
		                         samAsAnwa_cgi_interface(ques," ","वन्दिते भ्रातुः 5.4.157");
		                        }
^({word}|su)[ ]BrAwq{sup}[ ]bahuvrIhi	{
		                         sprintf(ques,"किमिदं  %s पुजार्थे वर्तते(Y/N)?", p2_utf);
		                         samAsAnwa_cgi_interface(ques," ","वन्दिते भ्रातुः 5.4.157");
		                        }
  /* 5.4.158 -- Canxasi */
^(nAdI|wanwrI){sup}[ ]{word}[ ]bahuvrIhi	{
		                                 sprintf(ques,"अनेन समासेन स्वाङ्गः उच्यते(Y/N)?");
		                                 samAsAnwa_cgi_interface(ques," ","नाडीतन्त्र्योः स्वाङ्गे 5.4.159");
		                        }
^{word}[ ](nAdI|wanwrI){sup}[ ]bahuvrIhi	{
		                                 sprintf(ques,"अनेन समासेन स्वाङ्गः उच्यते(Y/N)?");
		                                 samAsAnwa_cgi_interface(ques," ","नाडीतन्त्र्योः स्वाङ्गे 5.4.159");
		                                }
^{prA}[iIuUq]{sup}[ ]{word}[ ]bahuvrIhi		{
					          sprintf(ques,"किमिदं %s नद्यन्तं(Y/N)?",p2_utf);
					          samAsAnwa_cgi_interface(ques,"kap","नदृतश्च 5.4.153");
                                                }
^{word}[ ]{prA}[iIuUq]{sup}[ ]bahuvrIhi		{
					          sprintf(ques,"किमिदं %s नद्यन्तं(Y/N)?",p2_utf);
					          samAsAnwa_cgi_interface(ques,"kap","नदृतश्च 5.4.153");
                                                }
^{word}[ ]{word}[ ]bahuvrIhi			{
                               		           sprintf(ques,"अनेन समासेन कर्मव्यतिहारः उच्यते(Y/N)?");
                               		           samAsAnwa_cgi_interface(ques,"ic","इच् कर्मव्यतिहारे 5.4.127");
		                                   //sprintf(ques,"अनेन समासेन संज्ञा उच्यते(Y/N)?");
		                                   //samAsAnwa_cgi_interface(ques," "," न संज्ञायां 5.4.155"); /* Amba */
		                                   //sprintf(ques,"किम् अनेन समासेन शेषः उच्यते(Y/N)?");
 /* SeRa? */
		                                   //samAsAnwa_cgi_interface(ques,"kap","शेषाद् विभाषा 5.4.154");
			                        }
^.*	{ samAsAnwa_cgi_interface("NULL","",""); }
 
%%
char ques[LARGE];
char p1_utf[MEDIUMUTF];
char p2_utf[MEDIUMUTF];
char p1[MEDIUM];
char p2[MEDIUM];
char sup1[MEDIUM];
char sup2[MEDIUM];
char samAsaprakAra[MEDIUM];
char viXAyakasUwra[MEDIUMUTF];
char avigraha[MEDIUMUTF];
char encoding[MEDIUM];
void samAsAnwalex();
int samAsAnwawrap();
void samAsAnwa_cgi_interface();
void call_samAsAnwalex();
void cnvrtwx2utf();
void cnvrtutfd2r();

int main (int argc, char *argv[]) {
char input[MEDIUM];

ques[0] = '\0';

  strcpy(encoding,argv[1]);
  strcpy(avigraha,argv[2]);
  strcpy(p1,argv[3]);
  strcpy(sup1,argv[4]);
  strcpy(p2,argv[5]);
  strcpy(sup2,argv[6]);
  strcpy(viXAyakasUwra,argv[7]);
  strcpy(samAsaprakAra,argv[8]);

  strcpy(input,avigraha);
  strcat(input," ");
  strcat(input,samAsaprakAra);

  cnvrtwx2utf(p1,p1_utf);
  cnvrtwx2utf(p2,p2_utf);

  call_samAsAnwalex(input);
  return 1;
}

void call_samAsAnwalex(char *in){
  yy_scan_string(in);
  yylex();
}

int samAsAnwawrap()
{
 return 1;
}

void samAsAnwa_cgi_interface(char *question, char *prawyaya, char *sUwra)
{
     char question_utfr[MEDIUMUTF];
     if(!strcmp(question,"NULL")){
       printf("<td><form name=\"f2\" method=\"post\">\n");
     } else {
       printf("</tr><tr><td colspan=\"3\"><form name=\"f2\" method=\"post\">\n");
     }
     printf("<input type=\"hidden\" name=\"encodingsamAsAnwa\" id=\"encodingsamAsAnwa\" value=\"%s\" />",encoding);
     printf("<input type=\"hidden\" name=\"vigrahasamAsAnwa\" id=\"vigrahasamAsAnwa\" value=\"%s\" />",avigraha);
     printf("<input type=\"hidden\" name=\"p1samAsAnwa\" id=\"p1samAsAnwa\" value=\"%s\" />",p1);
     printf("<input type=\"hidden\" name=\"p2samAsAnwa\" id=\"p2samAsAnwa\" value=\"%s\" />",p2);
     printf("<input type=\"hidden\" name=\"s1samAsAnwa\" id=\"s1samAsAnwa\" value=\"%s\" />",sup1);
     printf("<input type=\"hidden\" name=\"s2samAsAnwa\" id=\"s2samAsAnwa\" value=\"%s\" />",sup2);
     printf("<input type=\"hidden\" name=\"viXAyakasUwrasamAsAnwa\" id=\"viXAyakasUwrasamAsAnwa\" value=\"%s\" />",viXAyakasUwra);
     printf("<input type=\"hidden\" name=\"samAsaprakArasamAsAnwa\" id=\"samAsaprakArasamAsAnwa\" value=\"%s\" />",samAsaprakAra);
     printf("<input type=\"hidden\" name=\"samAsAnwa\" id=\"samAsAnwa\" value=\"%s\" />",prawyaya);
     printf("<input type=\"hidden\" name=\"sUwrasamAsAnwa\" id=\"sUwrasamAsAnwa\" value=\"%s\" />",sUwra);
     if(!strcmp(question,"NULL")){
        printf("<input type=\"submit\" name=\"anssamAsAnwa\" value=\"Continue\" id=\"anssamAsAnwa\" onclick=\"return samAsAnwaNullcgi()\" />");
     } else {
       if(!strcmp(encoding,"RMN")) {
          cnvrtutfd2r(question,question_utfr);
          printf("%s",question_utfr);
       } else {
          printf("%s",question);
       }
       printf("<input type=\"submit\" name=\"anssamAsAnwa\" value=\"Yes\" id=\"anssamAsAnwa\" onclick=\"return samAsAnwayescgi()\" />");
       printf("<input type=\"submit\" name=\"anssamAsAnwa\" value=\"No\" id=\"anssamAsAnwa\" onclick=\"return samAsAnwanocgi()\" />");
     }
        printf("</form></td></tr></table>");
}
