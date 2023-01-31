/*
##############################################################################
#
#  Copyright (C) Vineet Chaitanya 1987-2002 and  Amba Kulkarni 1995-2023
#
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
 char map[]="01234567890123456789012345678901234567890123456789012345678901234⁄Àπ¿‚º∂£‹ª¥L¢¡Ê…Q÷’æﬁV√≈YÈ      § ∏ø·∑µÿ€∫≥—Ã∆Â»ﬂœ◊Ω›‘¬ƒÕ° ";
 char tmp;
 char tmp1;
NUKTA Z
OPERATOR_V V
OPERATOR_Y Y
SPECIAL_CATEGORY [zMH]
VOWEL_A a
VOWEL_REMAINING [AiIuUqeEoO]
CONSONANT [kKgGfcCjJFtTdDNwWxXnpPbBmyrlvSRsh]
ROM_WORD [A-Za-z0-9]+
%option noinput
%option nounput
%x CONS 
%%
@{ROM_WORD}				{printf("%s",yytext+1);}

{CONSONANT}				{
					printf("%c",map[(int)yytext[0] ]);BEGIN CONS;
					}

<CONS>{NUKTA}				{
					tmp='È';
					printf("%c",tmp);
					}

<CONS>{VOWEL_A}				{BEGIN INITIAL;}

<CONS>{VOWEL_REMAINING}			{
					printf("%c",map[(int)yytext[0] ]);
					BEGIN INITIAL;
					}

<CONS>{VOWEL_REMAINING}{OPERATOR_V}+ 	{
					printf("%c",map[(int)yytext[0] ]-yyleng+1);
					BEGIN INITIAL;
					}

<CONS>{VOWEL_REMAINING}{OPERATOR_Y}+ 	{
					printf("%c",map[(int)yytext[0] ]+yyleng-1);
					BEGIN INITIAL;
					}

<CONS>{CONSONANT}			{
                                        tmp='Ë';
					printf("%c%c",tmp,map[(int)yytext[0] ]);
					}

<CONS>{CONSONANT}{OPERATOR_V}+		{
                                        tmp='Ë';
					printf("%c%c",tmp,map[(int)yytext[0] ]-yyleng+1);
					}

<CONS>{CONSONANT}{OPERATOR_Y}+		{
                                        tmp='Ë';
					printf("%c%c",tmp,map[(int)yytext[0] ]+yyleng-1);
					}

<CONS>(.|\n)				{
                                        tmp='Ë';
					printf("%c%c",tmp,yytext[0]);
					BEGIN INITIAL;
					}

{VOWEL_REMAINING}			{
					printf("%c",map[(int)yytext[0] ]-53);
					}

{VOWEL_A}				{
					printf("%c",map[(int)yytext[0] ]);
					}

{SPECIAL_CATEGORY}			{
					printf("%c",map[(int)yytext[0] ]);
					}

{CONSONANT}{OPERATOR_V}+		{
					printf("%c",map[(int)yytext[0] ]-yyleng+1);
					BEGIN CONS;
					}

{CONSONANT}{OPERATOR_Y}+		{
					printf("%c",map[(int)yytext[0] ]+yyleng-1);
					BEGIN CONS;
					}

{VOWEL_REMAINING}{OPERATOR_V}+		{
					printf("%c",map[(int)yytext[0] ]-53-yyleng+1);
					}

{VOWEL_REMAINING}{OPERATOR_Y}+		{
					printf("%c",map[(int)yytext[0] ]-53+yyleng-1);
					}


{VOWEL_A}{OPERATOR_V}+			{
					printf("%c",map[(int)yytext[0] ]-yyleng+1);
					}

{VOWEL_A}{OPERATOR_Y}+			{
					printf("%c",map[(int)yytext[0] ]+yyleng-1);
					}
\.Y					{
					tmp='Í';
					tmp1='È';
					printf("%c%c",tmp,tmp1);
					}
\.					{
					printf("%c",yytext[0]);
					}

