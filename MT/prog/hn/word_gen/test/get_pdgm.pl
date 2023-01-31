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


## This programs tells the current pdgm being used for the given noun.

$pdgm[1] = "ASA";
$pdgm[2] = "AlU";
$pdgm[3] = "Apawwi";
$pdgm[4] = "AxamI";
$pdgm[5] = "Gara";
$pdgm[6] = "bahU";
$pdgm[7] = "gudiyA";
$pdgm[8] = "jO";
$pdgm[9] = "kroXa";
$pdgm[10] = "kuAz";
$pdgm[11] = "ladakA";
$pdgm[12] = "ladakI";
$pdgm[13] = "rAjA";
$pdgm[14] = "rAwa";
$pdgm[15] = "qwu";
$pdgm[16] = "gehUz";
$pdgm[17] = "kavi";

$wrd = $ARGV[0];
$ans = `grep '"$wrd",' /home/amba/amba_anu/hnd_gen/prog/n_excp.c`;
$ans =~ s/"$wrd",//;

if($ans ne "") { 
   $ans =~ s/([0-9]+),/$pdgm[$1]/;
}

else {
 $ans = &get_default_pdgm($wrd);
}
print "\n\nPDGM for the $wrd = $ans \n";
print <<EOH;

If this paradigm is wrong, add an entry to n_excp.c, choosing the paradigm from the following list.

Available paradigms are:
1. "ASA" 	2. "AlU" 	3. "Apawwi" 	4. "AxamI"
5. "Gara" 	6. "bahU" 	7. "gudiyA" 	8. "jO"
9. "kroXa"     10. "kuAz"      11. "ladakA"    12. "ladakI"
13. "rAjA"     14. "rAwa"      15. "qwu"       16. "gehUz"
17. "kavi"
EOH


sub get_default_pdgm{
local($wrd) = @_;

if($wrd =~ /A$/) { $ans = $pdgm[11];}
elsif($wrd =~ /a$/) { $ans = $pdgm[5];}
elsif($wrd =~ /I$/) { $ans = $pdgm[12];}
elsif($wrd =~ /i$/) { $ans = $pdgm[13];}
elsif($wrd =~ /oM$/) { $ans = $pdgm[9];}
elsif($wrd =~ /U$/) { $ans = $pdgm[2];}
elsif($wrd =~ /O$/) { $ans = $pdgm[15];}
elsif($wrd =~ /z$/) { $ans = $pdgm[10];}
elsif($wrd =~ /Z$/) { $ans = $pdgm[10];}
else { $ans = $pdgm[5];}

$ans;
}
1;
