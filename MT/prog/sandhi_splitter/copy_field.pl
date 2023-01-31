#!/usr/bin/env perl

#  Copyright (C) 2014-2023 Amba Kulkarni (ambapradeep@gmail.com)
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

open(TMP,"<$ARGV[0]");
$sandhied_words = <TMP>;
chomp($sandhied_words);
close(TMP);
@sandhied_words = split(/ /,$sandhied_words);
for ($i=$#sandhied_words+1; $i < 30; $i++) { $sandhied_words[$i] = "ZZ";}

$i=0; $ls = 0; $lw = 0;
while($in = <STDIN>){
   if($in =~ /^$/) { 
      print $in;
   } else {
      ($index,$ltag,$word,$rtag) = split(/\t/,$in,4);
#      if (abs($lw-$ls) < 2){
          $word =~ /^(..)/;
          $fs = $1;
          if ($sandhied_words[$i] =~ /^$fs/) { $word_s = $sandhied_words[$i]; $ls = length($word_s); $lw = length($word);$i++;} 
          else {$word_s = "ZZ"; $lw += length($word);}
          print $index,"\t",$ltag,"\t",$word,"\t",$word_s,"\t",$rtag;
#      } else {
#         $word_s = ""; $lw += length($word);
#         print $index,"\t",$ltag,"\t",$word,"\t-\t",$rtag;
#      }
  }
}
