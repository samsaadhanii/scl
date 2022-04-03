#!/usr/bin/perl

$|=1;

use GDBM_File;
tie(%LEX,GDBM_File,$ARGV[0],GDBM_WRCREAT,0666);
tie(%LEX1,GDBM_File,$ARGV[1],GDBM_WRCREAT,0666);

while(<STDIN>) {
chomp;
($value,$key) = split(/ /,$_);
 print "key = $key\n";
 print "value = $value\n";
 #$key =~ s/#/Z/;
$LEX{$key}+=$value;

$key =~ s/.*#//;
$LEX1{$key}+=$value;
}
untie(%LEX);
untie(%LEX1);
