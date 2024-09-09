#!/usr/bin/env perl

#  Copyright (C) 2010-2024 Amba Kulkarni (ambapradeep@gmail.com)
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
#use strict;
#use warnings;

require "../../../paths.pl";
my $myPATH="$GlblVar::CGIDIR/$GlblVar::SCL_CGI/";
require "$myPATH/cgi_interface.pl";

require "$myPATH/MT/prog/morph/scripts.pl";
require "$myPATH/converters/convert.pl";


#Usage:
#https://sanskrit.uohyd.ac.in/cgi-bin/scl/morph/morph.cgi?morfword=rAmaH&encoding=WX&outencoding=DEV&mode=json
#Outencoding: IAST/DEV

#Declaration of all the variables
my $word = "";
my $word_wx = "";
my $ans="";
my $ans_outencoding = "";
my $encoding="";
my $outencoding="";
my $rt = "";
my $kqw_rt = "";
my $rt_XAwu_gaNa = "";
my $XAwu = "";
my $gaNa = "";
my $lifga = "";
my $link = "";
my $upasarga = "";
my $prayogaH = "";
my $color = "";
my $disp_rt = "";
my $paxI = "";
my $i;
my @ans;
my $mode = "";
my $k;

my $format="web";

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
  } else {
     print "Access-Control-Allow-Origin: *\n";
  }

  print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

  $word_wx = &convert($encoding,$word,$myPATH);
  $ans = `$myPATH/MT/prog/morph/webrun_morph.sh $word_wx`;
  chomp($ans);

  if($format eq "web") {

     &printscripts();

     if($GlblVar::LOG eq "true"){
       &logbook($word, $word_wx, $ans);
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
          if($ans =~ /level:[01234]/) { $ans =~ s/{level:[01234]}//;}

          if ($ans =~ /^([^{ ]+)([ {])/) { 
              $ans =~ s/^([^{ ]+)([ {])/$2/;  # Remove rt from the ans; since we need to provide a link to it in web version.
              $rt = $1;
          } elsif ($ans =~ /^{kqw_XAwu/){
              $ans =~ s/^{kqw_XAwu:([^}]+)//;  # Remove rt from the ans; since we need to provide a link to it in web version.
              $rt = $1;
          }

          # We need to separate the upasarga from the rts for generation purpose.
          if ($ans =~ /upasarga:([^}]+)/) { 
	          $upasarga = $1;
   	          $ans =~ s/{upasarga:[^}]+}//;
          } elsif ($rt =~ /^(.+)_([^_]+)/){
       	          $upasarga = $1; $rt = $2;
          } else { $upasarga = "-"; }

            if ($ans =~ /kqw_prawyayaH/){
               $link = &handle_kqw($format,$rt,$upasarga,$outencoding,$ans);
               if($ans =~ /vargaH:nA/) {
                  $ans =~ /(.*\})([^\{]+)(\{.*)/;
                  $ans1 = $1;
                  $rt = $2;
                  $ans2 = $3;
                  $rt_outencoding = &my_convert($rt,$outencoding);
                  $link1 = "<a href=\"javascript:show('$rt_outencoding','DEV')\">$rt_outencoding</a>";
                  $color = "skyblue";
               } else {$link1 = ""; $color = "lavender"; }
            } elsif ($ans =~ /waxXiwa/){
                 $rt_outencoding = &my_convert($rt,$outencoding);
                 #$link = &handle_waxXiwa($format,$rt,$rt_outencoding,$ans); 
		 $link = $rt_outencoding;
                 $color = "lightgreen";
            } elsif ($ans =~ /{vargaH:nA}/ ) {
                $link = &handle_noun($format,$rt,'nA',$outencoding,$ans); 
                $color = "skyblue";
            } elsif ($ans =~ /saMKyA/)  {
              $link = &handle_noun($format,$rt,'saMKyA',$outencoding,$ans); 
              $color = "skyblue";
            } elsif ($ans =~ /saMKyeya/) {
              $link = &handle_noun($format,$rt,'saMKyeyam',$outencoding,$ans); 
              $color = "skyblue";
            } elsif ($ans =~ /{vargaH:sarva}/){
              $link = &handle_noun($format,$rt,'sarva',$outencoding,$ans); 
              $color = "skyblue";
            } elsif (($ans =~ /(lat|lit|lut|lot|lqt|laf|lqf|luf|lif)/) || ($ans =~ /avy.*kqxanwa/)) {
                 $link = &handle_verb($format,$rt,$upasarga,$outencoding,$ans);
                 $color = "pink";
            } else {
                $rt =~ s/[1-9]//;
                $rt_outencoding = &my_convert($rt,$outencoding);
                if ($format eq "web") { $link = "<a href=\"javascript:show('$rt_outencoding','DEV')\">$rt_outencoding</a>";}
                else { $link = "\"RT\":\"$rt_outencoding\",\"APP\":\"dict_help\"";}
                if ($ans =~ /avy/){ $color = "lavender";} else { $color = "lightgreen";}
           }
	   $ans =~ s/{vargaH:nA}/ /;
           $ans_outencoding = &my_convert($ans,$outencoding);

	   if($format eq "web") { 
	      $ans_outencoding =~ s/{/ {/; # add a space after the rt and before the first feature
              $ans_outencoding =~ s/{[^:]+://g; # Remove the feature name
              $ans_outencoding =~ s/}/ /g; # Add a space at the end of the last feature
           }
           if($format eq "web") { 
	      if ($link1 eq "") {
                  print "<td bgcolor='$color'>",$link,$ans_outencoding,"</td>";
              } else {
                  $ans1_outencoding = &my_convert($ans1,$outencoding);
	          $ans1_outencoding =~ s/{/ {/; # add a space after the rt and before the first feature
                  $ans1_outencoding =~ s/{[^:]+://g; # Remove the feature name
                  $ans1_outencoding =~ s/}/ /g; # Add a space at the end of the last feature
                  $ans2_outencoding = &my_convert($ans2,$outencoding);
	          $ans2_outencoding =~ s/{/ {/; # add a space after the rt and before the first feature
                  $ans2_outencoding =~ s/{[^:]+://g; # Remove the feature name
                  $ans2_outencoding =~ s/}/ /g; # Add a space at the end of the last feature
                  print "<td bgcolor='$color'>",$link,$ans1_outencoding,$link1,$ans2_outencoding,"</td>";
              } 
            } else { 
            print "\"COLOR\":\"$color\",$link,\"ANS\":\"$ans_outencoding\"";
            if($k < $#ans)  { print "},";} else { print "}";}
            if($k == $#ans)  { print "]";}
          }
         $i++;
         if (($i % 6 == 0) && ($format eq "web")) {print "</tr><tr>";}
        } # end of foreach
        } else { 
           if ($format eq "web") { print "No answer found\n";} 
           else { print "\"ANS\":\"No answer found\"";}
        if($format eq "web" ) { print "</table>\n";} else { print "]";}
       }


sub logbook{
       my($word, $word_wx, $ans) = @_;
       open(TMP1,">>$GlblVar::TFPATH/morph.log") || die "Can't open $GlblVar::TFPATH/morph.log for writing";
       print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."encoding:$encoding\t"."morfword:$word\n";
       print TMP1 $word_wx,"\n";
       print TMP1 $ans,"\n######################\n";
       close(TMP1);
}

sub handle_kqw{
   my($format,$rt,$upasarga,$outen,$ans) = @_;
   my($link, $rt_XAwu_gaNa, $disp_rt,$disp_rt_outencoding);

   chomp($ans);
   if($ans =~ /{XAwuH:([^}]+)/) { $XAwu = $1;}
   if($ans =~ /{gaNaH:([^}]+)/) { $gaNa = $1;}

   $rt_XAwu_gaNa = $rt."_".$XAwu."_".$gaNa;

   if($upasarga ne "-"){
      $disp_rt = $upasarga."_".$rt;
   } else {$disp_rt = $rt;}

     $disp_rt_outencoding = &my_convert($disp_rt,$outencoding);
     if($format eq "web") {$link = "<a href=\"javascript:generate_kqw_forms('WX','$rt_XAwu_gaNa','$upasarga','$outencoding')\">$disp_rt_outencoding</a>";}
     else { $link = "\"APP\":\"kqw\",\"encoding\":\"WX\",\"rt\":\"$rt_XAwu_gaNa\",\"upasarga\":\"$upasarga\",\"outencoding\":\"$outencoding\",\"RT\":\"$disp_rt_outencoding\"";}

$link;
}
1;

sub handle_waxXiwa{
    my($format,$rt,$rt_outencoding,$ans) = @_;
    my($link,$lifga);
    if ($ans =~ /(puM|napuM|swrI)/){ $lifga = $1;}
    if($format eq "web") { $link = "<a href=\"javascript:generate_waxXiwa_forms('WX','$rt','$lifga')\">$rt_outencoding</a>";}
     else { $link = "\"APP\":\"waxXiwa\",\"encoding\":\"WX\",\"rt\":\"$rt\",\"linga\":\"$lifga\",\"RT\":\"$rt_outencoding\"";}
  $link;
}
1;

sub handle_noun{
  my($format,$rt,$cat,$outencoding,$ans) = @_;
  my($link);
  my($rt_outencoding);
  if ($ans =~ /(puM|napuM|swrI)/){ $lifga = $1;}
  $rt_outencoding = &my_convert($rt,$outencoding);
  if($format eq "web") {$link = "<a href=\"javascript:generate_any_noun_forms('WX','$rt','$lifga','$cat','$outencoding','1')\">$rt_outencoding</a>";}
  else { $link = "\"APP\":\"noun\",\"encoding\":\"WX\",\"rt\":\"$rt\",\"linga\":\"$lifga\",\"cat\":\"$cat\",\"outencoding\":\"$outencoding\",\"RT\":\"$rt_outencoding\"";}
  $link;
}
1;

sub handle_verb{
       my($format,$rt,$upasarga,$outencoding,$ans) = @_;
       my($link, $rt_XAwu_gaNa, $prayogaH, $paxI, $disp_rt, $disp_rt_outencoding);
        chomp($ans);
     	if($ans =~ /XAwuH:([^}]+)/) { $XAwu = $1;}
     	if($ans =~ /gaNaH:([^}]+)/) { $gaNa = $1;}
        if($ans =~ /{sanAxi:Nic}/) { $prayogaH ="Nijanwa-karwari";} 
      	elsif ($ans =~ /(karwari|karmaNi)/) {$prayogaH = $1;}
      	else { $prayogaH = "karwari";}
        if($ans =~ /parasmEpaxI/) { $paxI = "parasmEpaxI";} 
        elsif($ans =~ /AwmanepaxI/) { $paxI = "AwmanepaxI";} 
      	else { $paxI = "uBayapaxI";}
        $rt_XAwu_gaNa = $rt."_".$XAwu."_".$gaNa;
        $rt =~ s/[1-9]/ /;
        if($upasarga ne "-"){
           $disp_rt = $upasarga."_".$rt;
        } else {$disp_rt = $rt;}
	$disp_rt_outencoding = &my_convert($disp_rt,$outencoding);
        if ($format eq "web") { $link = "<a href=\"javascript:generate_verb_forms('WX','$outencoding','$rt_XAwu_gaNa','$prayogaH','$upasarga','$paxI')\">$disp_rt_outencoding</a>";}
         else { $link = "\"APP\":\"verb\",\"encoding\":\"WX\",\"outencoding\":\"$outencoding\",\"rt\":\"$rt_XAwu_gaNa\",\"prayogaH\":\"$prayogaH\",\"upasarga\":\"$upasarga\",\"paxI\":\"$paxI\",\"RT\":\"$disp_rt_outencoding\"";}
  $link;
}
1;

sub my_convert {
    my($rt,$outencoding) = @_;
    my($rt_outencoding);
          if ($outencoding eq "IAST") {
              $rt_outencoding = `echo $rt | $myPATH/converters/wx2utf8roman.out`;
          } else {
              $rt_outencoding = `echo $rt | $myPATH/converters/wx2utf8.sh $myPATH`;
          }
    chomp($rt_outencoding);
    $rt_outencoding;
}
1;
