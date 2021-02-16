#include <stdio.h>
#include <string.h>
/* Sample input:
kAMcana kaMgana kAMt kAMw karwwA karwwyA
OUTPUT:
kAFcana kafgana kANt kAnw karwA karwwyA
*/

extern int getword();
void get_std_spelling();
void get_white_sp();

int main(int argc, char *argv[]) 
{
 char word[1000];
 char std_spell[1000];
 char wh_sp[100];

  get_white_sp(wh_sp);
  printf("%s",wh_sp);

  while(getword(word) > 0) {
    get_std_spelling(word, std_spell);
    printf("%s",std_spell);
 
    get_white_sp(wh_sp);
    printf("%s",wh_sp);
  }
  return 0;
}

void get_std_spelling(char *in, char *out){
int c, c1, c2, c3; 
/* c, c1, c2, c3 represent consecutive characters */
/* algo:
M/[kKgG] -> f
M/[cCjJ] -> F
M/[tTdD] -> N
M/[wwXX] -> n
M/[pPbB] -> m
rww/[aAiI..] -> rw
*/
int len, i=0, j=0;
len = strlen(in);


while(i < len) {
  c = in[i];
  if (c == 'M') {
     if (i+1 == len) { out[j] = 'm'; j++; i++;} /* If this is the last char */
     else {
       c1 = in[i+1];
       switch(c1) {
	       case 'k': case 'K': case 'g': case 'G': case 'f': {out[j] = 'f', out[j+1]= c1; j += 2; i += 2;break;}
	       case 'c': case 'C': case 'j': case 'J': case 'F': {out[j] = 'F'; out[j+1] = c1; j+= 2; i += 2;break;}
	       case 't': case 'T': case 'd': case 'D': case 'N': {out[j] = 'N'; out[j+1] = c1; j+= 2; i += 2;break;}
	       case 'w': case 'W': case 'x': case 'X': case 'n': {out[j] = 'n'; out[j+1] = c1; j+= 2; i += 2;break;}
	       case 'p': case 'P': case 'b': case 'B': case 'm': {out[j] = 'm'; out[j+1] = c1; j+= 2; i += 2;break;}
         default: {out[j] = 'M'; out[j+1] = c1; j += 2; i += 2;}
       }
     }
  }
  else if (c == 'r') {
     if (i+1 == len) {out[j] = 'r'; j++;  i++;} /* If this is the last char */
     else {
        c1 = in[i+1];
        switch(c1) {
           case 'w': {
                   if (i+2 == len) { out[j] = 'r'; out[j+1] = 'w'; j+= 2; i += 2;} /* If this is the last char */
                   else { 
                     c2 = in[i+2];
                     if(c2 == 'w') {
                       if (i+3 == len) { out[j] = 'r'; out[j+1] = 'w'; out[j+2] = 'w'; j += 3; i += 3;} /* If this is the last char */
                       else { 
                        c3 = in[i+3];
                        switch(c3) {
		  	  case 'a': case 'A': case 'i': case 'I':
			  case 'u': case 'U': case 'q': case 'L':
			  case 'e': case 'E': case 'o': case 'O': {
						out[j] = 'r'; out[j+1] = 'w'; out[j+2] = c3; j += 3;  i += 4; break;
			  }
                          default: { out[j] = 'r'; out[j+1] = 'w'; out[j+2] = 'w'; out[j+3] = c3; j += 4; i += 4; break;}
                        }
                      }
                     } else { out[j] = 'r'; out[j+1] = 'w'; out[j+2] = c2; j+=3; i += 3;}
                   }
                   break;
                }
       default: { out[j] = 'r'; out[j+1] = c1; j+= 2; i += 2;}
      }
    }
  } else { out[j] = c; j += 1; i += 1;}
}
out[j] = '\0';
}

int getword(char *word)
{
        int c,i = 0;

        c=getchar();
        while ((c != EOF) && ( c != ' ') && ( c != '\n') && (c != '\t'))
        {
           word[i++] = c; 
           c = getchar();
        }
        ungetc(c,stdin);
        word[i] = '\0';
return i;
}

void get_white_sp(char *wh_sp)
{
  int c, i=0;
  c = getchar();
  while ((c == ' ') || (c == '\n') || (c == '\t')){
     wh_sp[i++] = c;
     c = getchar();
  }
  ungetc(c,stdin);
  wh_sp[i]= '\0';
 // return i;
}
