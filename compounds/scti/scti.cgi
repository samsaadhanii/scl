#!/usr/bin/perl -W
#$VERSION = "2.0";
#use Cwd;
use strict;
use warnings;
#use Shell;
#use CGI;
#use CGI qw( :standard );
#use LWP::Simple qw/!head/;
use utf8;
BEGIN{require "../../paths.pl"};
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";
require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";

package main;

system("/bin/mkdir -p /tmp/scp");
my $path = "$GlblVar::SCLINSTALLDIR/compounds/scti";
my %param = &get_parameters();

my $input = $param{word};
my $encoding=$param{encoding};

my $pid=$$;

my $cnvrt_wrd=&convert($encoding,$input,$GlblVar::SCLINSTALLDIR);
open(TMPIN,">/tmp/scp/input_scti$pid");
	$cnvrt_wrd =~ s/\@//g;
	print TMPIN "$cnvrt_wrd";
close(TMPIN);

system("/usr/bin/perl $path/scti.pl $path/dbm/ref_data.dbm $path/dbm/wrd_gaNa.dbm $path/dbm/tag_word_freq.dbm $path/dbm/word_freq.dbm -debug=1 < /tmp/scp/input_scti$pid > /tmp/scp/output_scti$pid");

open(OUT,"</tmp/scp/output_scti$pid");
my @fin_out = <OUT>;
close(OUT);

print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
print "<head>\n";
print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n";
print "</head>\n";
print "<body>\n";

foreach my $fout(@fin_out){
if($fout =~ /Not Found/){
system("$path/tagger_run.sh  $GlblVar::SCLINSTALLDIR/compounds/scti /tmp/scp/input_scti$pid | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1");
}else{
	system("/bin/cat /tmp/scp/output_scti$pid| /usr/bin/perl $path/assignTagLabel.pl| $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1 > /tmp/scp/output$pid");
	open(OUT2,"</tmp/scp/output$pid");
		my $fout1 = <OUT2>;
	close(OUT2);
	my @rul_out = split(/\t/,$fout1);
	my $count = 0;
	print "<table border=1 width=\"70\%\" align=center style=\"border:1px solid black;\">\n";
	foreach my $rout(@rul_out){
		if($count == 0){
		  print "<tr align=center style=\"border:1px solid black;\"><td colspan=2 style=\"border:1px solid black;\"><font size=4 color=\"blue\">$rout</font></td></tr>";
		  print "<tr align=center style=\"border:1px solid black;\"><td style=\"border:1px solid black;\"><font size=3 color=\"brown\"> समासभेदः</font></td><td style=\"border:1px solid black;\"> <font size=3 color=\"brown\">सूत्रम्</font></td></tr>";
		  $count = 1;
		}else{
		 my($type,$sutra) = split(/\[/,$rout);
		  $sutra =~ s/\]//g;
		  print "<tr style=\"border:1px solid black;\"><td style=\"border:1px solid black;\">$type</td><td style=\"border:1px solid black;\">$sutra</td></tr>";
		}
	}
	print "</table>\n";
  }
}

print "</body>";
print "</html>";
