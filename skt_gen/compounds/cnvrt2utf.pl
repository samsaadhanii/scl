#!/usr/bin/env perl

require "../../paths.pl";
 my $mycPATH = "$GlblVar::SCLINSTALLDIR/converters";

 sub cnvrt2utf {
  my($in) = @_;
  chomp($in);

  $in = $in." "; #Idiosynchrosy of ir_skt; does not work well if con is at the end. Hence added an extra space

  $out = `echo $in | $mycPATH/ri_skt | $mycPATH/iscii2utf8.py 1`;

$out;
}
1;
