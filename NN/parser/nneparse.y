%union {
struct node{
char token[1000];
} nodeinfo;
}
%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

struct termstruct{
char word[1000];
char type[10];
char pratiyogin[10];
char anuyogin[100];
} terminfo[100];

int counter,i,relation_found;
char tmp[100];
extern int debug;

int yylex();
int yyerror();
%}

%token <nodeinfo> sambanXaH
%token <nodeinfo> concept

%type <nodeinfo> terms
%type <nodeinfo> TC
%type <nodeinfo> TR
%%
examples: example 
        | examples example
        ;

example: terms '\n' {
			        for(i=1;i<counter;i++){
                                  printf("@%s\t",terminfo[i].type);
                                  printf("%s\t",terminfo[i].word);
                                  printf("%d\t",i);
		                  //if(!strcmp(terminfo[i].type,"relation")){
		                  if(strcmp(terminfo[i].pratiyogin,"")){
                                      printf("%s\t",terminfo[i].pratiyogin);
                                  } else { printf("-\t");}
		                  //if(!strcmp(terminfo[i].type,"relation")){
		                  if(strcmp(terminfo[i].anuyogin,"")){
                                     printf("%s\n",terminfo[i].anuyogin+1);
                                  // first char is ',', to ignore it, we start printing from +1 position
			          } else { printf("-\n");}
                                }
                    }
       ;
terms: terms '-' TR
     | terms '-' TC
     | TC
     ;

TC: concept {	strcpy(terminfo[counter].word,$1.token);
		strcpy(terminfo[counter].type,"concept");
		sprintf(tmp,"%d",counter);
		for(i=1;i<counter;i++){
		    if(!strcmp(terminfo[i].type,"relation")){
		        strcat(terminfo[i].anuyogin,",");
		        strcat(terminfo[i].anuyogin,tmp);
		    }
		}
                if(!strcmp(terminfo[counter-1].type,"concept")) {
		    sprintf(tmp,"%d",counter-1);
		    strcat(terminfo[counter-1].pratiyogin,tmp);
                }
		counter++;
	     }
   ;
TR: sambanXaH {
		    strcpy(terminfo[counter].word,$1.token);
		    strcpy(terminfo[counter].type,"relation");
		    sprintf(tmp,"%d",counter-1);
		    strcat(terminfo[counter].pratiyogin,tmp);
		    counter++; 
	    }
   ;
%%
#include <stdio.h>
#include <stdlib.h>

int debug;
int yyerror(char *s) {
        fprintf(stderr,"%s\n",s);
        return (0);
}

int main(int argc, char *argv[]){
  counter = 1;
  for(i=1;i<100;i++){
    strcpy(terminfo[i].anuyogin,"");
    strcpy(terminfo[i].pratiyogin,"");
  }
  debug = 0;
  if(argc > 1) {
     if(index(argv[1],'D')) debug=1;
  }
  yyparse();
  return 1;
}
