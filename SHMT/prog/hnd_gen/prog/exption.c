/*
* Exceptional word handler
*
*/


#include <string.h>
#include <stdio.h>
#include "../headers/all_purpose.h"

extern int sufix();
extern void delete_from_end();

int exceptional(result,root,my_tam)
char result[VERY_LARGE],my_tam[MEDIUM],root[VERY_LARGE];
{
    /* If the root is "xe" and the tam is "nA_xenA" then the word becomes 
       "xe_xenA"  - This is hardwired here */

    if( (!strcmp(root,"xe") || sufix(root,"xe")) && !strcmp(my_tam,"nA_xenA") )
      {  sprintf(result,"%s_xenA",root);
         return 1;  }

    /* If the root is "kara" and the tam is "0_kara" then the word becomes 
       "karake"  - This is hardwired here */

    else if( (!strncmp(root,"kara",4) || sufix(root,"kara")) && !strncmp(my_tam,"0_kara",6) )
       {  sprintf(result,"%ske",root);
	  return 1; }
       
    /* If the root is "ho" and the tam is "yA_huA" then the word becomes 
       "huA" instead of huA_huA  - This is hardwired here */

    /* else if( (!strcmp(root,"ho") || sufix(root,"ho")) && !strcmp(my_tam,"yA_huA") ){
	  delete_from_end(root,2);
          sprintf(result,"%shuA",root);
	  return 1;
	  } */
     else if(!strcmp(root,"[huA]") && !strcmp(my_tam,"-"))
     { sprintf(result,"%s","_huA");
       return 1;
     }

    /* If the root is "cAhiye" then whatever may be the tams,
       o/p is always 'cAhiye'. This is hardwired here. */

     else if(!strcmp(root,"cAhiye"))
     { sprintf(result,"%s",root);
       return 1;
     }

     else if(!strncmp(my_tam,"nA~",3)) /* Handle nA + vibh */
     { 
       if(!strcmp(root,"hE")) strcpy(root,"ho");
	sprintf(result,"%sne~%s",root,my_tam+3);
       return 1;
     }

     else return 0;
}
