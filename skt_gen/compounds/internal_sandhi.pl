#!/usr/bin/env perl

#  Copyright (C) 2012-2023 Pavan Kumar and Amba Kulkarni (ambapradeep@gmail.com)
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


sub internal_sandhi{
 my($input)=@_;
 my($ans);
 $ans = "";
# added by karunakar for removing + at the end of sentence example rAjan+puruRa+
$input =~ s/\+$//;
if($debug) {
   print "<\@p>\@input \@to \@internal sanXiH = <\@span>$input</\@span></\@p>";
}
if($input=~/an\+aSva(.*)/){$ans = $ans .":". "anaSva$1";$ans1= $ans1 .":"."kArya";$ans2=$ans2.":"."nipAwana";}
if($input=~/an\+upalabXi(.*)/){$ans = $ans .":". "anupalabXi$1";$ans1= $ans1 .":"."kArya";$ans2=$ans2.":"."nipAwana";}
if($input =~ /gavi\+sWir(.*)/){$ans = $ans .":". "gaviRTir$1";$ans1 = $ans1 .":"."kArya";$ans2 = $ans2 .":". "sUtra";}
if($input =~ /yuXi\+sWir(.*)/){$ans = $ans .":". "yuXiRTir$1";$ans1 = $ans1 .":"."kArya";$ans2 = $ans2 .":". "sUtra";}
#if($input =~ /(.*[rR].*\+.*)n(.*)/){$ans = $ans .":". "$1N$2";$ans1 = $ans1 .":"."kArya";$ans2 = $ans2 .":". "sUtra";}
if($input =~ /mAwq\+svasq(.*)/){$ans = $ans .":". "mAwqRvasq$1";$ans1 = $ans1.":"."kArya";$ans2 = $ans2 .":"."sUtra";}
if($input =~ /piwq\+svasq(.*)/){$ans = $ans .":". "piwqRvasq$1";$ans1 = $ans1.":"
."kArya";$ans2 = $ans2 .":"."sUtra";}
 $ans =~ s/^://;
 if($ans eq "") { $ans = $input;}

$ans;
}
1;
