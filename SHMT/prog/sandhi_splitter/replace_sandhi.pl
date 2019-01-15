#!/usr/bin/env perl

#  Copyright (C) 2009-2019 Amba Kulkarni (ambapradeep@gmail.com)
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


$SCLINSTALLDIR = $ARGV[0];
require "$SCLINSTALLDIR/paths.pl";
require "$GlblVar::SCLINSTALLDIR/SHMT/prog/Normalisation/get_std_spelling_fn.pl";


$PUNC = "[\.\|!]?";
open(TMP, "<$ARGV[1]") || die "can't open $ARGV[1] for reading";

while($in = <TMP>){
  chomp($in);
  ($orig,$split) = split(/=/,$in);
   $orig =~ s/ //g;
   $split =~ s/ //g;
   $split =~ s/\-\+/-/g;
   $SPLIT{$orig} = $split;
#  print "split = $split\n";
}

while($in = <STDIN>){
   if($in =~ /^$/) { 
      $cnt = 0;
      print $in;
   } else {
      ($index,$ltag,$word,$rtag) = split(/\t/,$in);
       $index =~ /^([0-9]+)\.([0-9]+)/;
       $s_no = $1;
       $w_no = $2;
       $word_std = &get_std_spelling_fn($word);
       if($SPLIT{$word_std}){
         @words = split(/\+/,$SPLIT{$word_std});
         for ($i = 0; $i<= $#words; $i++){
          $wrd_no = $w_no + $cnt;
          if(($i == 0)  && ($#words == 0)) { #If no splits
            print $s_no,".",$wrd_no,"\t",$ltag,"\t",$word,"\t",$words[$i],"\t",$rtag;
          } elsif($i == 0) {# 1st component of the split
            print $s_no,".",$wrd_no,"\t",$ltag,"\t",$word,"\t",$words[$i],"\t\n";
          } elsif($i == $#words) { #last component of the split
            print $s_no,".",$wrd_no,"\t\t-\t",$words[$i],"\t",$rtag;
          } else {
            print $s_no,".",$wrd_no,"\t\t-\t",$words[$i],"\t\n";
          }
          $cnt++;
         }
         $cnt--;
       } else {
          $wrd_no = $w_no + $cnt;
          print $s_no,".",$wrd_no,"\t",$ltag,"\t",$word,"\t",$word,"\t",$rtag;
       }
   }
}
