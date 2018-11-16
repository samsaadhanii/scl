struct prsrg_index
     {
      char  prsrg_ar[20];
     };
struct word {
char tam[MAX_CHR_IN_TAM];
int cat;
char root[MAX_CHR_IN_PRATIPADIK];
int gender;
int number;
int number1;      /* number of the following word. */
int person;
int case_n;
char parsrg[MAX_CHR_IN_PARSARG];
};
struct lex_grp {
	char cat[MAX_CHR_IN_CAT]; 
        char root[MAX_CHR_IN_PRATIPADIK];
        int positn;
	int start_positn;
        int end_positn;
	int gender;
	int number;
	int case_n;
	char tam[MAX_CHR_IN_TAM_STR];
	int person;
	char vibhkt[MAX_CHR_IN_VIBHKT];
        char parsrg[MAX_CHR_IN_PARSARG];
        char mod_str[MAX_CHR_IN_MOD_STR];
        char flag[2];
};
struct word_info
{
int cat_nm;
int no_of_entries;
int noun;
int noun_pos_ar[TOTAL_LEX_ENTRIES_PER_WORD];
int verb;
int verb_pos_ar[TOTAL_LEX_ENTRIES_PER_WORD];
int verbal_noun;
int vn_pos_ar[TOTAL_LEX_ENTRIES_PER_WORD];
int prsrg;
int prsrg_pos_ar[TOTAL_LEX_ENTRIES_PER_WORD];
int adj;
int adj_pos_ar[TOTAL_LEX_ENTRIES_PER_WORD];
int avyaya;
int avy_pos_ar[TOTAL_LEX_ENTRIES_PER_WORD];
int adverb;
int adv_pos_ar[TOTAL_LEX_ENTRIES_PER_WORD];
};
struct par_vib
{
char parsrg[MAX_CHR_IN_PARSARG];
char vibhkt[MAX_CHR_IN_VIBHKT];
};
struct tam_gnp_str
{
char tam[MAX_CHR_IN_TAM_STR];
char raw_tam_lbl[MAX_CHR_IN_TAM_STR];
char gnp_str[MAX_CHR_IN_GNP_STR];
char gen_pos[GENDER]; 
char num_pos[NUMBER]; 
char per_pos[PERSON]; 
};
struct tam_num_str {
char tam[MAX_CHR_IN_TAM];
int  num;
};
struct vrb_num_str {
char vrb[MAX_CHR_IN_VRB];
int  num;
};
struct sort_print {
int max_wrd;
int gp_no;
int opt_no;
};
