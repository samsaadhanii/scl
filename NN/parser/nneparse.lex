%{
#include "nneparse.tab.h"
%}
%option noinput
%option nounput
%%
niRTa|vqwwi|avacCinna|nirUpiwa|nirUpaka|avacCexaka|ASraya|SAl[iI]|vaw|vawI|vawyaH|vAn|ka	{strcpy(yylval.nodeinfo.token,yytext);return sambanXaH;}
[^-\n]+	{strcpy(yylval.nodeinfo.token,yytext);return concept;}
\n	{ return '\n';}
\-	{ return '-';}
%%
