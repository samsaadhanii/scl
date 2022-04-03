#!/usr/bin/perl

use GDBM_File;

require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/compounds/scti/morf_related.pl";
require "$GlblVar::SCLINSTALLDIR/compounds/scti/panini-tagger.pl";
require "$GlblVar::SCLINSTALLDIR/compounds/scti/statistical_type_identifier.pl";

#Initialisation of variables
$eval_mode = 0;
$debug_level = 0;
$correct_count = 0;
$total_examples = 0;
$tag = "";
$splt_compound = "";
$ans = "";

#parsing Command line arguments
for ($i=0;$i<=$#ARGV;$i++) {
 if ($ARGV[$i] eq "-eval") {
     $eval_mode = 1;
 } elsif($ARGV[$i] =~ /-debug/) {
     $ARGV[$i] =~ /\-debug=([0-3])/;
     $debug_level = $1;
 } elsif($ARGV[$i] eq "-h") {
     print "The usage: scti.pl <ref_data.dbm> <wrd_gaNa.dbm> <tag_word_freq_dbm> <word_freq_dbm> OPTIONS\n";
     print "OPTIONS:\n";
     print "-eval: If you want to evaluate the tagger.\n ";
     print " In eval mode the input is a set of pairs of a split compound and a tag separated by a TAB\n";
     print "\n";
     print "-debug=num]\n";
     print "where: num = 1: Level 1 debugging\n";
     print "     : num = 2: Level 2 debugging\n";
     print "     : num = 3: Level 2 debugging\n";
     exit(0);
 }
}

#Tie the Hash tables
tie(%REF_DATA,GDBM_File,$ARGV[0],GDBM_READER,0666);
tie(%LEX,GDBM_File,$ARGV[1],GDBM_READER,0666);
tie(%LEX1,GDBM_File,$ARGV[2],GDBM_READER,0666);
tie(%LEX2,GDBM_File,$ARGV[3],GDBM_READER,0666);

if($debug_level >= 1) { 
###print "Eval mode = $eval_mode\n"; commented by Anil
}

#Sample input:
#In eval mode
#upa-kqRNam	A1
#In non-eval mode
#upa-kqRNam

while($splt_compound = <STDIN>)
{
$ans = "";
chomp($splt_compound);

if($eval_mode) {
   ($splitWrd,$tag) = split(/\t/,$splt_compound);
   if($debug_level >= 1) 
   { 
     print "splitWrd = $splitWrd\t tag = $tag\n";
   }
} else {
  $splitWrd = $splt_compound;
}

#if(!$eval_mode)
#{
#  $ans = $REF_DATA{$splitWrd};
#}

if($ans) {
 if($debug_level >= 1) 
 {
  #  print "ans = $ans after rule based type identification\n"; # Anil
 }
}

if(!$ans || $eval_mode)
{
 ($frst_comp,$secnd_comp) = split(/-/,$splitWrd);

  $morf_ana = &get_morf_analysis($secnd_comp,$debug_level);
  $kwa = &is_kwa($morf_ana,$debug_level);

 if($debug_level >= 2)
 {
    print "morf ana = $morf_ana\n";
 }

  @stems = split(/#/,&get_stems($morf_ana,$debug_level));
 if($debug_level >= 2)
 {
    print "stems = @stems\n";
 }

 foreach $stem (@stems) {
   $comp_stem2 = $frst_comp."-".$stem;
   $stem =~ /^(.*);([01])/;
   $stem = $1;
   $kwa = $2;
   $comp_stem = $frst_comp."-".$stem;

   $ans1 = &avyayIBAva($comp_stem,$splitWrd,$debug_level);
   if($ans1)
   {
     if($debug_level >= 2)
     {
        print "ans1 = $ans1\n";
     }
     $tmp = $ans1;
     $tmp =~ s/\[/\\\[/g;
     $tmp =~ s/\]/\\\]/g;
     $tmp =~ s/\-/\\-/g;
     $tmp =~ s/\(/\\\(/g;
     $tmp =~ s/\)/\\\)/g;
     if(($ans !~ /#$tmp$/) && ($ans !~ /#$tmp#/))
     {
       $ans .= "#".$ans1;
     }
   }
   $ans2 = &tatpuruRa($comp_stem,$splitWrd,$kwa,$debug_level);
   if($ans2)
   {
    if($debug_level >= 2)
    {
      print "ans2 = $ans1\n";
    }
     $tmp = $ans2;
     $tmp =~ s/\[/\\\[/g;
     $tmp =~ s/\]/\\\]/g;
     $tmp =~ s/\-/\\-/g;
     $tmp =~ s/\(/\\\(/g;
     $tmp =~ s/\)/\\\)/g;
     if(($ans !~ /#$tmp$/) && ($ans !~ /#$tmp#/))
     {
      $ans .= "#".$ans2;
     }
   }
 }

if($debug_level >= 1) 
{
#   print "ans = $ans after rule based type identification\n"; # Anil
}

if(!$ans)
{
$ans = "Not Found";
   foreach $stem (@stems) {
      $comp_stem = $frst_comp."-".$stem;
##      $ans = &statistical_type_identifier($splitWrd,$debug_level); # Anil
#      $ans = &statistical_type_identifier($comp_stem,$debug_level);
      if($debug_level >= 1) 
      { 
       #  print "ans = $ans after statistical based type identification\n"; # Anil
      }
   }
 }
}
 $ans =~ s/^#//;
 print $splitWrd, "\t", $ans;

 if($eval_mode) {
   if($ans =~ /^$tag\[/) { 
      $correct_count++;
      print "\tCorrect";
   }
 }# else { print "\n";}
print "\n";
}

untie(%LEX);
untie(%LEX1);
untie(%LEX2);
