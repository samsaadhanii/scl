%{
 char tmp[100],p[50],cat[50],gen[50],num[50],rel[50],san[50];
 char upa[50],dh[50],lakaara[50],prayoga[50],kqw[50],waxXiwa[50];
 int indx, to_indx;
%}
%option nounput
%option noinput

MASC puM
NEUT napuM
FEM swrI
SING eka
DUAL xvi
PLURAL bahu
LIFGA {MASC}|{NEUT}|{FEM}|-
VACANA {SING}|{DUAL}|{PLURAL}
INDEX [0-9]+
PRATIPADIKA [a-zA-Z\-]+
DHATU [a-zA-Z]+[1-5]
UPASARGA [a-zA-Z_]+
WAXXIWA mawup
SAMBANXAH karwA|karma|karaNam|sampraxAnam|apAxAnam|xeSAXikaraNam|kAlAXikaraNam|aXikaraNam|hewuH|prayojanam|pUrvakAlaH|niwya_sambanXaH|anuyogI|prawiyogI|RaRTIsambanXaH|samucciwa|sup_samucciwa|karwqsamAnAXikaraNam|karmasamAnAXikaraNam|sambanXaH|samboXyaH|muKyakarma|gONakarma|kriyAviSeRaNam|prawiReXaH|prayojakakarwA|prayojyakarwA|viRayAXikaraNam|apekRA|varwamAnasamAnakAlaH|sahArWaH|vinArWaH|sanxarBa_binxuH|wulanA_binxuH|samboXanasUcakam
VISERANA viSeRaNam|aBexaH
INTERSENTENTIALRELATION samucciwa
CAT sarva
PRAYOGA karwari|karmaNi|BAve
LAKARA varwamAnaH|anaxyawanaBUwaH|sAmAnyaBUwaH|parokRaBUwaH|anaxyawanaBaviRyakAlaH|sAmAnyaBaviRyakAlaH|AjFAprArWanAxiRu|viXiH|ASIH|kriyAniRpawwO-hewumaxBAve-ca
KQW_N varwamAnasamAnakAlaH|varwamAnasamAnakAlaH-karwari|varwamAnasamAnakAlaH-karmaNi|BaviRyawsamAnakAlaH|BaviRyawsamAnakAlaH-karwari|BaviRyawsamAnakAlaH-karmaNi|pUrvakAlaH|BUwakarwA|BUwakarma|prayojanam|BAvaH1|BAvaH2
KQW_A kwvA|lyap
SANADI san|Nic|yaf|luk|yafluk|san_Nic|Nic_san
SARVA12 asmax|yuRmax
CR \r
NL \n
%%
{INDEX}[ ]{SARVA12}[ ]{CAT}[ ]{VACANA}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}		{
	sprintf(tmp,"%s",yytext);
        indx = 0; p[0] = '\0'; num[0] = '\0';
        rel[0] = '\0'; to_indx = 0;cat[0] = '\0';
	sscanf(tmp,"%d %s %s %s %s %d",&indx,p,cat,num,rel,&to_indx);
	printf("(sup (id %d) (rt %s) (cat %s) (gen a) (num %s) (rel %s) (to_indx %d) )\n",indx,p,cat,num,rel,to_indx);
	}
{INDEX}[ ]{PRATIPADIKA}[ ]{CAT}[ ]{LIFGA}[ ]{VACANA}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}		{
	sprintf(tmp,"%s",yytext);
        indx = 0; p[0] = '\0'; gen[0] = '\0';num[0] = '\0';
        rel[0] = '\0'; to_indx = 0;cat[0] = '\0';
	sscanf(tmp,"%d %s %s %s %s %s %d",&indx,p,cat,gen,num,rel,&to_indx);
	printf("(sup (id %d) (rt %s) (cat %s) (gen %s) (num %s) (rel %s) (to_indx %d) )\n",indx,p,cat,gen,num,rel,to_indx);
	}
{INDEX}[ ]{PRATIPADIKA}[ ]{LIFGA}[ ]{VACANA}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}		{
	sprintf(tmp,"%s",yytext);
        indx = 0; p[0] = '\0'; gen[0] = '\0';num[0] = '\0';
        rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %s %s %s %s %d",&indx,p,gen,num,rel,&to_indx);
	printf("(sup (id %d) (rt %s) (cat -) (gen %s) (num %s) (rel %s) (to_indx %d) )\n",indx,p,gen,num,rel,to_indx);
	}
{INDEX}[ ]{DHATU}[ ]{KQW_N}[ ]{VACANA}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}		{
  // upasarga?dhatu sanaadi?kqw_suff lifga? vacana rel to_indx
  // l0 s0 u0
	sprintf(tmp,"%s",yytext);
        indx = 0; dh[0] = '\0'; kqw[0] = '\0'; 
        num[0] = '\0'; rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %s %s %s %s %d",&indx,dh,kqw,num,rel,&to_indx);
	printf("(kqw (id %d) (upasarga -) (rt %s) (san_suff -) (kqw_suff %s) (gen -) (num %s) (rel %s) (to_indx %d) )\n",indx,dh,kqw,num,rel,to_indx);
    }
{INDEX}[ ]{UPASARGA}\+{DHATU}[ ]{KQW_N}[ ]{VACANA}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}		{
  // l0 s0 u1
	sprintf(tmp,"%s",yytext);
        indx = 0; dh[0] = '\0'; kqw[0] = '\0'; upa[0] = '\0';
        num[0] = '\0'; rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %[^+]+%s %s %s %s %d",&indx,upa,dh,kqw,num,rel,&to_indx);
	printf("(kqw (id %d) (upasarga %s) (rt %s) (san_suff -) (kqw_suff %s) (gen -) (num %s) (rel %s) (to_indx %d) )\n",indx,upa,dh,kqw,num,rel,to_indx);
    }
{INDEX}[ ]{DHATU}[ ]{SANADI}[ ]{KQW_N}[ ]{VACANA}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}		{
  // l0 s1 u0
	sprintf(tmp,"%s",yytext);
        indx = 0; upa[0] = '\0'; dh[0] = '\0'; kqw[0] = '\0'; gen[0] = '\0';
        num[0] = '\0'; rel[0] = '\0'; to_indx = 0; san[0] = '\0';
	sscanf(tmp,"%d %s %s %s %s %s %d",&indx,dh,san,kqw,num,rel,&to_indx);
	printf("(kqw (id %d) (upasarga -) (rt %s) (san_suff %s) (kqw_suff %s) (gen -) (num %s) (rel %s) (to_indx %d) )\n",indx,dh,san,kqw,num,rel,to_indx);
	}
{INDEX}[ ]{UPASARGA}\+{DHATU}[ ]{SANADI}[ ]{KQW_N}[ ]{VACANA}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}		{
  // l0 s1 u1
	sprintf(tmp,"%s",yytext);
        indx = 0; upa[0] = '\0'; dh[0] = '\0'; kqw[0] = '\0'; gen[0] = '\0';
        num[0] = '\0'; rel[0] = '\0'; to_indx = 0; san[0] = '\0';
	sscanf(tmp,"%d %[^+]+%s %s %s %s %s %d",&indx,upa,dh,san,kqw,num,rel,&to_indx);
	printf("(kqw (id %d) (upasarga %s) (rt %s) (san_suff %s) (kqw_suff %s) (gen -) (num %s) (rel %s) (to_indx %d) )\n",indx,upa,dh,san,kqw,num,rel,to_indx);
	}
{INDEX}[ ]{DHATU}[ ]{KQW_N}[ ]{LIFGA}[ ]{VACANA}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}		{
  // l1 s0 u0
	sprintf(tmp,"%s",yytext);
        indx = 0; dh[0] = '\0'; kqw[0] = '\0'; gen[0] = '\0';
        num[0] = '\0'; rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %s %s %s %s %s %d",&indx,dh,kqw,gen,num,rel,&to_indx);
	printf("(kqw (id %d) (upasarga -) (rt %s) (san_suff -) (kqw_suff %s) (gen %s) (num %s) (rel %s) (to_indx %d) )\n",indx,dh,kqw,gen,num,rel,to_indx);
	}
{INDEX}[ ]{UPASARGA}\+{DHATU}[ ]{KQW_N}[ ]{LIFGA}[ ]{VACANA}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}		{
  // l1 s0 u1
	sprintf(tmp,"%s",yytext);
        indx = 0; upa[0] = '\0'; dh[0] = '\0'; kqw[0] = '\0'; gen[0] = '\0';
        num[0] = '\0'; rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %[^+]+%s %s %s %s %s %d",&indx,upa,dh,kqw,gen,num,rel,&to_indx);
	printf("(kqw (id %d) (upasarga %s) (rt %s) (san_suff -) (kqw_suff %s) (gen %s) (num %s) (rel %s) (to_indx %d) )\n",indx,upa,dh,kqw,gen,num,rel,to_indx);
	}
{INDEX}[ ]{DHATU}[ ]{SANADI}[ ]{KQW_N}[ ]{LIFGA}[ ]{VACANA}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}		{
  // l1 s1 u0
	sprintf(tmp,"%s",yytext);
        indx = 0; upa[0] = '\0'; dh[0] = '\0'; kqw[0] = '\0'; gen[0] = '\0';
        num[0] = '\0'; rel[0] = '\0'; to_indx = 0; san[0] = '\0';
	sscanf(tmp,"%d %s %s %s %s %s %s %d",&indx,dh,san,kqw,gen,num,rel,&to_indx);
	printf("(kqw (id %d) (upasarga -) (rt %s) (san_suff %s) (kqw_suff %s) (gen %s) (num %s) (rel %s) (to_indx %d) )\n",indx,dh,san,kqw,gen,num,rel,to_indx);
	}
{INDEX}[ ]{UPASARGA}\+{DHATU}[ ]{SANADI}[ ]{KQW_N}[ ]{LIFGA}[ ]{VACANA}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}		{
  // l1 s1 u1
	sprintf(tmp,"%s",yytext);
        indx = 0; upa[0] = '\0'; dh[0] = '\0'; kqw[0] = '\0'; gen[0] = '\0';
        num[0] = '\0'; rel[0] = '\0'; to_indx = 0; san[0] = '\0';
	sscanf(tmp,"%d %[^+]+%s %s %s %s %s %s %d",&indx,upa,dh,san,kqw,gen,num,rel,&to_indx);
	printf("(kqw (id %d) (upasarga %s) (rt %s) (san_suff %s) (kqw_suff %s) (gen %s) (num %s) (rel %s) (to_indx %d) )\n",indx,upa,dh,san,kqw,gen,num,rel,to_indx);
	}
{INDEX}[ ]{DHATU}[ ]{KQW_N}[ ]{LIFGA}[ ]{VACANA}{CR}?{NL}		{
  // l1 s0 u0 no rel
	sprintf(tmp,"%s",yytext);
        indx = 0; dh[0] = '\0'; kqw[0] = '\0'; gen[0] = '\0';
        num[0] = '\0'; 
	sscanf(tmp,"%d %s %s %s %s",&indx,dh,kqw,gen,num);
	printf("(kqw (id %d) (upasarga -) (rt %s) (san_suff -) (kqw_suff %s) (gen %s) (num %s) (rel -) (to_indx 0) )\n",indx,dh,kqw,gen,num);
	}
{INDEX}[ ]{UPASARGA}\+{DHATU}[ ]{KQW_N}[ ]{LIFGA}[ ]{VACANA}{CR}?{NL}		{
  // l1 s0 u1 no rel
	sprintf(tmp,"%s",yytext);
        indx = 0; upa[0] = '\0'; dh[0] = '\0'; kqw[0] = '\0'; gen[0] = '\0';
        num[0] = '\0'; 
	sscanf(tmp,"%d %[^+]+%s %s %s %s",&indx,upa,dh,kqw,gen,num);
	printf("(kqw (id %d) (upasarga %s) (rt %s) (san_suff -) (kqw_suff %s) (gen %s) (num %s) (rel -) (to_indx 0) )\n",indx,upa,dh,kqw,gen,num);
	}
{INDEX}[ ]{DHATU}[ ]{SANADI}[ ]{KQW_N}[ ]{LIFGA}[ ]{VACANA}{CR}?{NL}		{
  // l1 s1 u0 no rel
	sprintf(tmp,"%s",yytext);
        indx = 0; upa[0] = '\0'; dh[0] = '\0'; kqw[0] = '\0'; gen[0] = '\0';
        num[0] = '\0'; san[0] = '\0';
	sscanf(tmp,"%d %s %s %s %s %s",&indx,dh,san,kqw,gen,num);
	printf("(kqw (id %d) (upasarga -) (rt %s) (san_suff %s) (kqw_suff %s) (gen %s) (num %s) (rel -) (to_indx 0) )\n",indx,dh,san,kqw,gen,num);
	}
{INDEX}[ ]{UPASARGA}\+{DHATU}[ ]{SANADI}[ ]{KQW_N}[ ]{LIFGA}{CR}?{NL}		{
  // l1 s1 u1 no rel
	sprintf(tmp,"%s",yytext);
        indx = 0; upa[0] = '\0'; dh[0] = '\0'; kqw[0] = '\0'; gen[0] = '\0';
        num[0] = '\0'; san[0] = '\0';
	sscanf(tmp,"%d %[^+]+%s %s %s %s %s",&indx,upa,dh,san,kqw,gen,num);
	printf("(kqw (id %d) (upasarga %s) (rt %s) (san_suff %s) (kqw_suff %s) (gen %s) (num %s) (rel -) (to_indx 0) )\n",indx,upa,dh,san,kqw,gen,num);
	}
{INDEX}[ ]{UPASARGA}\+{DHATU}[ ]{SANADI}[ ]{KQW_N}[ ]{VISERANA}[ ]{INDEX}{CR}?{NL}		{
  // s1 u1 s:sanaadi u: upasarga
	sprintf(tmp,"%s",yytext);
        indx = 0; upa[0] = '\0'; dh[0] = '\0'; kqw[0] = '\0';
        rel[0] = '\0'; to_indx = 0; san[0] = '\0';
	sscanf(tmp,"%d %[^+]+%s %s %s %s %d",&indx,upa,dh,san,kqw,rel,&to_indx);
	printf("(kqw_viSeRaNa (id %d) (upasarga %s) (rt %s) (san_suff %s) (kqw_suff %s) (rel %s) (to_indx %d) )\n",indx,upa,dh,san,kqw,rel,to_indx);
	}
{INDEX}[ ]{DHATU}[ ]{SANADI}[ ]{KQW_N}[ ]{VISERANA}[ ]{INDEX}{CR}?{NL}		{
  // s1 u0 s:sanaadi u: upasarga
	sprintf(tmp,"%s",yytext);
        indx = 0; dh[0] = '\0'; kqw[0] = '\0'; 
        rel[0] = '\0'; to_indx = 0; san[0] = '\0';
	sscanf(tmp,"%d %s %s %s %s %d",&indx,dh,san,kqw,rel,&to_indx);
	printf("(kqw_viSeRaNa (id %d) (upasarga -) (rt %s) (san_suff %s) (kqw_suff %s) (rel %s) (to_indx %d) )\n",indx,dh,san,kqw,rel,to_indx);
	}
{INDEX}[ ]{UPASARGA}\+{DHATU}[ ]{KQW_N}[ ]{VISERANA}[ ]{INDEX}{CR}?{NL}		{
  // s0 u1 s:sanaadi u: upasarga
	sprintf(tmp,"%s",yytext);
        indx = 0; upa[0] = '\0'; dh[0] = '\0'; kqw[0] = '\0';
        rel[0] = '\0'; to_indx = 0; san[0] = '\0';
	sscanf(tmp,"%d %[^+]+%s %s %s %d",&indx,upa,dh,kqw,rel,&to_indx);
	printf("(kqw_viSeRaNa (id %d) (upasarga %s) (rt %s) (san_suff -) (kqw_suff %s) (rel %s) (to_indx %d) )\n",indx,upa,dh,kqw,rel,to_indx);
	}
{INDEX}[ ]{DHATU}[ ]{KQW_N}[ ]{VISERANA}[ ]{INDEX}{CR}?{NL}	{
  // s0 u0 s:sanaadi u: upasarga
	sprintf(tmp,"%s",yytext);
        indx = 0; dh[0] = '\0'; 
        rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %s %s %s %d",&indx,dh,kqw,rel,&to_indx);
	printf("(kqw_viSeRaNa (id %d) (upasarga -) (rt %s) (san_suff -) (kqw_suff %s) (rel %s) (to_indx %d) )\n",indx,dh,kqw,rel,to_indx);
	}
{INDEX}[ ]{PRATIPADIKA}[ ]{WAXXIWA}[ ]{LIFGA}[ ]{VACANA}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}		{
	sprintf(tmp,"%s",yytext);
        indx = 0; p[0] = '\0'; waxXiwa[0] = '\0'; gen[0] = '\0';
        num[0] = '\0'; rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %s %s %s %s %s %d",&indx,p,waxXiwa,gen,num,rel,&to_indx);
	printf("(waxXiwa (id %d) (rt %s) (waxXiwa_suff %s) (gen %s) (num %s) (rel %s) (to_indx %d) )\n",indx,p,waxXiwa,gen,num,rel,to_indx);
	}
{INDEX}[ ]{UPASARGA}\+{DHATU}[ ]{SANADI}[ ]{PRAYOGA}[ ]{LAKARA}{CR}?{NL} {
  // san upasarga s u
  // u1 s1
	sprintf(tmp,"%s",yytext);
        indx = 0; upa[0] = '\0'; dh[0] = '\0'; san[0] = '\0'; 
        prayoga[0] = '\0'; lakaara[0] = '\0'; 
	sscanf(tmp,"%d %[^+]+%s %s %s %s",&indx,upa,dh,san,prayoga,lakaara);
	printf("(wif (id %d) (upasarga %s) (rt %s) (san_suff %s) (prayoga %s) (lakAra %s) (rel -) (to_indx 0))\n",indx,upa,dh,san,prayoga,lakaara);
	}
{INDEX}[ ]{DHATU}[ ]{SANADI}[ ]{PRAYOGA}[ ]{LAKARA}{CR}?{NL}	{
  // u0 s1
	sprintf(tmp,"%s",yytext);
        indx = 0;  dh[0] = '\0'; san[0] = '\0';
        prayoga[0] = '\0'; lakaara[0] = '\0';
	sscanf(tmp,"%d %s %s %s %s",&indx,dh,san,prayoga,lakaara);
	printf("(wif (id %d) (upasarga -) (rt %s) (san_suff %s) (prayoga %s) (lakAra %s) (rel -) (to_indx 0))\n",indx,dh,san,prayoga,lakaara);
	}
{INDEX}[ ]{UPASARGA}\+{DHATU}[ ]{PRAYOGA}[ ]{LAKARA}{CR}?{NL}	{
  // u1 s0
	sprintf(tmp,"%s",yytext);
        indx = 0; upa[0] = '\0'; dh[0] = '\0'; 
        prayoga[0] = '\0'; lakaara[0] = '\0';
	sscanf(tmp,"%d %[^+]+%s %s %s",&indx,upa,dh,prayoga,lakaara);
	printf("(wif (id %d) (upasarga %s) (rt %s) (san_suff -) (prayoga %s) (lakAra %s) (rel -) (to_indx 0))\n",indx,upa,dh,prayoga,lakaara);
	}
{INDEX}[ ]{DHATU}[ ]{PRAYOGA}[ ]{LAKARA}{CR}?{NL}	{
  // u0 s0
	sprintf(tmp,"%s",yytext);
        indx = 0;  dh[0] = '\0'; 
        prayoga[0] = '\0'; lakaara[0] = '\0';
	sscanf(tmp,"%d %s %s %s",&indx,dh,prayoga,lakaara);
	printf("(wif (id %d) (upasarga -) (rt %s) (san_suff -) (prayoga %s) (lakAra %s) (rel -) (to_indx 0))\n",indx,dh,prayoga,lakaara);
	}
{INDEX}[ ]{UPASARGA}\+{DHATU}[ ]{SANADI}[ ]{PRAYOGA}[ ]{LAKARA}{INTERSENTENTIALRELATION}[ ]{INDEX}{CR}?{NL}	{
  // san upasarga s u
  // u1 s1
	sprintf(tmp,"%s",yytext);
        indx = 0; upa[0] = '\0'; dh[0] = '\0'; san[0] = '\0';
        prayoga[0] = '\0'; lakaara[0] = '\0'; rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %[^+]+%s %s %s %s %s %d",&indx,upa,dh,san,prayoga,lakaara,rel,&to_indx);
	printf("(wif (id %d) (upasarga %s) (rt %s) (san_suff %s) (prayoga %s) (lakAra %s) (rel %s) (to_indx %d))\n",indx,upa,dh,san,prayoga,lakaara,rel,to_indx);
	}
{INDEX}[ ]{DHATU}[ ]{SANADI}[ ]{PRAYOGA}[ ]{LAKARA}[ ]{INTERSENTENTIALRELATION}[ ]{INDEX}{CR}?{NL}	{
  // u0 s1
	sprintf(tmp,"%s",yytext);
        indx = 0;  dh[0] = '\0'; san[0] = '\0';
        prayoga[0] = '\0'; lakaara[0] = '\0'; rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %s %s %s %s %s %d",&indx,dh,san,prayoga,lakaara,rel,&to_indx);
	printf("(wif (id %d) (upasarga -) (rt %s) (san_suff %s) (prayoga %s) (lakAra %s) (rel %s) (to_indx %d))\n",indx,dh,san,prayoga,lakaara,rel,to_indx);
	}
{INDEX}[ ]{UPASARGA}\+{DHATU}[ ]{PRAYOGA}[ ]{LAKARA}[ ]{INTERSENTENTIALRELATION}[ ]{INDEX}{CR}?{NL}	{
  // u1 s0
	sprintf(tmp,"%s",yytext);
        indx = 0; upa[0] = '\0'; dh[0] = '\0'; 
        prayoga[0] = '\0'; lakaara[0] = '\0';rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %[^+]+%s %s %s %s %d",&indx,upa,dh,prayoga,lakaara,rel,&to_indx);
	printf("(wif (id %d) (upasarga %s) (rt %s) (san_suff -) (prayoga %s) (lakAra %s) (rel %s) (to_indx %d))\n",indx,upa,dh,prayoga,lakaara,rel,to_indx);
	}
{INDEX}[ ]{DHATU}[ ]{PRAYOGA}[ ]{LAKARA}[ ]{INTERSENTENTIALRELATION}[ ]{INDEX}{CR}?{NL}	{
  // u0 s0
	sprintf(tmp,"%s",yytext);
        indx = 0;  dh[0] = '\0'; 
        prayoga[0] = '\0'; lakaara[0] = '\0';rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %s %s %s %s %d",&indx,dh,prayoga,lakaara,rel,&to_indx);
	printf("(wif (id %d) (upasarga -) (rt %s) (san_suff -) (prayoga %s) (lakAra %s) (rel %s) (to_indx %d))\n",indx,dh,prayoga,lakaara,rel,to_indx);
	}
{INDEX}[ ]{DHATU}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}	{
   // upasarga san u s
   // u0 s0
	sprintf(tmp,"%s",yytext);
        indx = 0; dh[0] = '\0'; 
        rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %s %s %d",&indx,dh,rel,&to_indx);
	printf("(avykqw (id %d) (upasarga -) (rt %s) (san_suff -) (kqw_suff -) (rel %s) (to_indx %d) )\n",indx,dh,rel,to_indx);
	}
{INDEX}[ ]{DHATU}[ ]{SANADI}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}	{
   // u0 s1
	sprintf(tmp,"%s",yytext);
        indx = 0; dh[0] = '\0'; 
        rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %s %s %s %d",&indx,dh,san,rel,&to_indx);
	printf("(avykqw (id %d) (upasarga -) (rt %s) (san_suff %s) (kqw_suff -) (rel %s) (to_indx %d) )\n",indx,dh,san,rel,to_indx);
	}
{INDEX}[ ]{UPASARGA}\+{DHATU}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}	{
   // u1 s0
	sprintf(tmp,"%s",yytext);
        indx = 0; dh[0] = '\0'; upa[0] = '\0';
        rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %[^+]+%s %s %d",&indx,upa,dh,rel,&to_indx);
	printf("(avykqw (id %d) (upasarga %s) (rt %s) (san_suff -) (kqw_suff -) (rel %s) (to_indx %d) )\n",indx,upa,dh,rel,to_indx);
	}
{INDEX}[ ]{UPASARGA}\+{DHATU}[ ]{SANADI}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}	{
   // u1 s1
	sprintf(tmp,"%s",yytext);
        indx = 0; dh[0] = '\0'; upa[0] = '\0';san[0] = '\0';
        rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %[^+]+%s %s %s %d",&indx,upa,dh,san,rel,&to_indx);
	printf("(avykqw (id %d) (upasarga %s) (rt %s) (san_suff %s) (kqw_suff -) (rel %s) (to_indx %d) )\n",indx,upa,dh,san,rel,to_indx);
	}
{INDEX}[ ]{PRATIPADIKA}[ ]{VISERANA}[ ]{INDEX}{CR}?{NL}	{
	sprintf(tmp,"%s",yytext);
        indx = 0; p[0] = '\0'; 
        rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %s %s %d",&indx,p,rel,&to_indx);
	printf("(sup_viSeRaNa (id %d) (rt %s) (rel %s) (to_indx %d) )\n",indx,p,rel,to_indx);
	}
{INDEX}[ ]{PRATIPADIKA}[ ]{SAMBANXAH}[ ]{INDEX}{CR}?{NL}	{
	sprintf(tmp,"%s",yytext);
        indx = 0; p[0] = '\0'; 
        rel[0] = '\0'; to_indx = 0;
	sscanf(tmp,"%d %s %s %d",&indx,p,rel,&to_indx);
	printf("(avy (id %d) (rt %s) (rel %s) (to_indx %d) )\n",indx,p,rel,to_indx);
	}
%%
int main (int argc, char *argv[]) {
 yylex();
 return 1;
}
