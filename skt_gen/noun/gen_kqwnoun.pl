#!/usr/bin/env perl

#  Copyright (C) 2018-2019 Amba Kulkarni (ambapradeep@gmail.com)
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
require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";

$myPath = $GlblVar::SCLINSTALLDIR;

#package main;
#use CGI qw/:standard/;
#use CGI::Carp qw(fatalsToBrowser);

@vacanam = ("eka","xvi","bahu");

 my $encoding = $ARGV[0];
 my $prAwi = $ARGV[1];
 my $lifga = $ARGV[2];
 my $rt = $ARGV[3];
 my $upasarga = $ARGV[4];
 my $kqw_prawyaya = $ARGV[5];
 my $XAwu = $ARGV[6];
 my $gaNa = $ARGV[7];
 my $upasarga =~ s/^u=//;

 my $generator = "$GlblVar::LTPROCBIN -ct $myPath/morph_bin/all_gen.bin";

 $prAwi_wx=&convert($encoding,$prAwi,$myPath);
 $kqw_prawyaya_wx=&convert($encoding,$kqw_prawyaya,$myPath);
 chomp($prAwi_wx);
 chomp($kqw_prawyaya_wx);

 $LTPROC_IN = "";
 for($vib=1;$vib<9;$vib++){
    for($num=0;$num<3;$num++){
        $vacanam = $vacanam[$num];
        $str = "<kqw_vrb_rt:$rt><kqw_prawyayaH:$kqw_prawyaya_wx><XAwuH:$XAwu><gaNaH:$gaNa>$prAwi_wx<vargaH:nA><lifgam:$lifga><viBakwiH:$vib><vacanam:$vacanam><level:2>"; 
        $LTPROC_IN .=  $str."\n";
    } # number
 } #vib
 chomp($LTPROC_IN); # To chomp the last \n, else it produces an extra blank line in the o/p of lt-proc

 $str = "echo '".$LTPROC_IN."' | $generator | grep . | pr --columns=3 --across --omit-header | $myPath/converters/ri_skt | $myPath/converters/iscii2utf8.py 1 | $myPath/skt_gen/noun/noun_format_html.pl '' $prAwi_wx $lifga";
 system($str);
