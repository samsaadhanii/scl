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

#use utf8;
## If utf8 is commented, then Devanagari input is not accepted
##If it is not commented, then we do not get proper colors in the output
use strict;
use warnings;

require "../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

require "$GlblVar::SCLINSTALLDIR/MT/prog/morph/web_interface/scripts.pl";
require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";


#Usage:
#https://sanskrit.uohyd.ac.in/cgi-bin/scl/morph/morph.cgi?morfword=rAmaH&encoding=WX&outencoding=DEV&mode=json
#Outencoding: IAST/DEV

#Declaration of all the variables
my $word;
my $word_wx;
my $ans="";
my $ans_iast="";
my $encoding="";
my $outencoding="";
my $rt;
my $rt_XAwu_gaNa;
my $XAwu;
my $gaNa;
my $lifga;
my $lifga_wx;
my $link;
my $upasarga;
my $prayogaH;
my $color;
my $disp_rt;
my $paxI;
my $i;
my @ans;
my $mode;
my $k;
my $format;

  $format = "web";
  my %param = &get_parameters();
    $mode = $param{mode};
    $word = $param{morfword};
    $encoding=$param{encoding};
    $outencoding=$param{outencoding};
    if($mode eq "json") { $format = "JSON";}


  if($format eq "web") {
    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }
  }

  if($format eq "JSON") { 
     print "Access-Control-Allow-Origin: *\n";
  }

  print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

  $word_wx = &convert($encoding,$word,$GlblVar::SCLINSTALLDIR);
  chomp($word_wx);
  $ans = `$GlblVar::SCLINSTALLDIR/MT/prog/morph/webrun_morph.sh $word_wx`;
  chomp($ans);

  if($format eq "web") {

     &printscripts();

     if($GlblVar::LOG eq "true"){
       open(TMP1,">>$GlblVar::TFPATH/morph.log") || die "Can't open $GlblVar::TFPATH/morph.log for writing";
       print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."encoding:$encoding\t"."morfword:$word\n";
       print TMP1 $word_wx,"\n";
       print TMP1 $ans,"######################\n";
       close(TMP1);
     }
     print "<table style=\"border-collapse: collapse;\" bordercolor='brown' valign='middle' bgcolor='#297e96' border='1' cellpadding='2' cellspacing='2' > <tr>";

  }

    if ($format eq "JSON") { print "[";}
    @ans=split(/\//,$ans);
    $i = 0;
    if($ans ne "") {
       for($k=0;$k<=$#ans;$k++){
          $ans = $ans[$k];
          if ($format eq "JSON") { print "{";}
          if($ans =~ /^[^{]+{लेवेल् 4}/) { $ans =~ s/^[^{]+{लेवेल् 4}//;}
        # Why only level 4 entry in the beginning is deleted, why not all?
          if($ans =~ /लेवेल् [01]/) { $ans =~ s/{लेवेल् [01]}//;}
          if($ans =~ /लेवेल् 2/) { $ans =~ s/लेवेल् 2/कृदन्त/;}
          if($ans =~ /लेवेल् 3/) { $ans =~ s/लेवेल् 3/तद्धित/;}

          $ans =~ s/^([^{ ]+)([ {])/$2/;  # Remove rt from the ans; since we need to provide a link to it in web version.
          $rt = $1;
          # We need to separate the upasarga from the rts for generation purpose.
          if ($ans =~ /उपसर्ग ([^}]+)/) { 
	          $upasarga = $1;
   	          $ans =~ s/{उपसर्ग [^}]+}//;
          } elsif ($rt =~ /^(.+)_([^_]+)/){
       	          $upasarga = $1; $rt = $2;
          } else { $upasarga = "-"; }

          if (($rt ne $word) && ($ans =~ /कृत्_प्रत्ययः/ )){
             if($ans =~ /{धातुः ([^}]+)/) { $XAwu = $1;}
             if($ans =~ /{गणः ([^}]+)/) { $gaNa = $1;}
             $rt_XAwu_gaNa = $rt."_".$XAwu."_".$gaNa;
             if($upasarga ne "-"){
	        $disp_rt = $upasarga."_".$rt;
             } else {$disp_rt = $rt;}
               if($format eq "web") {$link = "<a href=\"javascript:generate_kqw_forms('Unicode','$rt_XAwu_gaNa','$upasarga')\">$disp_rt</a>";}
	       else { $link = "\"APP\":\"kqw\",\"encoding\":\"Unicode\",\"rt\":\"$rt_XAwu_gaNa\",\"upasarga\":\"$upasarga\",\"RT\":\"$disp_rt\"";}
               $color = "lavendar";
             } elsif ($ans =~ /तद्धित/){
               $ans =~ s/{वर्गः ना}//;
               if($format eq "web") { $link = "<a href=\"javascript:generate_waxXiwa_forms('Unicode','$rt','$lifga')\">$rt</a>";}
	       else { $link = "\"APP\":\"waxXiwa\",\"encoding\":\"Unicode\",\"rt\":\"$rt\",\"linga\":\"$lifga\",\"RT\":\"$rt\"";}
               $color = "lavendar";
            } elsif(($ans =~ /कृदन्त/) && ($ans !~ /अव्य/)) {
               $ans =~ s/{वर्गः ना}//;
               if ($ans =~ /(पुं|नपुं|स्त्री)/){ $lifga = $1;}
	       $lifga_wx = &get_lifga_wx($lifga);
               if($format eq "web") {$link = "<a href=\"javascript:generate_any_noun_forms('Unicode','$rt','$lifga_wx','nA','$outencoding','1')\">$rt</a>";}
	      else { $link = "\"APP\":\"noun\",\"encoding\":\"Unicode\",\"rt\":\"$rt\",\"linga\":\"$lifga\",\"cat\":\"nA\",\"outencoding\":\"$outencoding\",\"RT\":\"$rt\"";}
               $color = "skyblue";
            } elsif ($ans =~ /{वर्गः ना}/ ) {
                $ans =~ s/{वर्गः ना}//;
                if ($ans =~ /(पुं|नपुं|स्त्री)/){ $lifga = $1;}
	        $lifga_wx = &get_lifga_wx($lifga);
                if($format eq "web") {$link = "<a href=\"javascript:generate_any_noun_forms('Unicode','$rt','$lifga_wx','nA','$outencoding','1')\">$rt</a>";}
	      else { $link = "\"APP\":\"noun\",\"encoding\":\"Unicode\",\"rt\":\"$rt\",\"linga\":\"$lifga\",\"cat\":\"nA\",\"outencoding\":\"$outencoding\",\"RT\":\"$rt\"";}
                $color = "skyblue";
           } elsif ($ans =~ /संख्या/)  {
              if ($ans =~ /(पुं|नपुं|स्त्री)/){ $lifga = $1;} else  {$lifga = "अ";}
	      $lifga_wx = &get_lifga_wx($lifga);
              if($format eq "web") {$link = "<a href=\"javascript:generate_any_noun_forms('Unicode','$outencoding','$rt','$lifga_wx','saMKyA','$outencoding','1')\">$rt</a>";}
	      else { $link = "\"APP\":\"noun\",\"encoding\":\"Unicode\",\"rt\":\"$rt\",\"linga\":\"$lifga\",\"cat\":\"saMKyA\",\"outencoding\":\"$outencoding\",\"RT\":\"$rt\"";}
              $color = "skyblue";
           } elsif ($ans =~ /संख्येय/) {
              if ($ans =~ /(पुं|नपुं|स्त्री)/){ $lifga = $1;} else  {$lifga = "अ";}
	      $lifga_wx = &get_lifga_wx($lifga);
              if($format eq "web") {$link = "<a href=\"javascript:generate_any_noun_forms('Unicode','$rt','$lifga_wx','saMKyeyam','$outencoding','1')\">$rt</a>";}
	      else { $link = "\"APP\":\"noun\",\"encoding\":\"Unicode\",\"rt\":\"$rt\",\"linga\":\"$lifga\",\"cat\":\"saMKyeyam\",\"outencoding\":\"$outencoding\",\"RT\":\"$rt\"";}
              $color = "skyblue";
           } elsif ($ans =~ /सर्वनाम/){
              if ($ans =~ /(पुं|नपुं|स्त्री)/){ $lifga = $1;} else  {$lifga = "अ";}
	      $lifga_wx = &get_lifga_wx($lifga);
              if($format eq "web") {$link = "<a href=\"javascript:generate_any_noun_forms('Unicode','$rt','$lifga_wx','sarva','$outencoding','1')\">$rt</a>";}
	      else { $link = "\"APP\":\"noun\",\"encoding\":\"Unicode\",\"rt\":\"$rt\",\"linga\":\"$lifga_wx\",\"cat\":\"sarva\",\"outencoding\":\"$outencoding\",\"RT\":\"$rt\"";}
              $color = "skyblue";
          } elsif (($ans =~ /(लट्|लिट्|लुट्|लोट्|लृट्|लङ्|लृङ|लुङ्|लिङ्)/) || ($ans =~ /अव्य.*कृदन्त/)) {
          	if($ans =~ /([^ ]+) ([^ ]+दिः)/) {  $XAwu = $1;$gaNa = $2;}
                if($ans =~ /{सनादि:णिच}/) { $prayogaH = "णिजन्त-कर्तरि";} 
        	elsif ($ans =~ /(कर्तरि|कर्मणि)/) {$prayogaH = $1;}
        	else { $prayogaH = "कर्तरि";}
                if($ans =~ /परस्मैपदी/) { $paxI = "parasmEpaxI";} 
                elsif($ans =~ /आत्मनेपदी/) { $paxI = "AwmanepaxI";} 
        	else { $paxI = "uBayapaxI";}
                $rt_XAwu_gaNa = $rt."_".$XAwu."_".$gaNa;
                $rt =~ s/[1-9]//;
                if($upasarga ne "-"){
	           $disp_rt = $upasarga."_".$rt;
                 } else {$disp_rt = $rt;}
                 if ($format eq "web") { $link = "<a href=\"javascript:generate_verb_forms('Unicode','$outencoding','$rt_XAwu_gaNa','$prayogaH','$upasarga','$paxI')\">$disp_rt</a>";}
                 else { $link = "\"APP\":\"verb\",\"encoding\":\"Unicode\",\"outencoding\":\"$outencoding\",\"rt\":\"$rt_XAwu_gaNa\",\"prayogaH\":\"$prayogaH\",\"upasarga\":\"$upasarga\",\"paxI\":\"$paxI\",\"RT\":\"$disp_rt\"";}
                 $color = "pink";
            } else {
                $rt =~ s/[1-9]//;
                if ($format eq "web") { $link = "<a href=\"javascript:show('$rt','DEV')\">$rt</a>";}
                else { $link = "\"RT\":\"$rt\",\"App\":\"dict_help\"";}
                $color = "lightgreen";
            }
           if($outencoding eq "IAST") {
              $ans_iast = `echo $ans | $GlblVar::SCLINSTALLDIR/converters/utf82wx.sh $GlblVar::SCLINSTALLDIR | $GlblVar::SCLINSTALLDIR/converters/wx2utf8roman.out`;
	      $ans = $ans_iast;
           }
           if($format eq "web") { print "<td bgcolor='$color'>",$link,$ans,"</td>";}
           else { 
            print "\"COLOR\":\"$color\",$link,\"ANS\":\"$ans\"";
            if($k < $#ans)  { print "},";} else { print "}";}
            if($k == $#ans)  { print "]";}
          }
         $i++;
         if (($i % 6 == 0) && ($format eq "web")) {print "</tr><tr>";}
        } # endof foreach
        } else { 
           if ($format eq "web") { print "No answer found\n";} 
           else { print "\"ANS\":\"No answer found\"";}
        if($format eq "web" ) { print "</table>\n";} else { print "]";}
       }


 sub get_lifga_wx{
	 my($linga) = @_;
	 my($linga_wx) = "";

	 if($linga eq "नपुं") { $linga_wx = "napuM";}
	 elsif($linga eq "पुं") { $linga_wx = "puM";}
	 elsif($linga eq "स्त्री") { $linga_wx = "swrI";}
	 else { $linga_wx = "a";}

	 $linga_wx;
}
1;
