#include "../headers/all_purpose.h"
struct dict_entry {
  char word[LARGE];
  int  parad_no;
};

struct parad_entry {
  char dirobl;
  char sinplu;
  int  parad_no;
};

struct parad_tbl{
     int no_of_chars;
     char rep_str[SMALL];
};
