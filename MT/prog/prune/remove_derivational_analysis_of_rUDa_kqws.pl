#!/usr/bin/env perl

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


open(TMP,"$ARGV[0]") || die "Can't open $ARGV[0] for reading";

while(<TMP>) {
chomp;
$RD_KQW{$_}=1;
}
close(TMP);

while($in = <STDIN>){
  #if($in !~ /<level:1/){ # Why this condition?
     chomp($in);
     $in =~ s/=/\//;
    ($word,@analysis) = split(/\//, $in);
 
    print $word,"=";
    if ($word =~ /^-/) { $word =~ s/^-//; }
    if ($word =~ /-\$/) { $word =~ s/-\$//;}
#    print "analysis = @analysis\n";
 
# Split the word and its analysis.
#Remove the derivational analysis if the root is a rUDa kqw.
    $tmp = "";    
    foreach ($i=0; $i<=$#analysis;$i++){
        $rt = &get_rt($analysis[$i]);
        #if( ($rt ne "") && ($RD_KQW{$rt} || $RD_KQW{$word}) && ($pUrvapaxa == 1)) {
#Whether the kqw is a purvapaxa or not, the kqw analysis is to be removed.
        if( ($rt ne "") && ($RD_KQW{$rt} || $RD_KQW{$word})) {
           $analysis[$i] =~ s/^([^\/]+)>$rt</$rt</;
           $analysis[$i] =~ s/^([^\-]+)\-([^\/]+)>$rt</$1-$rt</;
	#For new kqw analysis:
           if ($analysis[$i] =~ /<kqw_pratipadika/) {
                $analysis[$i] =~ s/^.*<XAwuH:[^>]+><gaNaH:[^>]+><kqw_pratipadika:([a-zA-Z]+)><vargaH:/$1<vargaH:/;
           } else {
                $analysis[$i] =~ s/<kqw_XAwu:[^>]+>.*<XAwuH:[^>]+><gaNaH:[^>]+>([a-zA-Z]+)<vargaH:/$1<vargaH:/;
           }
       }
       if (   ($tmp !~ /^$analysis[$i]$/) 
           && ($tmp !~ /^$analysis[$i]\//) 
           && ($tmp !~ /\/$analysis[$i]\//) 
           && ($tmp !~ /\/$analysis[$i]$/)){
          $tmp .= "/".$analysis[$i];
       }
    }
    if($tmp ne "") { $tmp =~ s/^\///; print $tmp;} 
    elsif ($in !~ /^-/) { print join("/",@analysis);}
    print "\n";
 # } else { print $in;}
}

sub get_rt {
  my($ana) = @_;
  my ($rt);

# We do not get kqw_pratipadika uniformally. Hence two sep patterns are written 
#In some cases such as Ananxa with GaF analysis, we need to look at the word itself!
      if ($ana =~ /<kqw_pratipadika/) {
       $ana =~ /<kqw_pratipadika:([^>]+)>/;
       $rt = $1;
      } elsif ($ana =~ />([^>]+)</) {
       $ana =~ />([^>]+)</;
       $rt = $1;
      } else {$rt = "";}
#      print "rt = $rt\n";
#      print "$RD_KQW{$rt}\n";
#      print "word = $word\n";
#      print "$RD_KQW{$word}\n";
 $rt;
}
1;
