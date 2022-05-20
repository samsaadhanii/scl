#define NOUN_VERBAL_NOUN PURE_NOUN * VERBAL_NOUN
#define VERB_VERBAL_NOUN PURE_VERB * VERBAL_NOUN
#define NOUN_VERB_VERBAL_NOUN PURE_NOUN*PURE_VERB*VERBAL_NOUN
#define NO_PARSARG 4
#define MIXED_PARSARG 8



#define TOTAL_PARSARG_ENTRIES 24  /* Where is this constant used?    AMBA 26/11/91 */
#define TOTAL_WRDS_IN_A_SENT 75
#define TOTAL_CHRS_IN_A_WORD 30
#define TOTAL_LEX_ENTRIES_PER_WORD 50 /* TEMP_FIX 13-> 30->50 AMBA */
#define TOTAL_NO_PARSARGS 100
#define MAX_CAT_ENTRIES 255
#define NO_OF_WRDS_IN_IVG_TAM 2
#define TOTAL_NO_CASES 10

#define UNKNOWN_CAT 1
#define PURE_NOUN 2
#define PURE_VERB 3
#define PURE_PARSARG 5
#define VERBAL_NOUN 7   /* TEMP_FIX 7 --> 3 */
#define VERBAL_KO 9   /* TEMP_FIX 7 --> 3 */
#define PURE_ADJECTIVE 11
#define AVYAYA 13
#define REL_PRONOUN 17
#define PRONOUN 19
#define PRON_ADJ 23
#define PURE_ADVERB 29
#define RaRTI 31
#define PRO_RaRTI 37
#define EMPTY_WRD  MAX_CAT_ENTRIES -1

#define VERB_PARSARG PURE_VERB * PURE_PARSARG
#define NOUN_PARSARG PURE_NOUN * PURE_PARSARG
#define VERB_NOUN PURE_VERB * PURE_NOUN 
#define NOUN_ADJECTIVE PURE_NOUN * PURE_ADJECTIVE

#define DIRECT_CASE 2
#define ONLY_DIRECT 1
#define ONLY_OBLIQUE 2
#define OBLIQUE_DIRECT 3

#define SINGULAR 2
#define PLURAL 3
#define SING_PLRL SINGULAR * PLURAL

#define UTTAM 2
#define MADHYAM  3
#define ANYA 5

#define MASCULINE 2
#define FEMININE 3
#define NEUTER 5

#define MAX_CHR_IN_TAM 50 /*SAME AS MAX_CHR_IN_TAM_STR*/
#define MAX_CHR_IN_VRB 16 /* odd -> even for dbx */
#define MAX_CHR_IN_TAM_STR 50 /*SAME AS MAX_CHR_IN_TAM*/
#define MAX_CHR_IN_VRB_STR 16

#define GENDER 4
#define NUMBER 4
#define PERSON 4
#define CASE_TMP 4

#define MAX_CHR_IN_GNP_STR 86
#define MAX_CHR_IN_PARSARG 15
#define MAX_CHR_IN_MOD_STR 30

#define MAX_CHR_IN_CAT 16
#define MAX_CHR_IN_CASE 16
#define MAX_CHR_IN_VIBHKT 16
#define MAX_CHR_IN_TAM_LBL 50
#define MAX_CHR_IN_PRATIPADIK 1000 /* changed for unknown word handler from 60 to 1000  by amba */

#define CASE_0 2
#define CASE_1 3
#define CASE_2 5
#define CASE_3 7
#define CASE_4 11
#define CASE_5 13
#define CASE_6 17
#define CASE_7 19
#define CASE_8 23
#define CASE_9 29
#define CASE_ZERO 0
