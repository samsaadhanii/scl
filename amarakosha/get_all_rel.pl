#!/usr/bin/env perl

#  Copyright (C) 2006-2011 Shivaja Nair and 2006-2023 Amba Kulkarni (ambapradeep@gmail.com)
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

@rel = ("stem2head","avayava","avayavI","aparAjAwi","parAjAwi","janaka","janya","pawi","pawnI","svAmI","sevaka","vESiRtya","vESiRtyavaw","sambanXiwa","vqwwi","vqwwivAn");

#for $rel (@rel){
#$name = "LEX_".$rel;
#tie(%{$name},GDBM_File,"$GlblVar::SCLINSTALLDIR/amarakosha/DBM/$rel.gdbm",GDBM_READER,0444);
#}

for $rel (@rel){
$name = "LEX_".$rel;
open(TMP,"$GlblVar::SCLINSTALLDIR/amarakosha/DBM/all_kANdas") || die "Can't open amarakosha/DBM/all_kANdas for reading";
if ($rel eq "stem2head") { $key = 0; $value = 4; }
elsif ($rel eq "avayava") { $key = 5; $value = 4; }
elsif ($rel eq "avayavI") { $key = 4; $value = 5; }
elsif ($rel eq "aparAjAwi") { $key = 6; $value = 4; }
elsif ($rel eq "parAjAwi") { $key = 4; $value = 6; }
elsif ($rel eq "janaka") { $key = 4; $value = 7; }
elsif ($rel eq "janya") { $key = 7; $value = 4; }
elsif ($rel eq "pawi") { $key = 4; $value = 8; }
elsif ($rel eq "pawnI") { $key = 8; $value = 4; }
elsif ($rel eq "svAmI") { $key = 4; $value = 9; }
elsif ($rel eq "sevaka") { $key = 9; $value = 4; }
elsif ($rel eq "vESiRtya") { $key = 4; $value = 10; }
elsif ($rel eq "vESiRtyavaw") { $key = 10; $value = 4; }
elsif ($rel eq "sambanXiwa") { $key = 4; $value = 11; }
elsif ($rel eq "vqwwi") { $key = 4; $value = 12; }
elsif ($rel eq "vqwwivAn") { $key = 12; $value = 4; }

$name = "LEX_".$rel;
while(<TMP>) {
  chomp;
  @flds = split(/,/,$_);
  if(($flds[0] !~ /^%/) && ($flds[$key] ne "") && ($flds[$value] ne "")) {
     if(${$name}{$flds[$key]} eq "") {
        ${$name}{$flds[$key]}  =  $flds[$value];
     }else {
        if ((${$name}{$flds[$key]} !~ /::$flds[$value]::/) &&
             (${$name}{$flds[$key]} !~ /^$flds[$value]::/) &&
             (${$name}{$flds[$key]} !~ /::$flds[$value]$/) &&
             (${$name}{$flds[$key]} !~ /^$flds[$value]$/)) {
        ${$name}{$flds[$key]}  .= "::". $flds[$value];
        }
     }
  }
}
close(TMP);
}

$in_word = $ARGV[0];
$out_encoding = $ARGV[1];
@word = split(/::/,$LEX_stem2head{$in_word});

print "digraph G\{\n";

$rels = "";
foreach $word (@word) {
  foreach $rel (@rel) {
   &get_rec($word,$rel,1);
  }
}

if($out_encoding eq "DEV" ) {
   open TMP, "| $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1";
} elsif($out_encoding eq "IAST" ) {
   open TMP, "| $GlblVar::SCLINSTALLDIR/converters/wx2utf8roman.out";
}
print TMP $nodes,$rels;
close TMP;

print "rankdir=RL\n";
print "\}";

$nodes = "";
sub get_rec{
  my($word,$rel,$level) = @_;
  #print "word rel level = $word $rel $level\n";
  if(($word ne "") && ($level < 4)){
           if($nodes !~ /\@Node$word /){
              $tmp = $word;
              $tmp =~ s/_/_\@/g;
              $tmp =~ s/-/_\@/g;
              $nodes .= "\@Node$tmp \[\@label=\"$word\"]\n";
           }
           $visited{$word} = 1;
           my @sub_node = split(/::/,&get_related($word,$rel));
           #print "sub_node = @sub_node\n";
           foreach $sub_node (@sub_node) {
    #        if($visited{$sub_node} != 1) {
             if($nodes !~ /\@Node$sub_node /){
                $tmp = $sub_node;
                $tmp =~ s/_/_\@/g;
                $tmp =~ s/-/_@/g;
                $nodes .= "\@Node$tmp \[\@label=\"$sub_node\"]\n";
             }
             &draw_dot($word,$rel,$sub_node);
             if($visited{$sub_node} != 1) {
                $visited{$sub_node} = 1;
                $level++;
                foreach $rel (@rel) {
		   #print "word rel subnode: $word $rel $sub_node\n";
                   &get_rec($sub_node,$rel,$level);
                }
             }
    #       }
          }
  }
}

sub get_related{
my($w,$rel) = @_;

$name = "LEX_".$rel;
return ${$name}{$w};
}
1;

sub draw_dot{
my($word1,$rel,$word2) = @_;

if($rel eq "stem2head"){$rel="arWaH";}

            $tmp = $word1;
            $tmp =~ s/_/_\@/g; 
            $tmp =~ s/-/_\@/g;
            	$tmp1 = $word2;
        	$tmp1 =~ s/_/_\@/g; 
	        $tmp1 =~ s/-/_@/g;
  $str="\@Node$tmp -> \@Node$tmp1 \[\@label=\"$rel\",\@fontcolor=\@red, \@fontname=\"\@Lohit \@Hindi\"\]\n";
  #print "str = $str\n";
  if(($rels !~ /\@Node$tmp -> \@Node$tmp1/) && ($rels !~ /\@Node$tmp1 -> \@Node$tmp/) && ($tmp ne $tmp1)) { 
     $rels .= $str;
  }
}
1;
