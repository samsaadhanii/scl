#!/usr/bin/env perl

require "../../paths.pl";

 my $mycPATH = "$GlblVar::SCLINSTALLDIR/converters";

 sub cnvrt2utfr {
  my($in) = @_;
  chomp($in);

  $in = $in." "; #Idiosynchrosy of ir_skt; does not work well if con is at the end. Hence added an extra space

  $out = `echo $in | $mycPATH/utf82iscii.pl | $mycPATH/ir | $mycPATH/wx2utf8roman.out`;

$out;
}
1; 
