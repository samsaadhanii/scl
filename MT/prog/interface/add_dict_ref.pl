#!/usr/bin/env perl

$outscript = $ARGV[0];
$add_ref = 0;
while($in = <STDIN>){
if($in =~ /tr class="row[35]"/) { $add_ref=1;}
if(($in =~ /(.*<td class=[^>]+>[ ]*)(.*)(<\/td>.*)/) && ($add_ref)) {
 $left = $1;
 $m = $2;
 $right = $3;

 print " m = $m\n";
 $mlink = "";
 @middle = split('-', $m);
 foreach $middle (@middle) {
   $middle =~ s/\(([^ ]*[_\-])?([^0-9\- ]+)([0-9]*)[ ]/\($1<a href="javascript:show('$2','$outscript')">$2$3<AAA>/g;
   $middle =~ s/^([^ ]*[_\-])?([^0-9\- ]+)([0-9]*)[ ]/$1<a href="javascript:show('$2','$outscript')">$2$3<AAA>/;
   $middle =~ s/\/([^ ]*[_\-])?([^0-9\- ]+)([0-9]*)[ ]/\/$1<a href="javascript:show('$2','$outscript')">$2$3<AAA>/g;
   $middle =~ s/\-([^ ]*_)?([^0-9\- ]+)([0-9]*)[ ]/-$1<a href="javascript:show('$2','$outscript')">$2$3<AAA>/g;
   $mlink .= "-".$middle;
}

 $mlink =~ s/<AAA>/<\/a> /g;
 $mlink =~ s/^-//g;
 print $left,$mlink,$right,"\n";
 $add_ref = 0;
 } elsif ($in =~ /gen.cgi\?filename=\/MT/) {
   $in =~ s/gen.cgi\?filename=\/MT/gen.cgi\?filename=$ARGV[1]\/MT/;
 } else {
 print $in;
 }
}
