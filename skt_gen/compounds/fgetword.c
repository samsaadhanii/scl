#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void fgetword(FILE *fp, char *word, char delimitor)
{
	int c;
        int i = 0;

        c=getc(fp);
	while ((c != EOF) && ( c != delimitor) && ( c!='\n'))
         {
           word[i++] = c;
	   c = getc(fp);    
	 }
	word[i] = '\0';
}
