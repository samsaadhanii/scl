#!/usr/bin/perl -W
#$VERSION = "2.0";
use strict;
use warnings;
#use Shell;
use CGI;
use CGI qw( :standard );
use LWP::Simple qw/!head/;
print header(-type=>"text/html" , -charset=>"utf-8");

my $input;
my $encoding;
my $sandhi_splitter_out;
my $pid;
my $cnvrt_wrd;

if (param){ 
  $input = param('word');
  $encoding=param("encoding");
}


$pid=$$;
$cnvrt_wrd=&convert($encoding,$pid,$input);
system("/bin/mkdir -p /tmp/scp");

open(TMPIN,">/tmp/scp/input$pid");
	print TMPIN "$cnvrt_wrd";
close(TMPIN);

	system("/bin/sh ../src/run.sh /tmp/scp/input$pid");
	system("/usr/bin/perl eval_new.pl bigram_full.dbm unigram_full.dbm /tmp/scp/output$pid < /tmp/scp/input$pid > /tmp/scp/output_log$pid");
	system("/bin/cat /tmp/scp/output$pid |../../converters/ri_skt | ../../converters/iscii2utf8.py 1 > /tmp/scp/output_fin$pid");

open(TMPOUT,"/tmp/scp/output_fin$pid");
	my $tempout=<TMPOUT>;
#	$tempout =~ s/\t.*//g;
	print "<hr><br><font size=\"5\" color=\"brown\"><center>$tempout</center></font><br><hr>";
close(TMPOUT);

sub convert{
        my($encoding,$pid,$word) = @_;
	open(TMP,">/tmp/wor.$pid") || die "Can't open /tmp/wor.$pid for writing";
        print TMP $word,"\n";
        close(TMP);
              
            if($encoding eq "WX")
            {
            system("/bin/cat /tmp/wor.$pid > /tmp/word1.$pid");
            }
          
            if($encoding eq "VH")
            {
               system("/usr/bin/perl ../../converters/velthuis-wx.pl < /tmp/wor.$pid > /tmp/word1.$pid");
            }

	    if($encoding eq "KH")
            {
               system("../../converters/kyoto.out < /tmp/wor.$pid > /tmp/word1.$pid");           
            }
            
            if($encoding eq "SLP")
            {
               system("/usr/bin/perl ../../converters/slp2wx.pl < /tmp/wor.$pid > /tmp/word1.$pid");
            }

            if($encoding eq "Itrans") 
	    {
	       system("../../converters/itrans_ra.out < /tmp/wor.$pid > /tmp/word1.$pid");           
            }

            if($encoding eq "Unicode") 
	    {
              system("/usr/bin/perl ../../converters/utf82iscii.pl < /tmp/wor.$pid > /tmp/word.$pid");
              system("../../converters/ir_skt < /tmp/word.$pid >/tmp/word1.$pid");
            } 

            open(TMP,"</tmp/word1.$pid") || die "Can't open word1.$pid for reading; exiting";
            $word = <TMP>;
            close(TMP);
         
return $word; 
}
1;
