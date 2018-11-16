#!/usr/bin/env perl

require "../../paths.pl";

use CGI qw(:standard);
use Date::Format;

print header(-type=>"text/html", -charset=>"UTF-8");

if(param){
	$feedback = param('feedback');
	$module = param('module');
}
        if (-e "$TFPATH"){
	        die "can't open file for writting $!" unless open(TMP,">>$TFPATH/feedback.txt");
	} else { mkdir "$TFPATH" or die "Error creating directory $TFPATH";
	         die "can't open file for writting $!" unless open(TMP,">>$TFPATH/feedback.txt");
        }


	print TMP  "$module : $feedback\n\n";
        print TMP  time2str("%a, %d %h %y %X %Z\n\n", time);
	close TMP;
	print "feedback posted";

