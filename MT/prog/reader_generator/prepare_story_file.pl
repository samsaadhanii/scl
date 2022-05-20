#!/usr/bin/env perl

use strict;
use warnings;

my $path = $ARGV[0];
my $lastcount = $ARGV[1];

my $count = 1;
my $flcount = 1;
 
  while($flcount <= $lastcount) {

  my $file = $path."/I-".$flcount.".csv";
  #print "file = $file\n";
  if (-e $file) { 
     $file = $path."/I-".$flcount.".csv";
     open(TMP,"<$file") || die "Can't open $file for reading";
     my $in = <TMP>; # Ignore the first line which contains field names.
     while($in = <TMP>){
           $in =~ s/ \t/\t/;
           $in =~ s/, / /;
           if($in =~ /^[ \t]+$/) { 
              $count++;
              print "\n";
           } else {
             print "S$count\t",$in;
           }
     }
     print "\n";
  } else {
     my $dir = $path."/I-".$flcount;
     #print "dir = $dir\n";
     if(-d $dir) {
        &join_contents_of_subdir($path,$count);
     }
  }
  $flcount++;
  $count++;
}

sub join_contents_of_subdir{

  my $path = $_[0];
  my $count = $_[1];
  my $subcount = 1;
  my($file,$exists);
  
  $file = $path."/I-".$count."/I-".$count.".".$subcount.".csv";
  #print "file = $file\n";
  if (-e $file) { $exists = 1;} else { $exists = 0;}

  while($exists) {
    open(TMP,"<$file") || die "Can't open $file for reading";
    my $in = <TMP>; # Ignore the first line which contains field names.
    while($in = <TMP>){
         $in =~ s/ \t/\t/;
         $in =~ s/, / /;
         print "S$count.$subcount\t",$in;
    }
    print "\n";
    $subcount++;
    $file = $path."/I-".$count."/I-".$count.".".$subcount.".csv";
    #print "file = $file\n";
    if (-e $file) { $exists = 1;} else { $exists = 0;}
  }
 }
1;

