#!/usr/bin/perl

#  Copyright (C) 2010-2018 Amba Kulkarni (ambapradeep@gmail.com)
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



while($in = <STDIN>){
  if($in =~ /<level:0>/){
     chomp($in);
     $in =~ s/=/\//;
    ($word,@analysis) = split(/\//, $in);
 
    print $word,"=";
 
# Split the word and its analysis.
# If it has an analysis which shows only the derivation of a pratipadik, then remove such analysis
    $tmp = "";    
    foreach ($i=0; $i<=$#analysis;$i++){
       if($analysis[$i] !~ /level:0/){ $tmp .= "/".$analysis[$i]; }
       if($analysis[$i] =~ /level:0/){ 
           if ($analysis[$i] =~ /vargaH:sapUpa/) { $tmp .= "/".$analysis[$i]; }
       }
    }
    if($tmp ne "") { $tmp =~ s/^\///; print $tmp;} else {} # { print join("/",@analysis);} Since these are just derivational analysis, it is of no use; hence deleted completely.
    print "\n";
  } else { print $in;}
}
