%option noinput
%option nounput
 char word[1000];
 int word_no, comp_no;
%%
[a-zA-Z0-9]+/\-		{ 
		   	   strcpy(word,yytext); 
		  	   strcat(word,"-"); 
			   printf("%d.%d\t%s\n",word_no,comp_no,word); 
		  	   comp_no++;
                	}
[a-zA-Z0-9]+/[\. \n]	{ 
		   	   strcpy(word,yytext); 
			   printf("%d.%d\t%s\n",word_no,comp_no,word); 
                      	   word_no++;
		  	   comp_no = 1;
                        }
\-[a-zA-Z0-9]+/\-	{ 
		   	   strcpy(word,yytext); 
		  	   strcat(word,"-"); 
			   printf("%d.%d\t%s\n",word_no,comp_no,word); 
		  	   comp_no++;
                	}
\-[a-zA-Z0-9]+/[\. \n]	{ 
		   	   strcpy(word,yytext); 
			   printf("%d.%d\t%s\n",word_no,comp_no,word); 
                      	   word_no++;
		  	   comp_no = 1;
                        }

\.			{  
			   printf("%d.%d\t.\n",word_no,comp_no); 
                      	   word_no = 1; 
		  	   comp_no = 1;
               		}
[ \n]			{}
,			{  
			   printf("%d.%d\t,\n",word_no,comp_no); 
                      	   word_no++;
		  	   comp_no = 1;
               		}
.			{  printf("Error %s\n",yytext);}
%%
int word_no = 1;
int comp_no = 1;

int main(){
   yylex();
  return 1;
}
