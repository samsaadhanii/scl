#!/usr/bin/perl

use GDBM_File;
tie(%LEX,GDBM_File,$ARGV[0],GDBM_WRCREAT,0666);

while(<STDIN>) {
chomp;
$_ =~ /^([^,]+),(.*)$/;
$key1 = $1;
$value = $2;
if($LEX{$key1} eq "") {
   $LEX{$key1}=$value;
}
elsif( ($LEX{$key1} !~ /^$value$/) &&
       ($LEX{$key1} !~ /#$value$/) &&
       ($LEX{$key1} !~ /#$value#/) &&
       ($LEX{$key1} !~ /^$value#/)) {
          $LEX{$key1} .= "#".$value;
       }
}
untie(%LEX);
