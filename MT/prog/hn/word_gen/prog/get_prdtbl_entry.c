#include <stdio.h>
#include <string.h>
#include "../headers/my_defs.h"
#include "../headers/all_purpose.h"
#define no_of_forms 4

/*
* function to get table entry depending 
* upon vibhakti and number
*/

int get_tabl_entry_no(vibh,number)
char vibh[SMALL];
char number[SMALL];
{
 char case_type;
 int parad_off=0;/* paradigm offset */


   if (!strcmp(vibh,"0")) case_type = 'd';
   else case_type = 'o';
   switch(number[0]){
      case 's' : parad_off = 0;
                 break;
      case 'p' : parad_off = 1;
                 break;
   }
   if (case_type == 'o') parad_off = parad_off + 2; 
 return(parad_off);
}

void connect_vibhakti(word,vibhakti,new_word)
char word[VERY_LARGE],new_word[VERY_LARGE];
char vibhakti[SMALL];
{
 strcpy(new_word,word);
 if(strcmp(vibhakti,"0")  && strcmp(vibhakti,"1")){
         if (strcmp(vibhakti,"wA") || strcmp(vibhakti,"wva")) {
	   strcat(new_word,"_");
         }
	 strcat(new_word,vibhakti);
  }
}
