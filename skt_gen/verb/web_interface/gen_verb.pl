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
require "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/convert.pl";

package main;
#use CGI qw/:standard/;

@lakAra = ("lat","lit","lut","lqt","lot","laf","viXilif","ASIrlif","luf","lqf");
@person = ("pra","ma","u");
@vacanam = ("eka","xvi","bahu");

$generator = "$GlblVar::LTPROCBIN -cg $GlblVar::SCLINSTALLDIR/morph_bin/wif_gen.bin";
$ltproc_cmd = "$generator | sed '1,\$s/#.*/-/g' | grep . | pr -3 -a -t -w 300| tr ' ' '\t'" ;

 sub gen_verb_forms {
  
  my ($encoding, $outencoding, $prygH, $upasarga, $rt, $paxI, $format) = @_;


 if ($outencoding eq "IAST") {
         $conv_program = "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/wx2utf8roman.out";
 } else {
         $conv_program = "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/ri_skt | $GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/iscii2utf8.py 1";
 	 $outencoding = "DEV";
 }


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

  $rtutf8 = `echo $rt | sed 's/[1-5]//' | $conv_program`;
  chomp($rtutf8);
  $gaNautf8 = `echo $gaNa | $conv_program`;
  chomp($gaNautf8);
  if ($upasarga ne "-") {$upasarga = `echo $upasarga | $conv_program`."_";} else {$upasarga = "";}

  if($format eq "web") {
    print "<body>\n";
    print "<center>\n";
    print "<a href=\"javascript:show('${upasarga}$rtutf8','$outencoding')\">${upasarga}$rtutf8 ($gaNautf8)<\/a>\n";
    # In javascript:show also upasarga needs to be added. But I do not know how is the dict organised. Hence it is postponed. Amba 9th Nov 2016
    print "<\/center>\n";
 }

 if ($format eq "JSON") {
    print "[ {\"rt\":\"${upasarga}$rtutf8($gaNautf8)\",";
 }

 if ($paxI eq "uBayapaxI") {
     &gen_verb_forms_paxI($outencoding, $rt, $upasargastr, $sanAxi, $prayogaH, $XAwu, $gaNa, "AwmanepaxI", $format, $conv_program);
     if($format eq "JSON") {
        print "],";
     }
     &gen_verb_forms_paxI($outencoding, $rt, $upasargastr, $sanAxi, $prayogaH, $XAwu, $gaNa, "parasmEpaxI", $format, $conv_program);
     if($format eq "JSON") {
        print "]}]";
     }
 } else {
     &gen_verb_forms_paxI($outencoding, $rt, $upasargastr, $sanAxi, $prayogaH, $XAwu, $gaNa, $paxI, $format,$conv_program);
     if($format eq "JSON") {
        print "]}]";
     }
 }

  if($format eq "web") {
     print "</body></html>\n";
  }

}
1;


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


sub print_header {
        print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

        print "<head>\n";
        print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n";
        print "<script type=\"text/javascript\">\n";
        print "function show(word,encod){\n";
        print "window.open('/cgi-bin/$GlblVar::SCL_CGI/MT/dict_options.cgi?word='+word+'&outencoding='+encod+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes').focus();\n }\n </script>";

        print "</head>\n";

        print "<body onload=\"register_keys()\"> <script src=\"/$GlblVar::SCL_HTDOCS/MT/wz_tooltip.js\" type=\"text/javascript\"></script>\n";
}
1;

sub open_log {
  my($to_log, $tfpath) = @_;

  if($to_log eq "true"){
    if (! (-e "$tfpath")){
        mkdir "$tfpath" or die "Error creating directory $tfpath";
    }
    else { open(TMP1,">>$tfpath/noun.log") || die "Can't open $tfpath/noun.log for writing";}
    }
}
1;


sub register_log_and_close {
        my($log,$upasarga,$word,$prayoga,%e);

       if($log eq "true"){
         print TMP1 "running:","calling gen_verb.pl from verb generator";
         print TMP1 $e{'REMOTE_ADDR'}."\t".$e{'HTTP_USER_AGENT'}."\n"."upasarga:$upasarga\t"."word:$word\t"."prayoga:$prayoga\n#######################\n\n";
         close(TMP1);
       }
}
1;


sub gen_verb_forms_paxI {
 my ($outencoding, $rt, $upasargastr, $sanAxi, $prayogaH, $XAwu, $gaNa, $paxI, $format, $conv_program) = @_;

  if($format eq "web") {
    print "<table border=0 width=100%>\n";
    print "<tr><td>\n";
    print "<center>\n";
    print "<font color=\"green\" size=\"6\"><b>";
  }

 if ($paxI eq "parasmEpaxI") {
    if ($outencoding eq "IAST") {
        if ($format eq "JSON") { print "\"parasmE\":[{\"paxI\":\"parasmaipadī\",";}
        else { print "parasmaipadī";}
    } else {
        if ($format eq "JSON") { print "\"parasmE\":[{\"paxI\":\"परस्मैपदी \",";}
        else { print "परस्मैपदी ";}
    }
 }
 if ($paxI eq "AwmanepaxI") {
      if ($outencoding eq "IAST") {
        if ($format eq "JSON") { print "\"Awmane\":[{\"paxI\":\"ātmanepadī\",";}
        else { print "ātmanepadī";}
      } else {
        if ($format eq "JSON") { print "\"Awmane\":[{\"paxI\":\"आत्मनेपदी\",";}
          else { print "आत्मनेपदी";}
      }
 }

  if ($format eq "web") {
    print "</b></font>\n";
    print "</center></td></tr>\n";
    print "<tr>\n"; 
  }

  $LTPROC_IN = &get_generator_string($rt,$upasargastr,$sanAxi,$prayogaH,$XAwu,$gaNa,$paxI);

  if ($format eq "web") {
     $str = "echo '".$LTPROC_IN."' | $ltproc_cmd | $conv_program |$GlblVar::CGIDIR/$GlblVar::SCL_CGI/skt_gen/verb/verb_format_html.pl $outencoding";
     system($str);
  } else { # if $format = "json"
     $str = "echo '".$LTPROC_IN."' | $ltproc_cmd | $conv_program |$GlblVar::CGIDIR/$GlblVar::SCL_CGI/skt_gen/verb/verb_format_json.pl $outencoding";
     system($str);
  }

  if($format eq "web") {
     print "</tr>\n";
     print "</table>\n";
  }
 
  if($format eq "JSON"){
     print "}";
  }
 }
1;
