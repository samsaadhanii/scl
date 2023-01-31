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


#@waxXiwa_prawyayaH = ("तल्","मतुप्","तरप्","तमप्","त्व","वत्","तसिल्","मयट्","वारम्","कृत्वसुच्","धा","शस्");
@waxXiwa_prawyayaH = ("मतुप्","तरप्","तमप्","मयट्","क");
$line_no = 0;
$rt_wx = $ARGV[0];

while($in = <STDIN>){
 chomp($in);
if($in ne ""){

 $in =~ s/\t[\t]*/\t/g;
  @in = split(/\t/,$in);
  $in =~s/\\\// \/ /g;
($m,$f,$n)=split(/\t/,$in);
if($m=~/\?/){
$m="-";
}elsif($f=~/\?/){
$f="-";
}elsif($n=~/\?/){
$n="-";
}
  chomp($in);
  if($line_no == 0) { 
     print "<center>\n";
     print "<table border=0 width=50%>\n"; 
print "<tr><td colspan=4 align=\"center\"><font color=\"brown\" size=\"5\"><b>तद्धितान्तप्रातिपदिकम्</b></font></td></tr>\n";
     print "<tr  bgcolor='tan'><td align=\"center\"><font color=\"white\" size=\"4\">तद्धितप्रत्ययः</font></td><td align=\"center\"><font color=\"white\" size=\"4\">पुंलिङ्गम्</font></td><td align=\"center\"><font color=\"white\" size=\"4\">स्त्रीलिङ्गम्</font></td><td align=\"center\"><font color=\"white\" size=\"4\">नपुंसकलिङ्गम्</font><//td></tr>\n";
  }
 
if(($m ne "-")&&($f ne "-")&&($n ne "-")){
print "<tr><td width=20% bgcolor='#461B7E'  align='middle'><font color=\"white\" size=\"4\">$waxXiwa_prawyayaH[$line_no]</font></td>";
print "<td width=20% align=\"center\" bgcolor='#E6CCFF'><font color=\"black\" size=\"4\">";
print "<a href=\"javascript:generate_waxXiwa_noun_forms('Unicode','$rt_wx','पुं','$waxXiwa_prawyayaH[$line_no]')\">$m</a></td></font>";
print "<td width=20% align=\"center\" bgcolor='#E6CCFF'><font color=\"black\" size=\"4\">";
print "<a href=\"javascript:generate_waxXiwa_noun_forms('Unicode','$rt_wx','स्त्री','$waxXiwa_prawyayaH[$line_no]')\">$f</a></td></font>";
print "<td width=20% align=\"center\" bgcolor='#E6CCFF'><font color=\"black\" size=\"4\">";
print "<a href=\"javascript:generate_waxXiwa_noun_forms('Unicode','$rt_wx','नपुं','$waxXiwa_prawyayaH[$line_no]')\">$n</a></td></font></tr>";
}
  if($line_no == 11) {
     print "</table>\n";
     print "</center>\n";
  }
  $line_no++;
  if($line_no == 12) { $line_no = 0; $line_no++;}
}
}
print "<center>\n";
     print "<table border=0 width=50%>\n";
print "</table>\n";
	print "</center>\n";
print "</body></html>\n";
