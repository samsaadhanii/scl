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
      chomp($in);
      ($index,$word,$rem) = split(/\t/,$in,3);
          $word =~ /^(..)/;
          $fs = $1;
          if ($word =~ /^\-/) { $word_s = "ZZ"; $lw += length($word);}
          elsif ($sandhied_words[$i] =~ /^$fs/) { $word_s = $sandhied_words[$i]; $ls = length($word_s); $lw = length($word);$i++;} 
          elsif ($sandhied_words[$i] =~ /^[\.,]/) { $word_s = $sandhied_words[$i]; $ls = length($word_s); $lw = length($word);$i++;} 
          else {$word_s = "ZZ"; $lw += length($word);}
	  if ($rem ne "") { # In the case of Heritage splitter, first we get morph analysis and then we add the sandhied data. Hence $rem is non-empty
              print $index,"\t",$word,"\t",$word_s,"\t",$rem,"\n";
          } else { print $index,"\t",$word,"\t",$word_s,"\n";}
  }
}
