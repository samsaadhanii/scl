#!/usr/bin/env perl

#  Copyright (C) 2009-2022 Amba Kulkarni (ambapradeep@gmail.com)
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


#BEGIN{require "$ARGV[0]/paths.pl";}

#use lib $GlblVar::LIB_PERL_PATH;

$/ = "\n\n";

$Data_Path=$ARGV[1];
$LANG = $ARGV[2];

#use GDBM_File;
#tie(%LWG,GDBM_File,"$Data_Path/$LANG/avy_avy.dbm",GDBM_READER,0644) || die "Can't open noun.dbm for reading";
open(TMP,"$Data_Path/$LANG/avy_avy.txt") || die "Can't open avy_avy.txt for reading";
while(<TMP>) {
chomp;
$_ =~ /^([^,]+),(.*)$/;
$key = $1;
$val = $2;
$LWG{$key}=$val;
}
close(TMP);

while($in = <STDIN>){

@in = split(/\n/,$in);

 $sent = "";
 foreach $in (@in) {
   @columns = split(/\t/,$in);
   $sent .= "_".$columns[3]; # Word 
 }
 $sent =~ s/^_//;

 @words = split(/_/,$sent);
 $i=0;
 while($i<=$#words){
   $lwg_str = $words[$i]."-".$words[$i+1]."-".$words[$i+2];
   if($LWG{$lwg_str}) { 
      for($j=$i;$j<$i+2;$j++){
         chomp($in[$j]);
         print $in[$j],"\t---\n";
      }
      @columns = split(/\t/,$in[$i+2]);
      $last = $#columns;
      $last =~ s/^([^ ]+)/$LWG{$lwg_str}/;
      print $in[$j],"\t",$last,"\n";
      $i += 3;
   } else {
     $lwg_str = $words[$i]."-".$words[$i+1];
     if($LWG{$lwg_str}) { 
         chomp($in[$i]);
         print $in[$i],"\t---\n";
         chomp($in[$i+1]);
         @columns = split(/\t/,$in[$i+1]);
         $last = $columns[$#columns];
         $last =~ s/^([^ ]+)/$LWG{$lwg_str}/;
         print $in[$i+1],"\t",$last,"\n";
         $i += 2;
     } else { 
         @columns = split(/\t/,$in[$i]);
         $last = $#columns;
         print $in[$i],"\t",$columns[$last],"\n"; 
         $i++;
     }
   }
 }
 print "\n";
}
