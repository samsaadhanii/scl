#!/usr/bin/perl

$fbn = $ARGV[0];
$TFPATH = $ARGV[1];
$outscript = $ARGV[2];
$CGIURL = $ARGV[3];
if($ARGV[4] == "anvaya") {$anvaya = 1;} else {$anvaya = 0;}

print <<header
<?xml version="1.0"?>
header
;

print <<NAVIGATION
<div id="navigation">
<form action="" onsubmit="goto_section(); return false;">
<p><center>
<a id="about" href="/scl/SHMT/about.html" target="_new">About</a>
<a id="help" href="/scl/SHMT/anu_help.html" target="_new">Help</a>
<input type="hidden" name="no_of_rows" value="10"/>
<input type="button" value="Show/Hide Rows..." onclick="window.open('/scl/SHMT/rows.html','ShowHideRowsWindow','top=200,left=200,height=500,width=300,location=no,menubar=no,toolbar=no,directories=no,statusbar=no');"/>
<input type="checkbox" name="border_value" onchange="toggle_borders()"/>Borders
<a href="/scl/SHMT/DEMO/./tmp_$fbn/table.xlsx">Save Annotation</a> 
<a href="/cgi-bin/scl/skt_gen/Sentence/gen.cgi?filename=$TFPATH/table.tsv">Generate</a>
</center></p>
</form>
</div>
<div class="float_clear"/>
NAVIGATION
;

$word = 1;
@in = <STDIN>;
if ($anvaya == 1) {@new_in = &get_anvaya_order(@in);} else {@new_in = @in;}
#@new_in = @in;
for ($k = 1; $k <=$#in; $k++) {
$in = $new_in[$k];
chomp($in);
@flds = split(/\t/,$in);

print "<table cellspacing=\"0\" border=\"0\">\n";
foreach ($i=1;$i<=$#flds;$i++){
  print "<tr class=\"row",$i,"\">\n";
  if($word == 1) {
    print "<td class=\"number\">\n";
    if($i == 1) {
      print "<a href=\"/",$CGIURL,"/scl/SHMT/prog/interface/call_parser_summary.cgi?filename=",$TFPATH,"\&amp;outscript=",$outscript,"&rel=''&sentnum=1&save=no&translate=no\"  onmouseover=\"Tip('<img src=/scl/SHMT/DEMO/tmp_",$fbn,"/1.1.svg >' ,FONTSIZE,'18pt',HEIGHT,400,WIDTH,1200,STICKY,true,CLOSEBTN,true)\" onmouseout=\"UnTip()\">\n";
    }
    if ($i == 3) { 
      print "<a href=\"/",$CGIURL,"/scl/SHMT/prog/interface/show_graph.cgi?filename=./tmp_",$fbn,"/&sentnum=1\"  onmouseover=\"Tip('<img src=/scl/SHMT/DEMO/tmp_",$fbn,"/1.svg >' ,FONTSIZE,'18pt',HEIGHT,400,WIDTH,1200,STICKY,true,CLOSEBTN,true)\" onmouseout=\"UnTip()\">\n";
    }
    print "<span Onclick=\"toggle();\">\n";
    print $flds[0],".",chr(64+$i),"\n";
    print "<\/span>\n";
    if (($i == 1) || ($i == 4)) { print "<\/a>";}
    print "<\/td>\n";
  }
  $color_code = &color_code($flds[5]);
  print "<td class=\"",$color_code,"\">\n";
  
  if (($i==3) || ($i ==5)) {
   @ana = split(/\//,$flds[$i]);
   for ($j=0;$j<=$#ana;$j++) {
   $ana[$j] =~ s/\(([^ ]*[_\-])?([^0-9\- ]+)([0-9]*)[ ]/\($1<a href="javascript:show('$2','$outscript')">$2$3<AAA>/g;
   $ana[$j] =~ s/^([^ ]*[_\-])?([^0-9\- ]+)([0-9]*)[ ]/$1<a href="javascript:show('$2','$outscript')">$2$3<AAA>/;
   $ana[$j] =~ s/\/([^ ]*[_\-])?([^0-9\- ]+)([0-9]*)[ ]/\/$1<a href="javascript:show('$2','$outscript')">$2$3<AAA>/g;
   $ana[$j] =~ s/<AAA>/<\/a> /g;
   print $ana[$j];
   if($j < $#ana) { print "\/";}
   }
  } else { print $flds[$i];}
  print "<\/td>\n";
}
  print "<\/table>\n";
  $word++;
}

sub color_code{
  my($in) = @_;
  my($colorcode) = "-";
   #print "in = $in\n";
   if($in =~ /पुं;([1-8])/) { $colorcode = "N$1";}
   elsif($in =~ /स्त्री;([1-8])/) { $colorcode = "N$1";}
   elsif($in =~ /कर्तरि/) { $colorcode = "KP";}
   elsif($in =~ /कर्मणि/) { $colorcode = "KP";}
   elsif($in =~ /भावे/) { $colorcode = "KP";}
   elsif($in =~ /वर्गः:अव्य्/) { $colorcode = "NA";}
  $colorcode;
}
1;

sub get_anvaya_order {
 my(@in) = @_;
 my(@new_in);
 for ($i=1;$i<=$#in;$i++) {
  @flds = split('\t',$in[$i]);
  $new_in[$flds[2]] = $in[$i];
 }
@new_in;
}
#1;