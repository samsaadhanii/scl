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


$GraphvizDot = $ARGV[0];
$path = $ARGV[1]; # path for temporary files

#### Initialisation #######
$/ = "\n";	# \n is the input delimitor
$cluster_no = 0;
$rel_str = "";
$solnfound = 0;

$index = 0;
$wrd_fld_id = 1; # Counting starts from 0
$rel_fld_id = 6; # Counting starts from 0
$color_code_fld_id = 8; # Counting starts from 0

$hdr = "digraph G\{\nrankdir=BT;\n compound=true;\n bgcolor=\"lemonchiffon1\";\n";
$edgedir = "back";	# Default edge direction
$parse = 1;

$dotfl_nm = "$parse.dot"; 

# Output is stored in a '.dot' file
open TMP1, ">${path}/${dotfl_nm}" || die "Can't open ${path}/${dotfl_nm} for writing";
$filehandle_status = "open";
print TMP1 $hdr;

@in = <STDIN>;	# Read the table of analysis

######### Main routine begins ############
      $i = 1; 		#The count starts with 1; since the 1st line corresponds to the heading and hence it is to be ignored.

      while($i <= $#in) {
	chomp($in[$i]);	# chop the newline
	$in[$i] =~ s/\./_/g;	# Dot does not allow '.'s in the Node labels.
        @flds = split(/\t/,$in[$i]);	# split the input into fields
        #print "flds[1] = $flds[1]\n";
        if ($flds[1] ne "_") {
        #$flds[$index] =~ s/\./_/g;	# Dot does not allow '.'s in the Node labels.
	$label{$flds[$index]} = &get_label($flds[$wrd_fld_id],$flds[$index]);
        if ($label{$flds[$index]} ne "") {$s_id = $flds[$index];} else {$s_id = "";}
        if ($s_id ne "") {	#define source word index
	  $wcolor{$flds[$index]} = &get_color_code($flds[$color_code_fld_id]); #get color code for the node
       
          $compound_found = 0;
          $component_indx = 1;
          while ($flds[$wrd_fld_id] =~ /\-/) {
            $compound[$component_indx] = &add_compound_components($in[$i]);
            $i++;
            $component_indx++;
            @flds = split(/\t/,$in[$i]);
            $compound_found = 1;
          }
          if ($compound_found) {
            $compound[$component_indx] = &add_compound_components($in[$i]);
            &form_compound_constituency_tree($component_indx,@compound);
          } else {
            @rels = split(/;/,$flds[$rel_fld_id]);
            for ($z=0;$z<=$#rels;$z++) {
              if ($rels[$z] =~ /,/) {
                ($rel_nm,$d_id) = split(/:/,&get_relnm_id ($rels[$z]));
                 #print "d_id = $d_id\n";
                 #print "New d_id = $new_index{$d_id}\n";
                 #print "rel_nm = $rel_nm\n";
                 #$d_id =~ s/\./_/g;
                ($edgestyle,$edgedir) = split(/:/, &get_edgestyle_edge_dir($rel_nm,$z));
              }

              if (&niwya_relations($rel_nm)){ # niwya sambanXaH or niwya_sambanXaH1
		$n1 = "Node".$s_id;
		$n2 = "Node".$d_id;
                $rank .= "{rank = same; $n1; $n2;}\n"; 
              }

	# classify the nodes into cluster / non-cluster
              $is_cluster = 0;
              if (&cluster_relations($rel_nm)) {
                  ($is_cluster,$cluster_no) = split(/:/, &form_cluster($cluster_no,$d_id,$s_id));
              }
              if ($is_cluster == 0) {
                 if( ($s_id ne "") && ($non_cluster !~ /#$s_id,/)) {
                    $non_cluster .= "#".$s_id.",";
                    #$word_found{$s_id} = 1;
                 }
                 if( ($d_id ne "") && ($non_cluster !~ /#$d_id,/)) {
                    $non_cluster .= "#".$d_id.",";
                    #$word_found{$d_id} = 1;
                 }
              }
            
              if($edgestyle ne "") { $s_str = "style=$edgestyle";} else {$s_str = "";}

                if (($d_id ne "") && ($rel_nm !~ /abhihita/) && ($rel_nm !~ /अभिहित/)){
                if($new_index{$d_id} ne "") { $d_id = $new_index{$d_id};} 
                #print "d_id = $d_id\n";
                #print "new_index = $new_index{$d_id}\n";
	        $rel_str .= "\nNode$s_id -> Node$d_id \[ $s_str label=\"".$rel_nm."\"  dir=\"$edgedir\" \]";
	    #print "REL2 = $rel_str\n";
              }
            }
	 $solnfound = 1;
         }
       }
       }
       $i++;
    }

      if ($solnfound) {
         if ($rel_str ne "") {
             &draw_clusters($non_cluster,$cluster_no,$rel_str,@cluster);
             print TMP1 $rank;
             print TMP1 "/* Start of Relations section */\n";
             &writeNclose($rel_str);
             $filehandle_status = "close";
             $rel_str = "";

         } elsif($filehandle_status eq "open"){
             &print_no_solution();
         }
      }
 
#########End of Main routine ############


############  Sub routines start ############
sub draw_clusters{
my($non_cluster,$cluster_no,$rel_str,@cluster) = @_;

my($i,@rel_str,$node,$nodes,@nodes,$node_id,$indx_id,$z,$r,$from,$to);

#Global variables: %word, %word_ana, $wcolor, @tot_words,

    for($i=1; $i <= $cluster_no;$i++){

      print TMP1 "\nsubgraph cluster_",$i,"{\n";

      $nodes = $cluster[$i];
      &print_all_nodes_info($nodes);
      print TMP1 "\n}\n";
    }

    $nodes = $non_cluster;
    &print_all_nodes_info($nodes);

    @rel_str = split(/\n/,$rel_str);
    $rel_str = "";
    foreach $r (@rel_str) {
      $r =~ /Node([0-9_]+) \-> Node([0-9_]+).*label="[^"]+"/;
      $from = $1;
      $to = $2;
      for($z=0;$z<=$cluster_no;$z++){
         if(($cluster[$z] =~ /#$from;/) && ($cluster[$z] !~ /#$to;/)){
             $r =~ s/]/ ltail=cluster_$z]/;
         }
      }
      $rel_str .= "\n".$r;
	    #print "REL3 = $rel_str\n";
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
 my(@nodes,$node,$node_id,$indx_id);

#Global variables: %label, %wcolor
   $nodes =~ s/#//g;
   @nodes = split(/,/,$nodes);
   foreach $node (@nodes) {
      #print $node, " ", $word_found{$node}, "\n";
      if ($word_found{$node} != 1) {
         &print_node_info($node,$label{$node},$wcolor{$node});
	 #print "$node generated\n";
      }
   }
}
1;

sub print_node_info{
    my($node,$word,$color) = @_;
    #$node =~ s/\./_/g;
    #print "$node generated\n";
    print TMP1 "Node$node [style=filled, color=\"$color\" ";
    print TMP1 "label = \"$word\"]\n";
}

sub writeNclose{
   my($rel_str) = @_;
   print TMP1 $rel_str,"\n}\n";
	    #print "REL4 = $rel_str\n";
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

 sub  get_label{
 my($wrd,$indx) = @_;
 my $label = "";

 $indx =~ s/_.*//;
 if($wrd ne ".") { $label = $wrd."(".$indx.")";}
 $label;
}
1;

sub get_color_code {
 my($color_code) = @_;
 my($color_hash_code) = "";

#These color codes are taken from Sanskrit_style.css (MT/web_interface/Sanskrit_style.css)

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
 
$color_hash_code;
}
1;

sub get_relnm_id {
my($rel) = @_;
 my($rel_nm) = "";
 my($d_id) = 0;
 my($ans) = "";

 if ($rel =~ /([^,]+),([0-9\_\।]+)/) {
   $rel_nm = $1;
   $d_id = $2;
 }

# $d_id =~ s/\./_/g;
$ans = join (':',$rel_nm,$d_id);
$ans;
}
1;


 sub get_edgestyle_edge_dir {
  my($rel_nm,$rel_indx) = @_;
  my($edgestyle) = "";
  my($edgedir) = "";

  if (&niwya_relations($rel_nm)){ # niwya sambanXaH or niwya_sambanXaH1
      $edgestyle = "dashed color=\"red\"";
      $edgedir = "both";
  } elsif ($rel_indx > 0) {	# If it is a relation after ';'
      $edgestyle = "dotted"; 
      $edgedir = "back";
  } else {
      $edgestyle = ""; 
      $edgedir = "back";
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
              #$word_found{$s_id} = 1;
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
  $f[$rel_fld_id] =~ s/,/:/;
  $out_str = join (':',$f[$index],$f[$wrd_fld_id],$f[$rel_fld_id],$f[$color_code_fld_id]);
  $out_str;
}
1;


sub form_compound_constituency_tree {

  my ($component_indx, @compound) = @_;

  my ($i,$stack_index,$edgedir);
  my ($i,$next,$diff,@f);
  my (@new_label) = ();

  for ($i=1;$i <= $component_indx; $i++){
    @f = split(/:/,$compound[$i]);	# index, word, relation, to_index, color code
    $component{$f[0]} = $f[1];
  }

  #print TMP1 "\nsubgraph cluster_",$f[0],"{\n";  

  $i = 1;
  $edgedir = "back";
  $next = 1;
  @stack = ();
  $stack_index = 0;

  while ($i <= $component_indx){
    @f = split(/:/,$compound[$i]);	# fields: index(0), word(1), relation (2), to_index (3), color code (4)
    #print "entry = $compound[$i]\n";
    $diff = &get_diff($f[3], $f[0]);
    #print "diff = $diff\n";
    if (($diff == 1) || ($diff == 10))  {	# The diff should be equal to .1, but due to floating point representation, it is not exactly 0.1
       $srch_entry = $f[0];
       $found_indx = &myfound($srch_entry,$stack_index,@stack);
       #print "pUrvapada in Stack = $found_indx\n";
       if ($found_indx == -1 ) {  # pUrvapaxa not found in stack
       #print "pUrvapada Not Found in Stack\n";
          if ($i < $component_indx) { $intmd = $f[3]."_".$next; $next++;}	# get compound root node
          else {$intmd = "";}
        #print "intmd1 = $f[0] $intmd $f[3]\n";
          if($i == $component_indx) { $last = 1;} else { $last = 0;}
          &print_subtree($f[0],$f[2],$f[3],$f[4],$intmd,$edgedir,$last);
       } else {
            while (($found_indx > -1) && ($stack_index > 0)) {
               ($pos,@f) = split(/:/, $stack[$found_indx]); #POP
               #print "$srch_entry found at $pos # $found_indx\n";
	       $stack_index--;
               if ($pos < $component_indx) { $intmd = $f[3]."_".$next;$next++;}	# get compound root node
               else { $intmd = "";}
               #print " stack_index = $stack_index  found_indx = $found_indx intmd2 = $intmd\n";
               if($pos == $component_indx) { $last = 1;} else { $last = 0;}
               #print "$f[0],  $f[3],  $new_index{$f[3]}, $intmd\n";
               #print "$f[3] = $new_label{$f[3]}  $new_index{$f[3]} = $new_label{$new_index{$f[3]}}  $intmd = $label{$intmd}\n";
               &print_subtree($f[0],$f[2],$f[3],$f[4],$intmd,$edgedir,$last);
               $found_indx = &myfound($srch_entry,$stack_index,@stack);
            }
          @f = split(/:/,$compound[$i]);	# fields: index(0), word(1), relation (2), to_index (3), color code (4)
          if ($i < $component_indx) { $intmd = $f[3]."_".$next; $next++;}	# get compound root node
          else {$intmd = "";}
        #print "intmd3 = $f[0] $intmd $f[3]\n";
          if($i == $component_indx) { $last = 1;} else { $last = 0;}
          &print_subtree($f[0],$f[2],$f[3],$f[4],$intmd,$edgedir,$last);
       } 
    } else {
          #print "entry pushed to stack\n";
          $stack[$stack_index] = $i.":".$compound[$i];	## Push
          $stack_index++;
        #print "Stack index = $stack_index\n";
      }
  $i++;
  #print "i = $i\n";
}
  while ($stack_index >0) {
            if ($stack_index < $component_indx) { $intmd = $f[3]."_".$next;$next++;}	# get compound root node
            else { $intmd = "";}
            if($stack_index == 0) { $last = 1;} else { $last = 0;}
            &print_subtree($f[0],$f[2],$f[3],$f[4],$intmd,$edgedir,$last);
	    $stack_index--;
  }

  #print TMP1 "}\n";
}
1;


#Define new intermediate labels
sub get_intermediate_labels{
  my ($s,$d,$intmd) = @_;
       if ($intmd ne "" ) {
           if($new_index{$d} != 0) { $old_index{$d} = $new_index{$d};} else {$old_index{$d} = $d;}
           $new_index{$d} = $intmd;
	   #print "d = $d new_index = $new_index{$d}\n";
           $old_label{$s} = $component{$s};
           $old_label{$d} = $component{$d};
           if($new_label{$s} eq "") { $new_label{$s} = $old_label{$s};}
           if($new_label{$d} eq "") { $new_label{$d} = $old_label{$d};}
           #print " $s --> $new_label{$s}\n";
           #print " $d --> $new_label{$d}\n";
       }
}
1;

#Print the constituent nodes and the root node
sub print_constituent_and_intermediate_nodes{

  my ($to_id,$samAsa_type,$from_id,$color,$intmd,$last) = @_;

       my($wcolor,$intmd_label);
    #Print the constituent nodes and the root node
       $wcolor = &get_color_code($color);
  
#print "YYY $to_id $samAsa_type $from_id $intmd last=$last\n";
       if ($last == 1) {
	   $intmd_label = $new_label{$to_id};
	   $intmd_label =~ s/\([^)]+\)//g;
	   $intmd_label =~ s/[<>]//g;
	   $intmd_label =~ s/$/\($to_id\)/g;
           $intmd_label =~ s/\(([0-9]+)_[0-9]+\)/\($1\)/;
           $new_dummy_index{$to_id} = $new_index{$to_id}."c";
           #print "NDI = $new_dummy_index{$to_id}\n";
           if ($word_found{$new_dummy_index{$to_id}} != 1) {
             &print_node_info($new_dummy_index{$to_id},$intmd_label,$wcolor); 
	     #print "$new_dummy_index{$to_id} generated\n";
             $word_found{$new_dummy_index{$to_id}} = 1;
           }
           $rel_str .= "\nNode$new_index{$to_id} -> Node$new_dummy_index{$to_id} \[ dir=\"$edgedir\" \]";
           $new_index{$to_id} = $new_dummy_index{$to_id};
         } else { 
           $intmd_label_to = $new_label{$to_id};
           $intmd_label_to =~ s/\(([0-9]+)_[0-9]+\)/\($1\)/;
           $intmd_label_from = $new_label{$from_id};
           $intmd_label_from =~ s/\(([0-9]+)_[0-9]+\)/\($1\)/;
           if ($word_found{$to_id} == 0) { 
               &print_node_info($to_id,$intmd_label_to,$wcolor); 
               $word_found{$to_id} = 1; 
               #print "$to_id generated\n";
           }
           if ($word_found{$from_id} == 0) { 
               &print_node_info($from_id,$intmd_label_from,$wcolor); 
               $word_found{$from_id} = 1; 
               #print "$from_id generated\n";
           }
           if($intmd ne "") {
            $intmd_label = $new_label{$to_id}."-".$new_label{$from_id};
            if($last == 0) { $intmd_label =  "<". $intmd_label.">($samAsa_type)";} 
            $new_label{$from_id} = $intmd_label;
            $intmd_label =~ s/\(([0-9]+)_[0-9]+\)/\($1\)/;
            if ($word_found{$intmd} == 0) { 
                &print_node_info($intmd,$intmd_label,$wcolor); 
                $word_found{$intmd} = 1; 
                #print "$intmd geneated\n";
            }
         }
       }
 }
1;

 #Print the relations between the root and the constituent nodes
 sub print_samAsa_relations {
     my($to_id,$rel,$from_id,$intmd,$edgedir,$last) = @_;

      my($tmp_indx_to);
      my($tmp_indx_from);
      if ($new_index{$to_id} ne "") { $tmp_indx_to = $new_index{$to_id};} else { $tmp_indx_to = $to_id;}
      if ($new_index{$from_id} ne "") { $tmp_indx_from = $new_index{$from_id};} else { $tmp_indx_from = $from_id;}

      #print "ZZZ $tmp_indx_from $tmp_indx_to $intmd\n";
      if ($intmd ne ""){
          $rel_str .= " \nNode$old_index{$from_id} -> Node$intmd \[ dir=\"$edgedir\" \]";
	    #print "REL5 = $rel_str\n";
          $rel_str .= "\nNode$tmp_indx_to -> Node$intmd \[ dir=\"$edgedir\" \]";
          $rel_str .= " \nrank=same{Node$old_index{$from_id}, Node$tmp_indx_to} \nNode$tmp_indx_to -> Node$old_index{$from_id} \[style=\"invis\" dir=\"back\"\] ";
	    #print "REL6 = $rel_str\n";
      } else {
          $rel_str .= "\nNode$tmp_indx_to -> Node$tmp_indx_from \[ label = \"$rel\" dir=\"$edgedir\" \]";
	    #print "REL7 = $rel_str\n";
      }
 }
1;


sub get_diff {
my ($from, $to) = @_;
my($dirr);

$from =~ /^([^\.]+)_/;
$from_first_digit = $1;
$to =~ /^([^\.]+)_/;
$to_first_digit = $1;
if ($from_first_digit != $to_first_digit) { 
    $diff = 10; # Next word
}
else {
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
 #print "arr_size = $arr_size\n";
 $pos = -1;
 for ($i=$arr_size-1; $i >= 0 && ($pos == -1); $i--) {
      #print "arr = $arr[$i]\n";
      #print "str = $str\n";
      if ($arr[$i] =~ /:$str:/) {
           $pos = $i;
      }
 }
 $pos;
}
1;

sub print_subtree {
  my ($a,$b,$c,$d,$intmd,$edgedir,$last) = @_;

  &get_intermediate_labels($a,$c,$intmd);
  &print_constituent_and_intermediate_nodes($a,$b,$c,$d,$intmd,$last);
  &print_samAsa_relations($a,$b,$c,$intmd,$edgedir,$last);
}
1;
