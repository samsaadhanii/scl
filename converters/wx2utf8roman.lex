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
@[a-zA-Z]+	{ printf("%s",yytext+1);}
A		{ printf("ā");}
I		{ printf("ī");}
U		{ printf("ū");}
L		{ printf("ḷ");}
q		{ printf("ṛ");}
Q		{ printf("ṝ");}

E		{ printf("ai");}
O		{ printf("au");}
H		{ printf("ḥ");}
M		{ printf("ṃ");} /* m with dot below */
z		{ printf("ṁ");} /* m with dot above */

K		{ printf("kh");}
G		{ printf("gh");}
f		{ printf("ṅ");}

C		{ printf("ch");}
J		{ printf("jh");}
F		{ printf("ñ");}

t		{ printf("ṭ");}
T		{ printf("ṭh");}
d		{ printf("ḍ");}
D		{ printf("ḍh");}
N		{ printf("ṇ");}

w		{ printf("t");}
W		{ printf("th");}
x		{ printf("d");}
X		{ printf("dh");}

P		{ printf("ph");}
B		{ printf("bh");}

S		{ printf("ś");}
R		{ printf("ṣ");}

Z		{ printf("'");}
@		{}
.		{ECHO;}
\n		{ECHO;}
%%
