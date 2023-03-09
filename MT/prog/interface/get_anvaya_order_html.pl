#!/usr/bin/perl

$fbn = $ARGV[0];
$TFPATH = $ARGV[1];
$outscript = $ARGV[2];
$CGIURL = $ARGV[3];
$HERITAGE_CGI = $ARGV[4];
if($ARGV[5] eq "A") {$anvaya = 1;} else {$anvaya = 0;}

print <<header
<?xml version="1.0"?>
<div id="navigation">
<form action="" onsubmit="goto_section(); return false;">
<p><center>
<a id="logo" href=\"/scl/index.html\"><font color=\"DarkBlue\"> संसाधनी-Saṃdha </font></a>
<a id="about" href="/scl/MT/about.html" target="_new">About</a>
&nbsp; &nbsp; &nbsp; &nbsp;
<a id="help" href="/scl/MT/anu_help.html" target="_new">Help</a>
<input type="hidden" name="no_of_rows" value="8"/>
<input type="button" value="Show/Hide Rows..." onclick="window.open('/scl/MT/rows.html','ShowHideRowsWindow','top=200,left=200,height=500,width=300,location=no,menubar=no,toolbar=no,directories=no,statusbar=no');"/>
<input type="checkbox" name="border_value" onchange="toggle_borders()"/>Borders
<a href="/scl/MT/DEMO/./tmp_$fbn/table.xlsx">Save Annotation</a> 
&nbsp; &nbsp; &nbsp; &nbsp;
<a href="/cgi-bin/scl/skt_gen/Sentence/gen.cgi?filename=$TFPATH/table_dev.tsv">Generate</a> 
&nbsp; &nbsp; &nbsp; &nbsp;
header
;

$pid = $fbn;
$pid =~ s/^in//;

if($anvaya == 1) {
print "<a href=\"/cgi-bin/scl/MT/toggle_order.cgi?out_encoding=$outscript&pid=$pid&order=S\">Shloka Order</a> \n";
} else {
print "<a href=\"/cgi-bin/scl/MT/toggle_order.cgi?out_encoding=$outscript&pid=$pid&order=A\">Anvaya Order</a> \n";
}

print <<header1
</center></p>
</form>
</div>
<div class="float_clear"/>
header1
;

@in = <STDIN>;
if ($anvaya == 1) {@new_in = &get_anvaya_order(@in);} else {@new_in = @in;}
for ($word = 1; $word <$#in; $word++) {
$in = $new_in[$word];
chomp($in);

@flds = split(/\t/,$in);

print "<table cellspacing=\"0\" border=\"0\">\n";
foreach ($fld=1;$fld<=$#flds;$fld++){
   if ($fld == 1 || $fld > 2) {
      print "<tr class=\"row",$fld,"\">";
      if($word == 1) {
        print "<td class=\"number\">";
        if($fld == 1) { # words
          print "<a href=\"/",$CGIURL,"/scl/MT/prog/interface/call_parser_summary.cgi?filename=",$TFPATH,"\&amp;outscript=",$outscript,"&rel=''&sentnum=1&save=no&translate=no\"  onmouseover=\"Tip('<img src=/scl/MT/DEMO/tmp_",$fbn,"/1.svg >' ,FONTSIZE,'18pt',HEIGHT,400,WIDTH,900,STICKY,true,CLOSEBTN,true)\">\n";
        }
        if($fld == 3) { # sandhied words
          open(TMP,"<$TFPATH/sandhied_in$pid");
          $sentences = <TMP>;
          close(TMP);
          chomp($sentences);
          $sentences =~ s/ /\+/g;
          print "<a href=\"/$CGIURL/$HERITAGE_CGI?lex=MW\&cache=t\&st=t\&us=f\&font=deva\&cp=t\&text=$sentences\&t=WX\&topic=\&mode=b\&pipeline=f\">\n";
        }
        print "<span Onclick=\"toggle();\">";
        $sent_no = $flds[0];
        $sent_no =~ s/\.[0-9]+$//;
        print $sent_no,".",chr(64+$fld);
        print "<\/span>";
        if (($fld == 1) || ($fld == 3)) { print "<\/a>";}
        print "<\/td>";
      }
      print "<td class=\"",$flds[8],"\">";
  
      if (($fld==4) || ($fld==5)) {
       @ana = split(/\//,$flds[$fld]);
       for ($j=0;$j<=$#ana;$j++) {
          $ana[$j] =~ s/^([^0-9\-{]+)([0-9\-{])/<a href="javascript:show('$1','$outscript')">$1<\/a>$2/g;
          $ana[$j] =~ s/\-([^0-9\-{]+)([0-9\-{])/-<a href="javascript:show('$1','$outscript')">$1<\/a>$2/g;
          print $ana[$j];
          if($j < $#ana) { print "\/";}
       }
       print "<\/td><\/tr>\n";
      } else { print $flds[$fld]; print "<\/td><\/tr>\n";}
  }
}
        print "<tr class=\"row",$#flds+1,"\">";
        if($word == 1) { 
           print "<td class=\"number\">";
           print "<span Onclick=\"toggle();\">";
           print $sent_no,".",chr(64+$#flds+1);
           print "<\/span>";
           print "<\/td>";
        }
        print "<td class=\"$flds[8]\">";
        print "$flds[0]<\/td><\/tr>\n";
 	print "<\/table>\n";
}

sub get_anvaya_order {
 my(@in) = @_;
 my(@new_in, $indx);
 $indx = 1;
 for ($i=1;$i<=$#in;$i++) {
  @flds = split('\t',$in[$i]);
  $index{$flds[0]} = $indx;
  $indx++;
 }
 for ($i=1;$i<=$#in;$i++) {
  @flds = split('\t',$in[$i]);
  $indx = $index{$flds[2]};
  $new_in[$indx] = $in[$i];
 }
@new_in;
}
1;
