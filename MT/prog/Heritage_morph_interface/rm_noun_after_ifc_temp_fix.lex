 char word[100];
 char old_word[100];
%x SKIP
%%
morph: 	{}
\<form[ ]wx=\"[^\"]+/\"	{ strcpy(word,yytext+10); 
		 	  if(!strcmp(word,old_word)) { BEGIN SKIP;}
                          else {printf("%s",yytext);}
			}

\<entry[ ]wx=\"[^\"]+/\"	{ 
                          printf("%s",yytext);
				}

\<tags[ ]phase=\"noun\"\>	{ printf("%s",yytext);
				}
\<tags[ ]phase=\"iic\"\>	{ printf("%s",yytext);
				}
\<tags[ ]phase=\"ifc\"\>	{ printf("%s",yytext);
				  strcpy(old_word,word);
				}
<SKIP>\<form[ ]wx=\"[^\"]+/\"	{ strcpy(word,yytext+10); 
				  printf("%s",yytext);
                                  BEGIN INITIAL;
			        }
<SKIP>.	{}
<SKIP>\n	{}
.	{printf("%c",yytext[0]);}
\n	{printf("%c",yytext[0]);}
%%
int main(int argc, char *argv[])
{
return yylex();
}
