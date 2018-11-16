#!/usr/bin/env perl

use strict;
use warnings;

$/ = "\n\n";

my($in);

while($in = <STDIN>){
  &prepare_dot($in); 
}

sub prepare_dot{
my($input) = @_;

my($file_name,$rel_no,$no,$rele,@input,$shloka,$word,$node,$nodes);

$nodes = "";

@input = split(/\n/,$input);
$input[0] =~ /^S([^\t]+)/;
$file_name = $1;
open(TMP,">$file_name.dot") || die "Can't open $file_name.dot for writing";
$nodes = "";

print TMP "digraph G\{\n";
foreach $node (@input) {
 chomp $node;
 $node =~ s/\t/ /g;
 $node =~ s/,/ /g;
 ($shloka,$no,$word,$rele,$rel_no)=split(/ /,$node);
  $nodes = &Nodes($nodes,$rel_no,$no,$rele);
 print TMP "Node$no \[label=\"$word\"\, fontname=\"Lohit Hindi\"]\n";
}

print TMP $nodes,"\n";
print TMP "rankdir=RL\n";
print TMP "\}";
close(TMP);
system("dot $file_name.dot -Tjpg -o $file_name.jpg");
system("rm $file_name.dot");
}
1;

sub Nodes {
my ($nodes,$rel_no,$no,$rele) = @_;
 if(defined($rel_no)) {
   $nodes=$nodes."Node$no -> Node$rel_no \[label=\"$rele\",dir=back ,fontcolor=red, fontname=\"Lohit Hindi\"\]\n";
 }
 $nodes;
}
1;
