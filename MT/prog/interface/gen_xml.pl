#!/usr/bin/env perl

#  Copyright (C) 2009-2023 Amba Kulkarni (ambapradeep@gmail.com)

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



# Input:
# $1.fmt_split_mo_pos_dict
# $ROWS: Total number of columns in the input - 2 (1 each for ltag, rtag)

$ROWS = $ARGV[0];
$CHUNKER_ROW = 7; # For color code of columns ; Also check the xhtml*.xsl file

&print_header();
$fld{"w_s_p_no"}=0;
$fld{"left_tag"}=1;
$fld{"sword"}=2; #sandhied_word
$fld{"word"}=3;
$fld{"right_tag"}=4;
$fld{"morph_all"}=5;
$fld{"morph_in_context"}=6;
$fld{"kAraka"}=7;
$fld{"pos"}=8;
$fld{"anaphora"}=9;
$fld{"cc"}=10;
$fld{"gen"}=11;
$fld{"hin"}=12;

$/ = "\n\n";

while($in = <STDIN>){
  @word_info_ar = split(/\n/,$in);
  $words = $#word_info_ar+1;

  for($i=0;$i<=$#word_info_ar;$i++){
#    @flds = split(/\t/,$word_info_ar[$i],$ROWS+2);
    @flds = split(/\t/,$word_info_ar[$i]);
    $lft_tag = $flds[$fld{"left_tag"}];
    $rt_tag = $flds[$fld{"right_tag"}];
    if($lft_tag =~ /<TITLE>/) {
        print "<title words = \"$words\">\n";
        $title = 1;
        $lft_tag =~ s/<TITLE>//;
    }
    if($lft_tag =~ /<p>/) {
        print "<p>\n";
        $lft_tag =~ s/<p>//;
    }

    if($lft_tag =~ /<s>/) {
        print "<nextline>\n";
        $lft_tag =~ s/<s>//;
    }

    if($lft_tag =~ /<a>/) {
        print "<nextsolution words = \"$words\">\n";
        $lft_tag =~ s/<a>//;
    }

    $rt_tag =~ s/<\/TITLE>//;
    $rt_tag =~ s/<\/p>//;
    $rt_tag =~ s/<\/s>//;
    $rt_tag =~ s/<\/a>//;

    if(($i == 1) && !$title) {
       $num = $flds[$fld{"w_s_p_no"}];
       $num =~ s/\.[0-9]+$//; # chop the wrd number
           print "<sanskrit number='$num' category='none'> ",$lft_tag,$flds[$fld{"word"}],$rt_tag, " <\/sanskrit>\n";
    } else {
             print "<sanskrit category='none'> ",$lft_tag,$flds[$fld{"word"}],$rt_tag, " <\/sanskrit>\n";
    }
    print "<h1> " ,$flds[$fld{"sword"}], " <\/h1>\n";
    for($j=5;$j<=$ROWS+2;$j++){
             $k=$j-3;
             if($k == $CHUNKER_ROW) {
                print "<h$k> " ,$flds[$j], " <\/h$k>\n";
             } else {
                print "<h$k> ",$lft_tag,$flds[$j],$rt_tag, " <\/h$k>\n";
             }
    }

  if($flds[$fld{"right_tag"}] =~ /<\/TITLE>/) {
        print "<\/title>\n";
        $title = 0;
  }
  if($flds[$fld{"right_tag"}] =~ /<\/a>/) {
        print "<\/nextsolution>\n";
  }
  if($flds[$fld{"right_tag"}] =~ /<\/s>/) {
        print "<\/nextline>\n";
  }
  if($flds[$fld{"right_tag"}] =~ /<\/p>/) {
        print "<\/p>\n";
  }
 }
}
print "<\/rt>\n";

sub print_header{
print<<HEAD;
<?xml version="1.0" encoding="UTF-8"?>

<?xml-stylesheet type="text/xsl" href="xhtml_unicode.xsl"?>

<rt rows="$ROWS">
HEAD
;
}
