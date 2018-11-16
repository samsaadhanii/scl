%union {
struct node{
char token[1000];
int level;
int next_level;
int head;
} nodeinfo;
}
%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

struct termstruct{
char word[1000];
char type[10];
int level;
} terminfo[100];

struct relstruct{
 char relname[100];
 int from;
 int to;
 int level;
} relinfo[200];

int T_counter;
int rel_counter;
int i,j,k,found,min,max;
extern int debug, cg_or_real;
extern int getmin(), getmax();
extern char level[10][100];
int yylex();
int yyerror();
%}
%token <nodeinfo> sambanXaH
%token <nodeinfo> concept

%type <nodeinfo> NNE
%type <nodeinfo> compoundC
%type <nodeinfo> compoundR
%type <nodeinfo> concept_term
%type <nodeinfo> rel_term
%%
examples: example 
        | examples example
        ;

example: NNE '\n' {
                               printf("@digraph @G\n{\n");
                               printf("@labelfloat=@true;\n");
                               max = 1;
			       for(i=1;i<=T_counter;i++){
                                 j = terminfo[i].level;
                                 if (j > max) max = j;
                                 sprintf(level[j],"%s @Node%d",level[j],i); 
                               }
			       for(i=1;i<T_counter;i++){
                                  printf("@Node%d\t[@label=\"%s (%d)\" ",i,terminfo[i].word,i);
                                  printf("@fontcolor=\"@red\" @shape = \"@box\" ]\n");
                               }
			       for(i=1;i<rel_counter;i++){
				   if(cg_or_real == 2) {
                                      printf("@Node%d -> @Node%d [@label=%s]\n",relinfo[i].from,relinfo[i].to,relinfo[i].relname);
				   }
				   if(cg_or_real == 1) {
                                       printf("@Node%da\t[@label=\"%s \" ",i,relinfo[i].relname);
                                       printf("@fontcolor=\"@blue\" @shape = \"@oval\" ]\n");
                                       printf("@Node%d -> @Node%da \n",relinfo[i].from,i);
                                       printf("@Node%da -> @Node%d \n",i,relinfo[i].to);
                                       j = relinfo[i].level;
                                       if (j > max) max = j;
                                       sprintf(level[j],"%s @Node%da",level[j],i); 
				   }
                               }
                   
			       for(j=1;j<=max;j++){
                               printf("%d [@style=@invis]\n",j);
                               }
                               printf("{ ");
			       for(j=1;j<max;j++){
                               printf("%d ->",j);
                               }
                               printf("%d",j);
                               printf(" [@style=@invis]\n}\n");
			       for(j=1;j<=max;j++){
                                 printf("{@rank=@same %d %s}\n",j,level[j]);
                               }

		  	       printf("@rankdir=@TB}\n");
			       T_counter=1;
			       rel_counter=1;
				
                             }
       ;

NNE: compoundC	{
                        $$.head = $1.head;
                        $$.level = $1.level;
		}
   ;

compoundC: '<' compoundR '-' concept_term '>' {
			 	relinfo[rel_counter].from = $2.head;
			 	relinfo[rel_counter].to = $4.head;
				strcpy(relinfo[rel_counter].relname,$2.token);
				relinfo[rel_counter].level=$2.level;
	 			rel_counter++; 

				$$.head = $4.head;
				$$.level = $4.level;
				}
	 | '<' concept_term '-' concept_term '>' {
			 	relinfo[rel_counter].from = $2.head;
			 	relinfo[rel_counter].to = $4.head;
                                strcpy(relinfo[rel_counter].relname,"@R");
	 			rel_counter++; 

				$$.head = $4.head;
				$$.level = $4.level;
				}
        ;

compoundR: '<' concept_term '-' rel_term '>'	{ 
				$$.head = $2.head;
				strcpy($$.token,$4.token);
			        $$.level = $4.level;
			        }
        ;

concept_term: NNE	{
			 $$.head = $1.head;
			 if(debug) { printf("NNE\n");fflush(stdout);} 
			}
	    | concept	{ 
			 strcpy(terminfo[T_counter].word,$1.token);
			 strcpy(terminfo[T_counter].type,"concept");
			 terminfo[T_counter].level=$1.level;
		         $$.level = terminfo[T_counter].level;
			 $1.head = T_counter;
			 T_counter++;

			 $$.head = $1.head;

			 if(debug) {printf("concept_term = %s pos = %d type = concept\n",$1.token,T_counter);fflush(stdout);}
			}
	    ;

rel_term: sambanXaH	{
			 strcpy($$.token,$1.token);
			 $$.head = $1.head;
			 $$.level = $1.level;

			 if(debug) {printf("relation = %s pos = %d type = relation\n",$1.token,T_counter);fflush(stdout);}
			}
	    ;
%%
#include <stdio.h>
#include <stdlib.h>

int debug;
int cg_or_real;
char level[10][100];
int yyerror(char *s) {
        fprintf(stderr,"%s\n",s);
        return (0);
}

int main(int argc, char *argv[]){
  T_counter = 1;
  rel_counter = 1;
  min = 1;
  max = 3;
  debug = 0;
  cg_or_real = 2; 
 /* By default it produces a graph that is close to reality.
   cg(C) = 1; real(R) = 2 */
 /* Usage: nne2diagram.out [DCR] */
  if(argc > 1) {
     if(index(argv[1],'D')) debug=1;
     if(index(argv[1],'C')) cg_or_real=1;
     if(index(argv[1],'R')) cg_or_real=2;
  }
  yyparse();
  return 1;
}

int getmin(int a,int b){
	if(b > 0) {
	  if(a > b) { a = b;}
	}
return a;
}
int getmax(int a,int b){
	if(b > 0) {
	  if(a < b) { a = b;}
        }
return a;
}
