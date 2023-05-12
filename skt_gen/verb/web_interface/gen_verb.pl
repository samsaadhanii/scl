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

@lakAra = ("lat","lit","lut","lqt","lot","laf","viXilif","ASIrlif","luf","lqf");
@person = ("pra","ma","u");
@vacanam = ("eka","xvi","bahu");

 my $encoding = $ARGV[0];
 my $outencoding = $ARGV[1];
 my $prygH = $ARGV[2];
 my $upasarga = $ARGV[3];
 my $rt = $ARGV[4];
 my $paxI = $ARGV[5];
 my $format = $ARGV[6];

 $generator = "$GlblVar::LTPROCBIN -cg $GlblVar::SCLINSTALLDIR/morph_bin/wif_gen.bin";

 if ($outencoding eq "IAST") {
         $conv_program = "$GlblVar::SCLINSTALLDIR/converters/wx2utf8roman.out";
 } else {
         $conv_program = "$GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1";
	 	 $outencoding = "DEV";
 }

 my $ltproc_cmd = "$generator | sed '1,\$s/#.*/-/g' | grep . | pr -3 -a -t -w 300| tr ' ' '\t'" ;

 if($encoding ne "WX"){
   $rt_XAwu_gaNa_mng = &convert($encoding,$rt,$GlblVar::SCLINSTALLDIR);
   chomp($rt_XAwu_gaNa_mng);
   $prayogaH = &convert($encoding,$prygH,$GlblVar::SCLINSTALLDIR);
   chomp($prayogaH);
   $upasarga = &convert($encoding,$upasarga,$GlblVar::SCLINSTALLDIR);
   chomp($upasargaH);
 } else { $rt_XAwu_gaNa_mng = $rt; $prayogaH = $prygH; }

   $LTPROC_IN = "";
   $str = "";

   #print "rt = $rt upasarga = $upasarga prayoga = $prayogaH\n";
#Since we are using only first 3 fields, $mean is removed.
    ($rt,$XAwu,$gaNa,$mng) = split(/_/,$rt_XAwu_gaNa_mng);

    if ($prayogaH eq "Nickarwari") { $prayogaH = "karwari"; $sanAxi = "<sanAxi_prawyayaH:Nic>";} else {$sanAxi = "";}
    if ($prayogaH eq "karmaNi") { $paxI = "AwmanepaxI"}
    if ($upasarga ne "-") { $upasargastr = "<upasarga:$upasarga>";} else { $upasargastr = "";}
  print "<body>\n";
  $rtutf8 = `echo $rt | sed 's/[1-5]//' | $conv_program`;
  $gaNautf8 = `echo $gaNa | $conv_program`;
  if ($upasarga ne "-") {$upasarga = `echo $upasarga | $conv_program`."_";} else {$upasarga = "";}
  print "<center>\n";
  print "<a href=\"javascript:show('${upasarga}$rtutf8','$outencoding')\">${upasarga}$rtutf8 ($gaNautf8)<\/a>\n";
# In javascript:show also upasarga needs to be added. But I do not know how is the dict organised. Hence it is postponed. Amba 9th Nov 2016
  print "<\/center>\n";

 if (($paxI eq "parasmEpaxI") || ($paxI eq "uBayapaxI")) {
  print "<table border=0 width=100%>\n";
  print "<tr><td>\n";
  print "<center>\n";
  print "<font color=\"green\" size=\"6\"><b>";
  if ($outencoding eq "IAST") {
      print "parasmaipadī";
  } else {
      print "परस्मैपदी ";
  }
  print "</b></font>\n";
  print "</center></td></tr>\n";
  print "<tr>\n"; 
  $LTPROC_IN = &get_generator_string($rt,$upasargastr,$sanAxi,$prayogaH,$XAwu,$gaNa,"parasmEpaxI");
#$str = $LTPROC_IN;
#$str =~ s/</&lt;/g;
#$str =~ s/>/&gt;/g;
#print "str = $str\n";
  if ($format eq "web") {
     $str = "echo '".$LTPROC_IN."' | $ltproc_cmd | $conv_program |$GlblVar::CGIDIR/$GlblVar::SCL_CGI/skt_gen/verb/verb_format_html.pl $outencoding";
     system($str);
  } else { # if $format = "json"
     $str = "echo '".$LTPROC_IN."' | $ltproc_cmd ";
     system($str);
  }
  print "</tr>\n";
  print "</table>\n";
 }
 if (($paxI eq "AwmanepaxI") || ($paxI eq "uBayapaxI")) {
  print "<table border=0 width=100%>\n";
  print "<tr><td>\n";
  print "<center>\n";
  print "<font color=\"green\" size=\"6\"><b>";
  print "</b></font>\n"; 
  if ($outencoding eq "IAST") {
  print "ātmanepadī";
  } else {
  print "आत्मनेपदी";
  }
  print "</center></td></tr>\n";

  print "<tr>\n"; 
  $LTPROC_IN = &get_generator_string($rt,$upasargastr,$sanAxi,$prayogaH,$XAwu,$gaNa,"AwmanepaxI");

#$str = $LTPROC_IN;
#$str =~ s/</&lt;/g;
#$str =~ s/>/&gt;/g;
#print "str = $str\n";
  if ($format eq "web") {
     $str = "echo '".$LTPROC_IN."' | $ltproc_cmd | $conv_program |$GlblVar::CGIDIR/$GlblVar::SCL_CGI/skt_gen/verb/verb_format_html.pl $outencoding";
     system($str);
  } else { # if $format = "json"
     $str = "echo '".$LTPROC_IN."' | $ltproc_cmd ";
     system($str);
  }
  print "</tr>\n";
  print "</table>\n";
 }
  print "</body></html>\n";

sub get_generator_string {
 my($rt,$upasarga,$sanAxi,$prayogaH,$XAwu,$gaNa,$paxI) = @_;
 my ($l,$lakAra,$per,$num,$str,$STR);

       for($l=0;$l<10;$l++){
             $lakAra = $lakAra[$l];
             for($per=0;$per<3;$per++){
                $person = $person[$per];
                for($num=0;$num<3;$num++){
                     $vacanam = $vacanam[$num];
                     $str = "^"."${rt}${upasarga}${sanAxi}<prayogaH:$prayogaH><lakAraH:$lakAra><puruRaH:$person><vacanam:$vacanam><paxI:$paxI><XAwuH:$XAwu><gaNaH:$gaNa><level:1>"."\$";
                   $STR .=  $str."\n";
                } # number
            } #person
         } #lakAra
 $STR;
}
1;
