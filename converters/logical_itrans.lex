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


WHITE_SPACE	[ \t\r\n\v]
%x ASCII
%option noinput
%option nounput
%%
kh/{WHITE_SPACE}	printf("kha");
k/{WHITE_SPACE}	printf("ka");
gh/{WHITE_SPACE}	printf("gha");
g/{WHITE_SPACE}	printf("ga");
N\^/{WHITE_SPACE}	printf("N^a");
chh/{WHITE_SPACE}	printf("chha");
ch/{WHITE_SPACE}	printf("cha");
jh/{WHITE_SPACE}	printf("jha");
JN/{WHITE_SPACE}	printf("JNa");
j/{WHITE_SPACE}	printf("ja");
Th/{WHITE_SPACE}	printf("Tha");
T/{WHITE_SPACE}	printf("Ta");
Dh/{WHITE_SPACE}	printf("Dha");
D/{WHITE_SPACE}	printf("Da");
\.N/{WHITE_SPACE}	printf(".N");
N/{WHITE_SPACE}	printf("Na");
th/{WHITE_SPACE}	printf("tha");
t/{WHITE_SPACE}	printf("ta");
dh/{WHITE_SPACE}	printf("dha");
d/{WHITE_SPACE}	printf("da");
\.n/{WHITE_SPACE}	printf(".n");
n/{WHITE_SPACE}	printf("na");
ph/{WHITE_SPACE}	printf("pha");
p/{WHITE_SPACE}	printf("pa");
bh/{WHITE_SPACE}	printf("bha");
b/{WHITE_SPACE}	printf("ba");
m/{WHITE_SPACE}	printf("ma");
y/{WHITE_SPACE}	printf("ya");
r/{WHITE_SPACE}	printf("ra");
l/{WHITE_SPACE}	printf("la");
v/{WHITE_SPACE}	printf("va");
sh/{WHITE_SPACE}	printf("sha");
shh/{WHITE_SPACE}	printf("shha");
s/{WHITE_SPACE}	printf("sa");
h/{WHITE_SPACE}	printf("ha");
L/{WHITE_SPACE}	printf("La");
ksh/{WHITE_SPACE}	printf("ksha");
x/{WHITE_SPACE}	printf("xa");
GY/{WHITE_SPACE}	printf("GYa");
q/{WHITE_SPACE}	printf("qa");
K/{WHITE_SPACE}	printf("Ka");
G/{WHITE_SPACE}	printf("Ga");
z/{WHITE_SPACE}	printf("za");
f/{WHITE_SPACE}	printf("fa");
\.Dh/{WHITE_SPACE}	printf(".Dha");
\.D/{WHITE_SPACE}	printf(".Da");
\.h	{}
##      {BEGIN ASCII;printf("##");}
<ASCII>##       {BEGIN 0;printf("##");}
<ASCII>[a-zA-Z]*        {printf("%s",yytext);}
%%
