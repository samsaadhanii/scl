%{
#include "typeidentifier.tab.h"
%}
%option nounput
%option noinput
%%
[a-zA-Z]+	{strcpy(yylval.padainfo.word,yytext);return concept;}
	
\n	{ return '\n';}
\<	{ return '<';}
\>	{ return '>';}
\-	{ return '-';}
%%
