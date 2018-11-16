#include <stdio.h>
#include <string.h>
/* #include "/usr/ucbinclude/strings.h" */

int sufix(str1,str2)
char *str1, *str2;
/* Check if str2 is the suffix for str1 */
{
   int len1,len2;

   len1=strlen(str1);
   len2=strlen(str2);
   for(;len2>=0;len2--){
      if(str1[len1] != str2[len2]) return 0;
      len1--;
      }
   return 1;
}

void delete_from_end(word,no_of_char)
char *word;
int no_of_char;
{
  int i,j;

  for(i=0;word[i]!='\0';i++)
  ; 
  i--;
  j= i - no_of_char;
  word[j+1]='\0';
}

