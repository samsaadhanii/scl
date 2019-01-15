#!/usr/bin/env perl

#  Copyright (C) 2010-2019 Amba Kulkarni (ambapradeep@gmail.com)
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

print "<script type=\"text/javascript\" src=\"/scl/js_files/jquery.min.js\"></script>";
print "<script type=\"text/javascript\" src=\"/scl/js_files/callcgiscripts.js\"></script>";
print "<script type=\"text/javascript\" src=\"/scl/js_files/transliteration.js\"></script>";

print "<script src=\"/scl/js_files/jquery-ui.js\"></script>";

print "<link rel=\"stylesheet\" href=\"/scl/css_files/samsaadhanii.css\"/>";
print "<link rel=\"stylesheet\" href=\"/scl/css_files/menu.css\"/>";
print "<link rel=\"stylesheet\" href=\"/scl/css_files/sktmt.css\"/>";

$rt = $ARGV[0];
$lifga = $ARGV[1];

@vib = ("प्रथमा","द्वितीया","तृतीया","चतुर्थी","पञ्चमी","षष्ठी","सप्तमी","सं.प्र");
@vib_wx = ("praWamA","xviwIyA","wqwIyA","cawurWI","paFcamI","RaRTI","sapwamI","samboXana");
$line_no = 0;
$lakAra_no = 0;
print "<br><br>";
while($in = <STDIN>){
  chomp($in);
  $in =~ s/\t[\t]*/\t/g;
  @in = split(/\t/,$in);
  $in =~s/\\\// \/ /g;
  ($e,$x,$b)=split(/\t/,$in);
if($e=~/\?/){
$e="-";
}elsif($x=~/\?/){
$x="-";
}elsif($b=~/\?/){
$b="-";
}
if(($e ne "-")&&($x ne "-")&&($b ne "-")){
  if($line_no == 0) { 
	print "<center>\n";
     print "<table bordercolor=\"blue\" border=0 cellpadding=2 cellspacing=2 width='50%'>\n"; 
     print "<tr bgcolor='tan'><td></td><td align=\"center\"><font color=\"white\" size=\"4\">एकवचनम्</font> </td><td align=\"center\"><font color=\"white\" size=\"4\">द्विवचनम्</font></td><td align=\"center\"><font color=\"white\" size=\"4\">बहुवचनम्</font></td></tr>\n";
  }
 print "<tr><td  width='10%' bgcolor='#461B7E'  align='middle'><font color=\"white\" size=\"4\">$vib[$line_no]</font></td><td align=\"center\" bgcolor='#E6CCFF'><font color=\"black\" size=\"4\">";

  print "<a href=\"javascript:show_prakriyA('WX','$rt','$vib_wx[$line_no]','$lifga','ekavacana','$$')\">$e</a></font></td>\n";

 print "</font></td><td align=\"center\"  bgcolor='#E6CCFF'><font color=\"black\" size=\"4\">";
  print "<a href=\"javascript:show_prakriyA('WX','$rt','$vib_wx[$line_no]','$lifga','xvivacana','$$')\">$x</a></font></td>\n";
print "</font></td><td align=\"center\"  bgcolor='#E6CCFF'><font color=\"black\" size=\"4\">";
  print "<a href=\"javascript:show_prakriyA('WX','$rt','$vib_wx[$line_no]','$lifga','bahuvacana','$$')\">$b</a></font></td>\n";
print "</font></td></tr>\n";
}
  $line_no++;
  }
print "</center>\n";
print "</table>\n";
print "</body></html>\n";
