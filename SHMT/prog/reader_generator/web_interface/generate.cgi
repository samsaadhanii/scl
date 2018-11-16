#!PERLPATH
package main;

use CGI qw/:standard/;

my $cgi = new CGI;
print $cgi->header (-charset => 'UTF-8');
$pid = $$;
$dic_name = param('dic');
$word = param('word');
$cword = "";

$Files_Path = "/home/karunakar/workspace";
$CONV_PATH = "/home/karunakar/scl";

# converting word utf8 to wx to get filename
&converting();

#grep the 1st character in a word;
$cword =~ /^(.)/;
$l = $1;
#forming file name using dic_name and Word
chomp $dic_name;
if($dic_name eq "apt"){
	$filename = "$Files_Path/Apt-dic/new-apt-files/new_apt_files/Apt_formatted_files/$l.xml";
}
else{
	$filename = "$Files_Path/MW1/MW/prog/$l.new.html";
}


chomp $word;
open(TMP1,">TMPPATHdis_$pid.txt");
	if($word ne ""){
		$hint = 0;
		if(open(TMP,"$filename")){
		open(TMP,"$filename") ;
		}
		else{
			print "no file are matched $filename";
			die "can not open file for reading";
		}
		if($dic_name  eq "apt"){
			&apt_result(); #finding word in apt xml files
		}
		else{
			&mw_result(); #finding word in mw files
		}
	}
close(TMP);
close(TMP1);
if($hint == 1){
system("cat TMPPATHdis_$pid.txt");
}
else{ print "no files or no data matched ";}

# removing tmp file
system("rm -rf TMPPATHdis_$pid.txt TMPPATHword.$pid TMPPATHwordc.$pid");




sub apt_result{
$result = "";
	$/ = "</lexhead>";
		while($in = <TMP>){
		# extra code add on 11-02-13
		 @words = split(/-/,$word);
		 foreach $word(@words) {
		#############
			chomp $word;
			$lexcount = 0;
				if($in =~ /<prAwipaxikam>$word<\/prAwipaxikam>/ or $in =~ /<root>$word<\/root>/ ){
					$result = &get_exact_data($in);
					$result =~ s/<segmenthd>/<div style=\"background:green;\">segmenthd<\/div>/g;
					$result =~ s/<subsegmenthd>/<div style=\"background:green;\">subsegmenthd<\/div>/g;
					$result =~ s/<[a-z]+>/<label><br\/>/g;
					$result =~ s/<sense no=\"[0-9]+\">/<label><br\/>/g;
					$result  =~ s/>$word</><span style=\"background:yellow;\">$word<\/span></g;
					$hint =1;
					print TMP1 "<div style=\"border:1px solid #2175bc;text-align:justify;\"><div id=\"hd\">Apt-Dictionary</div>$result</div><br/>";
				}
		   }
		}
	}	

sub get_exact_data{
my $result = "";
	my $line = $_[0];
	@lines = split(/<segmenthd>/,$line);
	foreach $lines (@lines){
		if($lines =~ /<prAwipaxikam>$word<\/prAwipaxikam>/ or $lines =~ /<root>$word<\/root>/ ){
			$result .= $lines;
		}
	}
$result;
}
1;
#getting mw result

sub mw_result{
	while($in = <TMP>){
		if($in =~ /<span class=\"Deva\">$word<\/span>/ and $count == 0 and $in =~ /^<xml>/){
 		    	  $in =~ s/<span class=\"Deva\">$word<\/span>/<span class=\"Deva\" style=\"background:yellow;\">$word<\/span>/g;;
       			  print TMP1 "<div style=\"border:1px solid #2175bc;text-align:justify;margin-top:10px;\"><div id=\"hd\">MW</div>$in";
               		  $count =1; $hint =1;
      		}
       		elsif($count == 1 and $in !~/<\/xml>/){
        		 print TMP1 "$in";
     		}
        	elsif($count == 1 and $in =~ /<\/xml>/){
        		$count = 0;
        		print "</div>";
       		}
	}
}



# converting for finding file name

sub converting{
open(TMP,">TMPPATHword.$pid");
	print TMP $word;
	close(TMP);

system("$CONV_PATH/converters/utf82wx.sh <TMPPATHword.$pid > TMPPATHwordc.$pid");

open(TMP,"TMPPATHwordc.$pid");
$cword = <TMP>;
close(TMP);


}
