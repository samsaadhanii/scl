#!PERLPATH
package main;
use CGI qw/:standard/;

my $cgi = new CGI;
print $cgi->header(-charset => 'UTF-8');

$word = param('word');
chomp $word;
$word =~ s/{(.*)}//g;
#$word =~ s/[{0-9}]//g;
#$dic_name = param('dic');
print "<html><head>
<script type=\"text/javascript\" src=\"jquery.js\"></script>
<script type=\"text/javascript\" src =\"dict_options.js\"></script>
<style type=\"text/css\"> #hd{height:30px;font:22px bold sans-serif;width:100%;background:#333;color:#fff;}</style>
</head><body><div id=\"check\">";
print $word;
	print "<input type=\"text\" name=\"word\" value=\"$word\" id=\"word\" hidden/><table cellpadding=\"4\"><tr><td>Apt-dic<input type=\"checkbox\" onclick=\"showcontent(this.value)\"  name=\"apt\" value=\"apt\" id=\"apt\"/></td>";
#<td>MW-dic<input type=\"checkbox\" name=\"mw\" id=\"mw\" value=\"mw\" onclick=\"showcontent(this.value)\"/></tdi>
print "</tr></table>";

	print "<div id=\"result\"></div>";
print "</div></body></html>";
