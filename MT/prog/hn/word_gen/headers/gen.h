#include "../headers/all_purpose.h" 

struct noun_paradigms{
char Root[MEDIUM];
char number[SMALL];
char n_case[SMALL];
int ch_to_be_deleted;
char suffix[MEDIUM];
char del_ch[SMALL];
};

struct lex{
char root[MEDIUM];
char paradigm[MEDIUM];
};

struct verb_paradigms{
char Root[MEDIUM];
char tam[SMALL];
char gender[SMALL];
char number[SMALL];
char person[SMALL];
int ch_to_be_deleted;
char suffix[MEDIUM];
};

struct pronoun_paradigms{
char Root[MEDIUM];
int ch_to_be_deleted;
char final_form[MEDIUM];
};

struct shashti_paradigms{
char Root[MEDIUM];
int ch_to_be_deleted;
char final_form[MEDIUM];
};
