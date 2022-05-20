#include <string.h>
#include <ctype.h>
#include "../headers/all_purpose.h"

extern int sufix();
extern void delete_from_end();

void shift_right(word)
char *word;
{
  char temp[VERY_LARGE];
  int i;

  for(i=1;i<strlen(word);i++)
    temp[i-1] = word[i];
  temp[i-1] = '\0';
  strcpy(word,temp);
}

void modify_prefix(word)
char *word;
{
  char temp[VERY_LARGE];
  char backword[VERY_LARGE];
  int i;

  strcpy(temp,"");
  strcpy(backword,word);
  if(isdigit(word[0]) ){
   if(word[1]=='.'){
     for(i=0;i<(strlen(word)-2);i++) temp[i] = word[i+2];
     temp[i]='\0';
     }
   /*else if(isdigit(temp[1]) && temp[2] == '.'){
     for(i=3;i<strlen(word);i++) temp[i-3] = word[i];
     temp[i-3]='\0';
     }  Commented by Amba on 19th Aug 2018; since with else, temp[1] and temp[2] would be uninitialised. */
    if(isdigit(temp[1]) && temp[2] == '.'){
     for(i=3;i<strlen(word);i++) temp[i-3] = word[i];
     temp[i-3]='\0';
    } 

  }
  if(temp[0]!='\0') strcpy(word,temp);
  if(word[0]=='+') shift_right(word);
  if(!isalpha(word[0])) strcpy(word,backword);
}

void modify_star_suffix(word)
char *word;
{
   if(sufix(word,"<*0*>")) delete_from_end(word,5);
   if(sufix(word,"<*>")) delete_from_end(word,3);
   if(sufix(word,"[*]")) delete_from_end(word,3);
}
