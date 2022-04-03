#!/usr/bin/perl

use GDBM_File;
tie(%LEX,GDBM_File,$ARGV[0],GDBM_WRCREAT,0666);

while(<STDIN>) {
chomp;
$_ =~ /(.*),(.*),(.*),(.*)/;
$gen = $1;
$vib = $2;
$num = $3;
$value = $4;

$key = $gen.",".$vib.",".$num;

$LEX{$key} = $value;
}
untie(%LEX);
