#!/usr/bin/env perl 

#  Copyright (C) 2010-2022 Amba Kulkarni (ambapradeep@gmail.com)
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


BEGIN{require "../../paths.pl";}

#use lib $GlblVar::LIB_PERL_PATH;

$myPATH=$GlblVar::SCLINSTALLDIR;

require "$myPATH/converters/convert.pl";
require "$myPATH/skt_gen/noun/sarvanAma.pl";
require "$myPATH/skt_gen/noun/saMKyeya.pl";
require "$myPATH/skt_gen/noun/saMKyA.pl";
require "$myPATH/skt_gen/noun/pUraNa.pl";


@vacanam = ("eka","xvi","bahu");

 my $rt = $ARGV[0];
 my $lifga = $ARGV[1];
 my $lcat = $ARGV[2];
 my $encoding = $ARGV[3];
 my $outencoding = $ARGV[4];
 my $level = $ARGV[5];

 $generator = "$GlblVar::LTPROCBIN -ct $myPATH/morph_bin/sup_gen.bin";

 $rt_wx=&convert($encoding,$rt,$myPATH);

 if(!&check_cat($rt_wx,$lcat)) {
      print "<center> <b>Please check your input. </b></center>";
 } else {

 if(($rt_wx eq "asmax") || ($rt_wx eq "yuRmax")) { $lifga_wx = "a";}# $lcat = "sarva";}

 if($rt_wx =~ /^(.*-)([^\-]+)/) { $pUrvapaxa = $1; $rt_wx = $2;}
 else { $pUrvapaxa = "''";}

 $LTPROC_IN = "";
 for($vib=1;$vib<9;$vib++){
    for($num=0;$num<3;$num++){
        $vacanam = $vacanam[$num];
        $str = "$rt_wx<vargaH:$lcat><lifgam:$lifga_wx><viBakwiH:$vib><vacanam:$vacanam><level:$level>"; 
        $LTPROC_IN .=  $str."\n";
    } # number
 } #vib
 chomp($LTPROC_IN); # To chomp the last \n, else it produces an extra blank line in the o/p of lt-proc

 $str = "echo '".$LTPROC_IN."' | $generator | grep . ";

 system($str);
 
 | pr -3 -a -t -w 150 | tr ' ' '\t' | $conversion_program | $myPATH/skt_gen/noun/noun_format_html.pl $pUrvapaxa $rt_wx $lifga_wx $outencoding";
 system($str);
}

sub check_cat{
 my($rt,$cat) = @_;
 my($ans);
 if(($cat eq "nA")) { $ans = 1;}
 elsif(($cat eq "sarva") && $sarvanAma{$rt} ) { $ans = 1;}
 elsif(($cat eq "saMKyeyam") && $saMKyeya{$rt} ) { $ans = 1;}
 elsif(($cat eq "saMKyA") && $saMKyA{$rt} ) { $ans = 1;}
 elsif(($cat eq "pUraNam") && $pUraNa{$rt} ) { $ans = 1;}
 else {$ans = 0;}
$ans;
}
1;
