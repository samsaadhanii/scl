#!/usr/bin/perl

#$DEBUG = 1;
$DEBUG = 0;

use GDBM_File;
tie(%BIGRAM,GDBM_File,$ARGV[0],GDBM_READER,0444);
tie(%UNIGRAM,GDBM_File,$ARGV[1],GDBM_READER,0444);

@parses_3 = split(/\n/, &rec_constituency_tree(3));
@parses_4 = split(/\n/, &rec_constituency_tree(4));
@parses_5 = split(/\n/, &rec_constituency_tree(5));
@parses_6 = split(/\n/, &rec_constituency_tree(6));
@parses_7 = split(/\n/, &rec_constituency_tree(7));

open(OUT,"> $ARGV[2]")||die "$ARGV[2] could not be create";

$tot_bigram = $BIGRAM{"tot_bigram"};
$tot_purva_freq = $UNIGRAM{"tot_pUrva_freq"};
$tot_uwwara_freq = $UNIGRAM{"tot_uwwara_freq"};

while($eval_in=<STDIN>)
{
$ans = "";

chomp($eval_in);
if($DEBUG) {print $eval_in; print OUT $eval_in,"\t";}
$comps = ($eval_in =~ s/\-/\-/g);
$comps++;

print "comps = $comps\n";
$var = "parses_".$comps;
$countvar = "count_parses_".$comps;
for($i=0;$i<=$#{$var};$i++){
    if($eval_in =~ /^${$var}[$i]$/) { 
       print "pattern $i matched\n";
       ${$countvar}[$i]++;
       print "$countvar $i = ${$countvar}[$i]\n";
    }
}

# Check for errors
$lcount =~ ($eval_in =~ s/</</g);
$rcount =~ ($eval_in =~ s/>/>/g);
if($lcount ne $rcount) { print "Error in input $eval_in \n";}

$eval_orig = $eval_in;
$eval_orig =~ s/>[A-Zd][a-z]*[0-9]*/>/g;

$eval_in =~ s/<//g;
$eval_in =~ s/>[A-Zd][a-z]*[0-9]*//g;

if($eval_in =~ />/) { print "Error in input $eval_in\n";}

#Get the components
@components = split(/\-/, $eval_in);

#Get all possible bigram frequencies
for($i=0;$i<$#components;$i++){
  for($j=$i+1;$j<=$#components;$j++){
    $bi_name = "bigram".$i.$j."_freq";
    $pair="$components[$i]-$components[$j]";
    ${$bi_name} = $BIGRAM{$pair};
    if(!defined ${$bi_name}) { ${$bi_name} = 0;}
    if($DEBUG) { print "$bi_name = ${$bi_name}\n"; }
  }
}

#Get all possible unigram frequencies
for($i=0;$i<=$#components;$i++){

    $uni_p = "unigram_pUrva".$i."_freq";
    $uni_u = "unigram_uwwara".$i."_freq";
    $word_p = $components[$i]."-";
    $word_u = $components[$i];

    if($i < $#components) {
       ${$uni_p}=$UNIGRAM{$word_p};
       if(!defined ${$uni_p}) { ${$uni_p} = 0;}
       if($DEBUG) { print "$uni_p = ${$uni_p}\n"; }
    }
    if($i > 0) {
      ${$uni_u}=$UNIGRAM{$word_u};
      if(!defined ${$uni_u}) { ${$uni_u} = 0;}
      if($DEBUG) { print "$uni_u = ${$uni_u}\n"; }
    }
}
 
#Get conditional probabilities of a word as an uttarapada, given a puurvapada.
for($i=1;$i<=$#components;$i++){
  for($j=0;$j<$i;$j++){
    $name = "p".$i."ugiven".$j."p";
    ${$name} = 0;
    $uni_p = "unigram_pUrva".$j."_freq";
    if($i < $j) {
       $bi_name = "bigram".$i.$j."_freq";
    } else { 
       $bi_name = "bigram".$j.$i."_freq";
    }
    if(${$bi_name} != 0) {
       if(${$uni_p} != 0) {
          ${$name} = &get_prob(${$bi_name},$tot_bigram,${$uni_p},$tot_purva_freq);
       }
       if($DEBUG) { if(${$name} != 0) { print "$name = ${$name}\n";}}
    }
  }
}

#Get conditional probabilities of a word as a puurvapada, given an uttarapada.
for($i=0;$i<$#components;$i++){
  for($j=1;$j<=$#components;$j++){
    $name = "p".$i."pgiven".$j."u";
    ${$name} = 0;
    $uni_u = "unigram_uwwara".$j."_freq";
    if($i < $j) {
       $bi_name = "bigram".$i.$j."_freq";
    } else { 
       $bi_name = "bigram".$j.$i."_freq";
    }
    if(${$bi_name} != 0) {
       if(${$uni_u} != 0) {
          ${$name} = &get_prob(${$bi_name},$tot_bigram,${$uni_u},$tot_uwwara_freq);
       }
       if($DEBUG) { if(${$name} != 0) { print "$name = ${$name}\n";}}
    }
  }
}

#function to decide the parse based on the conditional probabilities
 for($i=0;$i <= $#components; $i++){
    $lcomponents[$i] = 0;
    $rcomponents[$i] = 0;
 }

$countr=0;
$countl=0;

 for($i=1;$i < $#components; $i++){
    $max = 0;
    $leftc = -1;
    $rightc = -1;
    for($p=0; $p < $i; $p++){
        $pUrva = "p".$i."ugiven".$p."p";
        if(${$pUrva} > $max) { $max = ${$pUrva}; $leftc = $p; $rightc = $i;}
    }
    for($u=$i; $u <= $#components; $u++){
        $uwwara = "p".$i."pgiven".$u."u";
        if(${$uwwara} > $max) { $max = ${$uwwara}; $leftc = $i; $rightc = $u;}
    }
    print "max = $max \n";
    print "leftc = $leftc \n";
    print "rightc = $rightc \n";
    if($leftc >=0) { $lcomponents[$leftc]++; $countl++;}
    if($rightc >=0) { $rcomponents[$rightc]++; $countr++;}
  }
  
 for($i=0; $i <= $#components; $i++){
     print $lcomponents[$i],"\t",$rcomponents[$i],"\n";
 }

print "countl = $countl countr = $countr \n";

 for($i=1; $i < $#components; $i++){
   if(($lcomponents[$i] == 0) && ($rcomponents[$i] == 0)){
       $name1 = "unigram_uwwara".$i."_freq";
       $name2 = "unigram_pUrva".$i."_freq";
       if(((${$name2} - ${$name1}) >= 6) && ($i != $#components)){
           $lcomponents[$i] =1;
           $countl++;
       } elsif($i != 0) {
           $rcomponents[$i] =1;
           $countr++;
       }
    }
  }

 for($i=0; $i <= $#components; $i++){
     print $lcomponents[$i],"\t",$rcomponents[$i],"\n";
 }

    if($lcomponents[0] == 0) {$lcomponents[0] = 1; $countl++;}
    if($rcomponents[$#components] == 0) {$rcomponents[$#components] = 1; $countr++;}

    print "countl = $countl countr = $countr \n";
    print "components = $#components \n";

    if($countl < $countr) { $lcomponents[0] += $countr-$countl;}
    if($countr < $countl) { $rcomponents[$#components] += $countl - $countr;}
    if(($countr == $countl) && ($countr <= $#components)) { 
        $lcomponents[0] += $#components - $countr;
        $rcomponents[$#components] += $#components - $countr;
        #$missing_brackets = $#components - $countr;
        #for($i=1;$i<=$missing_brackets;$i++){
        #    $rcomponents[$#components-$i] += 1;
        #}
     }

 for($i=0; $i <= $#components; $i++){
     print $lcomponents[$i],"\t",$rcomponents[$i],"\n";
 }

 for($i=0; $i <= $#components; $i++){
  if(($i != 0) && $lcomponents[$i]) { 
      $brackets = "<" x $lcomponents[$i];
      $ans .= $brackets . $components[$i]."-";
  }
  if($rcomponents[$i] && ($i != $#components)) { 
      $brackets = ">" x $rcomponents[$i];
      $ans .= $components[$i].$brackets ."-";}
  }
 
 print "ans = $ans\n";

     $ans =~ s/-$//;
     $ans = "<" x $lcomponents[0] .$components[0]."-".$ans; 
     $ans .= "-".$components[$#components].">" x $rcomponents[$#components];

 if($ans eq $eval_orig) { 
    print "ans = ", $ans , " Correct\n";print OUT $ans , "\tCorrect\n";
    $correctcountvar = "correct_".$countvar;
    for($i=0;$i<=$#{$var};$i++){
        if($ans =~ /^${$var}[$i]$/) { 
           print "pattern $i matched\n";
           ${$correctcountvar}[$i]++;
           print "$correctcountvar $i = ${$correctcountvar}[$i]\n";
        }
    }
 } else { 
	print "ans = ", $ans , " Wrong\n";
#	print OUT $ans , "\tWrong\n";
	print OUT "$ans\n";
    $wrongcountvar = "wrong_".$countvar;
    for($i=0;$i<=$#{$var};$i++){
        if($ans =~ /^${$var}[$i]$/) { 
           print "pattern $i matched\n";
           ${$wrongcountvar}[$i]++;
           print "$wrongcountvar $i = ${$wrongcountvar}[$i]\n";
        }
    }
 }
}
close(OUT);

$T = 0;
$TC = 0;
for($j=3;$j<20;$j++){
    print "Data for $j components\n";
    $var = "parses_".$j;
    $countvar = "count_parses_".$j;
    $correctcountvar = "correct_".$countvar;
    $wrongcountvar = "wrong_".$countvar;

    $total = 0;
    $totalc = 0;
    if($#{$var}) {
     print "Pattern Original Correct Wrong Precision Recall\n";
     for($i=0;$i<=$#{$var};$i++){
      if(!defined ${$correctcountvar}[$i]) { ${$correctcountvar}[$i] = 0;}
      if(!defined ${$wrongcountvar}[$i]) { ${$wrongcountvar}[$i] = 0;}
      if(!defined ${$countvar}[$i]) { ${$countvar}[$i] = 0;}
      if(${$countvar}[$i]) {
         $prec = ${$correctcountvar}[$i]*100/${$countvar}[$i];
      } else { $prec = 0;}
         $tmp = ${$correctcountvar}[$i] + ${$wrongcountvar}[$i];
         if($tmp) {
            $recall = ${$correctcountvar}[$i]*100/$tmp;
         } else { $recall = 0;}

      print "$i ${$countvar}[$i] ${$correctcountvar}[$i] ${$wrongcountvar}[$i] $prec $recall \n";
      $total += ${$countvar}[$i];
      $totalc += ${$correctcountvar}[$i];
    }
      if($total) { $avg = $totalc * 100 /$total;} else { $avg = 0;}
      if($avg) {
        print "Average performance for $j components= $avg\n";
      }
      $T += $total;
      $TC += $totalc;
   }
   if($T) { $avg = $TC * 100 /$T;} else { $avg = 0;}
      print "Average performance = $avg\n";
}

sub get_prob{
my($bi_freq,$bi_tot,$wrd_freq,$wrd_tot)=@_;
my $probs;
my $prob_bi;
my $prob_wrd;

$prob_bi=$bi_freq/$bi_tot;
$prob_wrd=$wrd_freq/$wrd_tot;
$probs = $prob_bi/$prob_wrd;

$probs;
}
1;

sub rec_constituency_tree {
my($n) = @_;
my($ans,$first,$second,$k,$i,$j,@first,@second);

$ans = "";
if($n == 1) {
   $ans = "[a-zA-Z]+";
} elsif ($n == 2) {
   $ans = "<[a-zA-Z]+\\-[a-zA-Z]+>[A-Zd]*[a-z]*[1-7]*";
} else {
  $k = 1;
  while ($k <= $n/2) {
    $first = &rec_constituency_tree($k);
    $second = &rec_constituency_tree($n-$k);
    @first = split(/\n/,$first);
    @second = split(/\n/,$second);
    for($i = 0; $i <= $#first; $i++){
      for($j = 0; $j <= $#second; $j++){
          $ans .=  "<".$first[$i]."\\-".$second[$j].">[A-Zd]*[a-z]*[1-7]*\n";
          if($k != ($n-$k)) {
             $ans .=  "<".$second[$j]."\\-".$first[$i].">[A-Zd]*[a-z]*[1-7]*\n";
          }
      }
    }
    $k++;
  }
}
$ans;
}
