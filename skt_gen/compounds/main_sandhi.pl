#!/usr/bin/env perl

require "../../paths.pl";

my $myPATH = "$GlblVar::SCLINSTALLDIR/skt_gen/compounds";

require "$myPATH/sandhi.pl";

($first,$second) = split(/\+/,$ARGV[0]);

#print "first = $first\n";
#print "second = $second\n";

#print "sanXi: ",&sandhi($first,$second);
print &sandhi($first,$second);
