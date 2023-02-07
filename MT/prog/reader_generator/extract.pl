#!/usr/bin/env perl

# 1-2: format
# 3: word
# 4: sandhied_word
# 5: format
# 6-8: morph
# 9: morph in context
# 10: kaaraka role
# 12: all possible relations
# 12: Anaphora
# 13: WSD
# ** 13: POS
# 14: Color code
# 15: Chunk/LWG
# 16:  map o/p
# 17: lwg o/p
# 18: lwg o/p with karwari
# 19: gen o/p
# 20: gen o/p with karwari

print "\@index\t\@word\t\@poem\t\@sandhied_\@word\t\@morph_\@analysis\t\@morph_\@in_\@context\t\@kaaraka_\@sambandha\t\@hindi_\@meaning\t\@English_\@meaning\t\@samAsa\t\@prayoga\t\@sarvanAma\t\@Name-\@classification\n";
#print "index\tword\tpoem\tsandhied_word\tmorph_analysis\tmorph_in_context\tkaaraka_sambandha\thindi_meaning\tEnglish_meaning\tsamAsa\tprayoga\tsarvanAma\tName-classification\n";

while($in = <STDIN>){
chomp($in);
if($in) {
  @flds = split(/\t/,$in);
  $flds[0] =~ s/^[^\.]+\.//;

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

  $flds[8] =~ s/^([a-zA-Z_0-9]+) /$1\{/;
  $flds[8] =~ s/([^\-]+\-[^ \-]+) /$1\{/g;
  $flds[8] =~ s/\{\{/\{/;
  $flds[8] =~ s/ /;/g;
  $flds[8] =~ s/\{;/\{/g;
  $flds[8] =~ s/\//}\//g;
  $flds[8] =~ s/(\/[^;]+);/\1\{/g;
  if($flds[8] =~ /\{/) {$c1 = $flds[8] =~ s/\{/\{/g;} else {$c1 = 0;}
  if($flds[8] =~ /\}/) {$c2 = $flds[8] =~ s/\}/\}/g;} else {$c2 = 0;}
  if ($c1 > $c2) { $flds[8] =~ s/$/}/;}

  if($grpwith == $flds[0]) {
# When the current word is to be grouped with the previous word
    $relation = $flds[2]."_".$flds[9];
    $mng = $tmpmng."_".$flds[18];
    $mng1 = $tmpmng1."_".$flds[19];
    print $tmpgrp,$relation,"\t",$mng,"\t",$mng1,"\n";
    $tmpgrp = "";
    $tmpmng = "";
    $tmpmng1 = "";
    $mng = "";
    $mng1 = "";
    $relation = "";
  } elsif ($flds[9] !~ /^,/) {  
## When the relation is not blank
    print $flds[0],"\t",$flds[2],"\t\t",$flds[3],"\t",$flds[6],"\t",$flds[8],"\t",$flds[9],"\t",$flds[18],"\t",$flds[19],"\n";
  } else {
## When the relation is blank -- that is the current word is to be grouped with the following word
    $tmpgrp = $flds[0]."\t".$flds[2]."\t\t".$flds[3]."\t".$flds[6]."\t".$flds[8]."\t";
    $grpwith = $flds[9];
    $grpwith =~ s/,//;
    $tmpmng = $flds[18];
    $tmpmng1 = $flds[19];
  }
# In case of upapada grouping the name of the relation is blank
} else { print "\n";}
}
