/*
##############################################################################
#
#  Copyright (C) Vineet Chaitanya 1987-2002 and  Amba Kulkarni 1995-2016
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later
#  version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

##############################################################################
*/
 /* BUG: 
    This program does not work well when the file ends with a consonant. 
    An additional blank space or . is to be entered to get the final halant. 
    AMBA: 15th July 2015 */
 /*
	Following part is removed, since it converts even the '.' in real numbers.
  \.					{
					tmp ='ê';
					printf("%c",tmp);
					}
 */

 char map[]="01234567890123456789012345678901234567890123456789012345678901234ÚË¹Àâ¼¶£Ü»´L¢ÁæÉQÖÕ¾ÞVÃÅYé      ¤Ê¸¿á·µØÛº³ÑÌÆåÈßÏ×½ÝÔÂÄÍ¡ ";
 char tmp;
 char tmp1;
NUKTA Z
OPERATOR_V V
OPERATOR_Y Y
SPECIAL_CATEGORY [zMH]
VOWEL_A a
VOWEL_Q Q
VOWEL_L L
VOWEL_REMAINING [AiIuUqeEoO]
CONSONANT [kKgGfcCjJFtTdDNwWxXnpPbBmyrlvSRsh]
ROM_WORD [A-Za-z0-9]+
%option noinput
%option nounput
%x CONS 
%%
\\\|					{
					tmp='ð';
					tmp1='µ';
					printf("%c%c",tmp,tmp1);
					}
\\_					{
					tmp='ð';
					tmp1='¸';
					printf("%c%c",tmp,tmp1);
					}
@{ROM_WORD}				{printf("%s",yytext+1);}
@\.					{printf("%s",yytext+1);}

{CONSONANT}				{
					printf("%c",map[(int)yytext[0] ]);
                                        BEGIN CONS;
					}

z{NUKTA}				{
                                        tmp='¡';
                                        tmp1='é';
					printf("%c%c",tmp,tmp1);
					}
\.{NUKTA}				{
					tmp ='ê';
                                        tmp1='é';
					printf("%c%c",tmp,tmp1);
					}
{NUKTA}					{
					tmp ='ê';
                                        tmp1='é';
					printf("%c%c",tmp,tmp1);
					}
<CONS>I{NUKTA}				{
					tmp='Ü';
					tmp1='é';
					printf("%c%c",tmp,tmp1);
					BEGIN INITIAL;
					}

<CONS>{NUKTA}a				{
					/*tmp='è';
					tmp1='ê';
					printf("%c%c",tmp,tmp1);*/
					tmp='é';
					printf("%c",tmp);
					BEGIN INITIAL;
					}

<CONS>{VOWEL_A}				{BEGIN INITIAL;}

<CONS>{VOWEL_Q}				{
					tmp='ß';
					tmp1='é';
					printf("%c%c",tmp,tmp1);
					BEGIN INITIAL;
					}

<CONS>{VOWEL_L}				{
					tmp='Û';
					tmp1='é';
					printf("%c%c",tmp,tmp1);
					BEGIN INITIAL;
					}

<CONS>{VOWEL_REMAINING}			{
					printf("%c",map[(int)yytext[0] ]);
					BEGIN INITIAL;
					}

<CONS>{VOWEL_REMAINING}{OPERATOR_V}+ 	{
					tmp = map[(int)yytext[0] ]-yyleng+1;
					/*printf("%c",map[yytext[0] ]-yyleng+1); 
This produces a warning: 
format %c expects type int, but argument 2 has type yy_size_t
Hence everywhere a 'tmp' variable is introduced, and then it is printed.
*/
					printf("%c",tmp);
					BEGIN INITIAL;
					}

<CONS>{VOWEL_REMAINING}{OPERATOR_Y}+ 	{
					tmp = map[(int)yytext[0] ]+yyleng-1;
					/*printf("%c",map[yytext[0] ]+yyleng-1); */
					printf("%c",tmp);
					BEGIN INITIAL;
					}

<CONS>{CONSONANT}			{
					tmp='è';
					printf("%c%c",tmp,map[(int)yytext[0] ]);
					}

<CONS>{CONSONANT}{OPERATOR_V}+		{
					tmp = map[(int)yytext[0] ]-yyleng+1;
					/*printf("è%c",map[yytext[0] ]-yyleng+1);*/
					tmp1='è';
					printf("%c%c",tmp1,tmp);
					}

<CONS>{CONSONANT}{OPERATOR_Y}+		{
					tmp1='è';
					tmp = map[(int)yytext[0] ]+yyleng-1;
					/*printf("è%c",map[yytext[0] ]+yyleng-1);*/
					printf("%c%c",tmp1,tmp);
					}

<CONS>\.				{
					tmp1='è';
					tmp ='ê';
					printf("%c%c",tmp1,tmp);
					BEGIN INITIAL;
					}
<CONS>(.|\n)				{
					tmp1='è';
					printf("%c%c",tmp1,yytext[0]);
					BEGIN INITIAL;
					}
{VOWEL_REMAINING}			{
					printf("%c",map[(int)yytext[0] ]-53);
					}

{VOWEL_A}				{
					printf("%c",map[(int)yytext[0] ]);
					}

{VOWEL_Q}				{
                                        tmp='ª';
                                        tmp1='é';
					printf("%c%c",tmp,tmp1);
					}

{VOWEL_L}				{
					tmp='¦';
                                        tmp1='é';
					printf("%c%c",tmp,tmp1);
					}
{SPECIAL_CATEGORY}			{
					printf("%c",map[(int)yytext[0] ]);
					}

{CONSONANT}{OPERATOR_V}+		{
					tmp = map[(int)yytext[0] ]-yyleng+1;
				/*	printf("%c",map[yytext[0] ]-yyleng+1); */
					printf("%c",tmp);
					BEGIN CONS;
					}

{CONSONANT}{OPERATOR_Y}+		{
					tmp = map[(int)yytext[0] ]+yyleng-1;
				/*	printf("%c",map[yytext[0] ]+yyleng-1); */
					printf("%c",tmp);
					BEGIN CONS;
					}

{VOWEL_REMAINING}{OPERATOR_V}+		{
					tmp = map[(int)yytext[0] ]-53-yyleng+1;
				/*	printf("%c",map[yytext[0] ]-53-yyleng+1); */
					printf("%c",tmp);
					}

{VOWEL_REMAINING}{OPERATOR_Y}+		{
					tmp = map[(int)yytext[0] ]-53+yyleng-1;
				/*	printf("%c",map[yytext[0] ]-53+yyleng-1); */
					printf("%c",tmp);
					}


{VOWEL_A}{OPERATOR_V}+			{
					tmp = map[(int)yytext[0] ]-yyleng+1;
				/*	printf("%c",map[yytext[0] ]-yyleng+1); */
					printf("%c",tmp);
					}

{VOWEL_A}{OPERATOR_Y}+			{
					tmp = map[(int)yytext[0] ]+yyleng-1;
				/*	printf("%c",map[yytext[0] ]+yyleng-1); */
					printf("%c",tmp);
					}
\.Y					{
					tmp='ê';
					tmp1='é';
					printf("%c%c",tmp,tmp1);
					}

