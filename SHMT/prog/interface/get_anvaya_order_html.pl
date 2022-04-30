#!/usr/bin/perl

$fbn = $ARGV[0];
$TFPATH = $ARGV[1];
$outscript = $ARGV[2];
$CGIURL = $ARGV[3];
if($ARGV[4] eq "A") {$anvaya = 1;} else {$anvaya = 0;}

print <<header
<?xml version="1.0"?>
<div id="navigation">
<form action="" onsubmit="goto_section(); return false;">
<p><center>
<a id="about" href="/scl/SHMT/about.html" target="_new">About</a>
<a id="help" href="/scl/SHMT/anu_help.html" target="_new">Help</a>
<input type="hidden" name="no_of_rows" value="8"/>
<input type="button" value="Show/Hide Rows..." onclick="window.open('/scl/SHMT/rows.html','ShowHideRowsWindow','top=200,left=200,height=500,width=300,location=no,menubar=no,toolbar=no,directories=no,statusbar=no');"/>
<input type="checkbox" name="border_value" onchange="toggle_borders()"/>Borders
<a href="/scl/SHMT/DEMO/./tmp_$fbn/table.xlsx">Save Annotation</a> 
<a href="/cgi-bin/scl/skt_gen/Sentence/gen.cgi?filename=$TFPATH/table.tsv">Generate</a>
</center></p>
</form>
</div>
<div class="float_clear"/>
header
;

@in = <STDIN>;
if ($anvaya == 1) {@new_in = &get_anvaya_order(@in);} else {@new_in = @in;}
for ($word = 1; $word <=$#in; $word++) {
$in = $new_in[$word];
chomp($in);

@flds = split(/\t/,$in);

print "<table cellspacing=\"0\" border=\"0\">\n";
foreach ($fld=1;$fld<=$#flds;$fld++){
   if ($fld == 1 || $fld > 3) {
      print "<tr class=\"row",$fld,"\">";
      if($word == 1) {
        print "<td class=\"number\">";
        if($fld == 1) { # index
          print "<a href=\"/",$CGIURL,"/scl/SHMT/prog/interface/call_parser_summary.cgi?filename=",$TFPATH,"\&amp;outscript=",$outscript,"&rel=''&sentnum=1&save=no&translate=no\"  onmouseover=\"Tip('<img src=/scl/SHMT/DEMO/tmp_",$fbn,"/1.1.svg >' ,FONTSIZE,'18pt',HEIGHT,400,WIDTH,900,STICKY,true,CLOSEBTN,true)\">\n";
        }
        print "<span Onclick=\"toggle();\">";
        print "1.",chr(64+$fld);
        print "<\/span><\/a>";
        print "<\/td>";
      }
      $color_code = &color_code($flds[5]);
      print "<td class=\"",$color_code,"\">";
  
      if (($fld==4) || ($fld==5)) {
       @ana = split(/\//,$flds[$fld]);
       for ($j=0;$j<=$#ana;$j++) {
          $ana[$j] =~ s/^([^{0-9]+)([0-9]?){/<a href="javascript:show('$1','$outscript')">$1$2<\/a>{/;
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
           print "1.",chr(64+$#flds+1);
           print "<\/span>";
           print "<\/td>";
        }
        print "<td class=\"$color_code\">";
        print "$flds[0]<\/td><\/tr>\n";
 	print "<\/table>\n";
}

sub color_code{
  my($in) = @_;
  my($colorcode) = "-";
   #print "in = $in\n";
   if($in =~ /पुं;([1-8])/) { $colorcode = "N$1";}
   elsif($in =~ /स्त्री;([1-8])/) { $colorcode = "N$1";}
   elsif($in =~ /सर्वनाम;([1-8])/) { $colorcode = "N$1";}
   elsif($in =~ /कर्तरि/) { $colorcode = "KP";}
   elsif($in =~ /कर्मणि/) { $colorcode = "KP";}
   elsif($in =~ /भावे/) { $colorcode = "KP";}
   elsif($in =~ /अव्य;/) { $colorcode = "NA";}
   elsif($in =~ /अव्य}/) { $colorcode = "NA";}
   elsif($in =~ /puṃ;([1-8])/) { $colorcode = "N$1";}
   elsif($in =~ /strī;([1-8])/) { $colorcode = "N$1";}
   elsif($in =~ /sarvanāma;([1-8])/) { $colorcode = "N$1";}
   elsif($in =~ /kartari/) { $colorcode = "KP";}
   elsif($in =~ /karmaṇi/) { $colorcode = "KP";}
   elsif($in =~ /bhāve/) { $colorcode = "KP";}
   elsif($in =~ /avya;/) { $colorcode = "NA";}
   elsif($in =~ /avya}/) { $colorcode = "NA";}
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
1;
