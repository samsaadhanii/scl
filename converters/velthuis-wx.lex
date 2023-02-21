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
a_a	{printf("aa");}
i_i	{printf("ii");}
u_u	{printf("uu");}
a_i	{printf("ai");}
a_u	{printf("au");}
aa	{printf("A");}
ii	{printf("I");}
uu	{printf("U");}
ai	{printf("E");}
au	{printf("O");}
\.rr	{printf("Q");}
\.r	{printf("q");}
\.R	{printf("Q");}
\.l	{printf("L");}
kh	{printf("K");}
gh	{printf("G");}
\"n	{printf("f");}
ch	{printf("C");}
jh	{printf("J");}
\~n	{printf("F");}
\.th	{printf("T");}
\.t	{printf("t");}
\.T	{printf("T");}
\.dh	{printf("D");}
\.d	{printf("d");}
\.D	{printf("D");}
th	{printf("W");}
t	{printf("w");}
T	{printf("W");}
dh	{printf("X");}
d	{printf("x");}
D	{printf("X");}
\.n	{printf("N");}
ph	{printf("P");}
bh	{printf("B");}
\"s	{printf("S");}
z	{printf("S");}
\.s	{printf("R");}
\.h	{printf("H");}
\.m	{printf("M");}
\'	{printf("Z");}
%%
