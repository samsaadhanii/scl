#!/usr/bin/env perl

use strict;
use warnings;

open "../../../paths.pl";
#Given a user's choice for an anuyogin, this programme removes all the anuyogins corresponding to the choice of a word as well as other words that are incompatible with this choice, and prints the table.
# It returns more_choices=1, if still there are words with multiple possible anuyogins, where user input is required.

sub print_table{
    my ($rel,$pid,$filename) = @_;
    my($in,$count,$more_choices,$type,$word,$index,$pra,$anu,$j,@anu,$tmp,@rel_pra_anu,$possible_anu,$rel_pra_anu,$rel_anu, $rel_pra);

    open(TMP,"<$filename") || die "Can't open $filename for reading";
    $count = 0;
    $more_choices = 0;
    $tmp = $rel;
    $tmp =~ s/^://;
    if ($tmp ne "") { @rel_pra_anu = split(/:/,$tmp);} 
    else {$rel_pra_anu[0] = "";}

    while($in = <TMP>){
      print "<table border=\"1\">";
      chomp($in);
      ($type,$word,$index,$pra,$anu) = split(/\t/,$in);
      print "<tr><td class=\"$type\">$word</td></tr>";
      print "<tr><td class=\"$type\">$index</td></tr>";

      #if($pra eq "-") { print "<tr><td class=\"$type\">-</td></tr>";}
      #else {print "<tr><td class=\"$type\">प्र:$pra</td></tr>";}

      if($anu eq "-") { print "<tr><td class=\"$type\">-</td></tr>";}
      else {
            print "<tr><td class=\"$type\">";
            @anu = split(/,/,$anu);
            print "अनु:";
	    # Get the list of possible anuyogis
            $possible_anu= $anu;
            if ($rel =~ /:$count,([0-9]+)/) { 
		$possible_anu = $1; 
	    } elsif($#anu > 0) { #If there are more than one elements
                 $possible_anu = $anu; #Assume that all are possible
                 $possible_anu .= ",";#For uniform regular expression, we have added , at the end.
                 for($j=0;$j<=$#anu;$j++) {
#For each of the possible anuyogis, check whether it is compatible with the entries in the 'rel', as chosen by the user.
                     if($rel_pra_anu[0] ne "") {
		      foreach $rel_pra_anu (@rel_pra_anu) {
			($rel_pra,$rel_anu) = split(/,/,$rel_pra_anu);
                         #Now rule out the ones which cross the boundaries for the given choice.
		         if ((($index > $rel_anu) || ($index < $rel_pra)) && 
                            (($anu[$j] > $rel_pra) && ($anu[$j] < $rel_anu))) {
                                $possible_anu =~ s/,$anu[$j],/,/;
                                $possible_anu =~ s/,$anu[$j]$//;
                                $possible_anu =~ s/^$anu[$j],//;
		        }
		        if ((($anu[$j] > $rel_anu) || ($anu[$j] < $rel_pra)) && 
                            (($index > $rel_pra) && ($index < $rel_anu))) {
                                 $possible_anu =~ s/,$anu[$j],/,/;
                                 $possible_anu =~ s/^$anu[$j],//;
                                 $possible_anu =~ s/,$anu[$j]$//;
		        }
                      }
                     }
              }
            }
	    # print the list of possible anuyogis with link for selection
            $possible_anu =~ s/,$//;
            if($possible_anu !~ /,/) {
                if($rel !~ /$count,$possible_anu/) {
                  $rel = $rel.":".$count.",".$possible_anu;
                }
		print $possible_anu;
            } else {
               @anu = split(/,/,$possible_anu);
               for($j=0;$j<$#anu;$j++) {
                $tmp = $rel.":".$count.",".$anu[$j];
                print "<a href=\"/cgi-bin/$GlblVar::SCL_CGI/NN/parser/select.cgi?pid=$pid&amp;instr=$tmp\">$anu[$j]</a>";
		print ",";
                $more_choices = 1;
               }
                $tmp = $rel.":".$count.",".$anu[$j];
                print "<a href=\"/cgi-bin/$GlblVar::SCL_CGI/NN/parser/select.cgi?pid=$pid&amp;instr=$tmp\">$anu[$j]</a>";
	    }
           print "</td></tr>";
      }
      print "</table>\n";
      $count++;
    }
    close(TMP);
my $ret_str = $more_choices."#".$rel;
$ret_str;
}
1;

 sub get_parsed_string{
  my($rel,$filename)= @_;
  my($count,$type,$word,$index,$pra,$anu,@left,@right,@word,$indx,$min,$tmp,$previous,$i,$c,$tmp1,$in,@level,@pra,@type,@anu);

  for($i=0;$i<20;$i++){
    $right[$i] = "";
    $left[$i] = "";
  }

#Once the user has made all the choices, this programme constructs a parenthesized expression from the given expression.
#In order to construct the parenthesied expression, we mark the index of the matching right parenthesis at the position where the left parenthsis would be. Similarly we mark the index of the left parenthesis at the position where the right parenthesis would be.
  open(TMP,$filename) || die "Can't open $filename for reading";
  $count = 1;
  while($in = <TMP>){
    chomp($in);
    ($type,$word,$index,$pra,$anu) = split(/\t/,$in);
# populate word, anu and pra array
     $word[$index] = $word;
     $pra[$index] = $pra;
     $type[$index] = $type;
     $indx = $index-1;
     if($rel =~ /:$indx,([0-9]+)/){ $anu = $1;}
     $anu[$index] = $anu;
#Handle pra: relation
       if($type eq "relation") {
         if($pra  =~ /[0-9]/) {
           if($right[$pra] eq "") { # If it is not head
              $left[$pra] .= ",$index"; #store the index of the closing parenthesis
              $right[$index] .= ",$pra"; #store the index of the opening parenthesis
              #print "PRA $pra $left[$pra]; $index, $right[$index]\n";
           } else {
             $tmp = $right[$pra];
             $min = 1000;
	     while($tmp =~ /^,([0-9]+)(.*)/) {
                 if($min > $1) { $min = $1;}
                 $tmp = $2;
             }
                $left[$min] .= ",$index"; #store the index of the closing parenthesis
                $right[$index] .= ",$min"; #store the index of the opening parenthesis
                #print "PRA1 $min $left[$min]; $index, $right[$index]\n";
           }
         }
        }
#Handle anu: relation
# The left parenthesis for the anuyogin is the pratiyogin, if it is not already the boundary (i.e. the right parenthesis) for some other compound, else, select the leftmost left parenthesis corresponding to the right parentheses in the pratiyogin.
       if ($word ne "त्वम्") {
         if($anu  =~ /[0-9]/) {
            if($right[$pra] eq "") {
                $right[$anu] .= ",$pra";
                $left[$pra] .= ",$anu"; 
           } else {
             $tmp1 = $right[$pra];
             $min = 1000;
	     while($tmp1 =~ /^,([0-9]+)(.*)/) {
                 if($min > $1) { $min = $1;}
                 $tmp1 = $2;
             }
                $right[$anu] .= ",$min"; 
                $left[$min] .= ",$anu"; 
           }
         }
        } else { $left[$min] =~ s/,$index//;}
     $count++;
  }
  close(TMP);

   $level[$count-1] = 1;
   for($i=$count-2;$i>0;$i--){
     if ($type[$i] eq "relation") {
        if   (($word[$i] eq "वत्") 
         ||  ($word[$i] eq "शालि") 
         ||  ($word[$i] eq "निरूपित") 
         ||  ($word[$i] eq "निरूपक")) {
            $level[$i] = $level[$anu[$i]]+1;
            $level[$pra[$i]] = $level[$anu[$i]]+2;
        }
        elsif   (($word[$i] eq "निष्ठ") 
         ||  ($word[$i] eq "वृत्ति")){ 
            $level[$i] = $level[$anu[$i]]-1;
            $level[$pra[$i]] = $level[$anu[$i]]-2;
        }
        elsif   (($word[$i] eq "अभेद") 
         ||  ($word[$i] eq "अवच्छिन्न") 
         ||  ($word[$i] eq "अवच्छेदक")){ 
            $level[$i] = $level[$anu[$i]]-1;
            $level[$pra[$i]] = $level[$anu[$i]];
        }
     }
    }
# This part prints the left and right parenthsis, counting the indices of the matching right and left parentheses for each word.
   my $ans = "";
   for($i=1;$i<$count;$i++){
       $c = ($left[$i] =~ s/,/,/g);
       if (($i==1) && ($c == 0)) { $c = 1;}
       $ans .= "<" x $c;
       if (($type[$i] eq "concept") && ($level[$i] eq "")){
         my $j = $i; while($level[$j] eq "") {$j++;}
          $ans .= $word[$i].":".$level[$j];
       } elsif (($type[$i] eq "relation") && ($level[$i] eq "")){
         my $j = $i; while($level[$j] eq "") {$j++;}
          $ans .= $word[$i].":".$level[$j];
       } else {
          $ans .= $word[$i].":".$level[$i];
       }
       $c = ($right[$i] =~ s/,/,/g);
       if (($i==$count-1) && ($c == 0) && ($word[$i] ne "त्वम्")) { $c = 1;}
       $ans .= ">" x $c;
       if($i < $count-1) { 
          if ($word[$i+1] eq "त्वम्") { $ans .= "^";} else {$ans .= "-";}
       }
   }
  $ans =~ s/<([^<>\^]+):[0-9]+\-\^(त्वम्)(:[0-9]+)>/$1$2$3/;
  $ans =~ s/<([^<>\^]+):[0-9]+\-\^(त्व)(:[0-9]+)>/$1$2$3/;
  $ans;
 }
1;
