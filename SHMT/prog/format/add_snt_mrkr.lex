/* 
#  Copyright (C) 2002-2016 Amba Kulkarni (ambapradeep@gmail.com)
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

*/
int i;
 char str[1000];
%x ABSORB
%option noinput
%option nounput
%%
[\.\?\!]\n	{printf("%c</s>\n",yytext[0]); BEGIN ABSORB;}
[\.\?\!]["']\n	{printf("%c%c</s>\n",yytext[0],yytext[1]); BEGIN ABSORB;}
<ABSORB>[\n\t ]	{}
<ABSORB>.	{printf("<s>%c",yytext[0]);BEGIN 0;}
\.\.[ ][ ]\n	{printf("%c</s>\n",yytext[0]); BEGIN ABSORB;}
\.\.[ ][ ]	{printf("%c</s> ",yytext[0]); BEGIN ABSORB;}
[\.\?\!]["'][ ][ ]\n	{printf("%c%c</s>\n",yytext[0],yytext[1]); BEGIN ABSORB;}
[\.\?\!]["'][ ]	{printf("%c%c</s> ",yytext[0],yytext[1]); BEGIN ABSORB;}
[\.\?\!][ ]\n	{printf("%c</s>\n",yytext[0]); BEGIN ABSORB;}
[\.\?\!][ ]	{printf("%c</s> ",yytext[0]); BEGIN ABSORB;}
%%
/* Convention used:
Two blank spaces after a ./?/! starts a new sentence. Optionally the quotation marks may also be present. A new line after these marks also starts a new sentence.  It is assumed that there is at the most one paragraph as an input.
*/
int main (int argc, char * argv[] ) {
 yylex();
 return 1;
}
