#!/usr/bin/perl

use GDBM_File;
tie(%LEX,GDBM_File,$ARGV[0],GDBM_WRCREAT,0666);

while(<STDIN>) {
chomp;
$_ =~ /([^,]+),(.*)$/;
$key = $1;
$value = $2;
if($LEX{$key} eq "") {$LEX{$key}=$value;} else {$LEX{$key} .= "#".$value;}
}
untie(%LEX);
