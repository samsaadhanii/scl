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


Please see 
http://www.aczoom.com/itrans/#itransencoding

ITRANS 5.3 Encoding for Devanagari
(Hindi/Marathi/Sanskrit) 

This section describes the ITRANS encoding, for
Devanagari. This is the basic encoding used for all
Indic language scripts. Consult the individual
language manuals in the ITRANS archive
(ITRANS/doc/ *.itx files, also available for online
browsing) for exact details on every language
supported by ITRANS. 

Vowels (dependent and independent):
-------
a     aa / A       i      ii / I       u     uu / U 
RRi / R^i    RRI / R^I    LLi / L^i    LLI / L^I
e     ai     o     au     aM    aH

Consonants:
----------- 
k     kh     g     gh     ~N
ch    Ch     j     jh     ~n
T     Th     D     Dh     N
t     th     d     dh     n
p     ph     b     bh     m
y     r      l     v / w
sh    Sh     s     h      L
x / kSh     GY / j~n / dny     shr
R (for marathi half-RA)
L / ld (marathi LLA)
Y (bengali)

Consonants with a nukta (dot) under them (mainly for
Urdu devanagari):
-----------------------------------------
k  with a dot:      q
kh with a dot:      K
g  with a dot:      G
j  with a dot:      z / J
p  with a dot:      f
D  with a dot:      .D
Dh with a dot:      .Dh

Specials/Accents:
-----------------
Anusvara:       .n / M / .m  (dot on top of previous
consonant/vowel)
Avagraha:       .a    (`S' like symbol basically to
replace a after o)
Ardhachandra:   .c    (for vowel sound as in english
words `cat' or `talk')
Chandra-Bindu:  .N    (chandra-bindu on top of
previous letter)
Halant:		.h    (to get half-form of the consonant - no
vowel - virama)
Visarga:        H     (visarga - looks like a colon
character)
Om:		OM, AUM (Om symbol)


[As shown, many codes have multiple choices, example
"RRi / R^i" implies you
 can use either "RRi" or "R^i"]
*/
%option noinput
%option nounput
%x ASCII
%%
OM {printf("om");}
AUM {printf("om");}
a\.c	{printf("EY");}
aa\.c	{printf("OY");}
aa {printf("A");}
ii {printf("I");}
uu {printf("U");}
RRi {printf("q");}
R^i {printf("q");}
RRI	{printf("Q");}	/* Dirty soln; Q & L mapping should be xfered to ra_d8 */
R^I	{printf("Q");}	/* Dirty soln; Q & L mapping should be xfered to ra_d8 */
LLi	{printf("L");}
L^i	{printf("L");}
LLI {printf("?");}
L^I {printf("?");}
ai {printf("E");}
au {printf("O");}
\.n {printf("M");}
\.m {printf("M");}
\.N {printf("z");}
\.a {printf("κι");}
kh {printf("K");}
gh {printf("G");}
~N {printf("f");}
N^ {printf("f");} /* For 4.0 compatibility */
ch {printf("c");}
Ch {printf("C");}
Chh {printf("C");} /* For 4.0 compatibility */
jh {printf("J");}
~n {printf("F");}
JN {printf("F");} /* For 4.0 compatibility */
T {printf("t");}
Th {printf("T");}
D {printf("d");}
Dh {printf("D");}
t {printf("w");}
th {printf("W");}
d {printf("x");}
dh {printf("X");}
ph {printf("P");}
bh {printf("B");}
\^r {printf("r");} /* CHECK */
\.r {printf("r");} /* CHECK */
v {printf("v");}
w {printf("v");}
sh {printf("S");}
shh {printf("R");} /* For 4.0 compatibility */
Sh {printf("R");}
L {printf("lY");}
ld {printf("lY");}
ksh {printf("kR");} /* For 4.0 compatibility */
x {printf("kR");}
GY {printf("jF");} /* For 4.0 compatibility */
j~n {printf("jF");}
dny {printf("jF");}
shr {printf("Sr");}
R {printf("rY");}
q {printf("kZ");}
K {printf("KZ");}
G {printf("gZ");}
z {printf("jZ");}
f {printf("PZ");}
\.D {printf("dZ");}
\.Dh {printf("DZ");}
##	{BEGIN ASCII;}
<ASCII>##	{BEGIN 0;}
<ASCII>[a-zA-Z]*	{printf("@%s",yytext);}
%%
