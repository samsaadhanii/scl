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

/* substring searches a searchstr in str and returns the start index in str if the searchstr in found else returns -1 */
int substring (str,searchstr)
char str[VERY_LARGE], searchstr[VERY_LARGE];
{
int count1 = 0;
int count2 = 0;
int flag = -1;
int i,j;

while (str[count1]!='\0') count1++;
while (searchstr[count2]!='\0') count2++;

for(i=0;i<=count1-count2;i++) {
  for(j=i;j<i+count2;j++) {
      flag=i;
      if (str[j]!=searchstr[j-i]) {
          flag=-1;
          break;
      }
  }
if (flag >= 0) break;
}
flag;
}
