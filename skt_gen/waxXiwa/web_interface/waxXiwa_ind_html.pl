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


@waxXiwa_prawyayaH = ("तल्","त्व");
@lifgam =("स्त्री","नपुं");
$line_no = 0;
$rt_wx = $ARGV[0];
while($in = <STDIN>){
  $in =~ s/\t[\t]*/\t/g;
  @in = split(/\t/,$in);
  $in =~s/\\\// \/ /g;
($m,$f,$n)=split(/ /,$in);
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

  }
if(($m ne "-")&&($f ne "-")&&($n ne "-")){
	print "<tr><td width=20% bgcolor='#461B7E'  align='middle'><font color=\"white\" size=\"4\">$waxXiwa_prawyayaH[$line_no]\{$lifgam[$line_no]\}</font></td><td width=80% align=\"center\" bgcolor='#E6CCFF' size=\"4\">";
       print "<a href=\"javascript:generate_waxXiwa_noun_forms('Unicode','$rt_wx','$lifgam[$line_no]','$waxXiwa_prawyayaH[$line_no]')\">$m</a></td></tr>";
}
$line_no++;
}
     print "</table>\n";
	print "</center>\n";
print "</body></html>\n";
