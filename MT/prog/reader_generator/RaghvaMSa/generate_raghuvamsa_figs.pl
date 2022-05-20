#!/usr/bin/env perl

#Purpose:
#This programes generates a svg file corresponding to the annotated dependencies in a table form.
## Usage:
### perl generate_raghuvamsa_figs.pl "svg_file_name" < analysis_file
#
# Structure of Analysis file
#It consists of 4 columns separated by TABS: Word_no Word Morph_Ana Relation
##Relation consists of 'rel_nm and the to_word_no separated by a Comma
#Sample entries
###########################BEGINS#######################################
#Anvaya_no	word	morph_in_context	kaaraka_sambandha

#1	दशरथस्य	दशरथ{नपुं;6;एक}	षष्ठीसम्बन्धः,2
#2	पुत्रः	पुत्र{पुं;1;एक}	अभेदः,3
#3	रामः	राम{पुं;1;एक}	कर्ता,9
#4	नगरे	नगर{नपुं;7;एक}	अधिकरणम्,9
#5	कोशात्	कोश{पुं;5;एक}	अपादानम्,9
#6	हस्तेन	हस्त{पुं;3;एक}	करणम्,9
#7	ब्राह्मणाय	ब्राह्मण{पुं;4;एक}	सम्प्रदानम्,9
#8	धनं	धन{नपुं;2;एक}	कर्म,9
#9	ददाति	दा3{कर्तरि;लट्;प्र;एक;परस्मैपदी;डुदाञ्;:जुहोत्यादिः}	अभिहित_कर्ता,3;सकर्मक
###########################ENDS#######################################
#
# Note that top 2 lines are always the column names followed by a blank line

use strict;
use warnings;

my(%color); 

$color{"N1"} = "#00BFFF";
$color{"N2"} = "#93DB70";
$color{"N3"} = "#40E0D0";
$color{"N4"} = "#B0E2FF";
$color{"N5"} = "#B4FFB4";
$color{"N6"} = "#87CEEB";
$color{"N7"} = "#C6E2EB";
$color{"N8"} = "#6FFFC3";
$color{"NA"} = "#FF99FF";
$color{"KP"} = "#FF1975";

$/ = "\n\n";

my $op_file_name = $ARGV[0];

my($in);

$in = <STDIN>; # Read the column headeings

while($in = <STDIN>){
  &prepare_dot($in); 
}

sub prepare_dot{
my($input) = @_;

my(@lines, $l, $rel_no,$no,$rele,$morph,$word,$node,$nodes,$color);

open(TMP,">$op_file_name.dot") || die "Can't open $op_file_name.dot for writing";
$nodes = "";

print TMP "digraph G\{\n";

@lines = split(/\n/,$input);

foreach $node (@lines) {
 chomp $node;
 $node =~ s/\t/ /g;
 $node =~ s/,/ /g;
 ($no,$word,$morph,$rele,$rel_no)=split(/ /,$node);
 $color = &get_color($morph);
 print TMP "Node$no \[style=filled, color=\"$color\" ";
 print TMP ", label=\"$word\"\, fontname=\"Lohit Hindi\"]\n";
 $nodes = &Nodes($nodes,$rel_no,$no,$rele);
}

print TMP $nodes,"\n";
print TMP "rankdir=BT\nbgcolor=\"lemonchiffon1\";\n";
print TMP "\}";
close(TMP);
system("dot $op_file_name.dot -Tsvg -o $op_file_name.svg");
#system("rm $file_name.dot");
}
1;

sub Nodes {
my ($nodes,$rel_no,$no,$rele,$morph) = @_;
 if($rele !~ /अभिहित/) { 
 if(defined($rel_no)) {
   $nodes=$nodes."Node$no -> Node$rel_no \[label=\"$rele\",dir=back ,fontcolor=red, fontname=\"Lohit Hindi\"\]\n";
 }
 }
 $nodes;
}
1;


sub get_color{
  my($ana) = @_;

  my ($color) = "";
  if($ana =~ /;([1-8]);/) {
     $color = $color{"N".$1};
  } elsif($ana =~ /;[^;]+पदी;/) {
     $color = $color{"KP"};
  } else {
     $color = $color{"NA"};
  }
$color;
}
1;

