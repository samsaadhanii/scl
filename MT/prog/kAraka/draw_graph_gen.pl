#!/usr/bin/env perl

#  Copyright (C) 2023-2024 Amba Kulkarni (ambapradeep@gmail.com)
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later
#  version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.


$path = $ARGV[0]; # path for temporary files
$parse = $ARGV[1]; #Name of the output file
$sent = $ARGV[2]; # Yes/No


## Sentence numbers are added for Discourse level analysis
if ($sent eq "No") { $sent = "";} else {$sent = "S[0-9]_";}

#### Initialisation #######
$/ = "\n";	# \n is the input delimitor
$cluster_no = 0;
$rel_str = "";
$solnfound = 0;
$non_cluster = "";

$index = 0;
$wrd_fld_id = 1; # Counting starts from 0
$morph_fld_id = 5; # Counting starts from 0
$rel_fld_id = 6; # Counting starts from 0
$color_code_fld_id = 8; # Counting starts from 0

$dotfl_nm = "$parse.dot"; 

# Output is stored in a '.dot' file
open TMP1, ">${path}/${dotfl_nm}" || die "Can't open ${path}/${dotfl_nm} for writing";
$filehandle_status = "open";

$hdr = "digraph G\{\nrankdir=BT;\n compound=true;\n bgcolor=\"lemonchiffon1\";\n";

print TMP1 $hdr;

$edgedir = "dir = \"back\"";	# Default edge direction

# Global variables: 
# @rows, #$rows, $str, $rank , $dvandva_found
$dvandva_found = 0;

@rows = <STDIN>;	# Read the table of analysis

######### Main routine begins ############
      $i = 1; 		#The count starts with 1; since the 1st line corresponds to the headers and hence it is to be ignored.

      while($i <= $#rows) {
	chomp($rows[$i]);	# chop the newline
        $rows[$i] =~ s///g;
	$rows[$i] =~ s/\./_/g;	# Dot does not allow '.'s in the Node labels.
        @flds = split(/\t/,$rows[$i]);	# split the input into fields
        # Process only genuine lines and ignore others
	if (($flds[1] ne "_")  && ($flds[0] =~ /[0-9]/) && ($rows[$i] !~ /WebKit/) && ($flds[0] !~ /-/)) {
	   $label{$flds[$index]} = &get_node_label($flds[$wrd_fld_id]); # Node label
	   $kqw{$flds[$index]} = &is_kqw($flds[$morph_fld_id]);	# This is needed to add a red boundary to the kqxanwas
           #Process the row, only if the label is non empty
           if (($label{$flds[$index]} ne "") && ($label{$flds[$index]} ne ".")) {
             $s_id = $flds[$index]; 	
             #get color code for the node
	     $wcolor{$flds[$index]} = &get_color_code($flds[$color_code_fld_id]); 
       
	     #If it is a compound entry 
             if ($flds[$wrd_fld_id] =~ /\-/) {
                #process 1 to n-1 components of a compound, store the entries in an array @compound; $i is the index of the next row which is to be processed, and component_indx is the index of the uwwarapa in the @compound, which is yet to be populated
                ($i,$component_indx,@compound) = split(/%/,&process_compound_entry($i));
                $compound[$component_indx] = &add_compound_components($rows[$i]);
                $component_indx++;
                &form_compound_constituency_tree($component_indx,@compound);
                $solnfound = 1;
             } else { # If not a compound entry
		 # multiple relations are separated by ';', for each relation, get the rel id, mark the niwya sambanXas, and classify the nodes into cluster or non-cluster nodes.
		#print "s_id = $s_id d_id = $d_id\n";
                @rels = split(/;/,$flds[$rel_fld_id]);
                for ($z=0;$z<=$#rels;$z++) { 
                     if ($rels[$z] =~ /,/) {
                        ($rel_nm,$d_id) = split(/:/,&get_relnm_id ($rels[$z]));
                        $rank .= &mark_niwya_sambanXa($rel_nm,$s_id,$d_id);
                        ($cluster_no, $non_cluster) = split(/:/,&classify_cluster_non_cluster($rel_nm,$cluster_no,$non_cluster,$s_id,$d_id));
                     } elsif (($s_id ne "") && ($non_cluster !~ /#$s_id,/)) {  # If the relation is empty, as in the case of verbs, the node is added to non cluster list
                               $non_cluster .= "#".$s_id.",";
                     }
	             $solnfound = 1;
                }
             }
           }
        }
       $i++;
       #print "i = $i rows = $#rows\n";
      }
      $rel_str = &add_relations($rel_str);  # Add all the non compound relations

      if ($solnfound  && ($rel_str ne "")) {
             print TMP1 $rank;
             $rel_str = &draw_clusters($non_cluster,$cluster_no,$rel_str,@cluster);
             print TMP1 "/* Start of Relations section */\n";
             &writeNclose($rel_str);
             $filehandle_status = "close";
             $rel_str = "";

       } elsif($filehandle_status eq "open"){
             &print_no_solution();
       }
 
#########End of Main routine ############


############  Sub routines start ############
sub draw_clusters{
my($non_cluster,$cluster_no,$rel_str,@cluster) = @_;

my($i,@rel_str,$node,$nodes,@nodes,$node_id,$indx_id,$z,$r,$from,$to);

#Global variables: $wcolor

# print all nodes from various clusters
    for($i=1; $i <= $cluster_no;$i++){

      print TMP1 "\nsubgraph cluster_",$i,"{\n";

      $nodes = $cluster[$i];
      &print_all_nodes_info($nodes);
      print TMP1 "\n}\n";
    }

# Print all non cluster nodes
    $nodes = $non_cluster;
    &print_all_nodes_info($nodes);

    @rel_str = split(/\n/,$rel_str);
    $rel_str = "";
    foreach $r (@rel_str) {
     #print "r = $r\n";

      if($r =~ /Node($sent[0-9_c]+) \-> Node($sent[0-9_c]+).*label="[^"]+"/) {
         $from = $1;
         $to = $2;
      } else {$from = ""; $to = "";}

      for($z=0;$z<=$cluster_no;$z++){
         if(($cluster[$z] =~ /#$from;/) && ($cluster[$z] !~ /#$to;/)){
             $r =~ s/]/ ltail=cluster_$z]/;
         }
      }
# New node numbers are obtained after the compound processing. Hence the old numbers to be replaced by the new numbers before the relations are printed.
      if ($new_index{$from} ne "") { $from = $new_index{$from};}
      if ($new_index{$to} ne "") { $to = $new_index{$to};}
      $r =~ s/Node$sent[0-9_c]+ \-> Node$sent[0-9_c]+(.*label="[^"]+")/Node$from -> Node$to$1/;
      $rel_str .= "\n".$r;
    }
$rel_str;
}
1;

sub print_no_solution{
    print TMP1 "A [shape=rectangle label=\"No Solution Found\"]";
    print TMP1 "\n}\n";
    close(TMP1);
}

sub print_all_nodes_info{
 my($nodes) = @_;
 my(@nodes,$node);

#Global variables: %label, %wcolor, %kqw
   $nodes =~ s/#//g;
   @nodes = split(/,/,$nodes);
   foreach $node (@nodes) {
      if ($word_found{$node} != 1) {
         &print_node_info($node,$label{$node},$wcolor{$node},$kqw{$node});
      }
   }
}
1;

sub print_node_info{
    my($node,$word,$color,$kqw) = @_;
    print TMP1 "Node$node [shape=\"rectangle\", style=filled, fillcolor=\"$color\" ";
    #print "Node$node [shape=\"rectangle\", style=filled, fillcolor=\"$color\" \n";
    if ($kqw == 1) { print TMP1 "color=\"red\" ";}
    print TMP1 "label = \"$word\"]\n";
}

sub writeNclose{
   my($rel_str) = @_;
   print TMP1 $rel_str,"\n}\n";
   close(TMP1);
 }
1;

sub niwya_relations{
  my($rel) = @_;
  if   ($rel =~ /नित्य/) { return 1;}
  elsif   ($rel =~ /nitya/) { return 1;}
 else { return 0;}
}
1;

sub cluster_relations{
  my($rel) = @_;
  if(   ($rel =~ /समुच्चित/) 
     || ($rel =~ /अन्यतरः/)
     || (   ($rel =~ /विशेषणम्/) 
          && ($rel !~ /क्रियाविशे/) 
          && ($rel !~ /विधेय/))
     || ($rel =~ /samuccitaḥ/) 
     || ($rel =~ /anyataraḥ/)
     || ($rel =~ /anyatara.h/) 
     || (   ($rel =~ /viśeṣaṇam/) 
          && ($rel !~ /kriyāvi/)
          && ($rel !~ /vidheya/))) { 
    return 1;
  } else { return 0;}
}
1;

 sub get_node_indx_ids{
 my($node) = @_;
 my($sid);
     $node =~ s/,//;
     $node =~ s/;/./;
     $sid = $node;
     $node =~ s/\..*//;
 $node."#".$sid;
}
1;

 sub  get_node_label{
 my($wrd) = @_;
 my $label = "";

 if($wrd ne ".") { $label = $wrd;}
 $label;
}
1;

sub get_color_code {
 my($color_code) = @_;
 my($color_hash_code) = "";

#These color codes are taken from Sanskrit_style.css (MT/web_interface/Sanskrit_style.css)

# The color code field may have the hash values of the colors or may indicate vibhaktis as N1 etc. 
# In the later case the values are converted to the hash code
 if ($color_code =~ /\#/) { $color_hash_code = $color_code;}
 else { 
    $color_code =~ s/@//;
    if($color_code eq "N1") { $color_hash_code = "#00BFFF";}
    elsif($color_code eq "N2") { $color_hash_code = "#93DB70";}
    elsif($color_code eq "N3") { $color_hash_code = "#40E0D0";}
    elsif($color_code eq "N4") { $color_hash_code = "#B0E2FF";}
    elsif($color_code eq "N5") { $color_hash_code = "#B4FFB4";}
    elsif($color_code eq "N6") { $color_hash_code = "#87CEEB";}
    elsif($color_code eq "N7") { $color_hash_code = "#C6E2EB";}
    elsif($color_code eq "N8") { $color_hash_code = "#6FFFC3";}
    elsif($color_code eq "NA") { $color_hash_code = "#FF99FF";}
    elsif($color_code eq "KP") { $color_hash_code = "#FF1975";}
    elsif($color_code eq "CP") { $color_hash_code = "#FFFF00";}
 }
 
$color_hash_code;
}
1;

sub get_relnm_id {
my($rel) = @_;
 my($rel_nm) = "";
 my($d_id) = 0;
 my($ans) = "";

 if ($rel =~ /([^,]+),($sent[0-9\_\।]+)/) {
   $rel_nm = $1;
   $d_id = $2;
 }

$ans = join (':',$rel_nm,$d_id);
$ans;
}
1;


 sub get_edgestyle_edge_dir {
  my($rel_nm,$rel_indx) = @_;
  my($edgestyle) = "";
  my($edgedir) = "";

  if (&niwya_relations($rel_nm)){ # niwya sambanXaH or niwya_sambanXaH1
      $edgestyle = "\"dashed\" color=\"red\"";
      $edgedir = "dir = \"both\"";
  } elsif ($rel_indx > 0) {	# If it is a relation after ';'
      $edgestyle = "\"dotted\""; 
      $edgedir = "dir = \"back\"";
  } else {
      $edgestyle = ""; 
      $edgedir = "dir = \"back\"";
  }
$ans = join (':', $edgestyle, $edgedir);
$ans;
}
1;

sub form_cluster {
   my($cluster_no, $d_id, $s_id) = @_;
   my ($cluster_found) = 0;
   my($is_cluster) = 0;
   my($j);
   
   for($j=0;$j<=$cluster_no;$j++){
      if(( $d_id ne "") && ($cluster[$j] =~ /#$d_id,/)) {
          if( ($s_id ne "") && ($cluster[$j] !~ /#$s_id,/)) {
              $cluster[$j] .= "#".$s_id.",";
              $is_cluster = 1;
          }
          $cluster_found = 1;
      }
   } 
   if($cluster_found == 0) {
      $cluster_no++;
      if ($s_id ne "") { $cluster[$cluster_no] = "#".$s_id.",";  $is_cluster = 1; } #$word_found{$s_id} = 1;
      if ($d_id ne "") { $cluster[$cluster_no] .= "#".$d_id.",";  $is_cluster = 1; } #$word_found{$d_id} = 1;
   }
$ans = join (':', $is_cluster, $cluster_no);
$ans;
}
1;

sub add_compound_components {
  my ($in_str) = @_;
  my(@f);
  my($out_str) = "";

  $in_str =~ s/\./_/g;
  @f = split(/\t/,$in_str);
  $f[$rel_fld_id] =~ s/,/:/;	# In the case of compounds, the ',' in the relation field is changed to ':' making the to index as a separate field in the out_str
  $kqw = &is_kqw($f[$morph_fld_id]);
  $out_str = join (':',$f[$index],$f[$wrd_fld_id],$f[$rel_fld_id],$kqw,$f[$color_code_fld_id]);
  $out_str;
}
1;


sub form_compound_constituency_tree {

  my ($component_indx, @compound) = @_;
# the input parameters are the total number of components and the array of components, where each row corresponds to the info of each component

  my ($i,$stack_index,$edgedir,$next,$diff,@f);
  my (@new_label) = ();

  for ($i=0;$i < $component_indx; $i++){
    @f = split(/:/,$compound[$i]);	# index, word, relation,to_index, kqw, color code
    $component{$f[0]} = $f[1];		# Global variable
   # print "i = $i comp = $compound[$i] \n";
  }

  $i = 0;
  $edgedir = "dir = \"back\"";
  $next = 1;
  @stack = ();
  $stack_index = 0;

## Handle 2 component compounds - No need to use stack. Just a binary tree.
  #if ($component_indx == 1) {
  #@f = split(/:/,$compound[$i]);
  #print "ZZZ\n";
  #&print_subtree($f[0],$f[2],$f[3],$f[4],$f[5],$intmd,$edgedir,$last);
  #$i++;
  #}

# Stack contains all the unprocessed components.
# If the component is not conncted to the next, then push it to the stack
# If the component is connected to the next, 
  # If the stack contains 
  # Check if the stack contains any entries with the same uwwarapaxa as of the current component entry
  # If yes, then pop up those entries and process, and finally proces sthe current entry
  # If not, process this entry
# 
  while ($i < $component_indx){
 # print "393 i = $i\n";
 # print "component_indx = $component_indx\n";
  for ($y=0;$y < $stack_index; $y++){
   #print "STACK" ,$stack[$y],"\n";
  }
  for ($y=0;$y < $component_indx; $y++){
    @f = split(/:/,$compound[$y]);	# index, word, relation,to_index, kqw, color code
   # print " COMP y = $y comp = $compound[$y] \n";
  }
    @f = split(/:/,$compound[$i]);	# fields: index(0), word(1), relation(2), to_index (3), kqw_or_not (4), color code (5)
    @rels = split(/;/,$f[2]);
    $diff = &get_diff($f[3], $f[0]);
    if (($diff == 1) || ($diff == 10))  {	#  if next word then diff=10; if next component then diff = 1
       $found_pUrvapaxa_indx = &myfound($f[0],$stack_index,@stack);
       $found_uwwarapaxa_indx = &myfound($f[3],$stack_index,@stack);
      # print "$f[0] $f[3]\n";
      # print "$found_pUrvapaxa_indx  $found_uwwarapaxa_indx\n";
       if ($found_pUrvapaxa_indx == -1 ) {  # pUrvapaxa not found in stack
          if (($i < $component_indx-1) && ($diff == 1)) { 
               $intmd = $f[3]."_".$next; 
          }	# get compound root node
          else {$intmd = "";}
          if ($i == $component_indx-1) { $last = 1;} else { $last = 0;}
          #print "YYY\n";
          &print_subtree($f[0],$f[2],$f[3],$f[4],$f[5],$intmd,$edgedir,$last);
       }
       if ($found_uwwarapaxa_indx == $stack_index-1) {
               $found_indx = $found_uwwarapaxa_indx;
               while (($found_indx == $stack_index-1) && ($stack_index > 0)) {
               ($pos,@f) = split(/:/, $stack[$found_indx]); #POP
	       $stack_index--;
              #print "pos = $pos component_indx = $component_indx dvandva = $dvandva_found\n";
               if (($pos < $component_indx)) { 
		    if (($f[2] !~ /द्वन्द्व/) ||  ($dvandva_found == 0)) { $next++;}
                    $intmd = $f[3]."_".$next;
		    if ($f[2] !~ /द्वन्द्व/) { $dvandva_found = 0;}
               }	
               else { $intmd = "";}
               if($pos == $component_indx-1) { $last = 1;} else { $last = 0;}
               #print " f0 = $f[0]  f2 = $f[2] \n";
               p#rint "XXX\n";
               &print_subtree($f[0],$f[2],$f[3],$f[4],$f[5],$intmd,$edgedir,$last);
               $found_indx = &myfound($f[3],$stack_index,@stack);
            }
       }
       if ($found_pUrvapaxa_indx > -1)  {
               $found_indx = $found_pUrvaapaxa_indx; 
               while (($found_indx > -1) && ($stack_index > 0)) {
               ($pos,@f) = split(/:/, $stack[$found_indx]); #POP
	       $stack_index--;
               if (($pos < $component_indx)) {# get compound root node 
		    if (($f[2] !~ /द्वन्द्व/) ||  ($dvandva_found == 0)) { $next++;}
                    $intmd = $f[3]."_".$next;
		    if ($f[2] !~ /द्वन्द्व/) { $dvandva_found = 0;}
               }	
               else { $intmd = "";}
               if($pos == $component_indx-1) { $last = 1;} else { $last = 0;}
               #print " f0 = $f[0]  f2 = $f[2] \n";
              # print "WWW\n";
               &print_subtree($f[0],$f[2],$f[3],$f[4],$f[5],$intmd,$edgedir,$last);
               $found_indx = &myfound($f[0],$stack_index,@stack);
            }
          @f = split(/:/,$compound[$i]);	# fields: index(0), word(1), relation (2), to_index (3), color code (4)
          if ($i < $component_indx - 1) { 
	      if (($f[2] !~ /द्वन्द्व/) ||  ($dvandva_found == 0)) { $next++;}
              $intmd = $f[3]."_".$next; 
	      if ($f[2] !~ /द्वन्द्व/) { $dvandva_found = 0;}
          }	# get compound root node
          else {$intmd = "";}
          if($i == $component_indx-1) { $last = 1;} else { $last = 0;}
               #print " f0 = $f[0]  f2 = $f[2] \n";
              # print "VVV\n";
          &print_subtree($f[0],$f[2],$f[3],$f[4],$f[5],$intmd,$edgedir,$last);
       }
    } else {
	 # print "stack index  = $stack_index and entry =  $stack[$stack_index-1]\n";
	 # print "compound entry  =  $compound[$i]\n";
          $stack[$stack_index] = $stack_index.":".$compound[$i];	## Push
          $stack_index++;
      }
  $i++;
 # print "ABC i = $i\n";
}
#  while ($stack_index >0) {
#            print "stack index = $stack_index\n";
#            print "component_indx = $component_indx\n";
#            if ($stack_index < $component_indx) { 
#                $intmd = $f[3]."_".$next;
#	        if ($f[2] !~ /द्वन्द्व/) { $next++;}
#            }
#            else { $intmd = "";}
#            if($stack_index == 0) { $last = 1;} else { $last = 0;}
#               print "UUU\n";
#            &print_subtree($f[0],$f[2],$f[3],$f[4],$f[5],$intmd,$edgedir,$last);
#	    $stack_index--;
#  }

}
1;


#Define new intermediate labels
sub get_intermediate_labels{
  my ($s,$d,$intmd) = @_;
      #print "s = $s d = $d intmd = $intmd\n";
       $old_label{$s} = $component{$s};
       $old_label{$d} = $component{$d};
       if($new_index{$d} != 0) { $old_index{$d} = $new_index{$d};} else {$old_index{$d} = $d;}
       if ($intmd ne "") { $new_index{$d} = $intmd;}
       if($new_label{$s} eq "") { $new_label{$s} = $old_label{$s};}
       if($new_label{$d} eq "") { $new_label{$d} = $old_label{$d};}
}
1;

#Print the constituent nodes and the root node
sub print_constituent_and_intermediate_nodes{

  my ($to_id,$samAsa_type,$from_id,$kqw,$color,$intmd,$last) = @_;

     #print "XXXX $to_id  $samAsa_type  $from_id  $kqw  $color $intmd $last dvandva = $dvandva_found\n"; 
     # $kqw corresponds to $to_id

       my($wcolor,$intmd_label);
       #Print the constituent nodes and the root node
       $wcolor = &get_color_code($color);
       if (($intmd eq "") && ($dvandva_found == 1)) { $intmd = $new_index{$from_id};}
  
       if ($last == 1) {
	   $intmd_label = $new_label{$to_id};
	   $intmd_label =~ s/\(.*\)//g;
	   $intmd_label =~ s/[<>]//g;
           $intmd_label =~ s/$sent([0-9]+)_[0-9]+/$1/;
           if($new_index{$to_id} eq "") { $new_index{$to_id} = $to_id;
              $new_dummy_index{$to_id} = $new_index{$to_id}; }
           else { $new_dummy_index{$to_id} = $new_index{$to_id}."c";}
           if ($word_found{$new_dummy_index{$to_id}} != 1) {
             &print_node_info($new_dummy_index{$to_id},$intmd_label,$wcolor,$kqw); 
             $word_found{$new_dummy_index{$to_id}} = 1;
           }
           if ($new_dummy_index{$to_id} ne $new_index{$to_id}) {
               $rel_str .= "\nNode$new_index{$to_id} -> Node$new_dummy_index{$to_id} \[ $edgedir \]";
           }
           $new_index{$to_id} = $new_dummy_index{$to_id};
         } else { 
           $intmd_label_to = $new_label{$to_id};
           $intmd_label_to =~ s/$sent([0-9]+)_[0-9]+/$1/;
           $intmd_label_from = $new_label{$from_id};
           $intmd_label_from =~ s/$sent([0-9]+)_[0-9]+/$1/;
           #print "$intmd_label_to\n";
           #print "$intmd_label_from\n";
           if ($word_found{$to_id} == 0) { 
               &print_node_info($to_id,$intmd_label_to,$wcolor,$kqw); 
               $word_found{$to_id} = 1; 
           }
           if ($word_found{$from_id} == 0) { 
               &print_node_info($from_id,$intmd_label_from,$wcolor,$kqw); 
               $word_found{$from_id} = 1; 
           }
           #print "intmd = $intmd\n";
           #print "dvandva = $dvandva_found\n";
           if ($intmd ne ""){
            $new_label{$to_id} =~  s/\-$//;
            $new_label{$from_id} =~  s/\-$//;
            $new_label{$to_id} =~  s/\(.*\)//;
            $new_label{$from_id} =~  s/\(.*\)//;
            $intmd_label = $new_label{$to_id}."-".$new_label{$from_id};
	    $intmd_label =~ s/[<>]//g;
            #print "intmd_label = $intmd_label\n";
            if($last == 0) { 
                  $intmd_label =  "<". $intmd_label.">($samAsa_type)";
            }
            $new_label{$from_id} = $intmd_label;
            $intmd_label =~ s/$sent([0-9]+)_[0-9]+/$1/;
            if (($word_found{$intmd} == 0)  || $dvandva_found == 1){ 
                &print_node_info($intmd,$intmd_label,$wcolor,$kqw); 
                $word_found{$intmd} = 1; 
            }
         }
       }
 }
1;

 #Print the relations between the root and the constituent nodes
 sub print_samAsa_relations {
     my($to_id,$rel,$from_id,$intmd,$edgedir,$last) = @_;

     # print "ZZZ $to_id $rel $from_id $intmd $edgedir $last\n";
      my($tmp_indx_to);
      my($tmp_indx_from);
      if ($new_index{$to_id} ne "") { $tmp_indx_to = $new_index{$to_id};} else { $tmp_indx_to = $to_id;}
      if ($new_index{$from_id} ne "") { $tmp_indx_from = $new_index{$from_id};} else { $tmp_indx_from = $from_id;}

      if ($intmd ne ""){
          $rel_str .= " \nNode$old_index{$from_id} -> Node$intmd \[ $edgedir \]";
          $rel_str .= "\nNode$tmp_indx_to -> Node$intmd \[ $edgedir \]";
          $rel_str .= " \nrank=same{Node$old_index{$from_id}, Node$tmp_indx_to} \nNode$tmp_indx_to -> Node$old_index{$from_id} \[style=\"invis\" dir=\"back\"\] ";
      } else {
          if ($rel =~ /द्वन्द्व/) {
              $rel_str .= "\nNode$tmp_indx_to -> Node$tmp_indx_from \[ $edgedir \]";
          } else {
              $rel_str .= "\nNode$tmp_indx_to -> Node$tmp_indx_from \[ label=\"$rel\" $edgedir \]";
          }
      }
      #print "tmp_indx_to = $tmp_indx_to from = $tmp_indx_from \n";
      #print "old index from = $old_index{$from_id} intmd = $intmd \n";
 }
1;


sub get_first_digit {
my ($in) = @_;
my($digit);
$in =~ /^$sent([^\.]+)_/;
$digit =  $1;
return $digit;
}
1;

sub get_diff {
my ($from, $to) = @_;
my($dirr);

$from_first_digit = &get_first_digit($from);
$to_first_digit = &get_first_digit($to);

if ($from_first_digit != $to_first_digit) { 
    $diff = 10; # Next word
} else {
   $from =~ s/.*_//g;
   $to =~ s/.*_//g;
   $diff = $from-$to; # if $diff = 1, next component
}

$diff
}
1;


sub myfound { 
 my ($str,$arr_size,@arr) = @_;

 my($i, $pos);
 $pos = -1;
 for ($i=$arr_size-1; $i >= 0 && ($pos == -1); $i--) {
      if ($arr[$i] =~ /:$str:/) {
           $pos = $i;
      }
 }
 $pos;
}
1;

sub print_subtree {
  my ($a,$b,$c,$d,$e,$intmd,$edgedir,$last) = @_;
  #print "$a $b $c $d $e $intmd $edgedir $last \n";

  if ($b =~ /द्वन्द्व/ ) {
     if ($dvandva_found == 1) {
         $intmd = "";
     } else {
         $dvandva_found = 1;
         #&get_intermediate_labels($a,$c,$intmd);
     }
  } else {
         $dvandva_found = 0;
         #&get_intermediate_labels($a,$c,$intmd);
  }
	#print "intmd = $intmd\n";
         &get_intermediate_labels($a,$c,$intmd);
         &print_constituent_and_intermediate_nodes($a,$b,$c,$d,$e,$intmd,$last);
    # &get_intermediate_labels($a,$c,$intmd);
    # &print_constituent_and_intermediate_nodes($a,$b,$c,$d,$e,$intmd,$last);
  if ($last == 0) {
     if (($a ne "") && ($non_cluster !~ /#$a,/)) {  # If the relation is empty, as in the case of verbs
          $non_cluster .= "#".$a.",";
     } 
     if (($c ne "") && ($non_cluster !~ /#$c,/)) {  # If the relation is empty, as in the case of verbs
          $non_cluster .= "#".$c.",";
     } 
   } 
   my $first = 1;
   while ($c =~ /;/) {
          $c =~ /^([^;]+);(.*)/;
          $c = $1;
          $rem = $2;
          if ($first == 0) { $edgedir .= " style=\"dotted\"";}
	 # print "AAA\n";
          &print_samAsa_relations($a,$b,$c,$intmd,$edgedir,$last);
          $first = 0;
          $rem =~ /^([^,]+),(.*)/;
          $b = $1;
          $c = $2;
   }
   if ($first == 0) { $edgedir .= " style=\"dotted\"";} 
	 # print "BBB\n";
   &print_samAsa_relations($a,$b,$c,$intmd,$edgedir,$last);
}
1;

#process_compound_entry stores all the components of a compound marked with '-' in an array @comp, component_indx is the index of the next component(uwwarapaxa) that is yet to be added, and $indx is the index of the row corresponding to the uwwarapaxa, that needs to be processed.
 sub process_compound_entry {
    my($indx) = @_; 

    my $component_indx = 0;
    my(@comp);
    chomp($rows[$indx]);
    $rows[$indx] =~ s///g;
    my @flds = split(/\t/,$rows[$indx]);
    while ($flds[$wrd_fld_id] =~ /\-/) {
              $comp[$component_indx] = &add_compound_components($rows[$indx]);
            $component_indx++;
            $indx++;
            chomp($rows[$indx]);
            $rows[$indx] =~ s///g;
            @flds = split(/\t/,$rows[$indx]);
    }
    my $ans = join('%',$indx,$component_indx,@comp);
    $ans;
 }
1;

sub add_relations{
   my($str) = @_;
   my $i = 1; 		#The count starts with 1; since the 1st line corresponds to the heading and hence it is to be ignored.
   my $index = 0;
   my($z,$s_id, $d_id);

   while($i <= $#rows) {
     @flds = split(/\t/,$rows[$i]);	# split the input into fields
     $s_id = $flds[$index]; 	
        if (($s_id !~ /\./) && ($flds[$wrd_fld_id] !~ /\-/)) {
        @rels = split(/;/,$flds[$rel_fld_id]);
        for ($z=0;$z<=$#rels;$z++) {
             if ($rels[$z] =~ /,/) {
                ($rel_nm,$d_id) = split(/:/,&get_relnm_id ($rels[$z]));
                ($edgestyle,$edgedir) = split(/:/, &get_edgestyle_edge_dir($rel_nm,$z));
                if($edgestyle ne "") { $s_str = "style=$edgestyle";} else {$s_str = "";}
                if (($d_id ne "") && ($rel_nm !~ /abhihita/) && ($rel_nm !~ /अभिहित/)){
                    if($new_index{$d_id} ne "") { $d_id = $new_index{$d_id};} 
                    if($new_index{$s_id} ne "") { $s_id = $new_index{$s_id};} 
                    $str .= "\nNode$s_id -> Node$d_id \[ $s_str label=\"".$rel_nm."\"  $edgedir \]";
                }
                $rank .= &mark_niwya_sambanXa($rel_nm,$s_id,$d_id);
              }
        }
     }
     $i++;
   }
$str;
}
1;

 sub mark_niwya_sambanXa{
  my($rel_nm,$s_id,$d_id) = @_;
  my $rank = "";
  my ($n1,$n2);
  if (&niwya_relations($rel_nm)){ # niwya sambanXaH or niwya_sambanXaH1
      $n1 = "Node".$s_id;
      $n2 = "Node".$d_id;
      $rank = "{rank = same; $n1; $n2;}\n"; 
  }
  $rank;
}
1;

sub add_to_non_cluster{
  my ($nc,$s,$d) = @_;
    if (($s ne "") && ($nc !~ /#$s,/)) {
         $nc .= "#".$s.",";
    }
    if (($d ne "") && ($nc !~ /#$d,/)) {
         $nc .= "#".$d.",";
    }
  $nc;
}
1;

sub classify_cluster_non_cluster{
  my ($rel_nm,$cluster_no,$non_cluster,$s_id,$d_id) = @_;
  my($is_cluster);

  # classify the nodes into cluster / non-cluster
    $is_cluster = 0;
    if (&cluster_relations($rel_nm)) {
       ($is_cluster,$cluster_no) = split(/:/, &form_cluster($cluster_no,$d_id,$s_id));
    }
    if ($is_cluster == 0) {
        $non_cluster = &add_to_non_cluster($non_cluster,$s_id,$d_id);
    }
$ans = join (':',$cluster_no,$non_cluster);
}
1;

sub is_kqw {
  my ($m) = @_;

 if ($m =~ /\(.*\)/) { return 1;} else {return 0;}
}
1;
