#!/usr/bin/env perl

#  Copyright (C) 2002-2023 Amba Kulkarni (ambapradeep@gmail.com)
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

@waxXiwa_prawyayaH = ("वत्","तसिल्");
$line_no = 0;
while($in = <STDIN>){
  chomp($in);
  if($in ne "") {
   if($line_no == 0) { 
     print "<center>\n";
     print "<table border=0 width=50%>\n"; 
     print "<tr><td colspan=2 align=\"center\"><font color=\"brown\" size=\"5\"><b>तद्धिताव्ययम्</b></font></td></tr>\n";

   }
   print "<tr><td width=20% bgcolor='#461B7E'  align='middle'><font color=\"white\" size=\"4\">$waxXiwa_prawyayaH[$line_no]</font></td><td width=80% align=\"center\" bgcolor='#E6CCFF'><font color=\"black\" size=\"4\">$in</font> </td></tr>\n";
  $line_no++;
 }
}
     print "</table>\n";
     print "</center>\n";
print "</body></html>\n";
