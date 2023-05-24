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

#Get the names of the kaaraka relations
open(TMP,"$ARGV[0]") || die "Can't open $ARGV[0] for reading";
while(<TMP>) {
  chomp;
  if(/^([^ ]+) ([0-9]+)/){
   $num = $2;
   $name = $1;
   $kAraka_name{$num}=$name;
  }
}
close(TMP);


%ANA = {};
%REL = {};
## Get the relations corresponding to each word from parseop1.txt, and also note down the correct pnalysis
open(TMP,"$ARGV[1]") || die "Can't open $ARGV[1] for reading";

$cont = 1;
while ($cont) {
           $in = <TMP>;
           chomp($in);
	   if($in eq "") { $cont = 0;}
        if($in =~ /\(/) {
	    $in =~ s/\(//;
	    $in =~ s/\)//;
            @flds = split(/,/,$in);
            $wrd = $flds[0];
            $comp = $flds[1];
            $ana = $flds[2];
            $rel = $flds[3];
            $wrd1 = $flds[4];
            $comp1 = $flds[5];
            $ana1 = $flds[6];
            $key = $wrd.".".$comp;
            $key1 = $wrd1.".".$comp1;
            if (($rel > 100)  && ($rel < 5000)) { $rel = $rel - 100;}
            if($ANA{$key} eq "") { $ANA{$key} = $ana;}
            if($ANA{$key1} eq "") { $ANA{$key1} = $ana1;}
            if($REL{$key} eq "") { $REL{$key} = $kAraka_name{$rel}.",".($wrd1+1).".".($comp1+1);}
            else { $REL{$key} .= ";".$kAraka_name{$rel}.",".($wrd1+1).".".($comp1+1);}
        } elsif ($in =~ /Cost/) {$cont = 0;} 
        else {} # print $in?
}
close(TMP);

## Append the correct morph analysis and also the kaaraka relation
$/ = "\n\n";
while($in = <STDIN>){

     @ana = split(/\n/,$in);

     foreach $ana (@ana) {
        chomp($ana);
        @w_ana = split(/\t/,$ana);
        print $w_ana[0],"\t",$w_ana[1],"\t",$w_ana[2],"\t",$w_ana[3],"\t",$w_ana[4],"\t",$w_ana[5],"\t";
        ($word,$comp) = split(/\./,$w_ana[0]);
        $key = ($word-1).".".($comp-1);

        $w_ana[5] =~ s/\/[a-zA-Z]+<vargaH:SaUPa[^>]+>[^\/]+<level:0>//g;
        $w_ana[5] =~ s/^[a-zA-Z]+<vargaH:SaUPa[^>]+>[^\/]+<level:0>//g;
        $w_ana[5] =~ s/^\///;

        @mo_ana = split(/\//,$w_ana[5]);
        $ana_count = 0;
        $found=0; 
        foreach $mo_ana (@mo_ana) {
          if(defined($ANA{$key}) && ($ANA{$key} == $ana_count)) {
           print $mo_ana;         
           print "\t",$REL{$key};
           $found=1;
          }
          $ana_count++;
        }
        if(!$found) { print &pick_one_morph($w_ana[5]),"\t-";}
        print "\n";
      }
}

untie(%kAraka_name);


sub pick_one_morph {
  my($mo) = @_;
  $mo =~ s/\/.*//;
 $mo;
}
1;
