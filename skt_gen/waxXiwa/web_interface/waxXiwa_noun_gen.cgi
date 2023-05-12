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

use utf8;
require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";
require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";

package main;


 if($GlblVar::LOG eq "true"){
    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }
   open(TMP1,">>$GlblVar::TFPATH/waxXiwa.log") || die "Can't open $GlblVar::TFPATH/waxXiwa.log for writing";
 }

  my %param = &get_parameters("decode");

 #   if (param) {
      my $encoding=$param{encoding};
      my $rt=$param{rt};
      my $gen=$param{gen};
      my $prawyaya=$param{suffix};

      chomp $encoding; chomp $rt; chomp $gen;
      #my $cgi = new CGI;
      #print $cgi->header (-charset => 'UTF-8');

print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
      print "<head>\n";
      print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />";
      print "<script type=\"text/javascript\">\n";
      print "function show(word,encod){\n";
      print "window.open('/cgi-bin/$GlblVar::SCL_CGI/MT/dict_options.cgi?word='+word+'&outencoding='+encod+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes').focus();\n }\n </script>";

      print "</head>\n";
      print "<body onload=\"register_keys()\"> <script src=\"/$GlblVar::SCL_HTDOCS/MT/wz_tooltip.js\" type=\"text/javascript\"></script>\n";
      my $result = &gen_waxXiwa_noun($rt,$gen,$encoding,$prawyaya);
      print $result;
      if($GlblVar::LOG eq "true"){
         print TMP1 "running:","calling gen_noun.pl from waxXiwa generator";
         print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."rt:$rt\t"."gen:$gen\t"."encoding:$encoding\tprawyaya:$prawyaya#######################\n\n";
      }
      #  }
 if($GlblVar::LOG eq "true"){
   close(TMP1);
 }

sub gen_waxXiwa_noun {
 my($rt_wx, $gen,$encoding, $suffix) = @_;

@vacanam = ("eka","xvi","bahu");

 $lifga_wx=&convert($encoding,$gen,$GlblVar::SCLINSTALLDIR);
 $suffix_wx=&convert($encoding,$suffix,$GlblVar::SCLINSTALLDIR);

 chomp($rt_wx);
 chomp($lifga_wx);
 chomp($suffix_wx);

 $rtutf8 = `echo $rt_wx | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1`;
 
 $generator = "$GlblVar::LTPROCBIN -cg $GlblVar::SCLINSTALLDIR/morph_bin/skt_taddhita_gen.bin";

 $LTPROC_IN = "";
 for($vib=1;$vib<9;$vib++){
    for($num=0;$num<3;$num++){
         $vacanam = $vacanam[$num];
         $str = "^"."$rt_wx<vargaH:nA><waxXiwa_prawyayaH:$suffix_wx><lifgam:$lifga_wx><viBakwiH:$vib><vacanam:$vacanam><level:3>"."\$"; 
         $LTPROC_IN .=  $str."\n";
    } # number
 } #vib
  #open (TMP,">/tmp/111");
 #print TMP $LTPROC_IN;
 #close (TMP);

 $str = "echo '".$LTPROC_IN."' | $generator | grep . | pr -3 -a -t | tr ' ' '\t' | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1| $GlblVar::CGIDIR/$GlblVar::SCL_CGI/skt_gen/waxXiwa/html_format.pl $rt_wx $lifga_wx $encoding";
 system($str);
}
1;
