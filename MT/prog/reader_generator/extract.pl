#!/usr/bin/env perl

# 1-2: format
# 3: sandhied_word
# 4: word
# 5: format
# 6-8: morph
# 9: morph in context
# 10: kaaraka role
# 11: Anaphora
# 12: WSD
# ** 13: POS
# 13: Color code
# 14: Chunk/LWG
# 15:  map o/p
# 16: lwg o/p
# 17: gen o/p

print "\@index\t\@word\t\@poem\t\@sandhied_\@word\t\@morph_\@analysis\t\@morph_\@in_\@context\t\@kaaraka_\@sambandha\t\@hindi_\@meaning\t\@English_\@meaning\t\@samAsa\t\@prayoga\t\@sarvanAma\t\@Name-\@classification\n";
#print "index\tword\tpoem\tsandhied_word\tmorph_analysis\tmorph_in_context\tkaaraka_sambandha\thindi_meaning\tEnglish_meaning\tsamAsa\tprayoga\tsarvanAma\tName-classification\n";

while($in = <STDIN>){
chomp($in);
if($in) {
  @flds = split(/\t/,$in);
  $flds[0] =~ s/^[^\.]+\.//;

  $flds[6] =~ s/ /{/;
  $flds[6] =~ s/ /;/g;
  $flds[6] =~ s/\//}\//g;
  $flds[6] =~ s/(\/[^;]+);/\1\{/g;
  $flds[6] =~ s/$/}/;

  $flds[8] =~ s/ /{/;
  $flds[8] =~ s/ /;/g;
  $flds[8] =~ s/\//}\//g;
  $flds[8] =~ s/(\/[^;]+);/\1\{/g;
  $flds[8] =~ s/$/}/;

  if($grpwith == $flds[0]) {
# When the current word is to be grouped with the previous word
    $relation = $flds[3]."_".$flds[9];
    $mng = $tmpmng."_".$flds[16];
    print $tmpgrp,$relation,"\t",$mng,"\n";
    $tmpgrp = "";
    $tmpmng = "";
    $mng = "";
    $relation = "";
  } elsif ($flds[9] !~ /^,/) {  
## When the relation is not blank
    print $flds[0],"\t",$flds[3],"\t\t",$flds[3],"\t",$flds[6],"\t",$flds[8],"\t",$flds[9],"\t",$flds[16],"\n";
  } else {
## When the relation is blank -- that is the current word is to be grouped with the following word
    $tmpgrp = $flds[0]."\t".$flds[3]."\t\t".$flds[3]."\t".$flds[6]."\t".$flds[8]."\t";
    $grpwith = $flds[9];
    $grpwith =~ s/,//;
    $tmpmng = $flds[16];
  }
# In case of upapada grouping the name of the relation is blank
} else { print "\n";}
}
