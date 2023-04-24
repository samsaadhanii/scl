#!/usr/bin/perl

@in = <STDIN>;
@new_in = &get_anvaya_order(@in);

for ($k = 1; $k <=$#in; $k++) {
$in = $new_in[$k];
chomp($in);
@flds = split(/\t/,$in);

$shloka_anvaya .= " ". $flds[1];
$trans_anvaya .= " ". $flds[9];
$trans_anvaya =~ s/_/ /g;
$trans_anvaya =~ s/\- / /g;
$shloka_anvaya =~ s/\- / /g;
}
$shloka_anvaya .= " ";
$trans_anvaya .= " ";

open (TMP,">$ARGV[0]") || die "Can't open $ARGV[0] for writing";
print TMP $shloka_anvaya;
close(TMP);
open (TMP,">$ARGV[1]") || die "Can't open $ARGV[1] for writing";
print TMP $trans_anvaya;
close(TMP);

sub get_anvaya_order {
 my(@in) = @_;
 my(@new_in, $i);
 for ($i=1;$i<=$#in;$i++) {
  @flds = split('\t',$in[$i]);
  $shloka_order{$i} = $flds[2];
  $word_pos{$flds[2]} = $i;
 }

 @new_order = sort {10*$a <=> 10*$b} (values %shloka_order);
 $i = 1;
 foreach $new_order (@new_order) {
   $new_in[$i] = $in[$word_pos{$new_order}];
   $i++;
 }
@new_in;
}
1;
