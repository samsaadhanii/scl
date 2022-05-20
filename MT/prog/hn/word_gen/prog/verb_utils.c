#include <stdio.h>
#include <string.h>
#include "../headers/all_purpose.h"
#include "../headers/mydefs.h"

extern struct verb_correction verb_subj_list[];
extern struct verb_correction verb_future_list[];
extern struct verb_correction verb_yA_list[];

extern void form_word();

static char *verb_jA_list[]={
                "gayA",
                "gaye",
                "gayI",
                "gayIM",
};

static char *verb_WA_list[]={
                "WA",
                "We",
                "WI",
                "WIM",
};
static char *verb_wA_list[]={
                "wA",
                "we",
                "wI",
                "wIM",
};
static char *verb_nA_list[]={
                "nA",
                "ne",
                "nI",
                "nIM",
};

static char *verb_hE_list[]={
               "hUz",
               "hE",
               "hE",
               "hEM",
               "ho",
               "hEM",
 };

int get_offset_subj(per,num)
char per[SMALL],num[SMALL];
{ 
  int subj_off = 0;

  switch(per[0]){
      case 'u' : subj_off = 0;
                 break;
      case 'm' : subj_off = 1;
                 break;
      case 'h' : subj_off = 2;
                 break;
      case 'a' : subj_off = 3;
                 break;
  }
  if (num[0] == 'p') subj_off = subj_off + 4;
 return(subj_off);
} 


int get_offset_hE(per,num)
char per[SMALL],num[SMALL];
{ 
  int subj_off = 0;

  switch(per[0]){
      case 'u' : subj_off = 0;
                 break;
      case 'm' : subj_off = 1;
                 break;
      case 'a' : subj_off = 2;
                 break;
      default : subj_off = 2;	/* Added by Amba to handle jAnA_hE type of cases where hE does not get changed */
                break;
  }
  if (num[0] == 'p') subj_off = subj_off + 3;
 return(subj_off);
} 
int get_offset_future(gen,num,per)
char gen[SMALL],per[SMALL],num[SMALL];
{ 
  int future_off = 0;
  int local;
  if(gen[0] == 'f')
     local = 8;
   else
     local = 0;

  if ( (num[0] == 's') && (per[0] == 'u')) future_off = 0+local;
  if ( (num[0] == 's') && (per[0] == 'm')) future_off = 1+local;
  if ( (num[0] == 's') && (per[0] == 'h')) future_off = 2+local;
  if ( (num[0] == 's') && (per[0] == 'a')) future_off = 3+local;
  if ( (num[0] == 'p') && (per[0] == 'u')) future_off = 4+local;
  if ( (num[0] == 'p') && (per[0] == 'm')) future_off = 5+local;
  if ( (num[0] == 'p') && (per[0] == 'h')) future_off = 6+local;
  if ( (num[0] == 'p') && (per[0] == 'a')) future_off = 7+local;
 return(future_off);
}

int get_offset_yA(gen,num)
char gen[SMALL],num[SMALL];
{ 
  int yA_off;
 
   if ((gen[0] == 'm') && (num[0] == 'p')) yA_off = 1;
   else if ((gen[0] == 'f') && (num[0] == 's')) yA_off = 2;
   else if ((gen[0] == 'f') && (num[0] == 'p')) yA_off = 3;
   else
      yA_off = 0;
 return(yA_off);
}



int get_correct_form(verb)
char verb[VERY_LARGE];
{
  char ch;
  int no=0;

  ch = verb[strlen(verb) - 1];
  switch(ch){
        case 'A' : if (!strcmp(verb,"WA"))
		              printf("\nWA can not occur in SUBJUNCTIVE case"); 
                   else no = 0;
                   break;
        case 'a' : if (!strcmp(verb,"kara")) no = 1;
                   else no=6;
                   break;
        case 'o' : if (!strcmp(verb,"ho")) no=3; 
                   else no=7; 
                   break;
        case 'e' : if(!strcmp(verb,"se")) no=0;
		   else no=2; 
                   break; 
        case 'I' : no=4;
                   break;
        case 'U' : no=5; 
                   break;
        case 'E' : if(!strcmp(verb,"hE")) no=3; /* 'E' case added for hE,temporary, to be deleted */
                   else no=99;
                   break;
        default: no=99; 
                 break;
   }
  return(no);
}   

void process_fut_verb(result,verb,gender,person,number,no)
char verb[VERY_LARGE], gender[SMALL],person[SMALL],number[SMALL];
int no;
char result[VERY_LARGE];
{
 int file_entry_num,offset_num;
 
   offset_num = get_offset_future(gender,number,person);
   file_entry_num = no * 16 + offset_num;
   form_word(verb,verb_future_list[file_entry_num].no_of_chars,verb_future_list[file_entry_num].rep_str,result);
 }

void process_hE_verb(result,person,number)
char person[SMALL],number[SMALL],result[VERY_LARGE];
{
 int offset_num;

   offset_num = get_offset_hE(person,number);
   strcpy(result,verb_hE_list[offset_num]); 
 }


void process_subj_verb(result,verb,person,number,no)
char verb[VERY_LARGE],person[SMALL],number[SMALL];
int no;
char result[VERY_LARGE];
{
 int file_entry_num,offset_num;
 
   offset_num = get_offset_subj(person,number);
   file_entry_num = no * 8 + offset_num;
   form_word(verb,verb_subj_list[file_entry_num].no_of_chars,verb_subj_list[file_entry_num].rep_str,result);
 }


void process_yA_verb(result,verb,gender,number,no)
char verb[VERY_LARGE],gender[SMALL],number[SMALL];
int no;
char result[VERY_LARGE];
{
 int file_entry_num,offset_num;

   offset_num = get_offset_yA(gender,number);
   file_entry_num = no * 4 + offset_num;
   form_word(verb,verb_yA_list[file_entry_num].no_of_chars,verb_yA_list[file_entry_num].rep_str,result);
 }


void process_WA_verb(result,gender,number)
char gender[SMALL],number[SMALL],result[VERY_LARGE];
{
 int offset_num;
 
   offset_num = get_offset_yA(gender,number);
   strcpy(result,verb_WA_list[offset_num]);
 }
void process_wA_verb(result,gender,number)
char gender[SMALL],number[SMALL],result[VERY_LARGE];
{
 int offset_num;
 
   offset_num = get_offset_yA(gender,number);
   strcpy(result,verb_wA_list[offset_num]);
 }
void process_nA_verb(result,gender,number)
char gender[SMALL],number[SMALL],result[VERY_LARGE];
{
 int offset_num;
 
   offset_num = get_offset_yA(gender,number);
   strcpy(result,verb_nA_list[offset_num]);
 }

void process_jA_verb(result,gender,number)
char gender[SMALL],number[SMALL],result[VERY_LARGE];
{
 int offset_num;
 
   offset_num = get_offset_yA(gender,number);
   strcpy(result,verb_jA_list[offset_num]);
 }


void verb_gen(result,root_verb,gender,number,person,tam,GNP_FLAG)
 char result[VERY_LARGE],root_verb[VERY_LARGE],person[SMALL],number[SMALL],gender[SMALL];
 char tam[MEDIUM];
 int GNP_FLAG;
{
 int num;
 char orignal_gnp[MEDIUM];
 char original_gender[SMALL],original_number[SMALL],original_person[SMALL];
 
    sprintf(orignal_gnp,"{%s,%s,%s}",gender,number,person);
 if(GNP_FLAG == 1) {
    strcpy(original_gender,gender);
    strcpy(original_number,number);
    strcpy(original_person,person);
    strcpy(gender,"m");
    strcpy(number,"s");
    strcpy(person,"a");
  }
/* Added yA1 tam also by AMBA
  if ((!strcmp(tam,"subj")) || (!strcmp(tam,"future"))
                              || (!strcmp(tam,"yA")) ){
*/
  if ((!strcmp(tam,"subj")) || (!strcmp(tam,"gA")) || (!strcmp(tam,"yA1"))
                              || (!strcmp(tam,"yA")) ){
                 num=get_correct_form(root_verb);
		 if (num == 99){
			   /*strcpy(result,"@*#");*/
			   strcat(result,root_verb);
  			   if (!strcmp(tam,"subj")) strcat(result,"yeM");
  			   if (!strcmp(tam,"gA")) strcat(result,"egA");
  			   if (!strcmp(tam,"yA")) strcat(result,"yA");
                 }
                 else
                 {
		 if(!strcmp(root_verb,"hE")) strcpy(root_verb,"ho");/* Added by Amba; can be discussed if necessary */
                 if(!strcmp(tam,"subj"))
                     process_subj_verb(result,root_verb,person,number,num);
                 if(!strcmp(tam,"gA"))
                     process_fut_verb(result,root_verb,gender,person,number,num);
                 if(!strcmp(tam,"yA")){
		  if(!strcmp(root_verb,"jA"))
		     process_jA_verb(result,gender,number);
       		 else
		     process_yA_verb(result,root_verb,gender,number,num);
                 }

		if(!strcmp(tam,"yA1")) /* yA1 -> yA  :: Amba 31:10;2002 */
		      process_yA_verb(result,root_verb,gender,number,num);
  		}
  }
/* Shifted above by AMBA 
if(!strcmp(tam,"yA"))
	if(!strcmp(root_verb,"jA"))
		 process_jA_verb(result,gender,number);
        else
	      process_yA_verb(result,root_verb,gender,number,num);
*/
  if (!strcmp(tam,"kara") ){
               strcpy(result,root_verb);
               strcat(result,tam);
 }
 if (!strcmp(tam,"0")) strcpy(result,root_verb);
 if (!strcmp(tam,"02")) {strcpy(result,root_verb); strcat(result,"_");strcat(result,root_verb);}
 if (!strcmp(tam,"WA")) {
       process_WA_verb(result,gender,number);
   }
 if (!strcmp(tam,"wA")){
		 if(!strcmp(root_verb,"hE")) strcpy(root_verb,"ho");/* Added by Amba; can be discussed if necessary */
	 process_wA_verb(result,gender,number);
       strcat(root_verb,result);
       strcpy(result,root_verb);
   }
 if (!strcmp(tam,"nA") || !strcmp(tam,"ne")){
        if(!strcmp(root_verb,"hE")) strcpy(root_verb,"ho");/* Added by Amba; can be discussed if necessary */
	process_nA_verb(result,gender,number);
       strcat(root_verb,result);
       strcpy(result,root_verb);
   }
 if (!strcmp(tam,"hE")) process_hE_verb(result,person,number); 
 if(GNP_FLAG == 1) {
   strcpy(gender,original_gender);
   strcpy(person,original_person);
   strcpy(number,original_number);
  }
}

