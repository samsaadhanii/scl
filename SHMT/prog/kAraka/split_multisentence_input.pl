#!/usr/bin/env perl

$/ = "\n\n";

$filename = $ARGV[0];
$index = 1;

while($in = <STDIN>){
  $ext = $index.".out";
  open (TMP,">$filename$ext") || die "Can't open $filename$ext for writing";
  print TMP $in;
  close(TMP);
  $index++;
}

