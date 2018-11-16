/* various utility function
 */

#include "../headers/all_purpose.h"

extern void modify_prefix();
extern void modify_star_suffix();

char last_char(word)
char word[VERY_LARGE];
{
   int i;
   for(i=0;word[i]!='\0';i++);
   return( word[i-1]);
}


void trim_word(strn)
char *strn;
{
  modify_prefix(strn);
  modify_star_suffix(strn);
}

