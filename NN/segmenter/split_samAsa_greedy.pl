#!/usr/bin/env perl

BEGIN {require "../../paths.pl";}


open(TMP,"<$GlblVar::SCLINSTALLDIR/NN/segmenter/samAsa_rules_sorted.txt") || die "Can't open samAsa_rules_sorted.txt for reading";

@_ = <TMP>;
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
   $RULE  = "LEX".$len;

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

require "$GlblVar::SCLINSTALLDIR/NN/segmenter/nyAya_words.pl";

$Max_Word_Size=25;
#$debug = 1;

while($in = <STDIN>){
chomp($in);
$found = "";
%SPLIT = ();
%SPLIT_CHECKED = ();

($ans, $found)  = split("#", &split_recursive_sandhi($in,0,""));
$ans = &prioritise($ans);
@ans = split("/",$ans);
$ans_found = 0;
foreach $a (@ans) {
 print $a,"\n";
 $ans_found++;
}
if(!$ans_found) { print "\@No \@answer \@found \n";}
#elsif($ans_found == 1) { print "One answer found \n";}
#else { print "$ans_found answers found\n";}
}

sub split_recursive_sandhi{
 my($in,$absolute_position,$found) = @_;

my($wrd1,$wrd2,$i,$k,$final_ans,$ans,@t,$t,$len,$pUrva,$str2Bmatched,$uttara,$fld1,$fld2,$fld3, @ans,$local_found,$m,$position,$local_ans,$lex,$tmp,$wrd2_position,$l);
$len = length($in);
  $final_ans = "";
    if($len < $Max_Word_Size) { $i = $len;} else {$i = $Max_Word_Size;}
   # if($len-$i+1 < 4) { $max_window_size = $len-$i+1;} else { $max_window_size = 7;}
    #print "max_window_size = $max_window_size\n";
    $max_window_size = 4;
    while($i>0) {
    #print "$i found = $found in = $in\n";
    $local_found = $found;
   #for($k=1; $k<=4 && $i+$k <= $len ;$k++){
   for($k=$max_window_size; $k>=1; $k--){
       if($i + $k < $len) {
    $local_ans = "";
    if($debug) {print "k = $k\n";}
    $in =~ /^(.{$i})(.{$k})(.*)$/;
    $pUrva = $1;
    $str2Bmatched = $2;
    $uttara = $3;
    $lex = "LEX".$k;
    #print " i = $i k = $k str = $str2Bmatched\n";
    if(${$lex}{$str2Bmatched}) {
       @ans = split(/#/,${$lex}{$str2Bmatched});
       for ($m = 0; $m <= $#ans; $m++ ){
          if($debug) { print "sandhi Rule: $ans[$m]\n";}
          ($fld1,$fld2,$fld3) = split(/,/,$ans[$m]);
           $tmp=$in;
           $tmp =~ s/^$pUrva$str2Bmatched$uttara$/$pUrva$fld1 $fld2$uttara/;
           ($wrd1, $wrd2) = split(/ /,$tmp);
           $position = $absolute_position+length($pUrva).",".$fld3; #.",".$wrd1;
           $wrd2_position = $absolute_position+length($pUrva)+length($str2Bmatched)-length($fld2)+1;
           #print "found = $found position = $position\n";
           #print " in = $in wrd1 = $wrd1 wrd2 = $wrd2\n";
           if((!&split_boundary_pos($position,$found) && !&from_non_pUrvapaxa_list($wrd2) && !&from_non_pUrvapaxa_list($wrd1))){
           if((length($wrd1) < $Max_Word_Size) && !$MO_CHECKED{$wrd1}){
              if($debug) {print "Calling morph for $wrd1\n";}
              $MO{$wrd1} = &get_morph_ana($wrd1);
              if($debug) {print "$MO{$wrd1}\n";}
              $MO_CHECKED{$wrd1} = 1;
           }
          if((length($wrd2) < $Max_Word_Size) && !$MO_CHECKED{$wrd2}){
              if($debug) {print "Calling morph for $wrd2\n";}
              $MO{$wrd2} = &get_morph_ana($wrd2);
              if($debug) {print "$MO{$wrd2}\n";}
              $MO_CHECKED{$wrd2} = 1;
          }
          if($MO{$wrd1} && $MO{$wrd2}) {
           #print "Morph for $wrd1 and $wrd2 found\n";
           #$local_ans .= "/".$wrd1." ".$wrd2.";".$fld3;
           $local_ans .= "/".$wrd1."{$fld3}".$wrd2;
           if($position ne "") {
            $local_found = &add_position($local_found,$position);
           }
          } 
          elsif($MO{$wrd1}) {
            #print "Morph for $wrd1 found Splitting $wrd2\n";
            if(!$SPLIT_CHECKED{$wrd2}) {
                ($ans,$sub_found) = split(/#/,&split_recursive_sandhi($wrd2,$wrd2_position-1,$found));
                #print "i = $i\nwrd1 = $wrd1\nwrd2  = $wrd2\nans = $ans\nsub_found = $sub_found\nfound = $found\n";
            } elsif($SPLIT{$wrd2}) { $ans = $SPLIT{$wrd2};}
            else {$ans = "";}
            #print "ans = $ans\n";
            if($ans ne "") {
             if($position ne "") {
                $local_found = &add_position($local_found,$position);
             }
             @sub_found = split(/#/,$sub_found);
             foreach $l (@sub_found) {
               if($l ne "") {
                  $local_found = &add_position($local_found,$l);
               }
             }
              $ans =~ s/\/\//\//g;
              $ans =~ s/^\///g;
              @t = split("/",$ans);
              foreach $t (@t) {
                 #$local_ans .= "/".$wrd1."".$t.";".$fld3;
                 $local_ans .= "/".$wrd1."{$fld3}".$t;
              }
            }
          }
        }
        #print "k = $k local_found = $local_found\n";
      }# For each of the sandhi rules
    }# if sandhi rule found
   if($local_ans) { 
      $final_ans .= "/".$local_ans; 
   }
  #print "k = $k in = $in local_found = $local_found\n";
  }# Execute only if $i + $k < $len
  }# For a split of 1 to 4 width
 #if($local_found ne $found) {
 #  $local_found =~ s/^#//g;
 #  @local_found = split(/#/,$local_found);
 #  foreach $l (@local_found) {
 #   if($l ne "") {
 #     $found = &add_position($found,$l);
 #   }
 #  }
 #}
  $found = $local_found;
  $found =~ s/^#//g;
#print "i = $i pUrva = $pUrva in = $in found = $found\n";
  $i--;
}# continue splitting from right to left reducing length by one at a time
$SPLIT{$in} = $final_ans;
$SPLIT_CHECKED{$in} = 1;
$final_ans =~ s/\/\//\//g;
$final_ans =~ s/^\///g;
#print "found = $found\n";
$final_ans."#".$found;
}
1;

sub get_morph_ana{
 my($word1) = @_;
 my($ans);
# system("$myPATH/NN/segmenter/client_splitter.sh $word1 | grep . | grep -v '\*'> /tmp/SKT_TEMP/tt");
# if(-s "/tmp/SKT_TEMP/tt") { $ans = 1;} else { $ans = 0;}
# print "ans1 = $ans\n"; 
# system("cat /tmp/SKT_TEMP/tt");
 $ans = `$GlblVar::SCLINSTALLDIR/NN/segmenter/client_splitter.sh $word1 | grep . | grep -v '\*'| wc -l`;
 if ($ans == 0) { $ans = $?;}
return $ans;
}
1;

sub split_boundary_pos{
my($start,$found) = @_;
my(@found,$f);
@found = split(/#/,$found);
foreach $f (@found) {
 if($f eq $start) { #print "$f found in $start\n"; 
    return 1;}
}
return 0;
}
1;

sub add_position {
my($str,$pos) = @_;
     $str =~ s/\-/:/g;
     $pos =~ s/\-/:/g;
     $str =~ s/\+/;/g;
     $pos =~ s/\+/;/g;
     if(($str !~ /^$pos#/) && 
        ($str !~ /^$pos$/) && 
        ($str !~ /#$pos#/) && 
        ($str !~ /#$pos$/)){
         $str .= "#".$pos;
     }
         $str =~ s/:/-/g;
         $str =~ s/;/+/g;
$str;
}
1;

sub from_non_pUrvapaxa_list {
my($w) = @_;

#No logic behind the next few entries;
if($w eq "ava-") { return 1;}
if($w eq "avacCinnA-") { return 1;}
if($w eq "anu-") { return 1;}
if($w eq "Cexa-") { return 1;}
if($w eq "Cexaka-") { return 1;}
if($w eq "CexakawA-") { return 1;}
if($w eq "Cexakawva-") { return 1;}
if($w eq "Cexya-") { return 1;}
if($w eq "CinnA-") { return 1;}
if($w eq "nirUpiwA-") { return 1;}
if($w eq "niRTA-") { return 1;}
if($w eq "nis-") { return 1;}
if($w eq "paryApwA-") { return 1;}
if($w eq "pra-") { return 1;}
if($w eq "prawiyogikA-") { return 1;}
if($w eq "rUpiwa-") { return 1;}
if($w eq "SAlI-") { return 1;}
if($w eq "Taka-") { return 1;}
if($w eq "TakA-") { return 1;}
# The viSeRaNa (BARiwa puMlinga, undergoes puMswva in bahuvrIhi and karmaXAraya compounds
if($w eq "viSeRaNA-") { return 1;}
if($w =~ /^akawA/) { return 1;}
if($w =~ /^araN/) { return 1;}
if($w =~ /^avaw/) { return 1;}
if($w =~ /^AraN/) { return 1;}
if($w =~ /^Cinna/) { return 1;}
if($w =~ /^Cexaka/) { return 1;}
if($w =~ /^CexakI/) { return 1;}
if($w =~ /^iRyakawA/) { return 1;}
if($w =~ /^kawA/) { return 1;}
if($w =~ /^raN/) { return 1;}
return 0;
}

sub prioritise{
my($ans) = @_;
my($low,$high,@ans,$oneans,$word,@words,$count,$max_count,$i,@ANS);

@ans = split("/",$ans);
$max_count = 0;
foreach $oneans (@ans) {
 $curr_ans = $oneans;
 $oneans =~ s/[ ][a-zA-Z]+[ ]*;.*//;
# print "oneans = $oneans\n";
 @words = split(/ /,$oneans);
 $count = 0;
 foreach $word (@words) {
#   print "word = $word NYAYA word = $NYAYA_words{$word}\n";
   if($NYAYA_words{$word}) { $count++;}
 }
 $ANS[$count] .= "/". $curr_ans;
# print "$count $oneans\n";
 if($max_count < $count) { $max_count = $count;}
}
#print "max_count = $max_count\n";
$ans = "";
foreach ($i=$max_count; $i >= 0 ; $i--){
 if($ANS[$i] ne "") { $ans .= "/". $ANS[$i];}
}
$ans =~ s/\/\/+/\//g;
$ans =~ s/^\///;
$ans;
}
1;
