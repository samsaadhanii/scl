%union {
struct node{
char word[2000];
char head[100];
} padainfo;
}

%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
char type[10];

int yylex();
int yyerror();
%}

%token <padainfo> niRTa
%token <padainfo> vqwwi
%token <padainfo> nirUpiwa
%token <padainfo> nirUpaka
%token <padainfo> avacCinna
%token <padainfo> avacCexaka
%token <padainfo> aBAva
%token <padainfo> concept

%type <padainfo> compound
%type <padainfo> Ppada
%type <padainfo> Upada
%type <padainfo> pada
%type <padainfo> example
%%
examples: example 
        | examples example
        ;

example: compound '\n' { printf("%s \n",$1.word); }
       ;

compound	: Ppada '-' Upada	{
                                         strcpy(type,"@R");
					 if(!strcmp($1.head,"niRTa")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"vqwwi")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"nirUpiwa")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"nirUpaka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"avacCinna")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"avacCexaka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"rahiwa")) strcpy(type,"@T6");
					 if(!strcmp($1.head,"eka")) strcpy(type,"@Tds");
					 if(!strcmp($1.head,"xvi")) strcpy(type,"@Tds");
					 if(!strcmp($1.head,"wri")) strcpy(type,"@Tds");
					 if(!strcmp($1.head,"cawur")) strcpy(type,"@Tds");
					 if(!strcmp($1.head,"paFca")) strcpy(type,"@Tds");
					 if(!strcmp($1.head,"Rat")) strcpy(type,"@Tds");
					 if(!strcmp($1.head,"sapwa")) strcpy(type,"@Tds");
					 if(!strcmp($1.head,"aRta")) strcpy(type,"@Tds");
					 if(!strcmp($1.head,"nava")) strcpy(type,"@Tds");
					 if(!strcmp($1.head,"xaSa")) strcpy(type,"@Tds");
					 if(!strcmp($1.head,"Sawa")) strcpy(type,"@Tds");
					 if(!strcmp($1.head,"sahasra")) strcpy(type,"@Tds");
					 if(!strcmp($1.head,"viXa")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"Awmaka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"ukwa")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"janya")) strcpy(type,"@T5");
					 if(!strcmp($1.head,"anukUla")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"AXAraka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"aXikaraNaka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"kAryaka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"kAraNaka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"viSeRyaka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"viSeRaNaka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"prakAraka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"saMsargaka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"saMsargika")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"viRayaka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"viRayika")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"lakRyaka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"lakRaNaka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"vqwwika")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"sAmAnyIya")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"aBAvIya")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"aXikaraNIya")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"prawiyogiwAka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"anuyogiwAka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"AXeyawAka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"AXArawAka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"aXikaraNawAka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"kAryawAka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"kAraNawAka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"viSeRyawAka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"viSeRaNawAka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"prakArawAka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"saMsargawAka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"saMsargiwAka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"viRayawAka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"viRayiwAka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"lakRyawAka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"lakRaNawAka")) strcpy(type,"@K1");
					 if(!strcmp($1.head,"vqwwiwAka")) strcpy(type,"@K1");
					 					 
					 
					 
					 
					 if(!strcmp($3.head,"niRTa")) strcpy(type,"@T7");
					 if(!strcmp($3.head,"vqwwi")) strcpy(type,"@T7");
					 if(!strcmp($3.head,"nirUpiwa")) strcpy(type,"@T3");
					 if(!strcmp($3.head,"nirUpaka")) strcpy(type,"@T6");
					 if(!strcmp($3.head,"avacCinna")) strcpy(type,"@T3");
					 if(!strcmp($3.head,"avacCexaka")) strcpy(type,"@T6");
					 if(!strcmp($3.head,"aBAva")) strcpy(type,"@T6");
					 if(!strcmp($3.head,"Bexa")) strcpy(type,"@T6");
					 if(!strcmp($3.head,"Binna")) strcpy(type,"@T5");
					 if(!strcmp($3.head,"rahiwa")) strcpy(type,"@T3");
					 if(!strcmp($3.head,"sAmAnAXikaraNyam")) strcpy(type,"@T6");
					 if(!strcmp($3.head,"Awmaka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"janya")) strcpy(type,"@T5");
					 if(!strcmp($3.head,"ukwa")) strcpy(type,"@T7");
					 if(!strcmp($3.head,"Axi")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"sambanXa")) strcpy(type,"@K4");
					 if(!strcmp($3.head,"svarUpa")) strcpy(type,"@T6");
					 if(!strcmp($3.head,"pakRaka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"sAXyaka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"hewuka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"prawiyogika")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"anuyogika")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"AXeyaka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"AXAraka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"aXikaraNaka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"kAryaka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"kAraNaka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"viSeRyaka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"viSeRaNaka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"prakAraka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"saMsargaka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"saMsargika")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"viRayaka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"viRayika")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"lakRyaka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"lakRaNaka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"vqwwika")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"prawiyogiwAka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"anuyogiwAka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"AXeyawAka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"AXArawAka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"aXikaraNawAka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"kAryawAka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"kAraNawAka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"viSeRyawAka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"viSeRaNawAka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"prakArawAka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"saMsargawAka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"saMsargiwAka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"viRayawAka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"viRayiwAka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"lakRyawAka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"lakRaNawAka")) strcpy(type,"@Bs6");
					 if(!strcmp($3.head,"vqwwiwAka")) strcpy(type,"@Bs6");
					 					 
					 sprintf($$.word,"%s-%s%s",$1.word,$3.word,type);
                                         strcpy($$.head,$3.head);
                                        }
	        ;

Ppada	: '<' pada 	{sprintf($$.word,"<%s",$2.word);strcpy($$.head,$2.head);}
	;
Upada	: pada '>'	{sprintf($$.word,"%s>",$1.word); strcpy($$.head,$1.head);}
	;
pada	: compound	{ strcpy($$.word,$1.word);strcpy($$.head,$1.head);}
	| concept	{ strcpy($$.word,$1.word);strcpy($$.head,$1.word);}
	;

%%
#include <stdio.h>
#include <stdlib.h>

int yyerror(char *s) {
        fprintf(stderr,"%s\n",s);
        return (0);
}

int main(int argc, char *argv[]){
    yyparse();
    return 1;
}
