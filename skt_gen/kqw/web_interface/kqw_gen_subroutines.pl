#!/usr/bin/env perl

#  Copyright (C) 2010-2024 Amba Kulkarni (ambapradeep@gmail.com)
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
my $myPATH = "$GlblVar::CGIDIR/$GlblVar::SCL_CGI";
require "$myPATH/cgi_interface.pl";
require "$myPATH/converters/convert.pl";


my $generator = "$GlblVar::LTPROCBIN -cg $myPATH/morph_bin/kqw_gen.bin";

#
###################  Sub routines #################
#
	
sub open_log {
  my($to_log, $tfpath) = @_;

  if($to_log eq "true"){
    if (! (-e "$tfpath")){
        mkdir "$tfpath" or die "Error creating directory $tfpath";
    }
    else { open(TMP1,">>$tfpath/kqw.log") || die "Can't open $tfpath/kqw.log for writing";}
    }
}
1;

sub register_log_and_close {
	my($log,$rt,$upa,$encoding,%e);

       if($log eq "true"){
          print TMP1 $e{'REMOTE_ADDR'}."\t".$e{'HTTP_USER_AGENT'}."\n"."rt:$rt\t"."upa:$upa\t"."encoding:$encoding\n##########################\n\n";
       }
       if($log eq "true"){ close(TMP1); }
}
1;

sub print_header {
	print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

        print "<head>\n";
	print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n";
        print "<script type=\"text/javascript\">\n";
        print "function show(word,encod){\n";
        print "window.open('/cgi-bin/$GlblVar::SCL_CGI/MT/dict_options.cgi?word='+word+'&outencoding='+encod+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes').focus();\n }\n </script>";

        print "</head>\n";

        print "<body onload=\"register_keys()\"> <script src=\"/$GlblVar::SCL_HTDOCS/MT/wz_tooltip.js\" type=\"text/javascript\"></script>\n";
        print "<script>\n"; 
        print "function generate_kqwnoun_forms(prAwi,rt,upasarga,kqw_prawyaya,XAwu,gaNa,lifga,encod,outencod){\n";
        print "  window.open('/cgi-bin/$GlblVar::SCL_CGI/skt_gen/kqw/kqwnoun_gen.cgi?encoding='+encod+'&prAwi='+prAwi+'&gen='+lifga+'&rt='+rt+'&upasarga='+upasarga+'&kqw_prawyaya='+kqw_prawyaya+'&XAwu='+XAwu+'&gaNa='+gaNa+'&outencoding='+outencod+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes').focus();\n";
        print "}\n";
        print "</script>\n";
        }
1;

sub gen_kqw_forms{
	my($rt_wx,$upa_wx,$format,$conversion_program,$outencoding) = @_;
	my($str,$str1,$LTPROC_IN);


my @kqw_prawyayaH = ("wqc","wavyaw","Sawq_lat","SAnac_lat><prayogaH:karwari","SAnac_lat><prayogaH:karmaNi","GaF","Nvul","Nyaw","lyut","yaw","kwa","kwavawu","anIyar");
my @kqw_avy_prawyayaH = ("wumun","Namul","kwvA");
my @kqw_avy_upa_prawyayaH = ("wumun","Namul","lyap");
my @lifga =("puM","swrI","napuM");

$LTPROC_IN = "";

   my $pid = $$;

   $rt_XAwu_gaNa = $rt_wx;
   chomp($rt_XAwu_gaNa);

    $upa_wx =~ s/Y/_/g;
    ($rt,$XAwu,$gaNa,$mean) = split(/_/,$rt_wx);
    #print "gaNa = $gaNa\n";
    #print "XAwu = $XAwu\n";
    #print "rt = $rt\n";
    #print "outencoding = $outencoding\n";
    if($upa_wx ne "-") { $upasargastr = "<upasarga:$upa_wx>";} else {$upasargastr = "";}
    for($l=0;$l<13;$l++) {
       for($g=0;$g<3;$g++) {
           $lifga = $lifga[$g];
           if ($upasargastr eq "") {
	       $str = "^${rt}${upasargastr}<lifgam:$lifga><kqw_prawyayaH:$kqw_prawyayaH[$l]><XAwuH:$XAwu><gaNaH:$gaNa><level:0>\$"; 
           } else {
	       $str = "^<kqw_XAwu:$rt>${upasargastr}<lifgam:$lifga><kqw_prawyayaH:$kqw_prawyayaH[$l]><XAwuH:$XAwu><gaNaH:$gaNa><level:0>\$"; 
           }
           $LTPROC_IN .=  $str."\n"; 
       }         
    }

   for($l=0;$l<3;$l++){
    if ($upasargastr eq "") {
      $str = "^${rt}${upasargastr}<vargaH:avy><kqw_prawyayaH:$kqw_avy_prawyayaH[$l]><XAwuH:$XAwu><gaNaH:$gaNa><level:2>\$";
    } else {
      $str = "^<kqw_XAwu:$rt>${upasargastr}<vargaH:avy><kqw_prawyayaH:$kqw_avy_upa_prawyayaH[$l]><XAwuH:$XAwu><gaNaH:$gaNa><level:2>\$";
   }
      $LTPROC_IN .=  $str."\n";
  }
  chomp($LTPROC_IN); # To chomp the last \n, else it produces an extra blank line in the o/p of lt-proc

 if($format eq "JSON") {
    $str = "echo '".$LTPROC_IN."' | $generator | sed '1,\$s/#.*/-/g' | grep . | $conversion_program | $myPATH/skt_gen/kqw/json_format.pl $outencoding $upa_wx";
 }
 else {# $format = web
         
    #print "gaNa = $gaNa\n";
    #print "XAwu = $XAwu\n";
    #print "rt = $rt_wx\n";
    #print "upa = $upa_wx\n";
    #print "outencoding  = $outencoding \n";
	 $str = "echo '".$LTPROC_IN."' | $generator | sed '1,\$s/#.*/-/g' | grep . | pr -3 -a -t -w 150 | tr ' ' '\t' | $conversion_program | $myPATH/skt_gen/kqw/html_format.pl $rt_wx $upa_wx $outencoding $XAwu $gaNa";
	 #$str = "echo '".$LTPROC_IN."' | $generator ";
	 #$LTPROC_IN =~ s/</;/g;
	 #$LTPROC_IN =~ s/>/;/g;
	 #print $LTPROC_IN;
 }
 my @out = `$str`;

 if ($out[0] =~ /\*/) { print "Word Forms Could not be generated\n";}
 else {return @out;}
}
1;

sub gen_kqwnoun_forms{

 my ($prAwi, $lifga, $rt, $upasarga, $kqw_prawyaya, $XAwu, $gaNa, $encoding, $outencoding) = @_;
 my($conversion_program);

#my $generator = "$GlblVar::LTPROCBIN -cg $myPATH/morph_bin/all_gen.bin";
## This produces an error, which I could not fix, with the forms of karwA in kq1 and kq3 - wqc suxxif
my $generator = "$GlblVar::LTPROCBIN -cg $myPATH/morph_bin/kqw_gen.bin";


#print "prAwi = $prAwi\n";
#print "lifga = $lifga\n";
#print "rt = $rt\n";
#print "upasarga = $upasarga\n";
#print "kqw_prawyaya = $kqw_prawyaya\n";
#print "XAwu = $XAwu\n";
#print "gaNa = $gaNa\n";
my @vacanam = ("eka","xvi","bahu");

 if ($encoding eq "DEV") { $encoding = "Unicode";}

# ### This is temporary fix. The input encoding and output encoding parameters are not being passed properly, when the kqw forms are generated starting from the morpjh analysis -> kqw -> kqwnoun
 if($prAwi =~ /^[a-zA-Z]+$/) { $prAwi_wx = $prAwi;} ## --> Temp fix
 else {  
   $prAwi_wx=&convert($encoding,$prAwi,$myPATH);
   chomp($prAwi_wx);
 }
 if($kqw_prawyaya =~ /^[a-zA-Z_]+$/) { $kqw_prawyaya_wx = $kqw_prawyaya;} ## --> Temp fix
 else {  
   $kqw_prawyaya_wx=&convert($encoding,$kqw_prawyaya,$myPATH);
   chomp($kqw_prawyaya_wx);
 }
#######################
 if ($outencoding eq "IAST") {
        $conversion_program = "$myPATH/converters/wx2utf8roman.out";
 } else {
        $conversion_program = "$myPATH/converters/ri_skt | $myPATH/converters/iscii2utf8.py 1";
 }

 if($upasarga ne "-") { $upasargastr = "<upasarga:$upasarga>";} else {$upasargastr = "";}

 if($kqw_prawyaya_wx eq "SAnac_lat_karwari") {
	 $kqw_prawyaya_wx = "SAnac_lat><prayogaH:karwari";
 }
 if($kqw_prawyaya_wx eq "SAnac_lat_karmaNi") {
	 $kqw_prawyaya_wx = "SAnac_lat><prayogaH:karmaNi";
 }

 $LTPROC_IN = "";
 for($vib=1;$vib<9;$vib++){
    for($num=0;$num<3;$num++){
        $vacanam = $vacanam[$num];
        if ($upasargastr eq "") {
            $str = "^"."$rt${upasargastr}<kqw_prawyayaH:$kqw_prawyaya_wx><XAwuH:$XAwu><gaNaH:$gaNa>$prAwi_wx<vargaH:nA><lifgam:$lifga><viBakwiH:$vib><vacanam:$vacanam><level:2>"."\$"; 
        } else {
            $str = "^"."<kqw_XAwu:$rt>${upasargastr}<kqw_prawyayaH:$kqw_prawyaya_wx><XAwuH:$XAwu><gaNaH:$gaNa>$prAwi_wx<vargaH:nA><lifgam:$lifga><viBakwiH:$vib><vacanam:$vacanam><level:2>"."\$"; 
        }
        $LTPROC_IN .=  $str."\n";
    } # number
 } #vib
 chomp($LTPROC_IN); # To chomp the last \n, else it produces an extra blank line in the o/p of lt-proc


 $str = "echo '".$LTPROC_IN."' | $generator | grep . | pr -3 -a -t  | tr ' ' '\t' | $conversion_program  | $myPATH/skt_gen/noun/html_format.pl '' $prAwi_wx $lifga $outencoding";
 
#open (T,">/tmp/1111");
#print T $str;
#close(T);

 my @out = `$str`;
 if ($out[0] =~ /\*/) { print "Word Forms Could not be generated\n";}
 else {return @out;}
}
;
