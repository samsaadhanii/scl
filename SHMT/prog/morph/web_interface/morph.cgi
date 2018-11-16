#!/usr/bin/env perl

#  Copyright (C) 2010-2018 Amba Kulkarni (ambapradeep@gmail.com)
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

use strict;
use warnings;

require "../paths.pl";
require "$GlblVar::SCLINSTALLDIR/SHMT/prog/morph/web_interface/scripts.pl";
require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";

use CGI qw( :standard );

my $version = "DEVELOP";

    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }


print header(-type=>"text/html" , -charset=>"utf-8");

#Declaration of all the variables
my $word;
my $word_wx;
my $ans="";
my $encoding="";
my $rt;
my $rt_XAwu_gaNa;
my $XAwu;
my $gaNa;
my $lifga;
my $link;
my $upasarga;
my $prayogaH;
my $color;

if (param()){ 
    $word = param('morfword');
    $encoding=param("encoding");
}

if($version eq "DEVELOP"){
  open(TMP1,">>$GlblVar::TFPATH/morph.log") || die "Can't open $GlblVar::TFPATH/morph.log for writing";
  print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."encoding:$encoding\t"."morfword:$word\n"."tempnew_data:$ans\n############################\n\n";
  close(TMP1);
}

&printscripts();

$word_wx = &convert($encoding,$word,$GlblVar::SCLINSTALLDIR);
  open(TMP1,">>$GlblVar::TFPATH/morph.log") || die "Can't open $GlblVar::TFPATH/morph.log for writing";
print TMP1 $word_wx;

chomp($word_wx);
$ans = `$GlblVar::SCLINSTALLDIR/SHMT/prog/morph/webrun_morph.sh $word_wx`;
print TMP1 $ans;
chomp($ans);
  close(TMP1);

print "<table style=\"border-collapse: collapse;\" bordercolor='brown' valign='middle' bgcolor='#297e96' border='1' cellpadding='2' cellspacing='2' >
<tr>";

my @ans=split(/\//,$ans);
my $i = 0;
if($ans ne "") {
 foreach $ans (@ans) {

   if($ans =~ /^[^{]+{लेवेल् 4}/) { $ans =~ s/^[^{]+{लेवेल् 4}//;}
 # Why only level 4 entry in the beginning is deleted, why not all?
   if($ans =~ /लेवेल् [01]/) { $ans =~ s/{लेवेल् [01]}//;}
   if($ans =~ /लेवेल् 2/) { $ans =~ s/लेवेल् 2/कृदन्त/;}
   if($ans =~ /लेवेल् 3/) { $ans =~ s/लेवेल् 3/तद्धित/;}

   $ans =~ s/^([^{ ]+)([ {])/$2/;
   $rt = $1;
 # We need to separate the upasarga from the rts for generation purpose.
   if($rt =~ /^(.+)_([^_]+)/){ $upasarga = $1; $rt = $2;}
   else {$upasarga = "-";}


   #if($rt ne $word) { #  To avoid the infinite regress
     if (($rt ne $word) && ($ans =~ /कृत्_प्रत्ययः/ )){
       if($ans =~ /{धातुः ([^}]+)/) { $XAwu = $1;}
       if($ans =~ /{गणः ([^}]+)/) { $gaNa = $1;}
       $rt_XAwu_gaNa = $rt."_".$XAwu."_".$gaNa;
       if($upasarga ne "-"){
          $link = "<a href=\"javascript:generate_kqw_forms('Unicode','$rt_XAwu_gaNa','$upasarga')\">${upasarga}_$rt</a>";
       } else {
          $link = "<a href=\"javascript:generate_kqw_forms('Unicode','$rt_XAwu_gaNa','$upasarga')\">$rt</a>";
       }
       $color = "lavendar";
    } elsif ($ans =~ /तद्धित_प्रत्यय/){
       $link = "<a href=\"javascript:generate_waxXiwa_forms('Unicode','$rt','$lifga')\">$rt</a>";
       $color = "";
    } elsif($ans =~ /कृदन्त/) {
             $ans =~ s/{वर्गः ना}//;
             if ($ans =~ /(पुं|नपुं|स्त्री)/){ $lifga = $1;}
             $link = "<a href=\"javascript:generate_any_noun_forms('Unicode','$rt','$lifga','nA','1')\">$rt</a>";
             $color = "skyblue";
    } elsif ($ans =~ /{वर्गः ना}/ ) {
                $ans =~ s/{वर्गः ना}//;
               if ($ans =~ /(पुं|नपुं|स्त्री)/){ $lifga = $1;}
                $link = "<a href=\"javascript:generate_any_noun_forms('Unicode','$rt','$lifga','nA','1')\">$rt</a>";
                $color = "skyblue";
      } elsif ($ans =~ /संख्या/)  {
         if ($ans =~ /(पुं|नपुं|स्त्री)/){ $lifga = $1;} else  {$lifga = "अ";}
         $link = "<a href=\"javascript:generate_any_noun_forms('Unicode','$rt','$lifga','saMKyA','1')\">$rt</a>";
         $color = "skyblue";
      } elsif ($ans =~ /संख्येय/) {
         if ($ans =~ /(पुं|नपुं|स्त्री)/){ $lifga = $1;} else  {$lifga = "अ";}
         $link = "<a href=\"javascript:generate_any_noun_forms('Unicode','$rt','$lifga','saMKyeyam','1')\">$rt</a>";
         $color = "skyblue";
      } elsif ($ans =~ /सर्वनाम/){
         if ($ans =~ /(पुं|नपुं|स्त्री)/){ $lifga = $1;} else  {$lifga = "अ";}
         $link = "<a href=\"javascript:generate_any_noun_forms('Unicode','$rt','$lifga','sarva','1')\">$rt</a>";
         $color = "skyblue";
     } elsif ($ans =~ /(लट्|लिट्|लुट्|लोट्|लृट्|लङ्|लृङ|लुङ्|लिङ्)/) {
        if($ans =~ /{धातुः ([^}]+)/) { $XAwu = $1;}
        if($ans =~ /{गणः ([^}]+)/) { $gaNa = $1;}
        if($ans =~ /{सनादि:णिच}/) { $prayogaH = "णिजन्त-कर्तरि";} else { $prayogaH = "कर्तरि";}
        $rt_XAwu_gaNa = $rt."_".$XAwu."_".$gaNa;
        if($upasarga ne "-"){
          $rt =~ s/[1-9]//;
          $link = "<a href=\"javascript:generate_verb_forms('Unicode','$rt_XAwu_gaNa','$prayogaH','$upasarga','uBayapaxI')\">${upasarga}_$rt</a>";
        } else {
          $rt =~ s/[1-9]//;
          $link = "<a href=\"javascript:generate_verb_forms('Unicode','$rt_XAwu_gaNa','$prayogaH','$upasarga','uBayapaxI')\">$rt</a>";
        }
        $color = "pink";
    } else {
        $rt =~ s/[1-9]//;
        $link = "<a href=\"javascript:show('$rt')\">$rt</a>";
        $color = "lightgreen";
    }
   print "<td bgcolor='$color'>",$link,$ans,"</td>";
 $i++;
 if($i % 6 == 0) { print "</tr><tr>";}
} # endof foreach
} else { print "No answer found\n";}
print "</table>\n";
