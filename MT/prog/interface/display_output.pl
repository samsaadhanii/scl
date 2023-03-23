#!/usr/bin/env perl

$CSSPATH = "/scl/MT/";
$CGIPATH = "/cgi-bin/scl/MT/";

$SCLINSTALLDIR = $ARGV[0];
$TFPATH = $ARGV[1];
$out_encoding = $ARGV[2];
$pid = $ARGV[3];
$sub_pid = $ARGV[4];
$order = $ARGV[5]; # S or A - for Shloka or Anvaya

require "$SCLINSTALLDIR/converters/convert.pl";

$scl_conv = $SCLINSTALLDIR."/converters";
$my_converter = &get_conv($scl_conv, $out_encoding);

## Print Head

&print_head;
 
print "<!-- Main division starts here -->\n
      <div id=\"main-division\" style=\"width:100%;margin-top:5px; border-style:none;border-width:1px;position:relative;height:490px;\">\n";

#for($i=1;$i<=$sub_pid+1;$i++) {
##print First table with Shlokas
#   $skt = "tmp_in".$pid."/wor.".$pid."_".$i;
#   $hnd = "in".$pid."_".$i."_trnsltn";
   &print_skt_hnd_tables ($TFPATH, $pid, $sub_pid,"orig");

#print Second table with Anvaya

#   $skt = "tmp_in".$pid."/anvaya_in".$pid."_".$i;
#   $hnd = "tmp_in".$pid."/anvaya_in".$pid."_".$i."_trnsltn";
   &print_skt_hnd_tables ($TFPATH, $pid,$sub_pid,"anvaya");


#Print Analysis Table

   &print_ana ($ana, $sub_pid,$order);

####  Sub Routine ###
sub get_conv {
  my($sclconvpath, $enc) = @_;
 
  my($conv) = "";

 if ( $enc eq "IAST" ){
   $conv="$sclconvpath/wx2utf8roman.out";
} elsif ( $enc eq "DEV" ){
   $conv="$sclconvpath/ri_skt | $sclconvpath/iscii2utf8.py 1";
}

$conv;
}
1;

## print Head
  sub print_head {
      print "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n
             <html><head><title>Anusaaraka</title>\n
      <META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=UTF-8\" />\n
      <link href=\"$CSSPATH/Sanskrit_style.css\" type=\"text/css\" rel=\"stylesheet\" />\n
      <link href=\"$CSSPATH/Sanskrit_hindi.css\" type=\"text/css\" rel=\"stylesheet\" />\n
      <script src=\"$CSSPATH/script.js\" type=\"text/javascript\"></script>\n
      <script src=\"$CSSPATH/Sanskrit_hindi.js\" type=\"text/javascript\"></script>\n
      <script src=\"$CSSPATH/toggle.js\" type=\"text/javascript\"></script>\n 
      <script type=\"text/javascript\">\n

      function show(word,encod){\n
      window.open('$CGIPATH/dict_options.cgi?word='+word+'&outencoding='+encod+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes');\n }\n </script>
      <style>
       body { background-color: FFFED1;}
      </style>
      </head>\n
      <body onload=\"register_keys()\"> <script src=\"$CSSPATH/wz_tooltip.js\" type=\"text/javascript\"></script>\n";

}
1;

## print Skt-Hnd tables
    
  sub print_skt_hnd_tables {
     my ($TFPATH, $pid,$sub_pid,$orig) = @_;
     my ($i); 

      print "<table width=\"99%\" style=\"border-style:none;border-width:1px;border-color:#C0C0C0;position:absolute;margin-left:5px;margin-right:5px;\"><tr>\n
      <!--division for sanskrit texts starts here-->\n";
      if($orig eq "orig") {
      print " <td width=\"50%\"> <div id=\"sanskrit-text\" style=\"height:100px; color:blue; overflow:auto; border-style:solid; border-left-width:1px; border-top-width:1px; border-bottom-width:1px; border-right-width:1px;border-color:#C0C0C0;\">\n
      <div id=\"skt-title\" style=\"height:25px;background-color:gray;color:#FFFFFF;\"><center>";
      if ($out_encoding eq "IAST") { print "saṃskṛta-vākyam";} else { print "संस्कृत वाक्यम् ";}
      print "</center></div> \n";
      } else {
      print "<td width=\"50%\"> <div id=\"sanskrit-text\" style=\"height:100px; color:red; overflow:auto; border-style:solid; border-left-width:1px; border-top-width:1px; border-bottom-width:1px; border-right-width:1px;border-color:#C0C0C0;\">\n
      <div id=\"skt-title\" style=\"height:25px;background-color:gray;color:#FFFFFF;\"><center>";
      if ($out_encoding eq "IAST") { print "saṃskṛta anvaya";} else { print "संस्कृत अन्वय";}
      print "</center></div> \n";
      }

      for($i=1;$i<=$sub_pid+1;$i++) {
       if($orig eq "orig") {
          $skt = "tmp_in".$pid."_".$i."/wor.".$pid."_".$i;
       }
       if($orig eq "anvaya") {
          $skt = "tmp_in".$pid."_".$i."/anvaya_in".$pid."_".$i;
       }
       print "$i.";
       system("cat $TFPATH/$skt | $my_converter; echo '<br \/>'");
     }

      print "</div>\n<!--division for sanskrit texts ends here-->\n<!--division for hindi texts starts here-->\n</td><td width=\"50%\">";

      if($orig eq "orig") {
          print " <div id=\"hindi-text\" style=\"height:100px;color: blue; overflow: auto; border-style:solid; border-left-width:1px; border-top-width:1px; border-bottom-width:1px; border-right-width:1px;border-color:#C0C0C0;\">\n";
      } else {
          print " <div id=\"hindi-text\" style=\"height:100px;color: red; overflow: auto; border-style:solid; border-left-width:1px; border-top-width:1px; border-bottom-width:1px; border-right-width:1px;border-color:#C0C0C0;\">\n";
      }
      print "<div id=\"hnd-title\" style=\"height:25px;background-color:gray;color:#FFFFFF;\"><center>";
      if ($out_encoding eq "IAST") { print "hindī translation";} else { print "हिन्दी-अनुवाद";}
      print "</center></div> \n";

      for($i=1;$i<=$sub_pid+1;$i++) {
       if($orig eq "orig") {
          $hnd = "in".$pid."_".$i."_trnsltn";
       }
       if($orig eq "anvaya") {
          $hnd = "tmp_in".$pid."_".$i."/anvaya_in".$pid."_".$i."_trnsltn";
       }
       print "$i.";
       system("cat $TFPATH/$hnd; echo '<br \/>'");
      }

      print "</div></td></tr>\n
      <!--division for hindi texts ends here-->\n</table>\n<br><br><br><br><br>\n ";
}
1;

 sub print_ana{
      my($ana,$sub_pid,$order) = @_;
      my($i);

      print "<!--division for Anusaaraka output starts here-->\n
      <div id=\"anusaaraka-output\" style=\"width:99%; margin-left:5px;margin-right:5px;border-style:solid;border-width:1px; overflow:auto; position:absolute; border-color:#C0C0C0;\">\n
      <div id=\"skt-title\" style=\"height:25px;background-color:gray;color:#FFFFFF;font-size:15px;width:100%;\"><center>";
      if ($out_encoding eq "IAST") { print "Sentential Analysis";} else { print "वाक्यविश्लेषणम्";} 
      print "</center></div> \n";
      #print "<br /> <font color=\"red\">Below we give the step by step analysis of the input. By default only three rows with the original Sanskrit sentence, relevant morph analysis and the Hindi translation are shown. <br/> You can hide/open other rows using the <font color=\"green\">Show/Hide Rows button</font> at the bottom. The color of each cell indicates the vibhakti / category of the word. Details of color coding are available <a target=\"_blank\" href=\"/scl/MT/anu_help.html#sec1.4\">here</a>. <br /> If you bring the cursor on the sentence ID, you will see the <font color=\"green\">parsed tree (Kaaraka Analysis)</font> for the given sentence. Clicking on this link will show you summary of all the possible parses. <br /> Finally each word is linked to the <font color=\"green\">Apte's Sanskrit-Hindi, Monier Williams's Sanskrit-English, Heritage Sanskrit-French dictionary and Amarakosha</font>. The link is available along with the morph analysis displayed in row C and E.</font><br /> <br />";

   for($i=1;$i<=$sub_pid+1;$i++) {
     if($order eq "A") {
        $ana = "anvaya_in".$pid."_".$i.".html";
     }

     if($order eq "S") {
        $ana = "shloka_in".$pid."_".$i.".html";
     }
      system("cat $TFPATH/$ana");
   }
      print "</body></html>";
}
1;
