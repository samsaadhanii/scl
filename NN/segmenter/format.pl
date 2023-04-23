#!/usr/bin/env perl


require "../../paths.pl";

$/ = "\n\n";
    print "
<div id=\"Instructions\">
<span>&dArr;</span> <br />
</div>";
while($in = <STDIN>){
       chomp($in);
	$tmp = $in;
	$tmp =~ s/{([^{]+)}//g;
	$tmp =~ s/\n.*//g;
       while($in =~ /{/){
           $in =~ /^([^{]+)\{([^}]+)}(.*)/;
	   $in = $3;
           print "<a data-placement=\"top\" data-toggle=\"tooltip\" class=\"tip-top\" data-original-title=\"$2\">$1</a>";
       }
       print "<a data-placement=\"top\" data-toggle=\"tooltip\" class=\"tip-top\" data-original-title=\"\">$in</a>\n";
}
   print "<form action=\"/cgi-bin/$GlblVar::SCL_CGI/NN/parser/generate.cgi\">";
    print "<input type=\"text\" value=\"$tmp\" name=\"text\" hidden /> 
	   <input type=\"text\" value=\"Unicode\" name=\"encoding\" hidden />
	   <input type=\"submit\" value=\"Parse\" class=\"btn btn-primary\"/> </form></center></font>";
    
