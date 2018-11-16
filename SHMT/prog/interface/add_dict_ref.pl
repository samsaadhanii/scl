#!/usr/bin/env perl

$outscript = $ARGV[0];
$add_ref = 0;
while($in = <STDIN>){
if($in =~ /tr class="row[35]"/) { $add_ref=1;}
if(($in =~ /(.*<td class=[^>]+>[ ]*)(.*)(<\/td>.*)/) && ($add_ref)) {
 $left = $1;
 $middle = $2;
 $right = $3;

 $middle =~ s/^([^ ]*[_\-])?([^0-9\- ]+)([0-9]*)[ ]/$1<a href="javascript:show('$2','$outscript')">$2$3<AAA>/;
 $middle =~ s/\/([^ ]*[_\-])?([^0-9\- ]+)([0-9]*)[ ]/\/$1<a href="javascript:show('$2','$outscript')">$2$3<AAA>/g;
 #$middle =~ s/\-([^ ]*_)?([^0-9\- ]+)([0-9]*)[ ]/-$1<a href="javascript:show('$2','$outscript')">$2$3<AAA>/g;

 $middle =~ s/<AAA>/<\/a> /g;
 print $left,$middle,$right,"\n";
 $add_ref = 0;
 } elsif ($in =~ /gen.cgi\?filename=\/SHMT/) {
   $in =~ s/gen.cgi\?filename=\/SHMT/gen.cgi\?filename=$ARGV[1]\/SHMT/;
 } else {
 print $in;
 }
}
