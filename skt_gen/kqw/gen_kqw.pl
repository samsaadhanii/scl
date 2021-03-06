#!/usr/bin/env perl

#  Copyright (C) 2010-2022 Amba Kulkarni (ambapradeep@gmail.com)
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

#$ltproc_cmd = "$GlblVar::LTPROCBIN -ct $GlblVar::SCLINSTALLDIR/morph_bin/kqw_gen.bin | pr --columns=3 --across --omit-header | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1";
  $ltproc_cmd = "$GlblVar::LTPROCBIN -ct $GlblVar::SCLINSTALLDIR/morph_bin/kqw_gen.bin | pr -3 -a -t | tr ' ' '\t' | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1";

  $ltproc_cmd1 = "$GlblVar::LTPROCBIN -ct $GlblVar::SCLINSTALLDIR/morph_bin/kqw_gen.bin | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1";

package main;
#use CGI qw/:standard/;
#use CGI::Carp qw(fatalsToBrowser);
print "<script>\n";
print "function generate_kqwnoun_forms(prAwi,rt,upasarga,kqw_prawyaya,XAwu,gaNa,lifga,encod){\n";
print "  window.open('/cgi-bin/scl/skt_gen/noun/kqwnoun_gen.cgi?encoding='+encod+'&prAwi='+prAwi+'&gen='+lifga+'&rt='+rt+'&upasarga='+upasarga+'&kqw_prawyaya='+kqw_prawyaya+'&XAwu='+XAwu+'&gaNa='+gaNa+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes').focus();\n";
print "}\n";
print "</script>\n";

#print "function generate_kqw_forms(encod,vb){\n";
#print "  window.open('http://localhost/cgi-bin/scl/skt_gen/kqw/kqw_gen.cgi?encoding='+encod+'&vb='+vb+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes').focus();\n";
#print "}\n";

#print "function generate_waxXiwa_forms(encod,rt,gen){\n";
#print "  window.open('http://localhost/cgi-bin/scl/skt_gen/waxXiwa/waxXiwa_gen.cgi?encoding='+encod+'&rt='+rt+'&gen='+gen+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes').focus();\n";
#print "}\n";

@kqw_prawyayaH = ("wqc","wavyaw","yak","Sawq_lat","SAnac_lat","SAnac_lat","GaF","Nvul","Nyaw","lyut","yaw","kwa","kwavawu","anIyar");
@kqw_avy_prawyayaH = ("wumun","Namul","kwvA");
@kqw_avy_upa_prawyayaH = ("wumun","Namul","lyap");
@lifga =("puM","swrI","napuM");

$LTPROC_IN = "";

   my $encoding = $ARGV[0];
   my $rt = $ARGV[1];
   my $upasarga = $ARGV[2];
   $pid = $$;

   if($encoding ne "WX") {
     $rt_XAwu_gaNa = &convert("Unicode",$rt);
     $upasarga = &convert("Unicode",$upasarga);
   } else { $rt_XAwu_gaNa = $rt;}
   chomp($rt_XAwu_gaNa);

    $upasarga =~ s/Y/_/g;
    ($rt,$XAwu,$gaNa,$mean) = split(/_/,$rt_XAwu_gaNa);
    if($upasarga ne "-") { $upasargastr = "<upasarga:$upasarga>";} else {$upasargastr = "";}
    for($l=0;$l<14;$l++) {
       for($g=0;$g<3;$g++) {
           $lifga = $lifga[$g];
	   if($l==4) {
	   $str = "<kqw_XAwu:${rt}>${upasargastr}<lifgam:$lifga><kqw_prawyayaH:$kqw_prawyayaH[$l]><prayogaH:karwari><XAwuH:$XAwu><gaNaH:$gaNa><level:0>"; 
   	   }elsif($l==5) {
	   $str = "<kqw_XAwu:${rt}>${upasargastr}<lifgam:$lifga><kqw_prawyayaH:$kqw_prawyayaH[$l]><prayogaH:karmaNi><XAwuH:$XAwu><gaNaH:$gaNa><level:0>"; 
	   } else {
	   $str = "<kqw_XAwu:${rt}>${upasargastr}<lifgam:$lifga><kqw_prawyayaH:$kqw_prawyayaH[$l]><XAwuH:$XAwu><gaNaH:$gaNa><level:0>"; 
          }
           $LTPROC_IN .=  $str."\n"; 
       }         
    }
   $ustrutf8 = &join($upasarga,$rt);
   $rtutf8 = `echo $rt | sed 's/[1-5]//' | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1`;
   if($upasarga ne "-") {$upasargautf8 = `echo $upasarga | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1`;} else {$upasargautf8 = "";}
   chomp($upasargautf8);
   #if($upasargautf8 ne "") { $upasargautf8 .= "_";}
   print "<center>\n";
   print "<a href=\"javascript:show('$ustrutf8','DEV')\">$ustrutf8<\/a>\n";
   print "<\/center>\n";
   $str = "echo '".$LTPROC_IN."' | $ltproc_cmd | $GlblVar::SCLINSTALLDIR/skt_gen/kqw/kqw_format_html.pl $rt u=$upasarga $XAwu $gaNa";
   $LTPROC_IN1 = "";
   for($l=0;$l<3;$l++){
    if($upasarga eq "-") {
      $str1 = "<kqw_XAwu:${rt}>${upasargastr}<vargaH:avy><kqw_prawyayaH:$kqw_avy_prawyayaH[$l]><XAwuH:$XAwu><gaNaH:$gaNa><level:2>";
    } else {
      $str1 = "<kqw_XAwu:${rt}>${upasargastr}<vargaH:avy><kqw_prawyayaH:$kqw_avy_upa_prawyayaH[$l]><XAwuH:$XAwu><gaNaH:$gaNa><level:2>";
   }
      $LTPROC_IN1 .=  $str1."\n";
  }
  if ($upasarga eq "-") { $upa = "N";} else {$upa = "Y";}
   $str1 = "echo '".$LTPROC_IN1."' | $ltproc_cmd1 | $GlblVar::SCLINSTALLDIR/skt_gen/kqw/kqw_avy_html.pl $upa";
  print "<html><body>\n";
  print "<table border=0 width=100%>\n";
  print "<tr><td width=50%>\n";
  system($str);
  print "</td>\n";
  print "<td width=50% valign=\"top\">\n";
  system($str1);
  print "</body></html>\n";

sub join {
	my ($upasarga,$rt) = @_;

	my ($sandhi);

	$upasarga =~ s/_//g;
	if ($upasarga eq "Af") { $upasarga = "A";}
	if($upasarga ne "-") { $sandhi = $upasarga.$rt;} else {$sandhi = $rt;}
	$sandhi =~ s/[aA][aA]/A/;
	$sandhi =~ s/[aA][iI]/e/;
	$sandhi =~ s/[aA][uU]/o/;
	$sandhi =~ s/[aA][qQ]/ar/;
	$sandhi =~ s/[aA][eE]/E/;
	$sandhi =~ s/[aA][oO]/O/;
	$sandhi =~ s/i([aAuUqQeEoO])/y\1/;
	$sandhi =~ s/i[iI]/I/;
	$sandhi =~ s/u([aAuUqQeEoO])/v\1/;
	$sandhi =~ s/u[uU]/U/;
	$sandhi =~ s/[1-5]//;

        $ans = `echo $sandhi | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1`;
	$ans;
}
