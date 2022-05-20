/*
*
* Noun Generator 
*/

#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include <search.h>
#include "../headers/all_purpose.h"
#include "../headers/my_defs.h"

struct dict_entry *tag;

extern void * my_bsearch();
extern struct dict_entry dict_parad_list[];
extern struct parad_tbl parad_tbl_entry[];
extern void  form_word();
extern int get_tabl_entry_no();
extern void connect_vibhakti();
 
/* Function to find default paradim no */

int find_default_word(match_word,gender)
char match_word[VERY_LARGE],gender[SMALL];
{
  char ch;
  int eqvi_parad_no;
  eqvi_parad_no = 0;

  ch = match_word[strlen(match_word) - 1];
  switch(ch){
        case 'A' : if (gender[0] == 'm') eqvi_parad_no = 11; /* ladakA */
		   else if (gender[0] == 'f')  eqvi_parad_no = 1; /* ASA */
                   break;
 	case 'a' : if (gender[0] == 'm' )  eqvi_parad_no = 5; /*Gara */
		   else if (gender[0] == 'f') eqvi_parad_no = 14; /*rAwa */
       		   break;
 	case 'I' : if(gender[0] == 'm') eqvi_parad_no = 4; /* AxamI */
		   else if (gender[0] == 'f') eqvi_parad_no = 12; /* ladakI */
       		   break;
	case 'i' : if(gender[0] == 'm' ) eqvi_parad_no = 17; /*kavi */
		   else if (gender[0] == 'f') eqvi_parad_no = 3; /*Apawwi */
       		   break;
	 case 'u': if(gender[0] == 'm') eqvi_parad_no = 13; /* rAjA */
		   else if(gender[0] == 'f') eqvi_parad_no = 15; /* qwu */
        	   break;
 	case 'U' : if (gender[0] == 'f') eqvi_parad_no = 6; /* bahU */
		   else if (gender[0] == 'm') eqvi_parad_no = 2; /* AlU */
       		   break;
	case 'o' : 
        case 'M' : eqvi_parad_no = 9; /* kroXa */
        	  break;
 	case 'O' : eqvi_parad_no = 8; /* jO */
       		   break;
 	case 'z' : if(gender[0] == 'm') eqvi_parad_no = 10; /* kuAz */
		   else if (gender[0] == 'f') eqvi_parad_no = 1; /* ASA */
       		    break;
        case 'Z' : break;
 	case '}' : eqvi_parad_no = 13; /*  rAjA  why is this added? added by AMBA */
       		     break;
	default  : /* Error */
                  eqvi_parad_no = 13; /*  changed by amba 11(ladakA)->5(Gara)->13(rAjA) */
   } /* switch */
   return(eqvi_parad_no);
}


/* function to find a word in dict. or its default */

int search_word(word_to_be_searched,gender)
char word_to_be_searched[VERY_LARGE],gender[SMALL];
{
 int no_of_records=4200;
 int parad_num;

 tag = (struct dict_entry *) malloc(sizeof(struct dict_entry));

  tag = (struct dict_entry *)my_bsearch(word_to_be_searched,dict_parad_list->word,no_of_records,sizeof(struct dict_entry),strcmp);
  //strcpy(tag[0], (struct dict_entry *)bsearch(word_to_be_searched,dict_parad_list->word,no_of_records,sizeof(struct dict_entry),strcmp));
  if(tag != NULL)  /* present in lexicon */
    parad_num = tag->parad_no; 
  else  	/* not in lexicon so find its default */
    parad_num = find_default_word(word_to_be_searched,gender);
return(parad_num);
}
 

void noun_gen(final_word,input_word,gender,number,vibhakti)
char final_word[VERY_LARGE],input_word[VERY_LARGE],gender[SMALL],number[SMALL],vibhakti[SMALL];
{
 char add_str[SMALL];
 int no,offset,array_element,no_del;
 char new_word[VERY_LARGE];

    no = search_word(input_word,gender);  	
    offset = get_tabl_entry_no(vibhakti,number);
    array_element = (no-1) * 4 + offset;   
    no_del = parad_tbl_entry[array_element].no_of_chars;
    strcpy(add_str,parad_tbl_entry[array_element].rep_str);
    form_word(input_word,no_del,add_str,new_word);     
    connect_vibhakti(new_word,vibhakti,final_word);   
}
