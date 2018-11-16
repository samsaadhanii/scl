#!/usr/bin/env perl

print "\@Anvaya_\@no\t\@word\t\@poem\t\@sandhied_\@word\t\@morph_\@analysis\t\@morph_\@in_\@context\t\@kaaraka_\@sambandha\t\@hindi_\@meaning\t\@English_\@meaning\t\@samAsa\t\@prayoga\n";

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
  $flds[8] =~ s/(\/[^;]+);/\1/g;
  $flds[8] =~ s/$/}/;
  if ($flds[9] !~ /^,/) {
    print $flds[0],"\t",$flds[3],"\t\t",$flds[3],"\t",$flds[6],"\t",$flds[8],"\t",$flds[9],"\t",$flds[16],"\n";
  }
} else { print "\n";}
}
