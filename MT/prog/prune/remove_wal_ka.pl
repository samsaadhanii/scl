#!/usr/bin/perl

#  Copyright (C) 2010-2023 Amba Kulkarni (ambapradeep@gmail.com)
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
  if($in =~ /<level:1>/){
     chomp($in);
     $in =~ s/=/\//;
    ($word,@analysis) = split(/\//, $in);
 
    print $word,"=";
 
# Split the word and its analysis.
# If it has more than one analysis, and one of the analysis has level 1,
# then remove all wal and ka analysis
    $tmp = "";    
    foreach ($i=0; $i<=$#analysis;$i++){
       if(($analysis[$i] !~ /waxXiwa_prawyayaH:wal/) &&
          ($analysis[$i] !~ /waxXiwa_prawyayaH:ka/)) {
           $tmp .= "/".$analysis[$i];
       }
    }
    if($tmp ne "") { $analysis[$i] = $tmp;}
    $analysis[$i] =~ s/^\///;
    print $analysis[$i],"\n";
  } else { print $in;}
}
