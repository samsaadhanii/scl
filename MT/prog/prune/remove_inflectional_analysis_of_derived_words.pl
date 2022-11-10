#!/usr/bin/env perl

#  Copyright (C) 2010-2022 Amba Kulkarni (ambapradeep@gmail.com)
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
     $in =~ s/=/\//;
    ($word,@analysis) = split(/\//, $in);
 
    print $word,"=";
    if ($word =~ /^-/) { $word =~ s/^-//;}
    if ($word =~ /-\$/) { $word =~ s/-\$//;}
 
# Split the word and its analysis.
    $tmp = "";    
    foreach ($i=0; $i<=$#analysis;$i++){
        $found = 0;    
         foreach ($j=0; $j<=$i;$j++){
	   $t = $analysis[$i];
	   $t =~ s/<level:[0-9]>//;
           if ($analysis[$j] =~ /$t/) { $found = 1; }
         }
      if ($found = 0) { $tmp .= $tmp."/".$analysis[$i]; }
    }
    if($tmp ne "") { $tmp =~ s/^\///; print $tmp;} 
    elsif ($in !~ /^-/) { print join("/",@analysis);}
    print "\n";
}
