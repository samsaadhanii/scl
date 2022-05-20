#!/usr/bin/env perl

use strict;
use warnings;

$SCLINSTALLDIR = $ARGV[0];
my $NO_OF_ROWS = $ARGV[1]-1;
# This variable is required in header.pl
require "$SCLINSTALLDIR/MT/prog/reader_generator/header.pl";
require "$SCLINSTALLDIR/MT/prog/reader_generator/footer.pl";
$/="\n\n";
my $shloka=0;
my $compound=1;
my($m,$row_indx,$div_id,@fields,$d,$wordindx,$length,$in,@in);

&header($NO_OF_ROWS);

my $total_fields = $NO_OF_ROWS+1;
while($in=<STDIN>) {
@in=split("\n",$in);
$length=$#in+1;
  for($wordindx=0;$wordindx<$length;$wordindx++){
	@fields=split("\t",$in[$wordindx]);
        $shloka = $fields[0];
        $shloka =~ s/^S//;
        $div_id = &get_div_id($fields[5]); # Field 5 contains the morph analysis
	for($m=2;$m<$total_fields;$m++) {
          $row_indx = $m-1;
          if (!$fields[$m]) { $fields[$m] = "-";}
	  if($m == 2) {
            print "<table border=\"\">\n";
	    if($wordindx==0) {
		print"<tr class=\"row$row_indx\" style=\"border-right:dashed;\"><td class=\"number\"><a href=\"$shloka.jpg\"  onmouseout=\"UnTip()\" onmouseover=\"Tip('<center><img src=$shloka.jpg></center>',FONTSIZE,'18pt',HEIGHT,400,STICKY,true,CLOSEBTN,true) \">".$shloka.".".chr(65+$wordindx)."</a></td><td class=\"$div_id\">".$fields[$m]."</td></tr>\n";
	    } else { print "<tr class=\"row$row_indx\"><td class=\"$div_id\">".$fields[$m]."</td></tr>\n"; 
            }
           }
# elsif($m == 6){ #new code added by Karunakar for Apt=dic integration
	   # if($wordindx==0) {
#		print"<tr class=\"row$row_indx\" style=\"border-right:dashed;\"><td class=\"number\">".$shloka.".".chr(65+$m-2)."</a></td><td class=\"$div_id\">".$fields[$m]."</td></tr>\n";
#            } else {
#		$d = $fields[$m];
#		$d =~ s/{(.*)}//g;
#		$d =~ s/[0-9a-zA-Z.]//g;
#		print"<tr class=\"row$row_indx\"><td class=\"$div_id\"><a href=\"javascript:show('$d')\">".$fields[$m]."</a></td></tr>\n";
#           }
#           } 
	    elsif($m == 9) {#compound tagging
	    if($wordindx==0) {
		print"<tr class=\"row$row_indx\" style=\"border-right:dashed;\"><td class=\"number\">".$shloka.".".chr(65+$m-2)."</a></td><td class=\"$div_id\">".$fields[$m]."</td></tr>\n";
            } else {
                if ($fields[$m] =~ /</) {
		   open(TMP,">samaasa$compound");
		   print TMP $fields[$m];
		   close(TMP);
		   system ("$SCLINSTALLDIR/MT/prog/reader_generator/get_dot.pl < samaasa$compound | dot -Tjpg -o samaasa$compound.jpg; rm samaasa$compound");
		   print "<tr class=\"row$row_indx\"><td class=\"$div_id\"><a href=\"samaasa$compound.jpg\"  onmouseout=\"UnTip()\" onmouseover=\"Tip('<center><img src=samaasa$compound.jpg></center>',FONTSIZE,'18pt',HEIGHT,300,STICKY,true,CLOSEBTN,true) \">".$fields[$m]."</a></td></tr>\n";
		   $compound++;
		} else {
	           print "<tr class=\"row$row_indx\"><td class=\"$div_id\">-</td></tr>\n"; 
                }
            }
	  } else{
	    if($wordindx==0) {
		print"<tr class=\"row$row_indx\" style=\"border-right:dashed;\"><td class=\"number\">".$shloka.".".chr(65+$m-2)."</a></td><td class=\"$div_id\">".$fields[$m]."</td></tr>\n";
            } else {
		print"<tr class=\"row$row_indx\"><td class=\"$div_id\">".$fields[$m]."</td></tr>\n";
	    }
	  }
        }
    print "</table>\n";
  }
}
&footer;

sub get_div_id {
 my($in) = @_;
 my($id);
 $id = "";
 if($in !~ /^[0-9]/ and $in =~ /([1-8];)/){
	$id = "n".$1;
	$id =~ s/;//g;
 }
 if($in !~ /^[0-9]/ and $in =~ /कर्तरि/){ $id = "v"; }
 if($in !~ /^[0-9]/ and $in =~ /कर्मणि/){ $id = "v"; }
 if($in !~ /^[0-9]/ and $in =~ /अव्य/){ $id = "NA"; }
 if($in !~ /^[0-9]/ and $in =~ /क्त्वा/){ $id = "NA"; }
 if($in !~ /^[0-9]/ and $in =~ /ल्यप्/){ $id = "NA"; }
 if($in !~ /^[0-9]/ and $in =~ /तुमुन्/){ $id = "NA"; }
 $id;
}
1;
