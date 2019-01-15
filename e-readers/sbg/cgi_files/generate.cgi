#!/usr/bin/perl -I /usr/lib/perl/5.18.2/

my $myPATH = "/home/ambaji/scl";
package main;

use CGI qw/:standard/;

my $cgi = new CGI;
print $cgi->header (-charset => 'UTF-8');

@params = param;

$dic_name = param('dic');
$word = param('word');
#$outencoding = param('encoding');
$cword = "";

$Files_Path = "$myPATH/SHMT/data/hi";

chomp $word;
# converting word utf8 to wx to get filename
#if ($outencoding eq "DEV") {
#  $cword = `echo $word | $myPATH/converters/utf82wx.sh`;
#  chomp($cword);
#  $sword = $word;
#}elsif($outencoding eq "ROMAN"){
#  $cword = `echo $word | $myPATH/converters/utf8roman2wx.out`;
#  chomp($cword);
#  $sword = `echo $cword | $myPATH/converters/wx2utf8.sh`;
#}
 $cword = `echo $word | $myPATH/converters/utf82wx.sh`;
 chomp($cword);
 $sword = $word;

#grep the 1st character in a word;
$cword =~ /^(.)/;
$l = $1;
#forming file name using dic_name and Word
chomp $dic_name;
if($dic_name eq "apte"){
	$filename = "$Files_Path/Apte_dict/$l.xml";
}
elsif($dic_name eq "mw"){
	$filename = "$Files_Path/MW/$l.new.html";
}

if($word ne ""){
   if($dic_name ne "amara") {
	  open(TMP,"$filename") || die print "$filename does not exist";
   }
}
         if($dic_name  eq "amara"){
	    system("$myPATH/amarakosha/relations.sh NULL 'paryAyavAcI' $cword DEV");
	    $found = 1;
	 }
	 elsif($dic_name  eq "apte"){
		$found = &apte_result(); #finding word in apt xml files
	 }
	 elsif($dic_name  eq "mw"){
		$found = &mw_result(); #finding word in mw files
	 }
close(TMP);

if (!$found){
 print "\n$word not found in ";
 if($dic_name eq "apte") {
    print "Apte's Sanskrit-Hindi dictionary\n";
 }
 if($dic_name eq "mw") {
    print "Monier-William's Sanskrit-English dictionary\n";
 }
}

sub apte_result{
$result = "";
        my $found = 0;
	$/ = "</lexhead>";
		while($in = <TMP>){
			$lexcount = 0;
				if($in =~ /<prAwipaxikam>$sword<\/prAwipaxikam>/ or $in =~ /<root>$sword<\/root>/ ){
					$result = &get_exact_data($in);
					$result =~ s/<segmenthd>/<div style=\"background:green;\">segmenthd<\/div>/g;
					$result =~ s/<subsegmenthd>/<div style=\"background:green;\">subsegmenthd<\/div>/g;
					$result =~ s/<[a-z]+>/<label><br\/>/g;
					$result =~ s/<sense no=\"[0-9]+\">/<label><br\/>/g;
					$result  =~ s/>$sword</><span style=\"background:yellow;\">$sword<\/span></g;
					print "<div style=\"border:1px solid #2175bc;text-align:justify; margin-top:10px;\"><div id=\"apte\">Apte-Dictionary</div>$result</div><br/>";
        				$found = 1;
				}
		   }
$found;
}	
1;

sub get_exact_data{
my $result = "";
	my $line = $_[0];
	@lines = split(/<segmenthd>/,$line);
	foreach $lines (@lines){
		if($lines =~ /<prAwipaxikam>$sword<\/prAwipaxikam>/ or $lines =~ /<root>$sword<\/root>/ ){
			$result .= $lines;
		}
	}
$result;
}
1;
#getting mw result

sub mw_result{
        my $found = 0;
	while($in = <TMP>){
		if($in =~ /<span class=\"Deva\">$sword<\/span>/ and $count == 0 and $in =~ /^<xml>/){
 		    	  $in =~ s/<span class=\"Deva\">$sword<\/span>/<span class=\"Deva\" style=\"background:yellow;\">$sword<\/span>/g;;
       			  print "<div style=\"border:1px solid #2175bc;text-align:justify;margin-top:10px;\"><div id=\"mw\">MW</div>$in";
               		  $count =1;
                          $found = 1;
      		}
       		elsif($count == 1 and $in !~/<\/xml>/){
        		 print "$in";
     		}
        	elsif($count == 1 and $in =~ /<\/xml>/){
        		$count = 0;
        		print "</div>";
       		}
	}
$found;
}
