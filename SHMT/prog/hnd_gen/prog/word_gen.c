/*
* Word generator
*/
#include <stdio.h>
#include <string.h>
#include "../headers/all_purpose.h"

extern void strcpy_till();
extern void noun_gen();
extern void pron_gen();
extern void verb_gen();
extern void adj_gen();

void word_gen(result,root,category,gender,number,person,TAM,GNP_FLAG,SHOW_FLAG)
char result[VERY_LARGE];
char root[VERY_LARGE];
char category[MEDIUM];
char gender[SMALL];
char number[SMALL];
char person[SMALL];
char TAM[MEDIUM];
int GNP_FLAG;
int SHOW_FLAG;
{
	char jnk[VERY_LARGE];
	strcpy(jnk,"");
   	switch(category[0]) {
        case 'n' : case 'N':  /* Case of Nouns  */
		noun_gen(result,root,gender,number,TAM);
	break;
        case 'P' : case 'p': /* Case of Pronouns */
		if(index(root,'`')) 
                   { strcpy_till(root,jnk,root,'`');}
		if(strcmp(gender,"NW") == 0)
		   { strcpy(gender,"m");}
	         pron_gen(result,root,gender,number,TAM);
		 strcat(result,jnk);

        break;
        case 'v' :  case 'f' :  case 'i' : case 't':
		      verb_gen(result,root,gender,number,person,TAM,GNP_FLAG);
        break;
        case 'a' :  case 'A' :
                     if (category[2] == 'j') 
		      adj_gen(result,root,gender,number,TAM);
                     if (category[1] == 'v') 
		          sprintf(result,"%s",root);
        break;
        default:
	   if((strcmp(TAM,"-") != 0) &&(strcmp(TAM,"0")!=0))
		 sprintf(result,"%s<*%s*>",root,TAM);
           else	
		 sprintf(result,"%s",root);
	   
	break;
    } /* switch */
}
