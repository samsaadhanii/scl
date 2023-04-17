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

require "../../paths.pl";


@kqw_prawyayaH = ("तृच्","तव्यत्","शतृ_लट्","शानच्_लट्_कर्तरि","शानच्_लट्_कर्मणि","घञ्","ण्वुल्","ण्यत्","ल्युट्","यत्","क्त","क्तवतु","अनीयर्");
@kqw_avy_prawyayaH = ("तुमुन्","णमुल्","क्त्वा");
@kqw_avy_upa_prawyayaH = ("तुमुन्","णमुल्","ल्यप्");
@lifga = ("पुं","स्त्री","नपुं");
@lifga_wx = ("puM","swrI","napuM");

@kqw_prawyayaH_IAST = ("tṛc","tavyat","śatṛ_laṭ","śānac_laṭ_kartari","śānac_laṭ_karmaṇi","ghañ","ṇvul","ṇyat","lyuṭ","yat","kta","ktavatu","anīyar");
@kqw_avy_prawyayaH_IAST = ("tumun","ṇamul","ktvā");
@kqw_avy_upa_prawyayaH_IAST = ("tumun","ṇamul","lyap");
@lifga_IAST =("puṃ","strī","napuṃ");


$column_headings_avy_IAST = "<tr bgcolor='tan'><td>kṛdavyayaṃ</td></tr>\n";
$column_headings_avy_DEV = "<tr bgcolor='tan'><td>कृदव्ययम्</td></tr>\n";

$column_headings_IAST= "<tr bgcolor='tan'><td>kṛtnāma</td><td align=\"center\"><font color=\"white\" size=\"4\">puṃ</font> </td><td align=\"center\"><font color=\"white\" size=\"4\">strī</font></td><td align=\"center\"><font color=\"white\" size=\"4\">napuṃ</font></td></tr>\n";

$column_headings_DEV="<tr bgcolor='tan'><td>कृत्नाम</td><td align=\"center\"><font color=\"white\" size=\"4\">पुं</font> </td><td align=\"center\"><font color=\"white\" size=\"4\">स्त्री</font></td><td align=\"center\"><font color=\"white\" size=\"4\">नपुं</font></td></tr>\n";

my $word = $ARGV[0];
my $upa = $ARGV[1];
my $encoding = $ARGV[2];
my $XAwu = $ARGV[3];
my $gaNa = $ARGV[4];

if ($encoding eq "IAST") {
         $conversion_program = "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/wx2utf8roman.out";
 } else {
         $conversion_program = "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/ri_skt | $GlblVar::CGIDIR/$GlblVar::SCL_CGI/converters/iscii2utf8.py 1";
	 $encoding = "DEV";
 }


   $word =~ /^([^_]+).*/;
   $rt = $1;
   $upa_rt = &join($upa,$rt);
   $upa_rt_en = `echo $upa_rt | $conversion_program`;

&script_header;

$line_no = 0;
print "<br><br>";

while($in = <STDIN>){
  chomp($in);

  if($line_no == 0) {
     &table_header($upa_rt_en,$encoding);
     if ($encoding eq "IAST") { print $column_headings_IAST; } 
     else { print $column_headings_DEV; }
  }
  if($line_no == 13) {
     &table_end;
     &table_header("","");
     if ($encoding eq "IAST") { print $column_headings_avy_IAST; } 
     else { print $column_headings_avy_DEV; }
  }

  $in =~ s/\t[\t]*/\t/g;
  $in =~ s/\?\?*/-/g;
  @in = split(/\t/,$in);
  for($c=1;$c<3;$c++){
     if($in[0] eq "-") { $in[$c] = "-";}
     if($in[0] =~ /\*/) { $in[$c] = "-";}
  }

  if($line_no < 13) {
     print "<tr><td  width='10%' bgcolor='#461B7E'  align='middle'>\n";
     print "<font color=\"white\" size=\"4\">";
     if ($encoding eq "IAST") {
        $k = $kqw_prawyayaH_IAST[$line_no];
     } else {
        $k = $kqw_prawyayaH[$line_no];
     }
     print $k;
     print "</font></td>\n";
     for ($c=0;$c<3;$c++){
        print "<td align=\"center\" bgcolor='#E6CCFF'>\n";
        print "<font color=\"black\" size=\"4\">\n";
        if ($in[$c] eq "-" ) { print "$in[$c]</font></td>\n";}
        else {
           print "<a href=\"javascript:generate_kqwnoun_forms('$in[$c]','$rt','$upa','$k','$XAwu','$gaNa','$lifga_wx[$c]','$encoding')\">$in[$c]</a></font></td>\n";
        }
      }
     } else {
       for ($c=0;$c<3;$c++){
       print "<tr><td  width='10%' bgcolor='#461B7E'  align='middle'>\n";
       print "<font color=\"white\" size=\"4\">";
       if($upa eq "-") {
        if ($encoding eq "IAST") {
         print $kqw_avy_prawyayaH_IAST[$c];
        } else {
         print $kqw_avy_prawyayaH[$c];
        }
       } else {
         if ($encoding eq "IAST") {
           print $kqw_avy_upa_prawyayaH_IAST[$c];
         } else {
           print $kqw_avy_upa_prawyayaH[$c];
         }
      }
      print "</font></td>\n";
      print "<td align=\"center\" bgcolor='#E6CCFF'>\n";
      print "<font color=\"black\" size=\"4\">\n";
      print "$in[$c]</font></td>\n";
     }
 }
  $line_no++;
}
&table_end;
&tail;

#### Sub routines ####

sub script_header{

print "<script>\n";
print "function generate_kqwnoun_forms(prAwi,rt,upasarga,kqw_prawyaya,XAwu,gaNa,lifga,encod){\n";
print "  window.open('/cgi-bin/$GlblVar::SCL_CGI/skt_gen/kqw/kqwnoun_gen.cgi?encoding='+encod+'&prAwi='+prAwi+'&gen='+lifga+'&rt='+rt+'&upasarga='+upasarga+'&kqw_prawyaya='+kqw_prawyaya+'&XAwu='+XAwu+'&gaNa='+gaNa+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes').focus();\n";
print "}\n";
print "</script>\n";

}
1;

sub table_end {
print "</center>\n";
print "</table>\n";
}
1;

sub tail{
print "</body></html>\n";
}
1;

sub table_header{
     my($upa_rt_en,$encoding) = @_;
     print "<center>\n";
     print "<a href=\"javascript:show('$upa_rt_en','$encoding')\">";
     print "$upa_rt_en<\/a>\n";
     print "<table bordercolor=\"blue\" border=0 cellpadding=2 cellspacing=2 width='50%'>\n"; 
}
1;

sub join {
	my ($upasarga,$rt) = @_;

	my ($sandhi);

	$upasarga =~ s/_//g;
	if ($upasarga eq "Af") { $upasarga = "A";}
	if($upasarga ne "-") { $sandhi = $upasarga.$rt;} else {$sandhi = $rt;}
	$sandhi =~ s/[aA][aA]/A/;
	$sandhi =~ s/[aA][iI]/e/;
	$sandhi =~ s/[aA][uU]/o/;
	$sandhi =~ s/[aA][qQ]/ar/;
	$sandhi =~ s/[aA][eE]/E/;
	$sandhi =~ s/[aA][oO]/O/;
	$sandhi =~ s/i([aAuUqQeEoO])/y\1/;
	$sandhi =~ s/i[iI]/I/;
	$sandhi =~ s/u([aAuUqQeEoO])/v\1/;
	$sandhi =~ s/u[uU]/U/;
	$sandhi =~ s/[1-5]//;

        #$ans = `echo $sandhi | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1`;
	#$ans;
	$sandhi;
}
1;
