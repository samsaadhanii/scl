#!/usr/bin/env perl

$relations = "(niRTa|nirUpiwa|avacCinna|vqwwi|nirUpaka|avacCexaka|ASraya|SAl[iI]|vaw|vawI|vawyaH|vAn|ka)";
$relationalabstracts = "(aXikaraNawA|AXArawA|AXeyawA|prawiyogiwA|anuyogiwA|hewuwA|kAraNawA|karaNawA|kAryawA|viSeRyawA|viSeRaNawA|prakArawA|saMsargawA|saMsargiwA|viRayawA|viRayiwA|avacCexakawA|avacCexyawA|avacCinnawA|lakRyawA|lakRaNawA|nirUpyawA|nirUpakawA|svawA|svAmiwA|vyApyawA|vyApakawA|sAXyawA|sAXakawA|prawibaXyawA|prawibanXakawA|ASrayawA|ASrayiwA|vqwwiwA|sawwA|janyawA|janakawA|aXikaraNawva|aXikaraNawva|AXArawva|AXeyawva|prawiyogiwva|anuyogiwva|hewuwva|kAraNawva|karaNawva|kAryawva|viSeRyawva|viSeRaNawva|prakArawva|saMsargawva|saMsargiwva|viRayawva|viRayiwva|avacCexakawva|avacCexyawva|avacCinnawva|lakRyawva|lakRaNawva|nirUpyawva|nirUpakawva|svawva|svAmiwva|vyApyawva|vyApakawva|sAXyawva|sAXakawva|prawibaXyawva|prawibanXakawva|ASrayawva|ASrayiwva|vqwwiwva|sawwva|janyawva|janakawva|aXikaraNawvam|aXikaraNawvam|AXArawvam|AXeyawvam|prawiyogiwvam|anuyogiwvam|hewuwvam|kAraNawvam|karaNawvam|kAryawvam|viSeRyawvam|viSeRaNawvam|prakArawvam|saMsargawvam|saMsargiwvam|viRayawvam|viRayiwvam|avacCexakawvam|avacCexyawvam|avacCinnawvam|lakRyawvam|lakRaNawvam|nirUpyawvam|nirUpakawvam|svawvam|svAmiwvam|vyApyawvam|vyApakawvam|sAXyawvam|sAXakawvam|prawibaXyawvam|prawibanXakawvam|ASrayawvam|ASrayiwvam|vqwwiwvam|sawwvam|janyawvam|janakawvam)";

$in = <STDIN>;
chomp ($in);
if ($in =~ /$relations\-$relations/) { $in =~ s/\-($relations)\-($relations)\-/\-$1-vaswu-$3-/;}
$in = "-".$in; #Add '-' in the beginning to have a null word at 0
# This is to avoid the jugglary with index starting with 0, while the interface needs the index start with 1

@words = split(/-/,$in);

#Algorithm:

 # For each word i do
for($i=1;$i<=$#words;$i++){
 # A) Decide the type of the ith word
 # If it is from the given list of relations, mark it as relation else concept
  if($words[$i] =~ /^$relations$/) { 
     $type[$i] = "@"."relation";
  } else { $type[$i] = "@"."concept";}

 # B) If the type is relation, mark pratiyogi as the previous word
  if($type[$i] eq "\@relation") { 
     $pratiyogi[$i] = $i-1;
  } else {$pratiyogi[$i] = "-";}

 # C) If the type is concept, 
  if($type[$i] eq "\@concept") {
     if($words[$i] eq "vaswu") {
        $anuyogi[$i-1] = $i;
        $anuyogi_of[$i] = ",".$i-1;
        #print "anuyogi", $i-1 ,"= ",$i,"\n";
     } else {
   # print "Concept = $words[$i]\n";
    for($j=$i-1;$j>=0; $j--) {
      if($type[$j] eq "\@relation") {
        # print " relation =$j  $words[$j]\n";
         if($words[$j] eq "nirUpiwa") {
             if ((($words[$pratiyogi[$j]] =~ /^$relationalabstracts$/) 
                 && (&compatible($words[$pratiyogi[$j]],$words[$i])
                  || &compatible($words[$i],$words[$pratiyogi[$j]])))
              || (($words[$pratiyogi[$j]] !~ /^$relationalabstracts$/) 
                && ($words[$i] =~ /^$relationalabstracts$/))) {
                 $anuyogi[$j] .= ",".$i;
                 $anuyogi_of[$i] .= ",".$j;
          #       print "anuyogi = $j ",$anuyogi[$j],"\n";
             }
         } elsif(($words[$j] eq "avacCinna")){
          #       print "anuyogi = $j ", $anuyogi[$j],"\n";
          #       print "word =$i ", $words[$i],"\n";
          #       print "relation =$j ", $words[$j],"\n";
             if (($anuyogi[$j] eq "") &&
                 ($words[$i] =~ /^$relationalabstracts$/)){
                 $anuyogi[$j] = $i;
                 $anuyogi_of[$i] .= ",".$j;
          #       print "anuyogi = $j ",$anuyogi[$j],"\n";
             }
        } elsif($words[$j] eq "nirUpaka") {
               if (($words[$j+1] eq "aBAva") || ($words[$j+1] eq "jFAna") || ($words[$j+1] eq "Bexa")){
                 $anuyogi[$j] = $j+1;
                 $anuyogi_of[$j+1] = $j;
               } elsif ($words[$i] !~ /^$relationalabstracts$/){
                 $anuyogi[$j] .= ",".$i;
                 $anuyogi_of[$i] .= ",".$j;
               }
        } elsif($words[$j] eq "niRTa") {
                 $k = $j+1;
          # skip all consecutive concepts
                 while(($type[$k] ne "\@relation") && ($k <= $i)) {$k++;}
                 $k--;
                 if(($anuyogi[$j] !~ /,$k$/) && ($anuyogi[$j] !~ /,$k,/)){
                    $anuyogi[$j] .= ",".$k;
                    $anuyogi_of[$i] .= ",".$k;
                 }
        } else {
           if($words[$j+1] ne "vaswu") {
           $anuyogi[$j] .= ",".$i;
           $anuyogi_of[$i] .= ",".$j;
          # print "anuyogi = $j ",$anuyogi[$j],"\n";
           }
         }
      }
    }
 #    if two consecutive concepts, then 
 #    all previous consecutive concepts are possible anuyogis
    if($type[$i-1] eq "\@concept") { 
       $continue = 1;
       for($j=$i-1;$j>=0 && $continue; $j--) {
           if($type[$j] eq "\@relation") { $continue = 0;}
           elsif ($anuyogi[$j] !~ /,$i/) { 
               $anuyogi[$j] .= ",".$i; 
               $anuyogi_of[$i] .= ",".$j;
          # print "anuyogi = $j ",$anuyogi[$j],"\n";
           }
       }
 #    and it is the pratiyogi of itself
       $pratiyogi[$i-1] = $i-1;
    }
  }
 }
}

# If any relational abstract can be an anuyogi of a single relation, then assign this anuyogi to that relation, removing all other possible anuyogis of that relation.
# For example in the example ganXa-niRTa-AXeyawA-nirUpiwa-aXikaraNawA
# niRTa can have AXeyawA and aXikaraNawA as anuyogis.
# But AXeyawA can be anuyogi for only niRTa, and hence assign this, removing aXikaraNawA from niRTa
for($i=1;$i<=$#words;$i++){
    $anuyogi_of[$i] =~ s/^,//;
    if($anuyogi_of[$i] =~ /^([0-9]+)/) {
       $anu = $1;
        #print "words = ",$words[$i],"\n";
       if ((($words[$anu] eq "nirUpiwa") || ($words[$anu] eq "avacCinna")) && ($words[$i] =~ /^$relationalabstracts$/)) {
           #if($anuyogi[$anu] !~ /$i/) {
           #   $anuyogi[$anu] .= ",".$i;
           #} else {
              $anuyogi[$anu] = $i;
           #}
       }
    }
}
for($i=1;$i<=$#words;$i++){
    $anuyogi[$i] =~ s/^,//;
    if($anuyogi[$i] eq "")  { $anuyogi[$i] = "-";}
    print $type[$i],"\t",$words[$i],"\t",$i,"\t",$pratiyogi[$i],"\t",$anuyogi[$i],"\n";
}

sub compatible {
 my ($a, $b) = @_;
 if (($a =~ /^AXeyaw(va|vam|A)$/) && (($b =~ /^aXikaraNaw(va|vam|A)$/) || ($b =~ /^AXAraw(va|vam|A)$/))) { return 1;} 
 elsif (($a =~ /^kAryaw(va|vam|A)$/) && (($b =~ /^kAraNaw(va|vam|A)$/) || ($b =~ /^karaNaw(va|vam|A)$/))) { return 1;}
 elsif (($a =~ /^viSeRyaw(va|vam|A)$/) && (($b =~ /^viSeRyiw(va|vam|A)$/) || ($b =~ /^prakAraw(va|vam|A)$/))) { return 1;} 
 elsif (($a =~ /^prawiyogiw(va|vam|A)$/) && ($b =~ /^anuyogiw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^viRayaw(va|vam|A)$/) && ($b =~ /^viRayiw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^nirUpyaw(va|vam|A)$/) && ($b =~ /^nirUpakaw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^vyApyaw(va|vam|A)$/) && ($b =~ /^vyApakaw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^viSeRyaw(va|vam|A)$/) && ($b =~ /^viSeRaNaw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^avacCexyaw(va|vam|A)$/) && ($b =~ /^avacCexakaw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^Xarmaw(va|vam|A)$/) && ($b =~ /^Xarmiw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^prawibaXyaw(va|vam|A)$/) && ($b =~ /^prawibanXakaw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^lakRyaw(va|vam|A)$/) && ($b =~ /^lakRaNaw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^saMsargaw(va|vam|A)$/) && ($b =~ /^saMsargiw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^prakAriw(va|vam|A)$/) && ($b =~ /^prakAraw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^ASrayaw(va|vam|A)$/) && ($b =~ /^ASrayiw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^janyaw(va|vam|A)$/) && ($b =~ /^janakaw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^puwraw(va|vam|A)$/) && ($b =~ /^piwqw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^prayojyaw(va|vam|A)$/) && ($b =~ /^prayojakaw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^sAXyaw(va|vam|A)$/) && ($b =~ /^sAXakaw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^boXyaw(va|vam|A)$/) && ($b =~ /^boXakaw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^sambanXaw(va|vam|A)$/) && ($b =~ /^sambanXiw(va|vam|A)$/)) { return 1;} 
 elsif (($a =~ /^avayavaw(va|vam|A)$/) && ($b =~ /^avayaviw(va|vam|A)$/)) { return 1;} 
else {return 0;}
}
