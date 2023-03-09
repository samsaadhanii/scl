#!/usr/bin/env perl

#  Copyright (C) 2010-2023 Amba Kulkarni (ambapradeep@gmail.com)
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


$SCLINSTALLDIR = $ARGV[0];
$GraphvizDot = $ARGV[1];
$path = $ARGV[2]; # path for temporary files

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

$hdr = "digraph G\{\nrankdir=BT;\n compound=true;\n bgcolor=\"lemonchiffon1\";";
$dir = "back";

$dotfl_nm = "$parse.dot"; 
open TMP1, ">${path}/${dotfl_nm}" || die "Can't open ${path}/${dotfl_nm} for writing";

@in = <STDIN>;

         &print_no_solution();

	 
         if($in =~ /^([0-9]+),([0-9]+),([0-9]+),([0-9]+),([0-9]+)/){
            $is_cluster = 0;
            $s_w_no = $1;
            $s_w_a_no = $2;
            $rel_nm = $3;
            $d_w_no = $4;
            $d_w_a_no = $5;
	  if($rel_nm == 1) {
              my $tmp = $d_w_no.".".$d_w_a_no;
              my $tmp1 = $s_w_no.".".$s_w_a_no;
              $word{$tmp} .= "_".$word{$tmp1};
              $word_used{$s_w_no} = 1;
           } else {
            if (($rel_nm == 101) || ($rel_nm == 102) || ($rel_nm == 74)){ # niwya sambanXaH or samAnakAlaH due to yaxA/waxA
               $style = "dashed color=\"red\"";
               $rank .= "{rank = same; Node$s_w_no; Node$d_w_no;}\n"; 
               $dir = "both";
            } elsif(($rel_nm > 100) && ($rel_nm < 200)) {
              $style = "dotted";
            } else {
              $style = ""; 
              $dir = "back";
            }
            $k_rel_nm = $kAraka_name{$rel_nm};
            if (&cluster_relations($k_rel_nm) || $rel_nm == 0) {
	      $cluster_found = 0;
              for($j=0;$j<=$cluster_no;$j++){
                 if($cluster[$j] =~ /#$d_w_no;$d_w_a_no,/) {
                    if($cluster[$j] !~ /#$s_w_no;$s_w_a_no,/) {
                       $cluster[$j] .= "#".$s_w_no.";".$s_w_a_no.",";
                       $is_cluster = 1;
                    }
                    $cluster_found = 1;
                 }
              } 
                 if($cluster_found == 0) {
                    $cluster_no++;
                    $cluster[$cluster_no] = "#".$s_w_no.";".$s_w_a_no.",";
                    $cluster[$cluster_no] .= "#".$d_w_no.";".$d_w_a_no.",";
                    $is_cluster = 1;
                 }
           } 
           if ($is_cluster == 0) {
                 if($non_cluster !~ /#$s_w_no;$s_w_a_no,/) {
                    $non_cluster .= "#".$s_w_no.";".$s_w_a_no.",";
                 }
                 if($non_cluster !~ /#$d_w_no;$d_w_a_no,/) {
                    $non_cluster .= "#".$d_w_no.";".$d_w_a_no.",";
                 }
           }
            
           if($style ne "") { $s_str = "style=$style";} else {$s_str = "";}
	   $rel_str .= "\nNode$s_w_no -> Node$d_w_no \[ $s_str label=\"".$k_rel_nm."\"  dir=\"$dir\" \]";
         }
  } else { $solnfound = 1;}
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
 

sub get_color{
  my($ana) = @_;

  my ($color);
  if($ana =~ /^([^<]+).*<(विभक्तिः|vibhaktiḥ|vibhakti\.h):([1-8])>/){
     $color = $color{"N".$3};
  } elsif($ana =~ /^([^<]+).*<(कृत्_प्रत्ययः|kṛt_pratyayaḥ|k\.rt_pratyaya\.h)/){
     $color = $color{"NA"};
  } elsif($ana =~ /^([^<]+).*<(लकारः|lakāraḥ|lakaara\.h):/){
     $color = $color{"KP"};
  }
$color;
}
1;

#open(IN, "<$file") || die "Can't open $file for reading";
#while($in = <IN>){
#      @in = split(/\n/,$in);
#      foreach $in (@in) {
#          @flds = split(/\t/,$in);
#          if(($flds[0] =~ /^([0-9]+)।([0-9]+)/) || ( $flds[0] =~ /^([0-9]+).([0-9]+)/)){
#           $s_no = $1; 
#           $pos = $2; 
#           $w_no = $pos-1;  #index starts with 0
#           $indx = $s_no.".".$w_no;
#           $word = $flds[2];
#           $tmp = $flds[7];
#           if($tmp =~ /\-/) {
#              $tmp =~ s/स\-पू\-प/स_पू_प/g;
#              $tmp =~ s/sa\-puu\-pa/sa_puu_pa/g;
#              $tmp =~ s/<वर्गः:स\-उ\-प\-[^>]+>//g;
#              $tmp =~ s/<vargaḥ:sa\-u\-pa\-[^>]+>//g;
#              $tmp =~ s/^\///;
#           }
#           if( $tmp =~ /^([^>]+)\-/) { 
#               $samAsa_pUrvapaxa = $1;
#               $tmp =~ s/^([^>]+)\-//;
#           } else { $samAsa_pUrvapaxa = "";}
#           @ana = split(/\//,$tmp);
#           for ($i=0;$i <= $#ana; $i++) {
#                $mindx = $indx.".".$i;
#                if($samAsa_pUrvapaxa) { 
#                  $ana[$i] = $samAsa_pUrvapaxa."-".$ana[$i];
#                }
#                $mana = &modify_mo($ana[$i]);
#                $mana =~ s/<(level|लेवेल्):[0-4]>//g;
#                $mana =~ s/<(kqw_prawyayaH|कृत्_प्रत्ययः):([^>]+)>/ $2/g;
#	        $mana =~ s/ /{/;
#	        $mana =~ s/$/}/;
#                $word{$mindx} = $word."($pos)";
#                $word_ana{$mindx} = $mana;
#                $wcolor{$mindx} = &get_color($ana[$i]);
#           }
#           if($tot_words[$s_no] < $w_no) { $tot_words[$s_no] = $w_no;}
#          }
#      }
#}
#close(IN);
#}
#1;

sub draw_clusters{
my($non_cluster,$cluster_no,$rel_str,@cluster) = @_;

my($i,@rel_str,$node,$nodes,@nodes,$node_id,$indx_id,$z,$r,$from,$to);

#Global variables: %word, %word_ana, $wcolor,%word_used, @tot_words,

    for($i=1; $i <= $cluster_no;$i++){

      print TMP1 "\nsubgraph cluster_",$i,"{\n";

      $nodes = $cluster[$i];
      &print_all_nodes_info($nodes);
      print TMP1 "\n}\n";
    }

    $nodes = $non_cluster;
    &print_all_nodes_info($nodes);

 ## Add all the nodes that were not printed earlier.
    for ($z=0;$z<=$tot_words;$z++){
         if($word_used{$z} != 1) {
	    $indx = $z.".0";
            &print_node_info($z,$word{$indx},$wcolor{$indx});
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

#Global variables: %word, %wcolor, %word_used
   $nodes =~ s/^#//;
   @nodes = split(/#/,$nodes);
   foreach $node (@nodes) {
     ($node_id, $indx_id) = split(/#/,&get_node_indx_ids($node));
     if($word_used{$node_id} != 1) {
      &print_node_info($node_id,$word{$indx_id},$wcolor{$indx_id});
      $word_used{$node_id} = 1;
     }
   }
}
1;

sub print_node_info{
    my($node,$word,$color) = @_;
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

sub cluster_relations{
  my($rel) = @_;
  if(   ($k_rel_nm =~ /समुच्चित/) 
     || ($k_rel_nm =~ /अन्यतरः/)
     || (   ($k_rel_nm =~ /विशेषणम्/) 
          && ($k_rel_nm !~ /क्रियाविशे/) )
     || ($k_rel_nm =~ /samuccitaḥ/) 
     || ($k_rel_nm =~ /anyataraḥ/)
     || ($k_rel_nm =~ /anyatara\.h/) 
     || (   ($k_rel_nm =~ /viśeṣaṇam/) 
          && ($k_rel_nm !~ /kriyāvi/))) { 
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
