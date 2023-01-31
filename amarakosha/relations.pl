#!/usr/bin/env perl

#  Copyright (C) 2006-2011 Shivaja Nair and (2006-2023) Amba Kulkarni (ambapradeep@gmail.com)
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

BEGIN{require "../paths.pl";}

#use lib $GlblVar::LIB_PERL_PATH;

#use GDBM_File;

my $rel_dbm = $ARGV[0];
my $heading = $ARGV[1];
my $word = $ARGV[2];
my $out_encoding = $ARGV[3];

my(%LEX,%LEX1,%LEX2,%LEX3,$head,$vargaH,$synset,$heading_info,$relata_info,$synset_info);

#tie(%LEX,GDBM_File,"$GlblVar::SCLINSTALLDIR/amarakosha/DBM/stem2head.gdbm",GDBM_READER,0666) || die "can't open DBM/stem2head.gdbm";

require "$GlblVar::SCLINSTALLDIR/MT/prog/morph/web_interface/scripts.pl";
require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";


open(TMP,"$GlblVar::SCLINSTALLDIR/amarakosha/DBM/all_kANdas") || die "can't open DBM/all_kANdas";
$key = 0;
$value = 4;
while(<TMP>) {
  chomp;
  @flds = split(/,/,$_);
  if(($flds[0] !~ /^%/) && ($flds[$key] ne "") && ($flds[$value] ne "")) {
     if($LEX{$flds[$key]} eq "") {
        $LEX{$flds[$key]}  =  $flds[$value];
     }else {
        if (($LEX{$flds[$key]} !~ /::$flds[$value]::/) &&
             ($LEX{$flds[$key]} !~ /^$flds[$value]::/) &&
             ($LEX{$flds[$key]} !~ /::$flds[$value]$/) &&
             ($LEX{$flds[$key]} !~ /^$flds[$value]$/)) {
        $LEX{$flds[$key]}  .= "::". $flds[$value];
        }
     }
  }
}
close(TMP);

#tie(%LEX1,GDBM_File,"$GlblVar::SCLINSTALLDIR/amarakosha/DBM/synset_info.gdbm",GDBM_READER,0666) || die "can't open DBM/synsetinfo.gdbm";

open(TMP,"$GlblVar::SCLINSTALLDIR/amarakosha/DBM/all_kANdas") || die "can't open DBM/all_kANdas";
#Fields: Word(0), Reference(1), Gender(2), Varga(3), Head_word(4), is_a_part_of(5), is_a_kind_of(6), janya_janaka(7), pawi_pawnI(8), svasvAmI(9), vESiRtya(10), saMbanXiwa(11), vqwwi(12), English name(13),

while(<TMP>) {
  chomp;
  @flds = split(/,/,$_);
  if($flds[0] !~ /^%/)  {

     if($LEX1{$flds[4]} eq "") {
        $LEX1{$flds[4]}  =  $flds[0]."#".$flds[1]."#".$flds[2]."#".$flds[3];
     }else {
        $LEX1{$flds[4]}  .= "::". $flds[0]."#".$flds[1]."#".$flds[2]."#".$flds[3];
     }
  }
}
close(TMP);

if($rel_dbm ne "NULL") {
#   tie(%LEX2,GDBM_File,"$GlblVar::SCLINSTALLDIR/amarakosha/DBM/$rel_dbm.gdbm",GDBM_READER,0666) || die "can't open DBM/$rel_dbm.gdbm";
open(TMP,"$GlblVar::SCLINSTALLDIR/amarakosha/DBM/all_kANdas");
if($rel_dbm eq "onto") {
while(<TMP>) {
  chomp;
  @flds = split(/,/,$_);
 # print "input = ",$_,"\n";
  if(($flds[4] !~ /^%/) && (($flds[13] ne "") || ($flds[14] ne ""))) {

     $str  =  $flds[13]."#".$flds[14];
     if($LEX2{$flds[4]} eq "") {
        $LEX2{$flds[4]}  =  $str;
     } elsif (($LEX2{$flds[4]} !~ /^$str$/) && ($LEX{$flds[4]} !~ /^$str::/) && ($LEX{$flds[4]} !~ /::$str$/) && ($LEX{$flds[4]} !~ /::$str::/)){
#        print "str = $str\n";
#        print "LEX = $LEX{$flds[4]}\n";
        $LEX2{$flds[4]}  .= "::". $str;
     }
  }
}
}
else {
if ($rel_dbm eq "stem2head") { $key = 0; $value = 4; }
elsif ($rel_dbm eq "avayava") { $key = 5; $value = 4; }
elsif ($rel_dbm eq "avayavI") { $key = 4; $value = 5; }
elsif ($rel_dbm eq "aparAjAwi") { $key = 6; $value = 4; }
elsif ($rel_dbm eq "parAjAwi") { $key = 4; $value = 6; }
elsif ($rel_dbm eq "janaka") { $key = 4; $value = 7; }
elsif ($rel_dbm eq "janya") { $key = 7; $value = 4; }
elsif ($rel_dbm eq "pawi") { $key = 4; $value = 8; }
elsif ($rel_dbm eq "pawnI") { $key = 8; $value = 4; }
elsif ($rel_dbm eq "svAmI") { $key = 4; $value = 9; }
elsif ($rel_dbm eq "sevaka") { $key = 9; $value = 4; }
elsif ($rel_dbm eq "vESiRtya") { $key = 4; $value = 10; }
elsif ($rel_dbm eq "vESiRtyavaw") { $key = 10; $value = 4; }
elsif ($rel_dbm eq "sambanXiwa") { $key = 4; $value = 11; }
elsif ($rel_dbm eq "vqwwi") { $key = 4; $value = 12; }
elsif ($rel_dbm eq "vqwwivAn") { $key = 12; $value = 4; }
while(<TMP>) {
  chomp;
  @flds = split(/,/,$_);
  if(($flds[0] !~ /^%/) && ($flds[$key] ne "") && ($flds[$value] ne "")) {
     if($LEX2{$flds[$key]} eq "") {
        $LEX2{$flds[$key]}  =  $flds[$value];
     }else {
        if (($LEX2{$flds[$key]} !~ /::$flds[$value]::/) &&
             ($LEX2{$flds[$key]} !~ /^$flds[$value]::/) &&
             ($LEX2{$flds[$key]} !~ /::$flds[$value]$/) &&
             ($LEX2{$flds[$key]} !~ /^$flds[$value]$/)) {
        $LEX2{$flds[$key]}  .= "::". $flds[$value];
        }
     }
  }
}
}
close(TMP);
}

if($rel_dbm eq "onto") {
#   tie(%LEX3,GDBM_File,"$GlblVar::SCLINSTALLDIR/amarakosha/DBM/rule_onto.gdbm",GDBM_READER,0666) || die "can't open DBM/rule_onto.gdbm";

   open(TMP,"$GlblVar::SCLINSTALLDIR/amarakosha/DBM/rules_onto") || die "can't open DBM/rules_onto";
while(<TMP>) {
  chomp;
  @flds = split(/,/,$_);
 # print "input = ",$_,"\n";
  if(($flds[0] !~ /^%/) && ($flds[1] ne "")) {

     if($LEX3{$flds[0]} eq "") {
        $LEX3{$flds[0]}  =  $flds[1];
     }else {
        $LEX3{$flds[0]}  .= "::". $flds[1];
     }
  }
 }
 close(TMP);
}

   $heading_info = "<\@br><\@font \@color=\"\@magenta\">$heading</\@font><\@br>";

  if($rel_dbm eq "NULL") { print "<\@center>$heading_info</\@center>"; }

  if($LEX{$word} eq "") {
     $out = `$GlblVar::SCLINSTALLDIR/amarakosha/shw_stem.pl $word | /usr/bin/sort -u`;
     if ($out) {
        ` echo $out | $GlblVar::SCLINSTALLDIR/amarakosha/showMsg.pl $rel_dbm $out_encoding`;
     } else {print "\@Could \@not \@find $word \@in \@the \@Amarakosha\n";}
  } else {
    @head = split(/::/,$LEX{$word});
    foreach $head (@head) {
     $synset = $LEX1{$head};
     $synset_info = "";
     if($synset) {
        $synset_info = &synset_info($head,$synset,$word);
     }
     if($rel_dbm ne "NULL") {
       if($rel_dbm eq "onto") {
         $relata_info = "";
         ($jAw,$upA) = split(/#/,$LEX2{$head});
          if ($jAw ne ""){ 
            $str = $jAw;
            $relata_info = "<\@br><\@b>jAwi</\@b><\@br> => $str<\@br>";
            $heading_info = "";
            while($LEX3{$str}){
                $relata_info .= "=> $LEX3{$str}<\@br>";
                $str = $LEX3{$str};
            }
          }
          if ($upA ne ""){ 
            $str = $upA;
            $relata_info .= "<\@br><\@b>upAXi</\@b><\@br> => $str<\@br>";
            $heading_info = "";
            while($LEX3{$str}){
                $relata_info .= "=> $LEX3{$str}<\@br>";
                $str = $LEX3{$str};
            } 
          }
       } elsif(($rel_dbm eq "avayavI") || ($rel_dbm eq "parAjAwi")){
         $relata_info = "";
        while($LEX2{$head}){
           $relata = $LEX2{$head};
           $relata =~ s/::.*//;
           $relata_synset = $LEX1{$relata};
           if($relata_synset) {
              $relata_info .= &synset_info($relata,$relata_synset,$word);
           }
           $head = $relata;
        }
       } else {
        @relata = split(/::/,$LEX2{$head});
        $relata_info = ""; 
        foreach $relata (@relata) { 
           $relata_synset = $LEX1{$relata};
           if($relata_synset) {
              $relata_info .= &synset_info($relata,$relata_synset,$word);
           }
        }
       }
       if($relata_info) {
           print $synset_info,"<\@br>",$heading_info,$relata_info;
       print "<\@br>_____________________<\@br><\@br>";
        }
     } else { print $synset_info; }
   }
 }
untie(%LEX);
untie(%LEX1);
untie(%LEX2);
untie(%LEX3);

sub synset_info{
  my($head,$synset,$word) = @_;
  my($synset_info);

   
    $add_info = "RANGE";  
    $start = ""; # stating sloka number
    $end = ""; # ending sloka number
    @synset = split(/::/,$synset);
	$range_info = &kANda_range1(@synset); #finding range of kANda;
	$range_info =~ /([0-9]+\.[0-9]+\.[0-9]+)\.*/; 
        $s = $1; #/^(.)\.*/; $s = $1;
	$range_info = &get_sloka_info1($range_info);
        $synset_info = "<\@br><\@div \@id=\"\@tool\"><\@font \@color=\"\@green\"><\@a \@title=\"$range_info\">arWaH :: $head</a></\@font> | ";
        $synset_info .= "<\@font \@color=\"\@black\">";
        for ($i=0;$i<=$#synset;$i++) {
           ($wrd,$kANda,$lifgam,$vargaH) = split(/#/,$synset[$i]);
           chop($lifgam);
           if($i == 0){
              $synset_info .= "<\@font \@color=\"\@red\">vargaH :: $vargaH</\@font> | ";
           }
           if($wrd eq $word) {
              $style = "<\@span \@style=\"\@background:\@yellow;\">";
           } else { $style = "<\@span \@style=\"\">";}
           #$synset_info .= ", $style <\@a \@title=\"kANda,varga,Sloka,pAxa :: $kANda\,lifga :: $lifgam\" \@href=\"\@javascript:\@generate_\@noun_\@forms('WX','\@$wrd','\@$lifgam')\">".$wrd."</\@a><\/\@span>";
	   if($out_encoding eq "DEV") { $out_encoding = "Unicode"};
           $synset_info .= ", $style <\@a \@title=\"kANda,varga,Sloka,pAxa :: $kANda\,lifga :: $lifgam\" \@href=\"\@javascript:\@generate_\@any_\@noun_\@forms('\@WX','\@$wrd','\@$lifgam','\@nA','\@$out_encoding','1')\">".$wrd."</\@a><\/\@span>";
        }
        $synset_info .= "</\@font></\@div>";
$synset_info;
}
1;


#code for finding range;
sub kANda_range1{
	my @synset = @_;
	my $start = 0 , $end = 0;
	 for ($i=0;$i<=$#synset;$i++) {
  		 my ($wrd,$kANda,$lifgam,$vargaH) = split(/#/,$synset[$i]);
       		 if($i == 0){ $start = $kANda;}
		 else {  $kANda =~ /([0-9]+\.[0-9]+\.[0-9]+)\.*/; $s =$1; 
			if($start =~ /$s/){ }else{ $start .= "-".$kANda;}
		}
	
	}
$start;
}
1;

sub get_sloka_info1{
	$num = $_[0];
	chomp $num;
		my $result = "";
		@nums = split(/-/,$num);
		foreach $nums (@nums){
		$nums =~ /([0-9]+\.[0-9]+\.[0-9]+)\.*/; $s = $1;
		$count = 0;
		die "can't open file for reading $!" unless open(TMP,"$GlblVar::SCLINSTALLDIR/amarakosha/amara.wx");
           	 while(my $in = <TMP>){
			chomp $in;
			if($in =~ /<Sloka_$s>/ and $count ==0){  $result .= $in; $count =1; }
			elsif($in !~ /<\/Sloka_$s>/ and $count == 1){ $result .= $in;}
			elsif($in =~ /<\/Sloka_$s/ and $count == 1){ $result .= $in; $count = 0;} 
		}
	}
$result =~ s/<\/Sloka_[0-9]+\.[0-9]+\.[0-9]+>//g;
$result =~ s/<Sloka_[0-9]+\.[0-9]+\.[0-9]+>//g;
$result =~ s/^M//g;
$result =~ s/ //g;
close TMP;
$result;
}
1;
