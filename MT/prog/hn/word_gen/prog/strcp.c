#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../headers/vsmt.h"

extern char *index();
void strcpy_till(str,sec_str,ori_str,ch)
char str[VERY_LARGE],sec_str[VERY_LARGE],ori_str[VERY_LARGE],ch;
{
  char temp[VERY_LARGE],*indx;

  strcpy(temp,ori_str);
  if ((indx = index(temp,ch))){ 
  	*indx = '\0';
  	strcpy(str,temp);
  	indx++;
  	strcpy(sec_str,indx);
  }
  else {
  	strcpy(str,ori_str);
  	strcpy(sec_str,"");
  }
}
void strcpy_till_last(str,sec_str,ori_str,ch)
char str[VERY_LARGE],sec_str[VERY_LARGE],ori_str[VERY_LARGE],ch;
{
  char temp[VERY_LARGE],*indx;

  strcpy(temp,ori_str);
    if ((indx = strrchr(temp,ch))){ 
  	*indx = '\0';
  	strcpy(str,temp);
  	indx++;
  	strcpy(sec_str,indx);
  }
  else {
  	strcpy(str,ori_str);
  	strcpy(sec_str,"");
  }
}
