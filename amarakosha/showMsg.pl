#!/usr/bin/env perl

#  Copyright (C) 2006-2011 Sivaja Nair and (2008-2023) Amba Kulkarni (ambapradeep@gmail.com)
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


my %rel_nm = ("NULL","syns","onto","onto","avayavI","holo","avayava","mero","parAjAwi","hyper","aparAjAwi","hypo","janaka","janaka","janya","janya","pawi","pawi","pawnI","pawnI","svAmi","svAmI","sevaka","sevaka","vESiRtya","vESiRtya","saMbanXi1","sambanXa","vqwwi","vqwwi");

  $/ = "\n\n";
  $rel = $rel_nm{$ARGV[0]};
  $out_encoding = $ARGV[1];
   @words=<STDIN>;

   print "<\@font \@size=4>\@The \@given \@word \@is \@in \@inflected \@form. <\@br>\@Check \@the \@spelling</\@font>";

   $count=0;
   $outputshow="";

   foreach $srcwrds(@words){
      chomp $srcwrds;
      $outputshow=$outputshow."<\@font \@size=4 \@color='\@red'><\@b><\@form \@action=\"\@interface.\@cgi\"> <\@input \@type=\"\@submit\" \@name=\"\@word\" \@size=30 \@value=\"$srcwrds\"> <\@input \@type=\"\@hidden\" \@name=\"\@encoding\" \@value=\"\@Unicode\"> <\@input \@type=\"\@hidden\" \@name=\"\@relation\" \@value=\"\@$rel\"><\@input \@type=\"\@hidden\" \@name=\"\@out_\@encoding\" \@value=\"\@$out_encoding\"></\@form></\@b></\@font>";
      $count++;
  }

if($count==0) { print "."; } 
elsif($count==1) {
print " <\@font \@size=4> \@or \@click \@on \@the prAwipaxikam :-</\@font><\@br><\@br>$outputshow";
} elsif($count>=2) {
print " <\@font \@size=4>\@or \@click \@on \@the \@appropriate prAwipaxikam \@from \@the \@following:</\@font><\@br><\@br>$outputshow";
}
