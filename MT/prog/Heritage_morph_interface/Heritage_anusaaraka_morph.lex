 int debug;
 char word[100];
 char gen[10][20];
 char num[10][20];
 char per[10][20];
 char gaNa[10][10];
 char gana[10];
 char vargaH[20];
 char pv[20];
 char vib[10][20];
 char prayogaH[10][30];
 char san[40];
 char lakAraH[10][40];
 char kqw[40];
 char kqw_prati[40];
 char prati[40];
 char paxI[10][40];
 char ans[1000];
 char tmp[200];
 char iic[100];
 int count;
 int comp_no;
 int word_no;
 int iic_count;
 int i;
 void get_gana();
%option nounput
%option noinput
%%
morph: 	{}
\<form[ ]wx=\"[^\"]+/\"	{ if(strcmp(pv,"")){ strcpy(word,pv); strcat(word,"-");} 
			  else if( iic_count > 0) { strcpy(word,"-");}
                          else {word[0] = '\0';}
                          if (iic_count == 0) {word_no++;}
			  if (iic_count > 0) { comp_no++;} else { comp_no = 1;}
                          strcat(word,yytext+10); 
                          strcpy(ans,""); 
                          if(debug) {   printf("found form wx\n"); 
					printf("word = %s\n",word);
					printf("ans = %s\n",ans);
				    }
			}

\<tags[ ]phase=\"pv\"\>\<entry[ ]wx=\"[^\"]+/\"\/\>	{
			 strcpy(pv,yytext+28); 
                         count=0; 
			 word_no--;
			 if(debug) {printf(" found tags phase pv\n pv = %s",pv);}
			}
\<entry[ ]wx=\"[^\"]+/\"\/\>\<krid	{
			strcpy(kqw_prati,yytext+11);
			/*iic_count=0;*/
			if(!strcmp(vargaH,"nA")) {strcpy(vargaH,"kqw_nA");}
			if(debug) {printf(" found krid = %s vargaH = %s",kqw_prati, vargaH);}
			}
\<entry[ ]wx=\"[^\"]+/\"	{ 
				  strcpy(prati,yytext+11); 
                        	  if(debug) {printf(" read prati\n");}
				}

\<tags[ ]phase=\"noun\"\>	{strcpy(vargaH,"nA"); 
				 iic_count=0;
				 if(debug) {printf(" in phase noun\n");}
				}
\<tags[ ]phase=\"unknown\"\>	{strcpy(vargaH,"UNKN"); 
				 iic_count=0;
				 if(debug) {printf(" in phase noun\n");}
				}
\<tags[ ]phase=\"iic\"\>	{strcpy(vargaH,"sapUpa"); 
				 strcat(word,"-");
                                 iic_count++;
				 if(debug) {printf(" in phase iic\n");}
				}
\<tags[ ]phase=\"ifc\"\>	{strcpy(vargaH,"nA");
				 iic_count=0;
				 if(debug) { printf(" in phase ifc\n");}
				}
\<tags[ ]phase=\"unde\"\>	{strcpy(vargaH,"avy"); iic_count = 0;}
\<tags[ ]phase=\"inde\"\>	{strcpy(vargaH,"avy"); iic_count = 0;}
\<tags[ ]phase=\"root\"\>	{strcpy(vargaH,"KP"); iic_count = 0;}
\<tags[ ]phase=\"voca\"\>	{strcpy(vargaH,"nA"); iic_count = 0;}

\<tag\>	{count=-1; 
	 if(debug) {printf(" new tag starts\n");}
	}

\<morpho_infl\>	{}
\<\/morpho_infl\>	{}
\<morpho_gen\>	{}
\<morpho_gen>[a-zA-Z_]+	{strcpy(pv,yytext+12);
			// strcat(pv,"_");
			// Added 18 Jul 2015 to handle GH's new treatment of pvs
                        }
\<\/morpho_gen\>	{}
\<\/krid\>	{if(debug) {printf(" closed krid\n");}}
\<krid\>	{}
\<root\>	{}
\<\/root\>	{if(debug) {printf(" closed root\n");}}


\<nom\/\>	{strcpy(vib[count],"<viBakwiH:1>");}
\<voc\/\>	{strcpy(vib[count],"<viBakwiH:8>");}
\<acc\/\>	{strcpy(vib[count],"<viBakwiH:2>");}
\<ins\/\>	{strcpy(vib[count],"<viBakwiH:3>");}
\<i\/\>	{strcpy(vib[count],"<viBakwiH:3>");}
\<dat\/\>	{strcpy(vib[count],"<viBakwiH:4>");}
\<abl\/\>	{strcpy(vib[count],"<viBakwiH:5>");}
\<gen\/\>	{strcpy(vib[count],"<viBakwiH:6>");}
\<g\/\>	{strcpy(vib[count],"<viBakwiH:6>");}
\loc\/\>	{strcpy(vib[count],"<viBakwiH:7>");}

\<m\/\>	{strcpy(gen[count],"<lifgam:puM>");}
\<n\/\>	{strcpy(gen[count],"<lifgam:napuM>");}
\<f\/\>	{strcpy(gen[count],"<lifgam:swrI>");}
\<d\/\>	{strcpy(gen[count],"<lifgam:a>");}

\<sg\/\>	{strcpy(num[count],"<vacanam:eka>");}
\<du\/\>	{strcpy(num[count],"<vacanam:xvi>");}
\<pl\/\>	{strcpy(num[count],"<vacanam:bahu>");}

\<thd\/\>	{strcpy(per[count],"<puruRaH:pra>");}
\<snd\/\>	{strcpy(per[count],"<puruRaH:ma>");}
\<fst\/\>	{strcpy(per[count],"<puruRaH:u>");}

\<part\/\>	{}
\<prep\/\>	{}
\<conj\/\>	{}
\<adv\/\>	{}
\<und\/\>	{}
\<ind\/\>	{}
\<iic\/\>	{}
\<unknown\/\>	{}

\<ca\/\>	{strcpy(san,"<sanAxi_prawyayaH:Nic>");}
\<des\/\>	{strcpy(san,"<sanAxi_prawyayaH:san>");}
\<int\/\>	{strcpy(san,"<sanAxi_prawyayaH:yaf>");}

\<ac\/>	{strcpy(prayogaH[count],"<prayogaH:karwari>"); strcpy(paxI[count],"<paxI:parasmEpaxI>");}
\<md\/>	{strcpy(prayogaH[count],"<prayogaH:karwari>"); strcpy(paxI[count],"<paxI:AwmanepaxI>");}
\<ps\/>	{strcpy(prayogaH[count],"<prayogaH:karmaNi>");strcpy(paxI[count],"<paxI:AwmanepaxI>");}

\<pr[ ]gana=[0-9]+\/\>	{get_gana(yytext+9,gana);strcpy(gaNa[count],gana); strcpy(lakAraH[count],"<lakAraH:lat>");}
\<imp[ ]gana=[0-9]+\/\>	{get_gana(yytext+10,gana);strcpy(gaNa[count],gana);strcpy(lakAraH[count],"<lakAraH:lot>");}
\<opt[ ]gana=[0-9]+\/\>	{get_gana(yytext+10,gana);strcpy(gaNa[count],gana);strcpy(lakAraH[count],"<lakAraH:viXilif>");}
\<aor[ ]gana=[0-9]+\/\>	{strcpy(gaNa[count],"X");strcpy(lakAraH[count],"<lakAraH:luf>");}
\<inj[ ]gana=[0-9]+\/\>	{strcpy(gaNa[count],"X");strcpy(lakAraH[count],"<lakAraH:luf>");}
\<prps\/\>	{strcpy(gaNa[count],"X");strcpy(lakAraH[count],"<lakAraH:lat>"); strcpy(prayogaH[count],"<prayogaH:karmaNi>");strcpy(paxI[count],"<paxI:AwmanepaxI>");}
\<impps\/\>	{strcpy(gaNa[count],"X");strcpy(lakAraH[count],"<prayogaH:karmaNi><lakAraH:lot>");strcpy(paxI[count],"<paxI:AwmanepaxI>");}
\<optps\/\>	{strcpy(gaNa[count],"X");strcpy(lakAraH[count],"<prayogaH:karmaNi><lakAraH:viXilif>");strcpy(paxI[count],"<paxI:AwmanepaxI>");}
\<impftps\/\>	{strcpy(gaNa[count],"X");strcpy(lakAraH[count],"<prayogaH:karmaNi><lakAraH:laf>");strcpy(paxI[count],"<paxI:AwmanepaxI>");}
\<impft[ ]gana=[0-9]+\/\>	{get_gana(yytext+12,gana);strcpy(gaNa[count],gana);strcpy(lakAraH[count],"<lakAraH:laf>");strcpy(paxI[count],"<paxI:AwmanepaxI>");}
\<perfut\/\>	{strcpy(gaNa[count],"X");strcpy(lakAraH[count],"<lakAraH:lut>");strcpy(paxI[count],"<paxI:AwmanepaxI>");}
\<fut\/\>	{strcpy(gaNa[count],"X");strcpy(lakAraH[count],"<lakAraH:lqt>");}
\<pft\/\>	{strcpy(gaNa[count],"X");strcpy(lakAraH[count],"<lakAraH:lit>");}
\<cond\/\>	{strcpy(gaNa[count],"X");strcpy(lakAraH[count],"<lakAraH:lqf>");}
\<ben\/\>	{strcpy(gaNa[count],"X");strcpy(lakAraH[count],"<lakAraH:ASIrlif>");}

\<ppr[ ]gana=[0-9]+\/\>\<ac\/\>	{get_gana(yytext+10,gana);strcpy(gaNa[count],gana);strcpy(kqw,"<kqw_prawyayaH:Sawq_lat>"); }
\<ppr[ ]gana=[0-9]+\/\>\<md\/\>	{get_gana(yytext+10,gana);strcpy(gaNa[count],gana);strcpy(kqw,"<kqw_prawyayaH:SAnac_lat>"); }
\<ppr[ ]gana=[0-9]+\/\>\<ps\/\>	{get_gana(yytext+10,gana);strcpy(gaNa[count],gana);strcpy(kqw,"<kqw_prawyayaH:SAnac_lat>"); }

\<abs\/\>	{strcpy(kqw,"<kqw_prawyayaH:kwvA>"); strcpy(vargaH,"avykqw");}
\<inf\/\>	{strcpy(kqw,"<kqw_prawyayaH:wumun>"); strcpy(vargaH,"avykqw");}
\<pfp\/\>1	{strcpy(kqw,"<kqw_prawyayaH:yaw>");} /* This is kqw_nA and not avykqw;  strcpy(vargaH,"avykqw");} printf("found krid pp\n"); Whether it is Nyaw / yaw / kyap ? */
\<pfp\/\>2	{strcpy(kqw,"<kqw_prawyayaH:anIyar>"); /*printf("found krid pp\n"); */}
\<pfp\/\>3	{strcpy(kqw,"<kqw_prawyayaH:wavyaw>"); /*printf("found krid pp\n"); */}
\<pp\/\>	{strcpy(kqw,"<kqw_prawyayaH:kwa>"); /*printf("found krid pp\n");*/}
\<ppa\/\>	{strcpy(kqw,"<kqw_prawyayaH:kwavawu>"); /*printf("found krid pp\n");*/}

\<choice\>	{count++;}

\<\/choice\>	{}
\<morph\>	{}
\<\/morph\>	{}
\<stem\>	{}
\<\/stem\>	{}

\<\/tag\>	{  /* printf("vargaH = %s count = %d",vargaH, count); */
                /*printf("inside close tag\n");*/
                if (debug) {printf("%s\n",ans);}
                   if(strcmp(ans,"")) { strcat(ans,"/");}

                   if(debug) { printf("ans = %s\n",ans);}
		   for(i=0;i<=count;i++) {
                      if(i >= 1) { strcat(ans,"/");}
                      if(!strcmp(vargaH,"nA")) {
                         if(strcmp(iic,"") && (i == 0)){
                           sprintf(tmp,"%s-",iic);
			   strcat(ans,tmp);
                           tmp[0] = '\0';
                         }
                         sprintf(tmp,"%s<vargaH:%s>%s%s%s<level:1>",prati,vargaH,gen[i],vib[i],num[i]);
			 strcat(ans,tmp);
                         tmp[0] = '\0';
                      }
                      else if(!strcmp(vargaH,"KP")) {
                         if(!strcmp(pv,"")){ strcpy(pv,"X");}
                         sprintf(tmp,"%s<upasarga:%s>%s%s%s%s%s%s<gaNaH:%s><level:1>",prati,pv,san,prayogaH[i],lakAraH[i],per[i],num[i],paxI[i],gaNa[i]);
			 strcat(ans,tmp);
                         tmp[0] = '\0';
                      }
                      else if(!strcmp(vargaH,"avy")) {
                         sprintf(tmp,"%s<vargaH:%s><level:1>",prati,vargaH);
			 strcat(ans,tmp);
                         tmp[0] = '\0';
                      }
                      else if(!strcmp(vargaH,"avykqw")) {
                         if(!strcmp(pv,"")){ strcpy(pv,"X");}
                         else if(!strcmp(kqw,"<kqw_prawyayaH:kwvA>")) { 
                             strcpy(kqw,"<kqw_prawyayaH:lyap>");
                         }
                         sprintf(tmp,"%s<upasarga:%s><vargaH:avy>%s%s<level:1>",prati,pv,san,kqw);
			 strcat(ans,tmp);
                         tmp[0] = '\0';
                      }
                      else if(!strcmp(vargaH,"sapUpa")) {
                         sprintf(tmp,"%s<vargaH:%s><lifgam:a><level:1>",word,vargaH);
			 strcat(ans,tmp);
                         tmp[0] = '\0';
                      }
                      else if(!strcmp(vargaH,"kqw_nA")) {
                         if(strcmp(iic,"") && (i == 0)){
                           sprintf(tmp,"%s-",iic);
			   strcat(ans,tmp);
                           tmp[0] = '\0';
                         }
                         if(!strcmp(pv,"")){ strcpy(pv,"X");}
                         sprintf(tmp,"%s<upasarga:%s>%s%s<kqw_pratipadika:%s><vargaH:nA>%s%s%s<level:1>",prati,pv,san,kqw,kqw_prati,gen[i],vib[i],num[i]);
			 strcat(ans,tmp);
                         tmp[0] = '\0';
                      }
                      else if(!strcmp(vargaH,"UNKN")) {
                         sprintf(tmp,"%s",prati);
			 strcat(ans,tmp);
                         tmp[0] = '\0';
                      }
                   if(debug) { printf("i = %d ans = %s\n",i,ans);}
                  }
                  if(!strcmp(vargaH,"avykqw") || !strcmp(vargaH,"kqw_nA") || !strcmp(vargaH,"KP") || !strcmp(vargaH,"nA")){ strcpy(pv,""); strcpy(iic,"");}
                  /*printf("finished tag\n"); */

                    for(i=0;i<10;i++) { 
                      gen[i][0] = '\0';
                      num[i][0] = '\0'; 
                      per[i][0] = '\0'; 
                      vib[i][0] = '\0'; 
                      prayogaH[i][0] = '\0'; 
                      san[0] = '\0'; 
                      lakAraH[i][0] = '\0'; 
                      kqw[0] = '\0'; 
                      kqw_prati[0] = '\0'; 
                      paxI[i][0] = '\0';
                    }
                }
\<\/tags\>	{ if((!strcmp(pv,"")) && (!strcmp(iic,""))){
                     if(word_no == 1) {
                       printf("%d.%d\t%s\t%s\n",
                           word_no,comp_no,word,ans);
                     } else {
                       printf("%d.%d\t%s\t%s\n",
                           word_no,comp_no,word,ans);
                     } 
                  }
                  if(debug) {printf(" finished with tags\n");}
                    for(i=0;i<10;i++) { 
                      gen[i][0] = '\0';
                      num[i][0] = '\0'; 
                      per[i][0] = '\0'; 
                      vib[i][0] = '\0'; 
                      prayogaH[i][0] = '\0'; 
                      san[0] = '\0'; 
                      lakAraH[i][0] = '\0'; 
                      kqw[0] = '\0'; 
                      kqw_prati[0] = '\0'; 
                      paxI[i][0] = '\0';
                    }
                }
\>      { } /*printf("end >\n");*/
.	{}
\n	{ if(debug) {printf(" ignore new line\n");}}
%%
void get_gana();

int main(int argc, char *argv[])
{
extern int count, word_no, comp_no, i;
extern int debug;
extern char word[100], gen[10][20], num[10][20], per[10][20], vargaH[20], pv[20], vib[10][20], prayogaH[10][30], san[40], lakAraH[10][40], kqw[40], kqw_prati[40], prati[40], paxI[10][40], ans[1000], tmp[200], iic[100];

debug = 0;

if(argc == 2) {
  if(index(argv[1],'D')) { 
     printf("debug = 1\n"); 
     debug = 1;
  }
}

comp_no = 1;
word_no = 0;
count = 0;
iic_count = 0;

word[0] = '\0';
vargaH[0] = '\0';
pv[0] = '\0';
prati[0] = '\0';
ans[0] = '\0';
tmp[0] = '\0';
iic[0] = '\0';

for(i=0;i<10;i++) { gen[i][0] = '\0';num[i][0] = '\0'; per[i][0] = '\0'; vib[i][0] = '\0'; prayogaH[i][0] = '\0'; san[0] = '\0'; lakAraH[i][0] = '\0'; kqw[0] = '\0'; kqw_prati[0] = '\0'; paxI[i][0] = '\0';}

return yylex();
}

void get_gana(char gana_id[2], char gana_name[10])
{
/* gana_id = gana_id - 48;  number versus ascii code */
switch (gana_id[0]) {
/*  Special gana values for present forms of secondary conjugations *)
(*i Not clearly needed, since not printed in XML banks - replace by 0 ? i*)
value cau_gana = 12
and   des_gana = 13
and   int_gana = 14  -- comment from Heritage */
  case '1' :  if (gana_id[1] == '0') strcpy(gana_name,"curAxiH");
            else if (gana_id[1] == '1') strcpy(gana_name,"X");
            else if (gana_id[1] == '2') strcpy(gana_name,"X");
            else if (gana_id[1] == '3') strcpy(gana_name,"X");
            else if (gana_id[1] == '4') strcpy(gana_name,"X");
            else strcpy(gana_name,"BvAxiH"); break;
  case '2' : strcpy(gana_name,"axAxiH"); break;
  case '3' : strcpy(gana_name,"juhowyAxiH"); break;
  case '4' : strcpy(gana_name,"xivAxiH"); break;
  case '5' : strcpy(gana_name,"svAxiH"); break;
  case '6' : strcpy(gana_name,"wuxAxiH"); break;
  case '7' : strcpy(gana_name,"ruXAxiH"); break;
  case '8' : strcpy(gana_name,"wanAxiH"); break;
  case '9' : strcpy(gana_name,"kryAxiH"); break;
}
}
