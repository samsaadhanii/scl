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
%option noinput
%option nounput
%%
@[a-zA-Z]+	printf("##%s##",yytext+1);
z	printf(".N");
q	printf("R^i");
Q	printf("R^I");
L	printf("L^i");
E	printf("ai");
O	printf("au");
K	printf("kh");
G	printf("gh");
f	printf("~N");
C	printf("Ch");
c	printf("ch");
J	printf("jh");
F	printf("~n");
T	printf("Th");
t	printf("T");
D	printf("Dh");
d	printf("D");
w	printf("t");
W	printf("th");
x	printf("d");
X	printf("dh");
P	printf("ph");
B	printf("bh");
S	printf("sh");
R	printf("Sh");
lY	printf("L");
rY	printf("R");
kZ	printf("q");
KZ	printf("Q");
gZ	printf("G");
jZ	printf("z");
PZ	printf("f");
dZ	printf(".D");
DZ	printf(".Dh");
EY	printf("a.c");
OY	printf("aa.c");
Z	printf(".a");
%%
/* \.Z	printf(".a"); */
