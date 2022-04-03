#!/usr/bin/perl

use GDBM_File;
tie(%LEX,GDBM_File,$ARGV[0],GDBM_READER,0666);
tie(%LEX1,GDBM_File,$ARGV[1],GDBM_READER,0666);


@tag = ("T6","Bs6","K1","Tn","Di","U","T3","Tp","T7","BvS","Tg","Ds","Bs3","A1","S","Km","T4","Bsmn","Bs7","T2","Tds","T5","K5","K2","Bs5","Bb","d","Bv","K6","Bvp","Bvs","K3","BvU","Tm","T1","BsU","K7","K4","Tdt","Tk","Bsmg","E","Bss","Bs4","DI","BVS","A2");

$test_example = 1;
while($in = <STDIN>) {
chomp($in);
##if($in =~ /=>/) { ($in,$ans) = split(/=>/,$in); $in =~ s/[ \t]//g; $ans =~ s/[ \t]//g; $ans =~ s/<.*>//;}
##else {$ans = "";}
($pUrva,$uttara) = split(/-/,$in);
$pUrva .= "-";

for ($i=0;$i<51;$i++) {

# $TP = 0;
# $P = 0;
# $TU = 0;
# $U = 0;
# $TP = 1/10000;
# $P = 1/4000;
# $TU = 1/10000;
# $U = 1/7000;
 $TP = 1;
 $P = 1;
 $TU = 1;
 $U = 1;

 $key = $tag[$i]."#".$pUrva;
 if($LEX{$key}) { $TP = $LEX{$key};}
 if($LEX1{$pUrva}) { $P = $LEX1{$pUrva};}
 $key = $tag[$i]."#".$uttara;
 if($LEX{$key}) { $TU = $LEX{$key};}
 if($LEX1{$uttara}) { $U = $LEX1{$uttara};}
# if($P == 0) { $prob_pUrva = 1/100;} else {$prob_pUrva = $TP/$P;}
$prob_pUrva = $TP/$P;
# if($U == 0) { $prob_uttara = 1/100;} else {$prob_uttara = $TU/$U;}
$prob_uttara = $TU/$U;
 $T = chr($i+65).$tag[$i];
 $prob{$T} = $prob_pUrva * $prob_uttara; 
# print "$tag[$i]    $prob{$tag[$i]}\n"; 
}
# print "After sorting\n";
 print "<INPUT\t$in>\n";
 $i=1;
 foreach $key (sort {$prob{$b} <=> $prob{$a} || $a cmp $b} keys %prob){
  $prob = $prob{$key};
  $key =~ s/^.//;
 # if($key eq $ans) { 
#	print "*"; 
#	$rank[$i]++;}
        print $i,":Rank\t", $prob,"\t$key\t<$in>$key\n";
  $i++;
 }
 print "</INPUT\t$in>\n";
 $test_example++;
}

#for($i=1;$i<=51;$i++){
#  print "$i => $rank[$i]\t", $rank[$i]*100/$test_example,"\n";
#}
untie(%LEX);
untie(%LEX1);
