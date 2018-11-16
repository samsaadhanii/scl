#include "../headers/all_purpose.h"

#define NEW_WORDS_FILE "new_words.log"

struct noun_entry {
  char key[MEDIUM];
  char category[SMALL];
  char TL_equiv[VERY_LARGE];
  char gender[SMALL];
  char number[SMALL];
  int  animate ;
  int  countable; 
};

struct verb_entry{
  char key[MEDIUM];
  char category[SMALL];
  char TL_equiv[VERY_LARGE];
};

struct inde_entry{
  char key[MEDIUM];
  char category[SMALL];
  char TL_equiv[VERY_LARGE];
};

struct TAM_map{
   char SL_TAM[MEDIUM];
   char TL_TAM[MEDIUM];
   };

#define DEFAULT_TAM "0"  

struct lo_word {
	char category[SMALL];
	char root[MEDIUM];
	char gender[SMALL];
	char number[SMALL];
	char CASE[SMALL];
	char TAM[MEDIUM];
	char person[SMALL];
	char perserg[MEDIUM];
	char vibhakti[MEDIUM];
}; 
