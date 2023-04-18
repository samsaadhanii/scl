#!/usr/bin/env perl

#  Copyright (C) 2012-2023 Amba Kulkarni (ambapradeep@gmail.com)
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

BEGIN{require "$ARGV[0]/paths.pl";}
##require "$SCLINSTALLDIR/MT/prog/kAraka/compatible.pl";

##use lib $GlblVar::LIB_PERL_PATH;

##use GDBM_File;

# ARGV[1]: Script : DEV / IAST 
# Devanagari / Roman transliteration / Velthuis

#ARGV[2]: input file:  Output of the parser
# Relevant fields:
# First field: paragraph/line/word_no
# Second field: word

#ARGV[3]: file name containing names of the kaaraka tags
#$ARGV[4]: name of the directory with temporary files
#$ARGV[5]: selected relations
#$ARGV[6]: sentence number
#$ARGV[7]: parseop file name

my $SCRIPT=$ARGV[1];
my $filename=$ARGV[2];
if($SCRIPT eq "IAST") {
 $kAraka_names=$ARGV[3]."/kAraka_names_roman.txt";
} else {
 $kAraka_names=$ARGV[3]."/kAraka_names_".lc($SCRIPT).".txt";
}
my $dirname=$ARGV[4];
my $relations=$ARGV[5];
my $sentnum=$ARGV[6];
my $OUTFILE=$ARGV[7];
my $save=$ARGV[8];
my $translate=$ARGV[9];

if($SCRIPT eq "IAST") {
  require "$GlblVar::SCLINSTALLDIR/MT/prog/interface/modify_mo_fn_roman.pl";
} else {
  require "$GlblVar::SCLINSTALLDIR/MT/prog/interface/modify_mo_fn_".lc($SCRIPT).".pl";
}
#tie(%kAraka_name,GDBM_File,$kAraka_name,GDBM_READER,0644) || die "Can't open $kAraka_name for reading";
open(TMP,$kAraka_names) || die "Can't open $kAraka_names for reading";
while(<TMP>) {
chomp;
if(/^([^ ]+) ([0-9]+)/){
$num = $2;
$name = $1;
$kAraka_name{$num}=$name;
}
}
close(TMP);

my $old_relations = $relations; # Needed for Undo operation
$old_relations =~ s/:[^:]+$//; #old relations is the current relation minus the last addition.

if($relations eq "") { $relations = "''";}
if($old_relations eq "") { $old_relations = "''";}

my($tot_words);
#Global Variables:
# %class, %wrd and %morph: These are populated by get_wrd_mo_anal

#Get the words and their morph analysis from $ARGV[1]
#Also assign the div-class for each of the analysis, needed for HTML display.

$tot_words = &get_wrd_mo_anal($filename);

#Read from the parseop.txt, various solutions, one after the other.
$ans = "";
%RELS=();
$parse = "";
$tmp = "";
$cmptbl = 1;
$match = 0;
$selected_constraints = ($relations =~ s/:/:/g);
$selected_morph = ($relations =~ s/:\-/:\-/g);
$selected_relations = $selected_constraints - $selected_morph;

while($in = <STDIN>){
  chomp($in);
  if($in =~ /./) {
         if($in =~ /\(/){
           $in_node = $in;
           $in_node =~ s/\(//;
           $in_node =~ s/\)//;
           if($relations ne "''") {
               $ans = &compatible($in_node,$relations);
               if ($ans == 1) { 
                   $match++; 
               } elsif ($ans == 0) { $cmptbl = 0;}
           }
           $tmp .= $in."\n";
         } elsif($in =~ /Total (Complete|Partial) Solutions=([0-9]+)/) {
              $total_solns=$2;
              $parse .= $in."\n";
         } elsif($in =~ /Cost/) { 
           if  ($cmptbl && ($match == $selected_relations)) {
               &populate_data($tmp);
               $soln++; $parse .= $tmp.$in."\n\n"; $tmp = ""; $match = 0; $cmptbl = 1;
           } else { $cmptbl=1; $tmp = ""; $match = 0;}
        } elsif($in =~ /Solution:/) { 
              $tmp.=$in."\n";
        } else { $parse .= $in."\n";}
  }# else {$parse .= $in."\n";}
 }

# print all reduced solutions to $OUTFILE
 open(TMP,">$OUTFILE") || die "Can't open $OUTFILE for writing";
 print TMP $parse;
 close(TMP);

# Either display all the consolidated solutions (save = no)
# Or show the selected solution as a kaaraka tagged sentence (save = yes)
  if($save eq "no") {
    if($soln == 0) { print "No Solution Found\n";}
    else {
          &print_header_menu($soln,$total_solns,$dirname,$SCRIPT,$old_relations,$sentnum);
# print the possible combinations
          print "<div style=\"position:relative; margin:auto; width:1500px;\">\n";
          print "<table>\n";
# Print the words in the sentence in the first row
          print "<tr>\n"; &print_sent($tot_words); print "<\/tr>\n";

# Print all compatible morph analysis in the second row.
          print "<tr>\n"; &print_morph_analysis($tot_words,$dirname,$SCRIPT); print "<\/tr>\n";

# Print all possible relations for each word
          print "<tr>\n"; 
          &print_relations_for_each_word($tot_words,$SCRIPT,$dirname,$sentnum,$relations);
          print "<\/tr>\n";

          print "<\/table>\n";
          print "<\/div>\n";
    }
  } elsif ($save eq "yes") {
       &display_selected_relations($tot_words,$relations);
  }

#################################
# Sub routines follow
################################
sub display_selected_relations{
my($tot_words,$relations) = @_;

my($i,$j,$indx,$pos,$mindx,$new_rel,$rel,$mpos,$rel_num);

#This function uses the following global variables:
# %wrd, %morph, %COL, %exists, %kAraka_name

  print "<table border=\"1\">\n";
  for($i=0; $i <= $tot_words; $i++){
    $indx = $i;
    $pos = $i+1;
    print "<tr><td>",$pos,"<\/td><td>",$wrd{$indx},"<\/td>";
    $j=1;
    while($j < 10) {
      $mindx = "$i,$j";
      if($morph{$mindx} && $exists{$mindx}) { 
         print "<td>",$morph{$mindx},"<\/td>"; 
      }
      $j++;
    }
    while($COL{$i} =~ /^([^;]+);/) {
       $COL{$i} =~ s/^([^;]+);//;
       $rel_pos = $1;
       if($rel_pos =~ /([^#]+)#([^,]+),([^,]+),(.*):(.*)/){
          $rel_num = $2;
          $mpos1 = $4;
            $rel = $kAraka_name{$rel_num}.",".$wpos.",".$mpos;
       }
       print "<td>",$rel,"<\/td>";
    }
    print "<\/tr>\n";
  }
print "<\/table>";
}
1;

sub get_wrd_mo_anal {
my($filename) = @_;

my($in,@in,$i,@flds,$w_no,$indx,$tmp,@tmp,@ana,$mindx,$i,$indx,$mana,$samAsa_pUrvapaxa,@ana,$tot_words);

# %class, %wrd and %morph are global variables;
## Field number and description
$word_comp_id = 0;
$word = 1;
$morph = 4;

$tot_words = 0;
open(IN, "<$filename") || die "Can't open $filename for reading";
while($in = <IN>){
      @in = split(/\n/,$in);
      foreach $in (@in) {
          @flds = split(/\t/,$in);
          if(($flds[$word_comp_id] =~ /^([0-9]+।[0-9]+)/) || ( $flds[$word_comp_id] =~ /^([0-9]+\.[0-9]+)/)){
           $p = $1;
	   $p =~ s/\./,/;
	   $p =~ s/\।/,/;
           $pos{$tot_words} = $p;
           $wrd{$tot_words} = $flds[$word];
           $tmp = $flds[$morph];
           @ana = split(/\//,$tmp);
           for ($i=0;$i <= $#ana; $i++) {
               $mindx = $p.",".($i+1);
               $mana = &modify_mo($ana[$i]);
               $mana =~ s/<level:[0-4]>//;
               $mana =~ s/<लेवेल्:[0-4]>//;
               $morph{$mindx} = $mana;
               if($ana[$i] =~ /;([1-8]);/){
                    $class{$mindx} = "N".$1;
               } elsif($ana[$i] =~ /;(kta|क्त);/){
                    $class{$mindx} = "NA";
               } elsif($ana[$i] =~ /;(लट्|लिट्|लुट्);/){
                    $class{$mindx} = "KP";
               } elsif($ana[$i] =~ /{(लट्|लिट्|लुट्);/){
                    $class{$mindx} = "KP";
               } elsif($ana[$i] =~ /(avy|अव्य)/){
                    $class{$mindx} = "NA";
               } elsif( $flds[$word] =~ /-$/){
                    $class{$mindx} = "CP";
               }
           }
	   $tot_words++;
          }
      }
}
close(IN);
$tot_words-1;
}
1;

sub print_relations_for_each_word{
 my($tot_words,$SCRIPT,$dirname,$sentnum,$relations) = @_;

 my($i,$rel_pos,$mindx,$rel_num,$class,$rel,$mpos,$wpos,$new_rel,$rels,$from);

#Global variables used in this function:
# %COL,%kAraka_name, %morph
 for($i=0; $i <= $tot_words; $i++){
 print "<td><ol>\n";
    $pos = $pos{$i};
    while($COL{$pos} =~ /^([^;]+);/) {
       $COL{$pos} =~ s/^([^;]+);//;
       $rel_pos = $1;
       if($rel_pos =~ /([^#]+)#([^,]+),([^,]+),([^,]+),([^,]+):(.*)/){
          $from = $1;
          $rel_num = $2;
          $wpos = $3;
          $cpos = $4;
          $mpos = $5;
          $class = $6;
          $mindx = $from;
          if($rel_num < 100 || $rel_num >=2000 || $rel_num == 101 || $rel_num == 102 || ($rel_num > 200 && $rel_num < 300)) {
             $rel = $kAraka_name{$rel_num}.",".$wpos.".".$cpos."(".$mpos.")";
             $new_rel = $from.",".$rel_num.",".$wpos.",".$cpos.",".$mpos;
          if($relations !~ /:$new_rel/) { 
             $rels = $relations.":".$new_rel;
          } else {$rels = $relations;}
          print "<li class =\"$class\">";
          print "<a href=\"/cgi-bin/$GlblVar::SCL_CGI/MT/prog/interface/call_parser_summary.cgi?filename=$dirname&amp;outscript=$SCRIPT&amp;rel=$rels&amp;sentnum=$sentnum&amp;save=no&amp;translate=no\" title=\"$morph{$mindx}\">";
          print " &#x2713; $rel </a> <\/li>\n";
         }
       }  else { print "-\n";}
    }
  print "<\/ol><\/td>\n";
}
}
1;

sub print_morph_analysis{
 my($tot_words,$dirname,$SCRIPT) = @_;

 my($i,$j,$mindx,$rels,$new_rel,$class);

#Global variables:
# %morph, $sentnum, %COL, $relations, %exists, $dirname, $SCRIPT

 for($i=0; $i <= $tot_words; $i++){
         print "<td><ul>\n";
         $j=1;
         $p = $pos{$i};
         $mindx = "$p,$j";
         while($j < 10) { # assuming that there are < 10 morph solns
         if($morph{$mindx} ne "" ) {
           $class = $class{$mindx};
           if( $exists{$mindx}  || ($wrd{$i} =~ /\-$/)){
               $new_rel = "-,-,-,-,".$p.",".$j;
               if($relations !~ /:$new_rel/) { $rels = $relations.":".$new_rel;}
               else {$rels = $relations;}
               print "<li class=\"$class\">";
               print $j,"<a href=\"/cgi-bin/$GlblVar::SCL_CGI/MT/prog/interface/call_parser_summary.cgi?filename=$dirname&amp;outscript=$SCRIPT&amp;rel=$rels&amp;sentnum=$sentnum&amp;save=no&amp;translate=no\" title=\"$morph{$mindx}\">&#x2713; $morph{$mindx} </a> <\/li>\n";
           }
         }
           $j++;
           $mindx = "$p,$j";
        }
  print "<\/ul><\/td>\n";
  }
}
1;

sub print_sent{
 my($tot_words) = @_;
 my($i,$indx,$pos);
#Global variables
# %wrd, %pos
 for($i=0; $i <= $tot_words; $i++){
    $indx = "$i";
    $p = $pos{$indx};
    $p =~ s/,/./;
    print "<td align=\"center\" style=\"background-color:grey; color:yellow\">$wrd{$indx}($p)<\/td>\n";
 }
}
1;

 sub print_header_menu{
 my($soln,$total_solns,$dirname,$SCRIPT,$old_relations,$sentnum) = @_;


      if(($total_solns == 1) || ($soln == 1)){
         print "<h3> <a href=\"/cgi-bin/$GlblVar::SCL_CGI/MT/prog/interface/call_parser_summary.cgi?filename=$dirname&amp;outscript=$SCRIPT&amp;rel=$old_relations&amp;sentnum=$sentnum&amp;save=no&amp;translate=no\"> &#x2713;<\/a> Undo\n";
         print "<a href=\"/cgi-bin/$GlblVar::SCL_CGI/MT/prog/interface/show_selected_parse.cgi?filename=$dirname&amp;sentnum=$sentnum&amp;start=0&amp;outscript=$SCRIPT\"> &#x2713; <\/a>Unique parse tree \n";
        print " <a href=\"/cgi-bin/$GlblVar::SCL_CGI/MT/prog/interface/call_parser_summary.cgi?filename=$dirname&amp;outscript=$SCRIPT&amp;rel=$old_relations&amp;sentnum=$sentnum&amp;save=no&amp;translate=yes\"> &#x2713;<\/a>Translate into hindi</h3>\n";
      } else {
        print "<h3> <a href=\"/cgi-bin/$GlblVar::SCL_CGI/MT/prog/interface/call_parser_summary.cgi?filename=$dirname&amp;outscript=$SCRIPT&amp;rel=$old_relations&amp;sentnum=$sentnum&amp;save=no&amp;translate=no\"> &#x2713;<\/a> Undo\n";
        print "$soln filtered trees\n";
        print "<\/h3>\n";
      }
}
1;

sub populate_data {
  my($parse) = @_;

 my($edge,$to_wrd,$to_mid,$rel_nm,$from_wrd,$from_mid,$mindx,$to,$from,$rel,$relto);

#GLOBAL variables
# %class, %RELS, %COL

     @edges = split(/\n/,$parse);
     foreach $edge (@edges) {
         if($edge =~ /\(/) {
           $edge =~ s/\(//;
           $edge =~ s/\)//;
           $edge =~ /([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+)/;
           $to_wrd = $1+1;
           $to_cid = $2+1;
           $to_mid = $3+1;
           $rel_nm = $4;
           $from_wrd = $5+1;
           $from_cid = $6+1;
           $from_mid = $7+1;

           $mindx = "$to_wrd,$to_cid,$to_mid";
           $exists{$mindx} = 1;
           $mindx = "$from_wrd,$from_cid,$from_mid";
           $exists{$mindx} = 1;
           $to_indx = $to_wrd.",".$to_cid;

           $to = $to_wrd.",".$to_cid.",".$to_mid;
           $from = $from_wrd.",".$from_cid.",".$from_mid;
           $rel = $rel_nm.",".$from;
           $relto = $rel_nm.",".$to;

           if(($RELS{$to} !~ /^$rel#/) && ($RELS{$to} !~ /#$rel#/)) {
               $RELS{$to} .= $rel."#";
               $mindx = "$to";
               $COL{$to_indx} .= $to."#".$rel.":$class{$mindx};";
           }
         }
     }
}
1;

sub compatible{
   my($in_node,$relations)= @_;
   
   my $ans = 2; 
# 0: reject the solution
# 1: count the matching relations
# 2: Don't care condition
   
   $in_node =~ /^([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+)/;
   $in_node = ($1+1).",".($2+1).",".($3+1).",".$4.",".($5+1).",".($6+1).",".($7+1);
   $relations =~ s/^://;
   @relations = split(/:/,$relations);
   foreach $r (@relations) {
      if ($r =~ /\-/) { 
          $r =~ /\-,\-,\-,\-,([0-9]+),([0-9]+),([0-9]+)/;
          $id = $1; $cid = $2; $mid = $3;
          $in_node =~ /^([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+)/;
          $to = $1; $cto = $2; $mto = $3; $from = $5; $cfrom = $6; $mfrom = $7;
          if ((($id == $to) && (($cid != $cto) || ($mid != $mto))) || 
              (($id == $from) && (($cid != $cfrom) || ($mid != $mfrom)))) { $ans = 0;}
      } elsif ($in_node =~ /$r/) { $ans = 1;}
   }
#   print "ans = $ans<br>"; 
$ans;
}
1;
