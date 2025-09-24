#!/usr/bin/perl

$found = 0;
while($in = <STDIN>){
  if ($found == 1) { 
      $in =~ s/.*"blue">//;
      $in =~ s/<.*>//;
      print $in;
      $found = 0;
  }
  if($in =~ /<a name/) { $found = 1;}

}
