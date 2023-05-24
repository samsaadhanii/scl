#!/usr/bin/env perl

#  Copyright (C) 2023-2023 Amba Kulkarni (ambapradeep@gmail.com)
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

$parse = 1;

#These color codes are taken from Sanskrit_style.css (MT/web_interface/Sanskrit_style.css)

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
$color{"CP"} = "#FFFF00";

$/ = "\n";
$cluster_no = 0;
$rel_str = "";
$solnfound = 0;

$hdr = "digraph G\{\nrankdir=BT;\n compound=true;\n bgcolor=\"lemonchiffon1\";\n";
$dir = "back";
$parse = 1;

$dotfl_nm = "$parse.dot"; 
open TMP1, ">${path}/${dotfl_nm}" || die "Can't open ${path}/${dotfl_nm} for writing";
#open TMP1, ">/Users/ambakulkarni/a.dot";
 print TMP1 $hdr;

@in = <STDIN>;

	for ($i=1;$i<$#in;$i++) {  #The count starts with 1; since the 1st line that corresponds to the heading is to be ignored.
          @flds = split(/\t/,$in[$i]);
         # if ($flds[0] =~ /^([0-9]+)[\.\।]([2-9])/) {
         #    $label .= $flds[1];
         # } else {$label = $flds[1];}
         $label = $flds[1];
          $flds[0] =~ /^([0-9]+)[\.\।]/;
          $word{$flds[0]} = $label."(".$flds[0].")";
          $tmp = $flds[8];
          $tmp =~ s/@//;
          $wcolor{$flds[0]} = $color{$tmp}; 
         
         #if ($flds[1] !~ /-$/) {  #If not compound pUrvapaxa, write the node
             @rels = split(/;/,$flds[6]);
             for ($z=0;$z<=$#rels;$z++) {
             if($rels[$z] =~ /([^,]+),([0-9\.\।]+)/) {
                $rel_nm = $1;
                $d_id = $2;
                $s_id = $flds[0];
                #$s_id =~ s/^([0-9]+).*/$1/; # Remove the component id
                #$d_id =~ s/^([0-9]+).*/$1/; # Remove the component id
                $is_cluster = 0;
                if (&niwya_relations($rel_nm)){ # niwya sambanXaH or niwya_sambanXaH1
                      $style = "dashed color=\"red\"";
                      $rank .= "{rank = same; Node$s_id; Node$d_id;}\n"; 
                      $dir = "both";
                } elsif ($z > 0) {
                      $style = "dotted"; 
                      $dir = "back";
                } else {
                      $style = ""; 
                      $dir = "back";
                }
                if (&cluster_relations($rel_nm)) {
	            $cluster_found = 0;
                    for($j=0;$j<=$cluster_no;$j++){
                       if($cluster[$j] =~ /#$d_id,/) {
                          if($cluster[$j] !~ /#$s_id,/) {
                             $cluster[$j] .= "#".$s_id.",";
                             $is_cluster = 1;
                             $word_found{$s_id} = 1;
                          }
                          $cluster_found = 1;
                       }
                    } 
                    if($cluster_found == 0) {
                       $cluster_no++;
                       $cluster[$cluster_no] = "#".$s_id.",";
                       $cluster[$cluster_no] .= "#".$d_id.",";
                       $is_cluster = 1;
                       $word_found{$s_id} = 1;
                       $word_found{$d_id} = 1;
                    }
               }
               if ($is_cluster == 0) {
                 if($non_cluster !~ /#$s_id,/) {
                    $non_cluster .= "#".$s_id.",";
                    $word_found{$s_id} = 1;
                 }
                 if($non_cluster !~ /#$d_id,/) {
                    $non_cluster .= "#".$d_id.",";
                    $word_found{$d_id} = 1;
                 }
               }
            
             if($style ne "") { $s_str = "style=$style";} else {$s_str = "";}

             if (($rel_nm !~ /abhihita/) && ($rel_nm !~ /अभिहित/)){
                $s_id =~ s/\./_/;
                $d_id =~ s/\./_/;
	        $rel_str .= "\nNode$s_id -> Node$d_id \[ $s_str label=\"".$rel_nm."\"  dir=\"$dir\" \]";
             }
            }
           }
	   $solnfound = 1;
        #}
      }
      if ($solnfound) {
         if ($rel_str ne "") {
             &draw_clusters($non_cluster,$cluster_no,$rel_str,@cluster);
             print TMP1 $rank;
             print TMP1 "/* Start of Relations section */\n";
             &writeNclose($rel_str);
             $filehandle_status = "close";
             $rel_str = "";
             system("$GraphvizDot -Tsvg -o${path}/$parse.svg ${path}/$parse.dot");

         } elsif($filehandle_status eq "open"){
             &print_no_solution();
             system("$GraphvizDot -Tsvg -o${path}/$parse.svg ${path}/$parse.dot");
         }
      }
 

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

 ## Add all the nodes that were not printed earlier.
    for ($z=1;$z<=$tot_words;$z++){
            @flds = split(/\t/,$in[$z]);
            #if ($flds[0] =~ /^([0-9]+)[\.\।]([2-9])/) {
            # $label .=  $flds[1];
            #} else {$label = $flds[1];}
            $label = $flds[1];
            $flds[0] =~ /^([0-9]+)[\.\।]/;
            $word{$flds[0]} = $label."(".$flds[0].")";
            $tmp = $flds[8];
            $tmp =~ s/@//;
            $wcolor{$flds[0]} = $color{$tmp}; 
            if (($flds[1] =~ /^-/) && ($word_found{$flds[0]} != 1)){
                 &print_node_info($z,$word{$flds[0]},$wcolor{$flds[0]});
            }
    }
         @rel_str = split(/\n/,$rel_str);
         $rel_str = "";
         foreach $r (@rel_str) {
	      $r =~ /Node([0-9]+) \-> Node([0-9]+).*label="[^"]+"/;
              $from = $1;
              $to = $2;
              for($z=0;$z<=$cluster_no;$z++){
                if(($cluster[$z] =~ /#$from;/) && ($cluster[$z] !~ /#$to;/)){
                    $r =~ s/]/ ltail=cluster_$z]/;
                }
              }
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
1;

sub print_all_nodes_info{
 my($nodes) = @_;
 my(@nodes,$node,$node_id,$indx_id);

#Global variables: %word, %wcolor
   $nodes =~ s/#//g;
   @nodes = split(/,/,$nodes);
   foreach $node (@nodes) {
      &print_node_info($node,$word{$node},$wcolor{$node});
   }
}
1;

sub print_node_info{
    my($node,$word,$color) = @_;
    $node =~ s/\./_/;
    print TMP1 "Node$node [style=filled, color=\"$color\" ";
    if($color eq "#FFAEB9") { print TMP1 "shape=rectangle ";}
    print TMP1 "label = \"$word\"]\n";
}
1;

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
          && ($rel !~ /क्रियाविशे/) )
     || ($rel =~ /samuccitaḥ/) 
     || ($rel =~ /anyataraḥ/)
     || ($rel =~ /anyatara\.h/) 
     || (   ($rel =~ /viśeṣaṇam/) 
          && ($rel !~ /kriyāvi/))) { 
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
