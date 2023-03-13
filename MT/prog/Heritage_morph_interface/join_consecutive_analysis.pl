#!/usr/bin/perl

$old_flds[1] = "";
$word_no = 1;
while($in = <STDIN>){
  chomp($in);
  @flds = split(/\t/,$in);
  $flds[0] =~ /^([0-9]+)\.([0-9]+)/;
  $comp_no = $2;
  
  if (($old_flds[1] eq $flds[1])) {
     print "\/", $flds[2];
  } elsif (($old_flds[1] =~ /\-$flds[1]/)) {
     print "\/", $flds[2];
  } elsif (($old_flds[1] eq "")) {
     print $word_no,".",$comp_no, "\t", $flds[1],"\t",,$flds[2];
      if ($flds[1] !~ /\-$/) {$word_no++;}
  } else { 
     print "\n";
     print $word_no,".",$comp_no, "\t", $flds[1],"\t",$flds[2];
     if ($flds[1] !~ /\-$/) {$word_no++;}
  }
  @old_flds = split(/\t/,$in);
}
print "\n";
