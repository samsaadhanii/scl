#!/usr/bin/perl

$word = 1;
@in = <STDIN>;
@new_in = &get_anvaya_order(@in);

for ($k = 1; $k <=$#in; $k++) {
$in = $new_in[$k];
chomp($in);
@flds = split(/\t/,$in);

$shloka_anvaya .= " ". $flds[1];
$trans_anvaya .= " ". $flds[7];
$trans_anvaya =~ s/_/ /g;
}

open (TMP,">$ARGV[0]") || die "Can't open $ARGV[0] for writing";
#print "shloka = $shloka_anvaya\n";
print TMP $shloka_anvaya;
close(TMP);
open (TMP,">$ARGV[1]") || die "Can't open $ARGV[1] for writing";
#print "trans = $trans_anvaya\n";
print TMP $trans_anvaya;
close(TMP);

sub get_anvaya_order {
 my(@in) = @_;
 my(@new_in);
 for ($i=1;$i<=$#in;$i++) {
  @flds = split('\t',$in[$i]);
  $new_in[$flds[2]] = $in[$i];
 }
@new_in;
}
1;
