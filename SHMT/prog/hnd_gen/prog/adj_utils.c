#include <string.h>
#include <search.h>
#include "../headers/all_purpose.h"

/* This program generates different forms of adjectives.
Input: root(of the adj),gender,number,vibhakti.
gender : m,f
number : s,p
vibhakti : ne,ko,se,etc.

e.g. kAlA,m,s,ne
     kAlA,f,p,ko,etc
Note here that kAlA & kAlI are not different roots.
different paradigms for Adjectives in Hindi are:
1. All non 'A' ending words (they do not change their forms)
2. baDiyA,bAlikA & jyAxA are the only exceptions in A ending words to the following rule.
	  msd,m(non-s,non-d),fs,fp
3. kAlA : kAlA,kAle,kAlI,KAlIM


--- Added by Amba START
yaha -> isa (s,o), ina(p,o), ye (p,d)
vaha -> usa (s,o), una(p,o), ve (p,d)
--- Added by Amba OVER
*/
void form_adjective(result,match_word,gender,number,vibhakti)
char match_word[VERY_LARGE],gender[SMALL],vibhakti[SMALL],number[SMALL],result[VERY_LARGE];
{
  char ch,vib;
  int len;
  if (!strcmp(vibhakti,"0")) vib = 'd';
  else vib = 'o';
  len = strlen(match_word);
  ch = match_word[len - 1];
  if ((ch == 'A') && (gender[0] == 'm')){
          if (   (!strcmp(match_word,"baDiyA")) 
	      || (!strcmp(match_word,"jyAxA"))
	      || (!strcmp(match_word,"rAjA"))
	      || (!strcmp(match_word,"karwA"))
	      || (!strcmp(match_word,"piwA"))
	     )
		  /* All relation words ending in 'A' such as piwA, rAjA, karwA etc also behave like an adjective */
	       strcpy(result,match_word);
                else{
                     if ((number[0] == 's') && (vib == 'd'))
                             strcpy(result,match_word);
                     else {
                               strcpy(result,match_word);
                               *(result + strlen(match_word) - 1) = '\0'; 
                               strcat(result,"e");
                     }
                }
   }
/*
Comment Begin
This is commented by Amba 13/1/2011
It creates problems in Skt-Hindi generation.
example: sevikAyAH kanyAyAH -> sevikA-kI kanyA-kI
Instead of sevikA-kI machine produced sevikI-kI
Comment End
   else if ((ch == 'A') && (gender[0] == 'f')) {
       strcpy(result,match_word);
       *(result + strlen(match_word) - 1) = '\0';
       strcat(result,"I");
   }
*/
   else if(!strcmp(match_word,"yaha")) {
          if((number[0] == 's') && (vib == 'd')) strcpy(result,match_word);
          if((number[0] == 's') && (vib == 'o')) strcpy(result,"isa");
          if((number[0] == 'p') && (vib == 'd')) strcpy(result,"ye");
          if((number[0] == 'p') && (vib == 'o')) strcpy(result,"ina");
   }
   else if(!strcmp(match_word,"vaha")) {
          if((number[0] == 's') && (vib == 'd')) strcpy(result,match_word);
          if((number[0] == 's') && (vib == 'o')) strcpy(result,"usa");
          if((number[0] == 'p') && (vib == 'd')) strcpy(result,"ve");
          if((number[0] == 'p') && (vib == 'o')) strcpy(result,"una");
   }
   else strcpy(result,match_word);
}

void adj_gen(result,input_word,gender,number,vibhakti)
char input_word[VERY_LARGE],number[SMALL],gender[SMALL],vibhakti[SMALL];
char *result;
{
    form_adjective(result,input_word,gender,number,vibhakti);
}
