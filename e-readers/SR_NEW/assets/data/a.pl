#!/usr/bin/perl

while($in = <STDIN>) {
      if ($in =~ /aaraka_sambandha/) {
	  print $in;
          $in =~ s/kaaraka_sambandh/possible_relations/;
      }
	  print $in;
}
