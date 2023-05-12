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


require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";

package main;
#use CGI qw/:standard/;
#use CGI::Carp qw(fatalsToBrowser);

@avy_waxXiwa_prawyayaH = ("vaw","wasil");
#,"karam","arWam","pUrvaka");
@nA_waxXiwa_prawyayaH = ("mawup","warap","wamap","mayat","ka");
@nA_napuM_waxXiwa_prawyayaH = ("wva");
@nA_swrI_waxXiwa_prawyayaH = ("wal");

@lifga =("puM","swrI","napuM");

print "<script>\n";
print "function generate_waxXiwa_noun_forms(encod,prAwi,lifga,suff){\n";
print "  window.open('/cgi-bin/$GlblVar::SCL_CGI/skt_gen/waxXiwa/waxXiwa_noun_gen.cgi?encoding='+encod+'&rt='+prAwi+'&gen='+lifga+'&suffix='+suff+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes').focus();\n";
print "}\n";

print "function generate_waxXiwa_forms(encod,rt,gen){\n";
print "  window.open('/cgi-bin/$GlblVar::SCL_CGI/skt_gen/waxXiwa/waxXiwa_gen.cgi?encoding='+encod+'&rt='+rt+'&gen='+gen+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes').focus();\n";
print "}\n";
print "</script>\n";

$rt = $ARGV[0];
$encoding = $ARGV[1];

$pid = $$;

$rt_wx=&convert($encoding,$rt,$GlblVar::SCLINSTALLDIR);


$LTPROC_IN = "";
$ltproc_cmd3 = "$GlblVar::LTPROCBIN -cg $GlblVar::SCLINSTALLDIR/morph_bin/skt_taddhita_gen.bin | pr -3 -a -t | tr ' ' '\t' | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1";

$ltproc_cmd1 = "$GlblVar::LTPROCBIN -cg $GlblVar::SCLINSTALLDIR/morph_bin/skt_taddhita_gen.bin | pr -1 -a -t | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1";

$rtutf8 = `echo $rt_wx | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1`;

  print "<center>\n";
  print "<a href=\"javascript:show('$rtutf8','DEV')\">$rtutf8<\/a>\n";
  print "<\/center>\n";

  for($l=0;$l<5;$l++) {
      for($g=0;$g<3;$g++) {
          $lifga = $lifga[$g];
	  $str = "^"."${rt_wx}<vargaH:nA><waxXiwa_prawyayaH:${nA_waxXiwa_prawyayaH[$l]}><lifgam:${lifga}><level:0>"."\$";
          $LTPROC_IN .=  $str."\n";
      } 
   }

   $str1 = "echo '".$LTPROC_IN."' | $ltproc_cmd3 | $GlblVar::CGIDIR/$GlblVar::SCL_CGI/skt_gen/waxXiwa/waxXiwa_format_html.pl $rt_wx";

  $LTPROC_IN2 = "^"."${rt_wx}<vargaH:nA><waxXiwa_prawyayaH:wal><lifgam:swrI><level:0>"."\$";
  $LTPROC_IN2 .= "\n^"."${rt_wx}<vargaH:nA><waxXiwa_prawyayaH:wva><lifgam:napuM><level:0>"."\$";

   $str2 = "echo '".$LTPROC_IN2."' | $ltproc_cmd1 | $GlblVar::CGIDIR/$GlblVar::SCL_CGI/skt_gen/waxXiwa/waxXiwa_ind_html.pl $rt_wx";

   #  print "str2 = ", $str2;
   $LTPROC_IN1 = "";
  for($l=0;$l<2;$l++){
      $str = "^"."${rt_wx}<vargaH:avy><waxXiwa_prawyayaH:${avy_waxXiwa_prawyayaH[$l]}><level:1>"."\$";
      $LTPROC_IN1 .=  $str."\n";
  }

   $str3 = "echo '".$LTPROC_IN1."' | $ltproc_cmd1 | $GlblVar::CGIDIR/$GlblVar::SCL_CGI/skt_gen/waxXiwa/waxXiwa_avy_html.pl";

print "<html><body>\n";
  print "<table border=0 width=100%>\n";
  print "<tr><td width=50%>\n";
  system($str1);
  open (TMP,">/tmp/aaa");
  print TMP $str1;
  close(TMP);
  print "<hr />\n";
  system($str2); #Temporarily disabled Taddhita morpf needs to be rewritten with new inputs from apaertium derivational morph
  print "</td>\n";
  print "<td width=50% valign=\"top\">\n";
  system($str3);
  print "</body></html>\n";
