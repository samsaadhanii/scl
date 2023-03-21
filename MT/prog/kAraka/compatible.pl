#!/usr/bin/env perl

$multiple_relations_begin=21;

sub compatible{
my($entry,$relations) = @_;

my($wrd_no,$mid,$rel1,$from_wrd,$from_mid);
my($cwrd_no,$cmid,$crel1,$cfrom_wrd,$cfrom_mid);

$entry =~ /^([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)/;
$wrd_no = $1;
$comp_id = $2;
$mid = $3;
$rel1 = $4;
$from_wrd = $5; 
$from_comp_id = $6; 
$from_mid = $7; 
$relations =~ s/^://;
@relations = split(/:/,$relations);

foreach $rel (@relations) {
  $rel =~ /^([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)/;
  $cwrd_no = $1;
  $c_comp_id = $2;
  $cmid = $3;
  $crel1 = $4;
  $cfrom_wrd = $5;
  $cfrom_comp_id = $6;
  $cfrom_mid = $7;
#If a word with a certain mid is chosen, then all the edges going to or coming from other mids of the same id are to be rejected.
  if (($crel1 != $kAraka_num{"niwya_sambanXaH"}) && ($rel1 != $kAraka_num{"niwya_sambanXaH"})) {
  if(($from_wrd eq $cfrom_wrd) && ($from_comp_id eq $cfrom_comp_id) && ($from_mid eq $cfrom_mid) && ($rel1 eq $crel1) && ($rel1 < $multiple_relations_begin) && ($wrd_no ne $cwrd_no)) {  #print STDERR "cond1 failed"; 
return 0;} 
# More than one outgoing arrows with same label
  if(($wrd_no eq $cwrd_no) && ($comp_id eq $c_comp_id) && ($mid eq $cmid) && ($rel1 eq $crel1) && ($from_wrd ne $cfrom_wrd)) { #print STDERR "cond2 failed"; 
return 0;}
# More than one incoming arrows with same label from different words
  if(($wrd_no eq $cwrd_no) && ($comp_id eq $c_comp_id) && ($mid eq $cmid) && ($rel1 ne $crel1)) { #print STDERR "cond3 failed"; 
return 0;} #2: niwya_sambanXaH
# More than one incoming arrows with different label
  if(($wrd_no eq $cwrd_no) && ($comp_id eq $c_comp_id) && ($mid ne $cmid)) { #print STDERR "cond4 failed"; 
return 0;}
#Single morph analysis per word
  if(($wrd_no eq $cfrom_wrd) && ($comp_id eq $c_comp_id) && ($mid ne $cfrom_mid)) { #print STDERR "cond5 failed"; 
return 0;}
#Single morph analysis per word
  if(($from_wrd eq $cfrom_wrd) && ($from_comp_id eq $cfrom_comp_id) && ($from_mid ne $cmid)) { #print STDERR "cond6 failed"; 
return 0;}
#Single morph analysis per word
  if(($from_wrd eq $cfrom_wrd) && ($from_comp_id ne $cfrom_comp_id) && ($from_mid eq $cfrom_mid)) { #print STDERR "cond7 failed"; 
return 0;}
#Single morph analysis per word
}
}
return 1;
}
1;

sub compatible_mo{
my($entry,$relations,%wrd_rels) = @_;

my($compatible, $cwrd_no, $wrd_no, $cmid, $mid, $crel1, $cfrom_wrd, $cfrom_mid, $rel, @relations, @wrd_relations);

$entry =~ /^([^,]+),([^,]+)/;
$wrd_no = $1;
$mid = $2;

$relations =~ s/^://;
@relations = split(/:/,$relations);

foreach $rel (@relations) {
  $rel =~ /^([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)/;
  $cwrd_no = $1;
  $cmid = $2;
  $crel = $3;
  $cfrom_wrd = $4;
  $cfrom_mid = $5;

  if(($wrd_no eq $cwrd_no) && ($mid ne $cmid)) { #print STDERR "cond13 failed"; 
return 0;}
  if(($wrd_no eq $cfrom_wrd) && ($mid ne $cfrom_mid)) { #print STDERR "cond12 failed"; 
return 0;}
}
$compatible = 0;
foreach $key (keys %wrd_rels) {
@wrd_relations = split(/;/,$wrd_rels{$key});
foreach $rel (@wrd_relations) {
  $rel =~ /^([0-9]+),([0-9]+)#[0-9]+,([0-9]+),([0-9]+)/;
  $cwrd_no = $1;
  $cmid = $2;
  $cwrd_no1 = $3;
  $cmid1 = $4;

  if(($wrd_no == $cwrd_no) && ($mid == $cmid)) { $compatible = 1;}
  elsif(($wrd_no == $cwrd_no1) && ($mid == $cmid1)) { $compatible = 1;}
}
}
$niwya_sambanXaH = 1;
#If X and Y are related to each other by niwya sambanXa, and x-X and y-Y are related, then x and y should not be related to each other.
 if($relations =~ /,$kAraka_num{"niwya_sambanXaH"},/) {
    for($j=0; $j<=$#relations && $niwya_sambanXaH; $j++){
      $relations[$j] =~ /^([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)/;
      $wrd_no = $1; $mid = $2; $rel1 = $3; $from_wrd = $4; $from_mid = $5;  
      if($rel1 == $kAraka_num{"niwya_sambanXaH"}) { # If this is a niwya sambanXa between X(wrd_no, mid) and Y(from_wrd,from_mid)
         for($k=0; $k<=$#rel && $niwya_sambanXaH; $k++){
           if ($relations[$k] =~ /^$wrd_no,$mid,([^,]+),(.*)$/) { #Get the co-ordinates of the word to which X is related (say x)
              if ($1 != $rel1) {
                 $X_hd = $2;
                 for($l=0; $l<=$#rel && $niwya_sambanXaH; $l++){
                   if ($relations[$l] =~ /^$from_wrd,$from_mid ([^,]+),(.*)$/){ #Get the co-ordinates of the word to which Y is related (say y)
                      if($1 != $rel1) {
                         $Y_hd = $2;
                         if (($relations =~ /^$X_hd,[^,]+,$Y_hd:/) || ($relations =~ /^$Y_hd,[^,]+,$X_hd:/) ||
                             ($relations =~ /^$X_hd,[^,]+,$Y_hd$/) || ($relations =~ /^$Y_hd,[^,]+,$X_hd$/) ||
                             ($relations =~ /:$X_hd,[^,]+,$Y_hd:/) || ($relations =~ /:$Y_hd,[^,]+,$X_hd:/) ||
                             ($relations =~ /:$X_hd,[^,]+,$Y_hd$/) || ($relations =~ /:$Y_hd,[^,]+,$X_hd$/)){ # If x and y are related, reject the analysis
                               $niwya_sambanXaH = 0; 
                          }    
                       }    
                   }    
                }    
              }    
           }    
         }    
      }    
    }    
 }

if(!$compatible && $wrd_rels ne "") { #print STDERR "cond11 failed"; 
return 0;}
if(!$niwya_sambanXaH) { return 0;}
return 1;
}
1;
