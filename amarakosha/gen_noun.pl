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

#use utf8;
require "../paths.pl";

require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";
require "$GlblVar::SCLINSTALLDIR/skt_gen/noun/sarvanAma.pl";
require "$GlblVar::SCLINSTALLDIR/skt_gen/noun/saMKyeya.pl";
require "$GlblVar::SCLINSTALLDIR/skt_gen/noun/saMKyA.pl";
require "$GlblVar::SCLINSTALLDIR/skt_gen/noun/pUraNa.pl";


#package main;
#use CGI qw/:standard/;
#use CGI::Carp qw(fatalsToBrowser);

@vacanam = ("eka","xvi","bahu");

 my $rt = $ARGV[0];
 my $lifga = $ARGV[1];
 my $lcat = $ARGV[2];
 my $encoding = $ARGV[3];
 my $level = $ARGV[4];

 #$generator = "/usr/bin/lt-proc -ct $myPATH/morph_bin/all_gen.bin";
 $generator = "$GlblVar::LTPROCBIN -ct $GlblVar::SCLINSTALLDIR/morph_bin/sup_gen.bin";

 $rt_wx=&convert($encoding,$rt,$GlblVar::SCLINSTALLDIR);
 $lifga_wx=&convert("Unicode",$lifga,$GlblVar::SCLINSTALLDIR);
 chomp($rt_wx);
 chomp($lifga_wx);


 if(!&check_cat($rt_wx,$lcat)) {
      print "<center> <b>Please check your input. </b></center>";
 } else {

 if(($rt_wx eq "asmax") || ($rt_wx eq "yuRmax")) { $lifga_wx = "a";}# $lcat = "sarva";}

 if($rt_wx =~ /^(.*-)([^\-]+)/) { $pUrvapaxa = $1; $rt_wx = $2;}
 else { $pUrvapaxa = "''";}

if (($lifga_wx eq "puM") 
 || ($lifga_wx eq "napuM")
 || ($lifga_wx eq "swrI")) {
    &call_noun_gen($rt_wx,$lcat,$lifga_wx);
}elsif($lifga_wx eq "vi") {
 &call_noun_gen($rt_wx,$lcat,"puM");
 &call_noun_gen($rt_wx,$lcat,"napuM");
 &call_noun_gen($rt_wx,$lcat,"swrI");
}
}

sub call_noun_gen {
 my($rt_wx,$lcat,$lifga_wx) = @_;
 $LTPROC_IN = "";
 for($vib=1;$vib<9;$vib++){
    for($num=0;$num<3;$num++){
        $vacanam = $vacanam[$num];
        $str = "$rt_wx<vargaH:$lcat><lifgam:$lifga_wx><viBakwiH:$vib><vacanam:$vacanam><level:1>"; 
        $LTPROC_IN .=  $str."\n";
    } # number
 } #vib
 chomp($LTPROC_IN); # To chomp the last \n, else it produces an extra blank line in the o/p of lt-proc

 $str = "echo '".$LTPROC_IN."' | $generator | grep . | pr --columns=3 --across --omit-header | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1 | $GlblVar::SCLINSTALLDIR/amarakosha/noun_format_html.pl $pUrvapaxa $rt_wx $lifga_wx";
 system($str);
}
1;

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
