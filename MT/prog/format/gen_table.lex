%option noinput
%option nounput
 char pre_tag[10];
 char post_tag[10];
 char word[1000];
 int word_no, sent_no, new_line;
%%
[a-zA-Z0-9\-]+		{ 
			   strcpy(word,yytext); word_no++;
                        }
[^a-zA-Z0-9 \t\n<>\-]+/[a-zA-Z0-9]	{ strcat(pre_tag,yytext);}
\<s\>			{
				strcat(pre_tag,"<s>");
                                word_no = 0; 
                                sent_no++;
                        }
[^a-zA-Z0-9 \t\n<>\-]+	{ strcat(post_tag,yytext);}
\<\/s\>			{
			     strcat(post_tag,"</s>");
                             new_line = 1;
			}
[ \t\n]+	{ printf("%d.%d\t%s\t%s\t%s\n",sent_no,word_no,pre_tag,word,post_tag); 
		  if(new_line) { printf("\n"); new_line = 0;}
		  pre_tag[0] = '\0'; 
		  post_tag[0] = '\0'; 
		}
.		{ printf("Error %s\n",yytext);}
%%
int word_no = 0;
int sent_no = 0;
int new_line = 0;

int main(){
   yylex();
  return 1;
}
