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
@[a-zA-Z]+	{printf("%s",yytext);}
aa	{printf("a_a");}
ai	{printf("a_i");}
au	{printf("a_u");}
ii	{printf("i_i");}
uu	{printf("u_u");}
A	{printf("aa");}
I	{printf("ii");}
U	{printf("uu");}
L	{printf(".l");}
E	{printf("ai");}
O	{printf("au");}
H	{printf(".h");}
q	{printf(".r");}
Q	{printf(".rr");}
K	{printf("kh");}
G	{printf("gh");}
C	{printf("ch");}
J	{printf("jh");}
F	{printf("~n");}
t	{printf(".t");}
T	{printf(".th");}
d	{printf(".d");}
D	{printf(".dh");}
N	{printf(".n");}
M	{printf(".m");}
w	{printf("t");}
W	{printf("th");}
x	{printf("d");}
X	{printf("dh");}
P	{printf("ph");}
B	{printf("bh");}
S	{printf("z");}
R	{printf(".s");}
z	{printf("\"m");}
%%
