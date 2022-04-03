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
A	{printf("aa");}
I	{printf("ii");}
U	{printf("uu");}
L	{printf("ll");}
E	{printf("ai");}
O	{printf("au");}
H	{printf("h");}
q	{printf("q");}
Q	{printf("qq");}
K	{printf("kh");}
G	{printf("gh");}
C	{printf("ch");}
J	{printf("jh");}
F	{printf("fh");}
t	{printf("t");}
T	{printf("th");}
d	{printf("d");}
D	{printf("dh");}
N	{printf("nn");}
M	{printf("mm");}
w	{printf("w");}
W	{printf("wh");}
x	{printf("x");}
X	{printf("xh");}
P	{printf("ph");}
B	{printf("bh");}
S	{printf("ss");}
R	{printf("sh");}
%%
