#!/usr/bin/env perl
#  Copyright (C) 2002-2023 Amba Kulkarni (ambapradeep@gmail.com)
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


$prev_ana = <STDIN>;
chomp($prev_ana);

while($ana = <STDIN>){
  chomp($ana);
  @prev_ana = split(/\//, $prev_ana);
  $found = 0; 
     if($ana =~ /<kqw_prawyayaH:Namul>/) {

#If the following word has Namul analysis, then keep only the Namul analysis.

          foreach ($i=0; $i<=$#prev_ana;$i++){
            if($prev_ana[$i] =~ /<kqw_prawyayaH:Namul>/) {
               if(($ana =~ /$prev_ana[$i]\//) || ($ana =~ /$prev_ana[$i]$/)){ 
                   $ans .= "/".$prev_ana[$i]; 
                   $found = 1;
               }
            }
          }
          if(!$found) { 
            foreach ($i=0; $i<=$#prev_ana;$i++){
              if($prev_ana[$i] !~ /<kqw_prawyayaH:Namul>/) {
                   $ans .= "/".$prev_ana[$i]; 
              }
            }
          }

#	  $ans =~ s/^\//; 
#          print $ans;
     } else {
# If the following word does not have Namul, 
# Check whether the current word has any analysis other than Namul.
# If yes, print only non Namul analysis,
# else print complete analysis.
# $ans = "";
 if($#prev_ana > 1) {
            $found_non_Namul = 0;
            foreach ($i=0; $i<=$#prev_ana;$i++){
              if($prev_ana[$i] !~ /<kqw_prawyayaH:Namul>/) {
                   $ans .= "/".$prev_ana[$i]; 
                   $found_non_Namul = 1;
              }
            }
            if(!$found_non_Namul) { $ans .= "/".$prev_ana; } 
            #else { $ans =~ s/^\///; print $ans;}
} else { $ans .= $prev_ana;}
}
 $prev_wrd = $wrd;
 $prev_ana = $ana;
 $ans =~ s/\/\///g;
 $ans =~ s/^\///;
 print $ans;
 print "\n";
 $ans = "";
}

$ans = "";
@analysis = split(/\//, $prev_ana);
 $found_non_Namul = 0;
 foreach ($i=0; $i<=$#analysis;$i++){
      if($analysis[$i] !~ /<kqw_prawyayaH:Namul>/) {
         $ans .= "/",$analysis[$i]; 
         $found_non_Namul = 1;
      }
 }
 if(!$found_non_Namul) { $ans .= "/".$prev_ana; }
 $ans =~ s/\/\///g;
 $ans =~ s/^\///;
 print $ans;
 print "\n";
