#!/usr/bin/perl

use GDBM_File;
tie(%LEX,GDBM_File,$ARGV[0],GDBM_WRCREAT,0666);

while(<STDIN>) {
chomp;
$_ =~ /(.*),(.*),(.*)/;
$gen = $1;
$vib = $2;
$value = $3;

$key = $gen.",".$vib;

$LEX{$key} = $value;
}
untie(%LEX);
