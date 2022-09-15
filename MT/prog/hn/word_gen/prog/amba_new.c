/*
 MAIN PROGRAM FOR WORD GENERATOR

     list of all dependency file     

suffix.c          / suffix(),delete_from_end() /
my_bsrch.c        / my_bsearch()  / 
trim.             / modify_prefix(),modify_star_suffix(),shift_right() /
strcp.c           / strcpy_till() , strcpy_till_last()/
RaR.c	          / RaR_list[] : pronoun_RAR /
form_wor.c	  / void form_word() /
ya_form.c	  / verb_yA_list[] : verb_correction /
get_prdtbl_entry.c	     / get_tabl_entry_no()  /
			     / connect_vibhakti() /
		             / generate_delete_file() /
subj.c            / verb_subj_list[] : verb_correction /
future.c          / verb_future_list[] : verb_correction /
parad.c		  / parad_tbl_entry[] : parad_tbl /	
n_excp.c	  / dict_parad_list[] : dict_entry /
nou_utils.c	  / Noun generator /
pro_utils.c	  / Pronoun generator /
verb_utils.c	  / Verb generator /
adj_utils.c	  / Adjective generator /
word_gen.c        / WORD GENERATOR /
fix.c             / prefix & suffix finding funct. /
exption.c         / exceptinol handling function . /
function.c

     list of header file used in above files

all_purpose.h     / For various definition /
gen.h             / Definition of  following structures/
	          / noun_paradigms, lex, verb_paradigms/
		  /  pronoun_paradogms ,shashti_paradigms /
mydefs.h          / struct pronoun_RaR,verb_correction /
my_defs.h	  / struct dict_entry,parad_entry,parad_tbl /	

*/

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <search.h>
#include "tam.c"
#include "../headers/all_purpose.h" 	/* For various definition */
#include "../headers/gen.h" 
		

/* Global varibles for different generator */

char category[SMALL];
char TAM[MEDIUM];
char RAW_GEN[MEDIUM];
char RAW_NUM[MEDIUM];
char RAW_PER[MEDIUM];
char gender[SMALL],tgender[SMALL];
char number[SMALL],tnumber[SMALL];
char person[SMALL],tperson[SMALL];
char COMMENT[MEDIUM];
int GNP_FLAG; /* flag to guess default GNP */
int SHOW_FLAG;/* flag to show GNP in result */
int EXCPTION;

int GEN_WORD_CNT; /* Generator word counter */
extern void strcpy_till();
extern void strcpy_till_last();
extern void *my_bsearch();
extern void word_gen();
extern void trim_word();
extern void cooked_TAM_suff();
extern void prefix_suffix();
extern int exceptional();
extern int substring();

char word_num_str[MEDIUM],map_wc[SMALL], root[VERY_LARGE];

int main(argc,argv)
int argc;
char *argv[];
{
   
    char result[VERY_LARGE],prefix[VERY_LARGE],suffix[VERY_LARGE];
    char extra_root[VERY_LARGE],word_tag[VERY_LARGE],jun[VERY_LARGE];
    char root_front[VERY_LARGE],troot[VERY_LARGE],*fresult,*rtam;
    int GEN_WORD_CNT = 1,EXTRA_ROOT_FLAG = 0,NEXT_SENSE=0,i;
    int map_no,sense_no,B_FLAG,rlen;

     if(argc != 9) {
	fprintf(stderr,"Illegal Call to Generator\n");
        for(i=0;i<argc;i++)
           fprintf(stderr,"%s ",argv[i]);
        fprintf(stderr,"\n");
	fprintf(stderr,"Usage : new_gen.out {ON/OFF} {SHOW/NOT} root category gender number person tam\n");
	exit(0);
     }
     /* if OFF then verb generator assume default GNP */
     /* if ON then GNP will be consider for generation */
     if(!strcmp(argv[1],"OFF"))    GNP_FLAG = 1;
      else    {GNP_FLAG = 0;
	       fresult = (char *)malloc(LARGE);
              }
     if(!strcmp(argv[2],"SHOW")) SHOW_FLAG = 1;
      else SHOW_FLAG = 0;

     strcpy(root,argv[3]);
     strcpy(category,argv[4]);
     strcpy(gender,argv[5]);
     strcpy(number,argv[6]);
     strcpy(person,argv[7]);
     strcpy(TAM,argv[8]);

      /* initilisation of variables */
      strcpy(result,"");
      strcpy(prefix,"");
      strcpy(suffix,"");
      strcpy(word_tag,"");
      strcpy(root_front,"");
      strcpy(jun,"");
      strcpy(troot,"");
      B_FLAG = 0;
      EXCPTION = 0;
      trim_word(root);

      /* check for multiple meaning */
     if(map_wc[0]=='\0') { /*sanjil*/
         map_no = 0;sense_no = 0;
     } 
     else {sscanf(map_wc,"%d, %d",&map_no,&sense_no);}
     if ( sense_no > 1 ) {
	 NEXT_SENSE = 1;
         printf("[");
     }
      
      /* check for multiple root */
     if (index(root,'&')){
         strcpy_till(root,extra_root,root,'&'); 
	 rlen = strlen(root);
	 EXTRA_ROOT_FLAG = 1;
      }


      if( root[0] == '#')   /* Newline start */
         {if(GEN_WORD_CNT >1)
          printf(" ");
	 printf("<%d>",GEN_WORD_CNT++);
	}
     else  if (root[0] == '-') printf("-"); /* Added by Amba; to handle words grouped with the following words; and hence the equivalent of the current word is blank */
            else {
	      if (NEXT_SENSE) printf(" ");
	      /* check for root seprated by '_' */
	      if(index(root,'_'))
		 strcpy_till_last(root_front,root,root,'_');

             /* exceptional word handling */
	      EXCPTION = exceptional(jun,root,TAM);
              if(index(TAM,'_') && !EXCPTION)
	      cooked_TAM_suff(suffix,TAM,suffix);

	      if(EXCPTION){ /* root is modified */
		      if(strcmp(prefix,""))
			 printf("%s_",prefix);
		      if(strcmp(root_front,""))
			 printf("%s_",root_front);
		printf("%s",jun);
              }


	     if(EXCPTION == 0) {
              /* split prefix & suffix from TAM */
	      if(index(TAM,'+') || index(TAM,'~'))
		 prefix_suffix(TAM,prefix,suffix);

		     /* word generator */
             if(GNP_FLAG) /* here GNP_FLAG=1 specifies GNP OFF */
		      word_gen(result,root,category,gender,number,person,TAM,GNP_FLAG);
             else {
	     if (!strcmp(category,"v")) {
	     	rtam = (char *) malloc(sizeof(tam_gnp_str_ar[0]));
	        rtam = (char *)my_bsearch(TAM,tam_gnp_str_ar[0].tam,TOTAL_FVG_TAMS,sizeof(tam_gnp_str_ar[0]),strcmp);
	     if(rtam[0] != '\0') {
	     /*	rtam = (char *)((int)rtam + 2*MAX_CHR_IN_TAM_STR); */
	        rtam += 2*MAX_CHR_IN_TAM_STR; }
	/*Pointer rtam is incremented to point to the third field,which is the gnp_str for raw_tam_lbl */
             if(rtam != NULL && strcmp(rtam,"0")) {
	        i=0;
                while(*rtam !='_' && *rtam !='\0'&& rtam != NULL && *rtam != '[') TAM[i++]= *rtam++;
	        TAM[i]='\0';
                rtam++; /* skip '[' */
	        i=0;
                while(*rtam !=',' && *rtam !='\0'&& rtam != NULL && *rtam != ']') RAW_GEN[i++]= *rtam++;
	        RAW_GEN[i]='\0';
                rtam++; /* skip ',' */
	        i=0;
                while(*rtam !=',' && *rtam !='\0'&& rtam != NULL && *rtam != ']') RAW_NUM[i++]= *rtam++;
	        RAW_NUM[i]='\0';
                rtam++; /* skip ',' */
	        i=0;
                while(*rtam !=',' && *rtam !='\0'&& rtam != NULL && *rtam != ']') RAW_PER[i++]= *rtam++;
	        RAW_PER[i]='\0';

	        if(!strcmp(RAW_GEN,"-")) strcpy(tgender,"NW");
	        else if(strcmp(RAW_GEN,"g_v")) strcpy(tgender,RAW_GEN);
                else strcpy(tgender,gender);

	        if(!strcmp(RAW_NUM,"-")) strcpy(tnumber,"NW");
	        else if(strcmp(RAW_NUM,"n_v")) strcpy(tnumber,RAW_NUM);
                else strcpy(tnumber,number);

	        if(!strcmp(RAW_PER,"-")) strcpy(tperson,"NW");
	        else if(strcmp(RAW_PER,"p_v")) strcpy(tperson,RAW_PER);
                else strcpy(tperson,person);

	        word_gen(result,root,category,tgender,tnumber,tperson,TAM,GNP_FLAG);
	        strcpy(fresult,result);
                if(*rtam != '\0') {
                   rtam++;	
                   while(*rtam !='\0') {
	             strcat(fresult,"_");
	             i=0;
	             while(*rtam != '_') troot[i++]=*rtam++;
	             troot[i]='\0';
	             i=0; rtam++;
	             while(*rtam != '_' && *rtam !='\0' && *rtam != '[') TAM[i++]= *rtam++;
	             TAM[i]='\0';
                     rtam++; /* skip '[' */
	             i=0;
                     while(*rtam !=',' && *rtam !='\0'&& rtam != NULL && *rtam != ']') RAW_GEN[i++]= *rtam++;
	             RAW_GEN[i]='\0';
                     rtam++; /* skip ',' */
	             i=0;
                     while(*rtam !=',' && *rtam !='\0'&& rtam != NULL && *rtam != ']') RAW_NUM[i++]= *rtam++;
	             RAW_NUM[i]='\0';
                     rtam++; /* skip ',' */
	             i=0;
                     while(*rtam !=',' && *rtam !='\0'&& rtam != NULL && *rtam != ']') RAW_PER[i++]= *rtam++;
	             RAW_PER[i]='\0';

	             if(!strcmp(RAW_GEN,"-")) strcpy(tgender,"NW");
	             else if(strcmp(RAW_GEN,"g_v")) strcpy(tgender,RAW_GEN);
                     else strcpy(tgender,gender);

	             if(!strcmp(RAW_NUM,"-")) strcpy(tnumber,"NW");
	             else if(strcmp(RAW_NUM,"n_v")) strcpy(tnumber,RAW_NUM);
                     else strcpy(tnumber,number);

	             if(!strcmp(RAW_PER,"-")) strcpy(tperson,"NW");
	             else if(strcmp(RAW_PER,"p_v")) strcpy(tperson,RAW_PER);
                     else strcpy(tperson,person);

		     word_gen(result,troot,category,tgender,tnumber,tperson,TAM,GNP_FLAG);
	             strcat(fresult,result);
	             if(*rtam != '\0') rtam++;
                   }   
	      }
	      strcpy(result,fresult);
	      if(EXTRA_ROOT_FLAG) {
	   	for(i=0;i<rlen;i++) fresult++;
              }
            }
	    else {
		   fprintf(stderr,"GNP agreement data for %s is missing in tam.c in the generator\n",TAM);
		   sprintf(result,"%s_%s",root,TAM);
       }
	}
	else word_gen(result,root,category,gender,number,person,TAM,GNP_FLAG);
	   }/* end else */
		      /* print word with all acces. */
		      if(strcmp(root_front,""))
			 printf("%s_",root_front);
		      if(strcmp(prefix,""))
			 printf("%s_",prefix);
		      printf("%s",result);    /* Generated Word */
		      if(strcmp(word_tag,""))
			 printf("_%s",word_tag);
		      if(strcmp(suffix,""))
			 printf("_%s",suffix);

		      /* print GNP values for the word */
		      if((SHOW_FLAG == 1) && (category[0] == 'v'))
			if( (strcmp(gender,"any") != 0) && (strcmp(number,"any") != 0) && (strcmp(person,"any") != 0))
			   printf("{%s,%s,%s}",gender,number,person);
               } 
              if(NEXT_SENSE == 1) {
		  printf("]");
		  NEXT_SENSE = 0;
              }

	      /* generate extra word */
              if ( EXTRA_ROOT_FLAG == 1) {
	                printf("[");
			EXTRA_ROOT_FLAG = 0;
			while(strcmp(extra_root,"")){
			  strcpy_till(root,extra_root,extra_root,'&');
		  if(GNP_FLAG)
		      word_gen(result,root,category,gender,number,person,TAM,GNP_FLAG);
                  else
		      strcpy(result,strcat(root,fresult));
			  if(B_FLAG == 1) 
			    printf("/%s",result);
			  else {
                                 if(strcmp(prefix,""))
                                        printf("%s_",prefix);
				  printf("%s",result);
				  B_FLAG = 1; 
			  }
		          if(strcmp(suffix,""))
				 printf("_%s",suffix);
			}
			printf("]");
	      }
	}
/*printf("\n"); */
return 1;
}  /* main */

/*
* function to read input structure 
*/
