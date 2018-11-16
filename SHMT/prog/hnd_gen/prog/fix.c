/*
* function to seprate prefix & suffix from a TAM
*
*/

#include <stdio.h>
#include <string.h>
#include "../headers/all_purpose.h"

extern void strcpy_till();

char prsrg[VERY_LARGE],sec_str[VERY_LARGE],suffix1[VERY_LARGE];
/* function to seprate prefix & suffix in first look */
void prefix_suffix(TAM,prefix,suffix)
char TAM[LARGE];
char prefix[VERY_LARGE];
char suffix[VERY_LARGE];
{
    strcpy(sec_str,"");
    strcpy(prsrg,"");
    if(index(TAM,'+')) {  /* Case of negatives */
  	strcpy_till(prefix,sec_str,TAM,'+');
        strcpy(TAM,sec_str);
    }
    if(index(TAM,'~')) {  /* Case of verbal noun */
  	 strcpy_till(TAM,sec_str,TAM,'~');
  	 if(index(sec_str,'%')) {
  		strcpy_till(prsrg,sec_str,sec_str,'%');
  		strcat(prsrg,"-");
  		strcat(prsrg,sec_str);
                /* If nA~ke%liye -> ne-ke-liye */
                if(!strcmp(TAM,"nA") ) 
			strcpy(TAM,"ne");
                strcpy(suffix,prsrg);
  	                        }
          else
             strcpy(suffix,sec_str);
                          }
}

/* function to give complete suffix when GNP OFF */

void cooked_TAM_suff(suffix,TAM,suffix2)
char *suffix,*TAM,*suffix2;
{
    extern int GNP_FLAG;
    char sec_str[VERY_LARGE],rsuffix[VERY_LARGE];
    strcpy(sec_str,"");
    strcpy(prsrg,"");
    strcpy(suffix1,"");
  if(GNP_FLAG) 
  	{  
  	 strcpy_till(TAM,sec_str,TAM,'_');
  	 if(index(sec_str,'%')) {
  		strcpy_till(prsrg,sec_str,sec_str,'%');
  		strcat(prsrg,"-");
  		strcat(prsrg,sec_str);
                /* If nA_ke%liye -> ne-ke-liye */
                if(!strcmp(TAM,"nA") ) 
			strcpy(TAM,"ne");
                strcpy(suffix,prsrg);
  	 			}
	 else 
	 	strcpy(suffix1,sec_str);

         if(!strcmp(suffix2,""))  /* case X_suffix1 */
         	strcpy(suffix,suffix1);
         else
                {sprintf(rsuffix,"%s_%s",suffix1,suffix2);
		strcpy(suffix,rsuffix); }
	}/* end if */
}
