#include <string.h>
#include "../headers/all_purpose.h"
#include "../headers/mydefs.h"
extern struct pronoun_RaR RaR_list[];
static char *pro_ne_list[]={
                "mEMne",
                "hamane",
                "wUne",
                "wumane",
                "Apane",
                "Apane",
                "usane",
                "unhoMne",
               "jisane",
               "jinhoMne",
               "kisane",
               "kinhoMne",
               "kisIne",
               "kinhoMne",
               "isane",
               "inhoMne",
 };

static char *pro_default_list[]={
                "muJa",
                "hama",
                "wuJa",
                "wuma",
                "Apa",
                "Apa",
                "usa",
                "una",
               "jisa",
               "jina",
               "kisa",
               "kina",
               "kisI",
               "kinhI",
               "isa",
               "ina",
 };  
static char *pro_ko_list[]={
                "muJe",
                "hameM",
                "wuJe",
                "wumheM",
                "Apako",
                "Apako",
                "usako",
                "unako",
               "jisako",
               "jinako",
               "kisako",
               "kinako",
               "kisIko",
               "kinhIko",
               "isako",
               "inako",
 };  

 int form_ne_pronoun(root_verb,number)
 char root_verb[VERY_LARGE],number[SMALL];
 {
 int ne_off,no;

  if (number[0] == 'p') no = 1;
       else no = 0; 
  if (!strcmp(root_verb,"mEM"))        ne_off = 0 + no;
  else if (!strcmp(root_verb,"hama"))  ne_off = 1+no;
  else if (!strcmp(root_verb,"wU"))    ne_off = 2 + no;
  else if (!strcmp(root_verb,"wuma"))  ne_off = 3+no;
  else if (!strcmp(root_verb,"Apa"))   ne_off = 4 + no;
  else if (!strcmp(root_verb,"vaha"))  ne_off = 6+no;
  else if (!strcmp(root_verb,"ve"))    ne_off = 7+no;
  else if (!strcmp(root_verb,"jo"))    ne_off = 8 + no;
  else if (!strcmp(root_verb,"kOna"))  ne_off = 10 + no;
  else if (!strcmp(root_verb,"koI"))   ne_off = 12 + no;
  else if (!strcmp(root_verb,"yaha"))  ne_off = 14+no;
  else if (!strcmp(root_verb,"ye"))    ne_off = 15+no;
  else ne_off = 99;
return(ne_off);
}

void form_0_pronoun(result,root,num)
char *result,*root,*num;
{
if(strcmp(num,"p"))
	{strcpy(result,root);
	return;}
else
	if(!strcmp(root,"mEM"))
		strcpy(result,"hama");
	else if(!strcmp(root,"wU"))
		strcpy(result,"wuma");
		else if(!strcmp(root,"vaha"))
			strcpy(result,"ve");
			else if(!strcmp(root,"yaha"))
				strcpy(result,"ye");
			      else strcpy(result,root);
}
		
void form_default_pronoun(result,root_verb,no,vibhakti)
 char root_verb[VERY_LARGE],vibhakti[SMALL],result[VERY_LARGE],no[SMALL];
 {
  int ne_offset; 
   ne_offset=form_ne_pronoun(root_verb,no);
   if (ne_offset == 99){
	  strcpy(result,root_verb);
          strcat(result,"_");
    }
   else
          strcpy(result,pro_default_list[ne_offset]);
   if(strcmp(vibhakti,"0") && strcmp(vibhakti,"1"))
	   strcat(result,vibhakti);
}

void form_RaR_pronoun(result,number,root_verb,gender,TAM)
char number[SMALL],gender[SMALL],root_verb[VERY_LARGE],result[VERY_LARGE],TAM[SMALL];
{
 int pron_num,pro_offset=0,entry_num;

 pron_num=form_ne_pronoun(root_verb,number);
 if(pron_num == 99) {
    strcpy(result,root_verb);
    strcat(result,TAM);
  }
  else {
         if(!strcmp(TAM,"kA")) pro_offset = 0;
         else if(!strcmp(TAM,"ke")) pro_offset = 1;
         else if(!strcmp(TAM,"kI")) pro_offset = 2;
	 entry_num = pron_num * 3 + pro_offset; 
	 strcpy(result,RaR_list[entry_num].RaR_form);
  }
}

void pron_gen(result,root_verb,gender,number,TAM)
char TAM[MEDIUM],root_verb[VERY_LARGE],number[SMALL],gender[SMALL];
char result[VERY_LARGE];
{
int num;
 

  if (!strcmp(TAM,"0"))
	   form_0_pronoun(result,root_verb,number);
  else if (!strcmp(TAM,"ne")){
	   num=form_ne_pronoun(root_verb,number);
   if (num == 99){
	  strcpy(result,root_verb);
          strcat(result,"_ne");
    }
   else
          strcpy(result,pro_ne_list[num]);
  }
/* Start: Added by Amba */
  else if (!strcmp(TAM,"ko")){
	   num=form_ne_pronoun(root_verb,number);
   if (num == 99){
	  strcpy(result,root_verb);
          strcat(result,"_ko");
    }
   else
          strcpy(result,pro_ko_list[num]);
  }
/* End: Added by Amba */
  else
/* This function has been modified by Amba. Earlier it used to give single answer --> kA */
     if (!strcmp(TAM,"kA") || !strcmp(TAM,"ke") || !strcmp(TAM,"kI"))
	   form_RaR_pronoun(result,number,root_verb,gender,TAM);
     else
           form_default_pronoun(result,root_verb,number,TAM);
}
