#!/usr/bin/env perl

# Copyright (C) 2010-2013 Karunakar 
# 2014-2021 Amba Kulkarni (ambapradeep@gmail.com)
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
package main;
#use CGI qw/:standard/;

require "../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";


#my $cgi = new CGI;
#print $cgi->header(-charset => 'UTF-8');

print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

my %param = &get_parameters();

$word = $param{word};
$encod = $param{outencoding};

print "<html><head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>
<script type=\"text/javascript\" src=\"/scl/js_files/jquery.tools.min.js\"></script>
<script type=\"text/javascript\" src =\"/scl/SHMT/option.js\"></script>
<style type=\"text/css\"> #apte{font:22px bold sans-serif;width:100%;background:#333;color:#fff;}</style>
<style type=\"text/css\"> #mw{font:22px bold sans-serif;width:100%;background:#333;color:#fff;}</style>
<style type=\"text/css\"> #amara{font:22px bold sans-serif;width:100%;background:#333;color:#fff;}</style>
<style type=\"text/css\"> #heritage{font:22px bold sans-serif;width:100%;background:#333;color:#fff;}</style>
<script>
function generate_noun_forms(encod,prAwi,lifga){
window.open('/cgi-bin/scl/amarakosha/noun_gen.cgi?encoding='+encod+'&rt='+prAwi+'&gen='+lifga+'&jAwi=nA'+'&level=1'+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes').focus();
}
</script>
</head><body><div id=\"check\">";
        print "<form name=\"dicthelp\" method=\"post\">\n";
	print "<input type=\"hidden\" name=\"word\" value=\"$word\" id=\"word\"/>\n";
	print "<input type=\"hidden\" name=\"outencoding\" value=\"$encod\" id=\"outencoding\"/>\n";
        print "<table cellpadding=\"4\"><tr>\n";
        print "<td>Amarakosha<input type=\"checkbox\" name=\"Amara\" id=\"amara\" value=\"amara\" onclick=\"showcontent(this.value)\"/></td>\n";
        print "<td>Apte-dic<input type=\"checkbox\" onclick=\"showcontent(this.value)\"  name=\"apte\" value=\"apte\" id=\"apte\"/></td>\n";
	print "<td>MW-dic<input type=\"checkbox\" name=\"mw\" id=\"mw\" value=\"mw\" onclick=\"showcontent(this.value)\"/></td>\n";
	print "<td>Heritage<input type=\"checkbox\" name=\"heritage\" id=\"heritage\" value=\"heritage\" onclick=\"showcontent(this.value)\"/></td>\n";
        print "</tr></table></form>";

	print "<div id=\"result\"></div>";

print "</div></body></html>";
