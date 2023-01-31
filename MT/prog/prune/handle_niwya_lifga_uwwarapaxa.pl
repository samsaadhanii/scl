#!/usr/bin/env perl

#  Copyright (C) 2023 Amba Kulkarni (ambapradeep@gmail.com)
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


#Compound words with uwwarapaxa in niwya lifga should have only an exntry with one lifga and not other.
#For example, samuxra-vacanAw can not be in puM (even in bahuvrIhi), since vacana is in napuM.

while($in = <STDIN>){
    chomp($in);
    if($in){
      ($word,$ana) = split(/=/, $in);
      if($ana =~ /^(.*)\-/) {  $pUrvapaxa = $1."-"; $ana =~ s/^.*\-//;}
      else {$pUrvapaxa = "";}
      @analysis = split(/\//, $ana);

      print $word,"=",$pUrvapaxa;
      $ans = "";
      if ($pUrvapaxa ne "") {
         foreach ($i=0; $i<=$#analysis;$i++){
            if($analysis[$i] !~ /<kqw_prawyayaH:lyut>.*<lifgam:napuM>/){
               $ans .= "/".$analysis[$i];
            } 
         }
         $ans =~ s/^\///;
      } else {$ans = $ana;}
    print $ans;
   }
   print "\n";
}
