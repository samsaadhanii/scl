#!/usr/bin/env perl

# 1: word index
# 2: word
# 3: sandhied_word
# 4-6: morph
# 7: morph in context
# 8: kaaraka role
# 9: all possible relations
# 10: Anaphora
# 11: WSD
# 12: Color code
# 13: Chunk/LWG
# 14: map o/p
# 15: lwg o/p
# 16: lwg o/p with karwari
# 17: gen o/p
# 18: gen o/p with karwari

print "\@index\t\@word\t\@poem\t\@sandhied_\@word\t\@morph_\@analysis\t\@morph_\@in_\@context\t\@kaaraka_\@sambandha\t\@possible_\@relations\t\@color_\@code\t\@hindi_\@meaning\t\@hindi_\@meaning_\@active\n";

$index = 1;
while($in = <STDIN>){
chomp($in);
if($in) {
  @flds = split(/\t/,$in);

  $flds[1] =~ s/^-//;


  $flds[5] =~ s/^([a-zA-Z_0-9]+) /$1\{/;
  $flds[5] =~ s/([^\-]+\-[^ \-]+) /$1\{/g;
  $flds[5] =~ s/\{\{/\{/;
  $flds[5] =~ s/ /;/g;
  $flds[5] =~ s/\{;/\{/g;
  $flds[5] =~ s/\//}\//g;
  $flds[5] =~ s/(\/[^;]+);/\1\{/g;
  if($flds[5] =~ /\{/) {$c1 = $flds[5] =~ s/\{/\{/g;} else {$c1 = 0;}
  if($flds[5] =~ /\}/) {$c2 = $flds[5] =~ s/\}/\}/g;} else {$c2 = 0;}
  if ($c1 > $c2) { $flds[5] =~ s/$/}/;}

  $flds[6] =~ s/^([a-zA-Z_0-9]+) /$1\{/;
  $flds[6] =~ s/([^\-]+\-[^ \-]+) /$1\{/g;
  $flds[6] =~ s/\{\{/\{/;
  $flds[6] =~ s/ /;/g;
  $flds[6] =~ s/\{;/\{/g;
  $flds[6] =~ s/\//}\//g;
  $flds[6] =~ s/(\/[^;]+);/\1\{/g;
  if($flds[6] =~ /\{/) {$c1 = $flds[6] =~ s/\{/\{/g;} else {$c1 = 0;}
  if($flds[6] =~ /\}/) {$c2 = $flds[6] =~ s/\}/\}/g;} else {$c2 = 0;}
  if ($c1 > $c2) { $flds[6] =~ s/$/}/;}

  if($grpwith == $flds[0]) {
# When the current word is to be grouped with the previous word
    $relation = $grpwith."_".$flds[7];
    $poss_relation = $tmp_poss_rel."_".$flds[8];
    $mng = $tmpmng."_".$flds[16];
    $mng1 = $tmpmng1."_".$flds[17];
    print $tmpgrp,$relation,"\t",$poss_relation,"\t",$flds[11],"\t",$mng,"\t",$mng1,"\n";
    $tmpgrp = "";
    $tmpmng = "";
    $tmpmng1 = "";
    $mng = "";
    $mng1 = "";
    $relation = "";
    $poss_relation = "";
  } elsif (($flds[7] !~ /^,/) && ($flds[8] !~ /^,/)) {  
## When the relation is not blank
    print $flds[0],"\t",$flds[1],"\t\t",$flds[2],"\t",$flds[5],"\t",$flds[6],"\t",$flds[7],"\t",$flds[8],"\t",$flds[11],"\t",$flds[16],"\t",$flds[17],"\n";
  } else {
## When the relation is blank -- that is the current word is to be grouped with the following word
    $tmpgrp = $flds[0]."\t".$flds[1]."\t\t".$flds[2]."\t".$flds[5]."\t".$flds[6]."\t";
    $grpwith = $flds[7];
    $grpwith =~ s/,//;
    $tmp_poss_rel = $flds[8];
    $tmpmng = $flds[16];
    $tmpmng1 = $flds[17];
  }
# In case of upapada grouping the name of the relation is blank
} else { print "\n";}
$index++;
}
