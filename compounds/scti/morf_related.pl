#!/usr/bin/perl

require "../../paths.pl";

sub get_morf_analysis
{
 my($wrd,$debug_level)= @_;
 my($morf_out);

 $morf_out =  `/bin/echo $wrd | lt-proc -c $GlblVar::SCLINSTALLDIR/compounds/scti/all_morf.bin`;

 chomp($morf_out);
 $morf_out =~ s/^\^//;
 $morf_out =~ s/\$$//;
 $morf_out;
}
1;


sub get_stems
{
 my($morf_ana,$debug_level) = @_;
 
 my($ans);
 $ans = "";

 my(@morf_ana,$stem,$stem4,$stems,$stems4,$stemsfrom4);

 if($morf_ana =~ /^\^.*\/\*.*\$$/) { 
    $morf_ana =~ s/\/.*//; 
    $morf_ana =~ s/^\^//;
    $morf_ana =~ s/\$$//;
 }
 @morf_ana = split("/",$morf_ana);

 foreach $morf_ana (@morf_ana)
 {
  if($morf_ana =~ /<level:4>/) 
  {
    $stem4 = $morf_ana;
    $stem4 =~ s/<[^>]+>//g;
    if (($stems4 !~ /#$stem4$/) && ($stems4 !~ /#$stem4#/))
    {
      $stems4 .= "#".$stem4;
    }
  } else {
    $stem = $morf_ana;
    $stem =~ s/<[^>]+>//g;
    if (($stems !~ /#$stem$/) && ($stems !~ /#$stem#/))
    {
      $stems .= "#".$stem.";0";
    }
  }
 }
 $stems4 =~ s/^#//;
 $stems4 =~ s/#/\n/;
 $stems4 =~ s/\$//;

 if($debug_level >= 3) {
    print "stems of level 4 = $stems4\n";
 }
 $morf_out =  `/bin/echo "$stems4" | lt-proc -c $GlblVar::SCLINSTALLDIR/compounds/scti/all_morf.bin`;
 chomp($morf_out);

 $stemsfrom4 = "";
 if($debug_level >= 3) {
    print "morf_out of level 4 = $morf_out\n";
 }

 @morf_ana = split("/",$morf_out);
 foreach $morf_ana (@morf_ana)
 {
    $stemfrom4 = $morf_ana;
    $stemfrom4 =~ s/<[^>]+>//g;
    if (($stemsfrom4 !~ /#$stemfrom4$/) && 
        ($stemsfrom4 !~ /^$stemfrom4#/) && 
        ($stemsfrom4 !~ /#$stemfrom4#/))
    {
      $stemsfrom4 .= "#".$stemfrom4;
    }
    $kwa = &is_kwa($morf_ana,$debug_level); 
    if($kwa) {
      $stemsfrom4 .= ";1";
    } else {
      $stemsfrom4 .= ";0";
    }
 }

 $stems =~ s/^#//;
 $stemsfrom4 =~ s/^#//;

 $ans = $stems."#".$stemsfrom4;
}
1;

sub is_kwa
{
my($morf_ana,$debug_level) = @_;

 my($kwa);
 $kwa = 0;

 if($morf_ana =~ /kqw_prawyayaH:kwa/)
 {
  $kwa = 1;
 }
 $kwa;
}
1;
