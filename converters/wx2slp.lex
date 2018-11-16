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
w	{printf("t");}
W	{printf("T");}
x	{printf("d");}
X	{printf("D");}
q	{printf("f");}
Q	{printf("F");}
R	{printf("z");}
t	{printf("w");}
T	{printf("W");}
d	{printf("q");}
D	{printf("Q");}
N	{printf("R");}
F	{printf("Y");}
f	{printf("N");}
L	{printf("x");}
lYh	{printf("|");}
z	{printf("~");}
Z	{printf("'");}
%%
