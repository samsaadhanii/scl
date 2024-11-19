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


$/ = "<svg";
$in = <STDIN>; # ignore xml
$/ = "-->";
$in = <STDIN>;
print  "<svg", $in;
&print_script_N_style;
$/ = "</g>\n";
@in = <STDIN>;

my ($i,$node,$index);

@dummy_compound_nodes = split(/:/, &get_dummy_nodes_list(@in));

print @dummy_compound_nodes;

 for($i = 0; $i <= $#dummy_compound_nodes; $i++) {
     $node = $dummy_compound_nodes[$i];
     $node =~ /^(S[0-9]_[0-9]+)_/;
     $index = $1;
     #print "node = $node\n";
     #print "index = $index\n";
     $parent_node = "";
     $children_node = "";
     for ($j=0;$j<=$#in; $j++)  {
         if ($in[$j] =~ /<\!\-\-.* Node$node .*\-\->/) {
             $parent_node = $in[$j];
             $visited[$j] = 1;
         } elsif (($in[$j] =~ /Node${index}_/)  && ($in[$j] !~ /Node$node/)){
             #print "IN = $in[$j]\n";
             $children_node .= $in[$j];
             $visited[$j] = 1;
         } elsif  ($in[$j] =~ /Node(S[0-9]_[0-9]+_[0-9]_[0-9])&#45;&gt;Node((S[0-9]_[0-9]+_[0-9]_[0-9])c)/) {
            if (($1 eq $3) && ($2 eq $node)) { 
                 $children_node .= $in[$j];
                 $visited[$j] = 1;
            }
         }
     }
     &print_hidden_hdr_open($i); 
     print $children_node; 
     &print_hidden_hdr_close; 
     
     $parent_node =~ s/<g id="(node[^"]+)" class="node">/<g class="$1" onclick="toggleChildren('children_node$i');">/;
     print $parent_node;
 }
 for ($j=0;$j<=$#in; $j++)  {
    if ($visited[$j] != 1) {
       if  ($in =~ /Node(S[0-9]_[0-9_]+)&#45;&gt;Node(S[0-9]_[0-9]+_[0-9]_[0-9])c/) {
            if ($1 ne $2) { print $in[$j];
                #print "IN1 = $in NI \n";
            }
       } elsif  ($in =~ /Node(S[0-9]_[0-9]+_[0-9]_[0-9])&#45;&gt;Node(S[0-9]_[0-9]+_[0-9]_[0-9])c /) {
            if ($1 ne $2) { print $in[$j];
                #print "IN2 = $in NI \n";
            }
       } elsif ($in =~ /Node(S[0-9]_[0-9_]+)/) {
             print $in[$j]; 
             #print "IN3 = $in NI \n";
       }
      }
 }


sub get_dummy_nodes_list {
  my(@svg_nodes) = @_;

  my ($ans);
  my ($hidden_count) = 1;

  foreach $node (@svg_nodes) {
    if  ($node =~ /<\!\-\-.* Node(S[0-9]_[0-9]+_[0-9]_[0-9]c) .*\-\->/) {
         $dummy_node[$hidden_count] = $1;
         $hidden_count++;
    }
   }
$ans = join (':', @dummy_node);
$ans;
}
1;
