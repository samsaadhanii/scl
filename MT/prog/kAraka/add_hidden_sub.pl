#!/usr/bin/perl

## Usage: perl add_hidden_sub.pl < 2.svg > 2_2.svg

sub print_script_N_style {
print "
<style>
 .hidden { display: none; }
 .node { cursor: pointer; }
 </style>
<script>
     function toggleChildren(id) {
      const children = document.getElementById(id);
      if (children.classList.contains('hidden')) {
        children.classList.remove('hidden');
      } else {
        children.classList.add('hidden');
      }
    }
</script>\n";
}
1;

sub print_hidden_hdr_open {
 my ($label) = @_;

 my($str) = "<g id=\"children_node$label\" class=\"hidden\">
    <g class=\"node\" onclick=\"toggleChildren('children_node$label');\">\n";

print $str;
}


sub print_hidden_hdr_close{
    print "</g>\n</g>\n";
}


$hidden_count=1;
$hold_children = "";
$hold_parent = "";
$old_compound_node_no = 1;
$current_compound_node_no = 0;

$/ = "<svg";
$in = <STDIN>; # ignore xml
$/ = "-->";
$in = <STDIN>;
print  "<svg", $in;
&print_script_N_style;
$/ = "</g>\n";
while($in = <STDIN>){
 #print "IN = $in NI \n";
 #print "HOLD P $hold_parent\n";
 #print "HOLD C $hold_children\n";
        if  ($in =~ /<\!\-\-.* Node([0-9]_[0-9]_[0-9]c) .*\-\->/) {
		  $in =~ s/<g id="(node[^"]+)" class="node">/<g class="$1" onclick="toggleChildren('children_node$hidden_count');">/;
		  $hold_parent = $in;
        } elsif  ($in =~ /Node([0-9]_[0-9]_[0-9])&#45;&gt;Node([0-9]_[0-9]_[0-9])c/) {
                 #print "ONE = $1\n";
                 #print "TWO = $2\n";
                 if ($1 eq $2) {
                    #print "HP = $hold_parent\n";
                    if ($hold_parent ne "") {
                     if ($hold_children ne "") { 
                         &print_hidden_hdr_open($hidden_count); 
                         print $hold_children; 
                         print $in; 
                         &print_hidden_hdr_close; 
                         print $hold_parent;
                         $hold_children = "";
                     }
                    } 
                  } else { print $hold_parent; print $hold_children; print $in; $hold_parent = ""; $hold_children = "";}
                  $hidden_count++;
        } elsif($in =~ /Node([0-9])/) {
	           $current_compound_node_no = $1;
	           if ($old_compound_node_no != $current_compound_node_no) {
                      if ($hold_children ne "") { print $hold_children; $hold_children = "";}
                      $hold_children .= $in; 
                      $old_compound_node_no = $current_compound_node_no;
                   } else { $hold_children .= $in;}
        } else { 
          print $hold_parent; 
          print $hold_children; 
          print $in; 
          $hold_children = "";
          $hold_parent = "";
        }
}
print $hold_children;
print $hold_parent;
