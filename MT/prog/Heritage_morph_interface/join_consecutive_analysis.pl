#!/usr/bin/perl

$old_flds[2] = "";
$old_flds[3] = "";
$count = 1;
while($in = <STDIN>){
  chomp($in);
  @flds = split(/\t/,$in);
  
  if (($old_flds[2] eq $flds[2]) && ($old_flds[3] eq $flds[3])) {
     print "\/", $flds[5];
  } elsif (($old_flds[2] =~ /\-$flds[2]/) && ($old_flds[3] =~ /\-$flds[3]/)) {
     print "\/", $flds[5];
  } elsif (($old_flds[2] eq "") && ($old_flds[3] eq "")) {
     print "1.$count", "\t", $flds[1],"\t",$flds[2],"\t",$flds[3],"\t",$flds[4],"\t", $flds[5];
     $count++;
  } else { 
     print "\n";
     print "1.$count", "\t", $flds[1],"\t",$flds[2],"\t",$flds[3],"\t",$flds[4],"\t",$flds[5];
     $count++;
  }
  @old_flds = split(/\t/,$in);
}
print "\n";
