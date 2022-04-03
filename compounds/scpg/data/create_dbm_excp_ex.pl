#!/usr/bin/perl

use GDBM_File;
tie(%LEX,GDBM_File,$ARGV[0],GDBM_WRCREAT,0666);

while(<STDIN>) {
chomp;
$_ =~ /(.*)#(.*)#(.*)/;
$key1 = $1;
$value = $2;
$key2 = $3;
if($LEX{$key2} eq "") {
      $LEX{$key2}=$value;
} elsif( ($LEX{$key2} !~ /^$value$/) &&
         ($LEX{$key2} !~ /#$value$/) &&
         ($LEX{$key2} !~ /#$value#/) &&
         ($LEX{$key2} !~ /^$value#/)) {
             $LEX{$key2} .= "#".$value;
         }
}
untie(%LEX);
