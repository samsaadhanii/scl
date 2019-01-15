#!/usr/bin/env perl

#  Copyright (C) 2010-2019 Amba Kulkarni (ambapradeep@gmail.com)
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

#use GDBM_File;
#tie(%RD_KQW,GDBM_File,"$ARGV[1]",GDBM_READER,0644) || die "Can't open $ARGV[1] for reading";

open(TMP,"$ARGV[1]") || die "Can't open $ARGV[1] for reading";
while(<TMP>) {
chomp;
$RD_KQW{$_}=1;
}
close(TMP);

while($in = <STDIN>){
  if($in =~ /<level:[23]/){
     chomp($in);
     $in =~ s/=/\//;
    ($word,@analysis) = split(/\//, $in);
 
    print $word,"=";
 
# Split the word and its analysis.
#Remove the derivational analysis if the root is a rUDa kqw.
    $tmp = "";    
    foreach ($i=0; $i<=$#analysis;$i++){
# We do not get kqw_pratipadika uniformally. Hence two sep patterns are written 
      if ($analysis[$i] =~ /<kqw_pratipadika/) {
       $analysis[$i] =~ /<kqw_pratipadika:([^>]+)>/;
       $rt = $1;
      } elsif ($analysis[$i] =~ />([^>]+)</) {
       $analysis[$i] =~ />([^>]+)</;
       $rt = $1;
      } else {$rt = "";}
       if( ($rt ne "") && $RD_KQW{$rt}) {
           $analysis[$i] =~ s/^([^\/]+)>$rt</$rt</;
           $analysis[$i] =~ s/^([^\-]+)\-([^\/]+)>$rt</$1-$rt</;
#For new kqw analysis:
      if ($analysis[$i] =~ /<kqw_pratipadika/) {
           $analysis[$i] =~ s/<kqw_vrb_rt:[^>]+>.*<XAwuH:[^>]+><gaNaH:[^>]+><kqw_pratipadika:([a-zA-Z]+)><vargaH:/$1<vargaH:/;
      } else {
           $analysis[$i] =~ s/<kqw_vrb_rt:[^>]+>.*<XAwuH:[^>]+><gaNaH:[^>]+>([a-zA-Z]+)<vargaH:/$1<vargaH:/;
        }
       }
       if (   ($tmp !~ /^$analysis[$i]$/) 
           && ($tmp !~ /^$analysis[$i]\//) 
           && ($tmp !~ /\/$analysis[$i]\//) 
           && ($tmp !~ /\/$analysis[$i]$/)){
          $tmp .= "/".$analysis[$i];
       }
    }
    if($tmp ne "") { $tmp =~ s/^\///; print $tmp;} else { print join("/",@analysis);}
    print "\n";
  } else { print $in;}
}
