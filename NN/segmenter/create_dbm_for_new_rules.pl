#!/usr/bin/env perl

BEGIN {require "../../paths.pl";}

use lib $GlblVar::LIB_PERL_PATH;

use GDBM_File;

for($i=1;$i<5;$i++){
 $rule = "RULE".$i;
 tie(%{$rule},GDBM_File,"${ARGV[0]}$i.dbm",&GDBM_WRCREAT,0644);
}

@_ = <STDIN>;

$samAsa_freq = 0;
$sandhi_freq = 0;
foreach $_ (@_) {
   $_ =~ /^([^	]+)	([^+]+)\+([^	]+)	(.*)$/;
   $freq = $4;
   if($_ =~ /\-/) {
      $samAsa_freq += $freq; 
   } else {
      $sandhi_freq += $freq; 
   }
}

foreach $_ (@_) {
   $_ =~ /^([^	]+)	([^+]+)\+([^	]+)	(.*)$/;
   $out = $1;
   $in1 = $2;
   $in2 = $3;
   $frq = $4;

   $rule = $out."=".$in1."+".$in2;
   #print $out, $in1, $in2, $frq,"\n";
   $len = length($out);
   $RULE  = "RULE".$len;

   if($in1 =~ /\-/) { 
      $freq = int($frq * 1000000/$samAsa_freq);
   } else { 
      $freq = int($frq * 1000000/$sandhi_freq);
   }
   if(${$RULE}{$out}) { 
      ${$RULE}{$out} .= "#". $in1.",".$in2.",".$rule.",".$freq;
   } else {
      ${$RULE}{$out} = $in1.",".$in2.",".$rule.",".$freq;
   }
}
untie(%RULE1);
untie(%RULE2);
untie(%RULE3);
untie(%RULE4);
