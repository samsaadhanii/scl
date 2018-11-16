%{
#include "nne2diagram.tab.h"
int type;
%}
%option noinput
%option nounput
%x LEVEL
%%
niRTa	{strcpy(yylval.nodeinfo.token,yytext);return sambanXaH;}
vqwwi	{strcpy(yylval.nodeinfo.token,yytext);return sambanXaH;}
avacCinna	{strcpy(yylval.nodeinfo.token,yytext);return sambanXaH;}
nirUpiwa	{strcpy(yylval.nodeinfo.token,yytext);return sambanXaH;}
nirUpaka	{strcpy(yylval.nodeinfo.token,yytext);return sambanXaH;}
avacCexaka	{strcpy(yylval.nodeinfo.token,yytext);return sambanXaH;}
ASraya	{strcpy(yylval.nodeinfo.token,yytext);return sambanXaH;}
SAl[iI]|vaw|vawI|vawyaH|vAn	{strcpy(yylval.nodeinfo.token,"vaw");return sambanXaH;}
ka	{strcpy(yylval.nodeinfo.token,"ka");return sambanXaH;}
aBexa	{strcpy(yylval.nodeinfo.token,"aBexa");return sambanXaH;}
[a-zA-Z]+wva	{strcpy(yylval.nodeinfo.token,yytext);yylval.nodeinfo.level=3;return concept;}
[a-zA-Z]+wA	{strcpy(yylval.nodeinfo.token,yytext);yylval.nodeinfo.level=3;return concept;}
[a-zA-Z]+	{strcpy(yylval.nodeinfo.token,yytext);yylval.nodeinfo.level=1;return concept;}

niRTa:/[0-9]	{yytext[yyleng-1] = '\0'; strcpy(yylval.nodeinfo.token,yytext); type=sambanXaH ; BEGIN LEVEL;}
vqwwi:/[0-9]	{yytext[yyleng-1] = '\0'; strcpy(yylval.nodeinfo.token,yytext); type=sambanXaH ;BEGIN LEVEL;}
avacCinna:/[0-9]	{yytext[yyleng-1] = '\0'; strcpy(yylval.nodeinfo.token,yytext); type=sambanXaH ;BEGIN LEVEL;}
nirUpiwa:/[0-9]	{yytext[yyleng-1] = '\0'; strcpy(yylval.nodeinfo.token,yytext); type=sambanXaH ;BEGIN LEVEL;}
nirUpaka:/[0-9]	{yytext[yyleng-1] = '\0'; strcpy(yylval.nodeinfo.token,yytext); type=sambanXaH ;BEGIN LEVEL;}
avacCexaka:/[0-9]	{yytext[yyleng-1] = '\0'; strcpy(yylval.nodeinfo.token,yytext); type=sambanXaH ;BEGIN LEVEL;}
ASraya:/[0-9]	{yytext[yyleng-1] = '\0'; strcpy(yylval.nodeinfo.token,yytext); type=sambanXaH;BEGIN LEVEL;}
SAl[iI]:|vaw:|vawI:|vawyaH:|vAn:/[0-9]	{yytext[yyleng-1] = '\0'; strcpy(yylval.nodeinfo.token,"vaw"); type=sambanXaH ;BEGIN LEVEL;}
ka:/[0-9]	{yytext[yyleng-1] = '\0'; strcpy(yylval.nodeinfo.token,"ka"); type=sambanXaH ;BEGIN LEVEL;}
aBexa:/[0-9]	{yytext[yyleng-1] = '\0'; strcpy(yylval.nodeinfo.token,"aBexa"); type=sambanXaH ;BEGIN LEVEL;}

[a-zA-Z]+wva:/[0-9]	{yytext[yyleng-1] = '\0';strcpy(yylval.nodeinfo.token,yytext); type=concept; BEGIN LEVEL;}
[a-zA-Z]+wA:/[0-9]	{yytext[yyleng-1] = '\0';strcpy(yylval.nodeinfo.token,yytext); type=concept; BEGIN LEVEL;}
[a-zA-Z]+:/[0-9]	{yytext[yyleng-1] = '\0';strcpy(yylval.nodeinfo.token,yytext); type=concept; BEGIN LEVEL;}
<LEVEL>[0-9]+		{yylval.nodeinfo.level=atoi(yytext); BEGIN INITIAL; return type;}
\n	{ return '\n';}
\<	{ return '<';}
\>	{ return '>';}
\-	{ return '-';}
%%
