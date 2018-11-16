#!/usr/bin/env perl

while($in = <STDIN>){

$in =~ s/ na hi / nahi /;
$in =~ s/ aWa vA / aWavA /;
$in =~ s/ ki[mM] ca / kiFca /;
$in =~ s/ na ca / naca /;

print $in;
}
