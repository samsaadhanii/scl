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

#use CGI qw( :standard );

    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }

     print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

  my %param = &get_parameters();


    #print header(-type=>"text/html" , -charset=>"utf-8");

#Declaration of all the variables
my $word;
my $word_wx;
my $ans="";
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

#if (param()){
    $word = $param{morfword};
    $encoding=$param{encoding};
    $outencoding=$param{outencoding};
    #}

if($GlblVar::LOG eq "true"){
  open(TMP1,">>$GlblVar::TFPATH/morph.log") || die "Can't open $GlblVar::TFPATH/morph.log for writing";
  print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."encoding:$encoding\t"."morfword:$word\n";
  close(TMP1);
}

&printscripts();

$word_wx = &convert($encoding,$word,$GlblVar::SCLINSTALLDIR);

if($GlblVar::LOG eq "true"){
  open(TMP1,">>$GlblVar::TFPATH/morph.log") || die "Can't open $GlblVar::TFPATH/morph.log for writing";
  print TMP1 $word_wx,"\n";
}

chomp($word_wx);

$ans = `$GlblVar::SCLINSTALLDIR/MT/prog/morph/webrun_morph.sh $word_wx`;
if($GlblVar::LOG eq "true"){
   print TMP1 $ans,"######################\n";
   close(TMP1);
}

chomp($ans);

print "<table style=\"border-collapse: collapse;\" bordercolor='brown' valign='middle' bgcolor='#297e96' border='1' cellpadding='2' cellspacing='2' >
<tr>";

my @ans=split(/\//,$ans);
my $i = 0;
if($ans ne "") {
		#print "ans = $ans\n";
 foreach $ans (@ans) {

   if($ans =~ /^[^{]+{लेवेल् 4}/) { $ans =~ s/^[^{]+{लेवेल् 4}//;}
 # Why only level 4 entry in the beginning is deleted, why not all?
   if($ans =~ /लेवेल् [01]/) { $ans =~ s/{लेवेल् [01]}//;}
   if($ans =~ /लेवेल् 2/) { $ans =~ s/लेवेल् 2/कृदन्त/;}
   if($ans =~ /लेवेल् 3/) { $ans =~ s/लेवेल् 3/तद्धित/;}

   $ans =~ s/^([^{ ]+)([ {])/$2/;
   $rt = $1;
 # We need to separate the upasarga from the rts for generation purpose.
   if ($ans =~ /उपसर्ग ([^}]+)/) { 
	   $upasarga = $1;
   	   $ans =~ s/{उपसर्ग [^}]+}//;
   } elsif ($rt =~ /^(.+)_([^_]+)/){
	   $upasarga = $1; $rt = $2;
   } else { $upasarga = "-"; }


   #if($rt ne $word) { #  To avoid the infinite regress
     if (($rt ne $word) && ($ans =~ /कृत्_प्रत्ययः/ )){
       if($ans =~ /{धातुः ([^}]+)/) { $XAwu = $1;}
       if($ans =~ /{गणः ([^}]+)/) { $gaNa = $1;}
       $rt_XAwu_gaNa = $rt."_".$XAwu."_".$gaNa;
        if($upasarga ne "-"){
	   $disp_rt = $upasarga."_".$rt;
         } else {$disp_rt = $rt;}
         $link = "<a href=\"javascript:generate_kqw_forms('Unicode','$rt_XAwu_gaNa','$upasarga')\">$disp_rt</a>";
         $color = "lavendar";
    } elsif ($ans =~ /तद्धित/){
       $ans =~ s/{वर्गः ना}//;
       $link = "<a href=\"javascript:generate_waxXiwa_forms('Unicode','$rt','$lifga')\">$rt</a>";
       $color = "lavendar";
    } elsif(($ans =~ /कृदन्त/) && ($ans !~ /अव्य/)) {
             $ans =~ s/{वर्गः ना}//;
             if ($ans =~ /(पुं|नपुं|स्त्री)/){ $lifga = $1;}
	     $lifga_wx = &get_lifga_wx($lifga);
             $link = "<a href=\"javascript:generate_any_noun_forms('Unicode','$rt','$lifga_wx','nA','$outencoding','1')\">$rt</a>";
             $color = "skyblue";
    } elsif ($ans =~ /{वर्गः ना}/ ) {
                $ans =~ s/{वर्गः ना}//;
               if ($ans =~ /(पुं|नपुं|स्त्री)/){ $lifga = $1;}
	       $lifga_wx = &get_lifga_wx($lifga);
               $link = "<a href=\"javascript:generate_any_noun_forms('Unicode','$rt','$lifga_wx','nA','$outencoding','1')\">$rt</a>";
                $color = "skyblue";
      } elsif ($ans =~ /संख्या/)  {
         if ($ans =~ /(पुं|नपुं|स्त्री)/){ $lifga = $1;} else  {$lifga = "अ";}
	 $lifga_wx = &get_lifga_wx($lifga);
         $link = "<a href=\"javascript:generate_any_noun_forms('Unicode','$outencoding','$rt','$lifga_wx','saMKyA','$outencoding','1')\">$rt</a>";
         $color = "skyblue";
      } elsif ($ans =~ /संख्येय/) {
         if ($ans =~ /(पुं|नपुं|स्त्री)/){ $lifga = $1;} else  {$lifga = "अ";}
         $link = "<a href=\"javascript:generate_any_noun_forms('Unicode','$rt','$lifga','saMKyeyam','$outencoding','1')\">$rt</a>";
         $color = "skyblue";
      } elsif ($ans =~ /सर्वनाम/){
         if ($ans =~ /(पुं|नपुं|स्त्री)/){ $lifga = $1;} else  {$lifga = "अ";}
	 $lifga_wx = &get_lifga_wx($lifga);
         $link = "<a href=\"javascript:generate_any_noun_forms('Unicode','$rt','$lifga_wx','sarva','$outencoding','1')\">$rt</a>";
         $color = "skyblue";
     } elsif (($ans =~ /(लट्|लिट्|लुट्|लोट्|लृट्|लङ्|लृङ|लुङ्|लिङ्)/) 
      || ($ans =~ /अव्य.*कृदन्त/)) {
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
         $link = "<a href=\"javascript:generate_verb_forms('Unicode','$outencoding','$rt_XAwu_gaNa','$prayogaH','$upasarga','$paxI')\">$disp_rt</a>";
        $color = "pink";
    } else {
        $rt =~ s/[1-9]//;
        $link = "<a href=\"javascript:show('$rt','DEV')\">$rt</a>";
        $color = "lightgreen";
    }
   print "<td bgcolor='$color'>",$link,$ans,"</td>";
 $i++;
 if($i % 6 == 0) { print "</tr><tr>";}
} # endof foreach
} else { print "No answer found\n";}
print "</table>\n";

 sub get_lifga_wx{
	 my($lifga) = @_;
	 my($lifga_wx) = "";

	 if($lifga eq "नपुं") { $lifga_wx = "napuM";}
	 elsif($lifga eq "पुं") { $lifga_wx = "puM";}
	 elsif($lifga eq "स्त्री") { $lifga_wx = "swrI";}
	 else { $lifga_wx = "a";}

	 $lifga_wx;
}
1;
