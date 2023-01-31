#!/usr/bin/env perl

#  Copyright (C) 2017-2023 Amba Kulkarni (ambapradeep@gmail.com)
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
 chomp($in);
 if($in) {
    $in =~ s/\$//;
    $in =~ s/=/\//;
    ($word,@analysis) = split(/\//, $in);
 #print "analysis = ",@analysis,"\n";

print $word,"=";
#print "\n";
 
# Split the word and its analysis.
# remove the analysis that are repeated.

# Algo: For each of the analysis, check whether it has been repeated earlier.
# If not, then print.

# Current  Following  Actions				
#  1        2,3       print, remove analysis with 2,3	
#  1        4         Skip			
#  2,3      1,4       Skip				
#  2        3         print				
#  3        2         print				
#  4        1,2,3     print, remove analysis with 1,2,3	

  $ans = $analysis[0];
  #$ans = "";
  foreach ($i=1; $i<=$#analysis;$i++){
    #print "i = $i $analysis[$i]\n";
     $tmp = $analysis[$i];
     $tmp =~ s/<level:[1234]>//;
     if($#analysis == 0) { $ans = $analysis[$i];}
     else {
      $diff = 1;
      foreach ($j=0; $j <= $i-1; $j++){
       if($analysis[$j] ne "") {
         $tmp1 = $analysis[$j];
         $tmp1 =~ s/<level:[1234]>//;
         if ($tmp eq $tmp1) {
           if($analysis[$i] eq $analysis[$j]) { $analysis[$j] = ""; $diff = 0;}
           elsif ((($analysis[$i] =~ /<level:1>/) && ($analysis[$j] =~ /<level:4>/))
                  || (($analysis[$i] =~ /<level:[23]>/) && ($analysis[$j] =~ /<level:[14]>/)))
                      { $diff = 0;}
           elsif ((($analysis[$i] =~ /<level:4>/) && ($analysis[$j] =~ /<level:[123]>/))
                  || (($analysis[$i] =~ /<level:1>/) && ($analysis[$j] =~ /<level:[23]>/)))
            {$analysis[$j] = "";$diff = 0;}
#	      $tmp =~ s/nA_[^>]+>/nA>/;  # This is to remove the taddhita analysis, if present
#	      $tmp1 =~ s/nA_[^>]+>/nA>/;  # This is to remove the taddhita analysis, if present
           #print "ans = $ans\n";
    #     print "j=$j", $analysis[$j],"\n";
        }
       }
      }
     if ($diff == 1 && $analysis[$i] ne "") { $ans .= "/". $analysis[$i];}
    # print "$i ans = $ans\n";
   }
  }
     $ans =~ s/^\///;
     print $ans;
 }
 print "\n";
}
