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


@vib = ("प्रथमा","द्वितीया","तृतीया","चतुर्थी","पञ्चमी","षष्ठी","सप्तमी","सं.प्र");
@vib_IAST = ("prathamā","dvitīyā","tṛtīyā","caturthī","pañcamī","ṣaṣṭhī","saptamī","saṃ.pra");
@vib_WX = ("praWamA","xviwIyA","wqwIyA","cawurWI","paFcamI","RaRTI","sapwamI","samboXana");
$column_headings_IAST= "<tr bgcolor='tan'><td></td><td align=\"center\"><font color=\"white\" size=\"4\">ekavacanam</font> </td><td align=\"center\"><font color=\"white\" size=\"4\">dvivacanam</font></td><td align=\"center\"><font color=\"white\" size=\"4\">bahuvacanam</font></td></tr>\n";
$column_headings_DEV="<tr bgcolor='tan'><td></td><td align=\"center\"><font color=\"white\" size=\"4\">एकवचनम्</font> </td><td align=\"center\"><font color=\"white\" size=\"4\">द्विवचनम्</font></td><td align=\"center\"><font color=\"white\" size=\"4\">बहुवचनम्</font></td></tr>\n";
@vacana=("ekavacana","xvivacana","bahuvacana");

my $pUrvapaxa = $ARGV[0];
my $rt_wx = $ARGV[1];
my $lifga_wx = $ARGV[2];
my $encoding = $ARGV[3];

if ($encoding eq "IAST") {
         $conversion_program = "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/wx2utf8roman.out";
 } else {
         $conversion_program = "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/ri_skt | $GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/iscii2utf8.py 1";
	 $encoding = "DEV";
 }

if($lifga_wx eq "napuM") { $lifga_wx = "napuMsaka";} #Idiosynchrasy of java simulator programme 

   $rt_lifga = `echo $rt_wx '(' $lifga_wx ')' | $conversion_program`;

   $rt = `echo $rt_wx | $conversion_program`;

if ($pUrvapaxa eq "''") { $pUrvapaxautf = "";}
else { $pUrvapaxautf = `echo $pUrvapaxa | $conversion_program`;}

&script_header;

$line_no = 0;
print "<br><br>";

while($in = <STDIN>){
  chomp($in);

  if($line_no == 0) {
     &table_header;
     if ($encoding eq "IAST") { print $column_headings_IAST; } 
     else { print $column_headings_DEV; }
  }

  $in =~ s/\t[\t]*/\t/g;
  $in =~ s/\?\?*/-/g;
  @in = split(/\t/,$in);
  for($c=1;$c<3;$c++){
     if($in[$c] =~ /\-/) { $in[$c] = "-";}
     if($in[$c0] eq "") { $in[$c] = "-";}
     if($in[$c0] =~ /\*/) { $in[$c] = "-";}
  }

  print "<tr><td  width='10%' bgcolor='#461B7E'  align='middle'>\n";
  print "<font color=\"white\" size=\"4\">";
  if ($encoding eq "IAST") {
     print $vib_IAST[$line_no];
  } else {
     print $vib[$line_no];
  }
  print "</font></td>\n";
  for ($c=0;$c<3;$c++){
     print "<td align=\"center\" bgcolor='#E6CCFF'>\n";
     print "<font color=\"black\" size=\"4\">\n";
     if (($line_no != 7)  && ($in[$c] !~ /\-/)){
        print "<a href=\"javascript:show_prakriyA('WX','$pUrvapaxa$rt_wx','$vib_WX[$line_no]','$lifga_wx','$vacana[$c]','$$')\">$pUrvapaxautf$in[$c]</a></font></td>\n";
     } else {
      print "$pUrvapaxautf$in[$c]</font></td>\n";
     }
  }
  $line_no++;
}
#print "Word not found\n";

&tail;

#### Sub routines ####
#
sub script_header{
print "<script type=\"text/javascript\" src=\"/$GlblVar::SCL_HTDOCS/js_files/jquery.min.js\"></script>";
print "<script type=\"text/javascript\" src=\"/$GlblVar::SCL_HTDOCS/js_files/callcgiscripts.js\"></script>";
print "<script type=\"text/javascript\" src=\"/$GlblVar::SCL_HTDOCS/js_files/transliteration.js\"></script>";

print "<script src=\"/$GlblVar::SCL_HTDOCS/js_files/jquery-ui.js\"></script>";

print "<link rel=\"stylesheet\" href=\"/$GlblVar::SCL_HTDOCS/css_files/samsaadhanii.css\"/>";
print "<link rel=\"stylesheet\" href=\"/$GlblVar::SCL_HTDOCS/css_files/menu.css\"/>";
print "<link rel=\"stylesheet\" href=\"/$GlblVar::SCL_HTDOCS/css_files/sktmt.css\"/>";
}
1;

sub tail{
print "</center>\n";
print "</table>\n";
print "</body></html>\n";
}
1;

sub table_header{
     print "<center>\n";
     print "<a href=\"javascript:show('$rt','$encoding')\">";
     print "$rt_lifga<\/a>\n";
     print "<table bordercolor=\"blue\" border=0 cellpadding=2 cellspacing=2 width='50%'>\n"; 
}
1;
