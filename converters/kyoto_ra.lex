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


WX	KH

q	R	
Q	RR
E	ai
O	au
K	kh
G	gh
C	ch
J	jh
f	G
F	J
t	T
T	Th
d	D
D	Dh
w	t
W	th
x	d
X	dh
P	ph
B	bh
S	z
R	S
Z	'
*****************************
*/
%option noinput
%option nounput
%x ASCII
%%
RR {printf("Q");}
R {printf("q");}
ai {printf("E");}
au {printf("O");}
kh {printf("K");}
gh {printf("G");}
G {printf("f");}
ch {printf("C");}
jh {printf("J");}
J {printf("F");}
Th {printf("T");}
T {printf("t");}
Dh {printf("D");}
D {printf("d");}
th {printf("W");}
t {printf("w");}
dh {printf("X");}
d {printf("x");}
ph {printf("P");}
bh {printf("B");}
z {printf("S");}
S {printf("R");}
' {printf("Z");}
%%
