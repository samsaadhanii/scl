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
Ā	printf("A");
Ī	printf("I");
Ū	printf("U");
Ḷ	printf("L");
Ṛ	printf("q");
Ṝ	printf("Q");
Ai	printf("E");
Au	printf("O");
AI	printf("E");
AU	printf("O");
Ṃ	printf("M");
ḥ	printf("H");

ā	printf("A");
ī	printf("I");
ū	printf("U");
ḷ	printf("L");
ṛ	printf("q");
ṝ	printf("Q");
ai	printf("E");
au	printf("O");
ṃ	printf("M");
ṁ 	printf("M");
ḥ	printf("H");

Kh	printf("K");
K	printf("k");
Gh	printf("G");
G	printf("g");
Ṅ	printf("f");

kh	printf("K");
gh	printf("G");
ṅ	printf("f");

Ch	printf("C");
C	printf("c");
Jh	printf("J");
J	printf("j");
Ñ	printf("F");

ch	printf("C");
jh	printf("J");
ñ	printf("F");

Ṭh	printf("T");
Ṭ	printf("t");
Ḍh	printf("D");
Ḍ	printf("d");
Ṇ	printf("N");

ṭh	printf("T");
ṭ	printf("t");
ḍh	printf("D");
ḍ	printf("d");
ṇ	printf("N");

th	printf("W");
t	printf("w");
dh	printf("X");
d	printf("x");

Th	printf("W");
T	printf("w");
Dh	printf("X");
D	printf("x");

Ph	printf("P");
P	printf("p");
Bh	printf("B");
B	printf("b");
M	printf("m");

ph	printf("P");
bh	printf("B");

R	printf("r");

ś	printf("S");
ṣ	printf("R");
Ś	printf("S");
Ṣ	printf("R");
'	printf("Z");
%%
