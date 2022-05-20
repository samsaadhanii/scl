/* function to complete a root word by adding suffix 
*/

#include <string.h>
#include "../headers/all_purpose.h"

void form_word(root_word,chars_to_be_del,sfx_to_be_added,result)
char root_word[VERY_LARGE],sfx_to_be_added[SMALL],result[VERY_LARGE];
int chars_to_be_del;
{

  strcpy(result,root_word);
  *(result + strlen(root_word) - chars_to_be_del) = '\0';
  strcat(result,sfx_to_be_added);
} 
