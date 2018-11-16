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

kh	printf("K");
gh	printf("G");
ṅ	printf("f");

ch	printf("C");
jh	printf("J");
ñ	printf("F");

ṭh	printf("T");
ṭ	printf("t");
ḍh	printf("D");
ḍ	printf("d");
ṇ	printf("N");

th	printf("W");
t	printf("w");
dh	printf("X");
d	printf("x");

ph	printf("P");
bh	printf("B");

ś	printf("S");
ṣ	printf("R");
'	printf("Z");
%%
