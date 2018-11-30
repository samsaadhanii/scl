#!/usr/bin/env perl

$CSSPATH = "/scl/SHMT/";
$CGIPATH = "/cgi-bin/scl/SHMT/";

$SCLINSTALLDIR = $ARGV[0];
$TFPATH = $ARGV[1];
$out_encoding = $ARGV[2];
$pid = $ARGV[3];

require "$SCLINSTALLDIR/converters/convert.pl";

if ( $out_encoding eq "IAST" ){
 $my_converter="$SCLINSTALLDIR/converters/wx2utf8roman.out";
 $my_converter_wxHindi="$SCLINSTALLDIR/converters/wx2utf8roman.out";
}

if ( $out_encoding eq "DEV" ){
  $my_converter="$SCLINSTALLDIR/converters/ri_skt | $SCLINSTALLDIR/converters/iscii2utf8.py 1";
  $my_converter_wxHindi="$SCLINSTALLDIR/converters/ri | $SCLIINSTALLDIR/converters/iscii2utf8.py 1";
}

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
      window.open('$CGIPATH/options1.cgi?word='+word+'&outencoding='+encod+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes');\n }\n </script>
      <style>
       body { background-color: FFFED1;}
      </style>
      </head>\n
      <body onload=\"register_keys()\"> <script src=\"$CSSPATH/wz_tooltip.js\" type=\"text/javascript\"></script>\n
      <!-- Main division starts here -->\n
      <div id=\"main-division\" style=\"width:100%;margin-top:5px; border-style:none;border-width:1px;position:relative;height:490px;\">\n
      <table width=\"99%\" style=\"border-style:none;border-width:1px;border-color:#C0C0C0;position:absolute;margin-left:5px;margin-right:5px;\"><tr>\n
      <!--division for sanskrit texts stars here-->\n
      <td width=\"50%\"> <div id=\"sanskrit-text\" style=\"width:665px; height:100px; color:blue; overflow:auto; border-style:solid; border-left-width:1px; border-top-width:1px; border-bottom-width:1px; border-right-width:1px;border-color:#C0C0C0;\">\n
      <div id=\"skt-title\" style=\"height:25px;background-color:gray;color:#FFFFFF;\"><center> संस्कृतवाक्यम्/वाक्यानि</center></div> \n";

      open(TMP1,"<$TFPATH/tmp_in$pid/wor.$pid") || die "can't open $TFPATH/tmp_in$pid/wor.$pid";
      $sent_no = 1;
      $word_no = 1;
      $in = <TMP1>;
      #$in =~ s/।/ ।/g;
      #$in =~ s/#//g;
      $in =~ s/\./ \./g;
      $in = `echo "$in" | $my_converter`;
      chomp($in);
      @in = split(/।/,$in);
      foreach $in (@in) {
        chomp($in);
        if($in) {
         print $sent_no,".",$word_no," ",$in,"<br>";
         $sent_no++;
        }
      }
      close(TMP1);

      print "</div>\n<!--division for sanskrit texts ends here-->\n<!--division for hindi texts starts here-->\n
      </td><td width=\"50%\">
      <div id=\"hindi-text\" style=\"width:100%;height:100px;color: blue; overflow: auto; border-style:solid; border-left-width:1px; border-top-width:1px; border-bottom-width:1px; border-right-width:1px;border-color:#C0C0C0;\">\n
      <div id=\"hnd-title\" style=\"height:25px;background-color:gray;color:#FFFFFF;\"><center> हिन्दी-अनुवाद</center></div> \n";

      system("cat $TFPATH/in${pid}_trnsltn");

      print "</td></tr>\n
      <!--division for hindi texts ends here-->\n</table>\n<br>\n 
      <!--division for Anusaaraka output starts here-->\n
      <div id=\"anusaaraka-output\" style=\"width:99%;min-height:320px; margin-left:5px;margin-right:5px;border-style:solid;border-width:1px; overflow:auto; position:absolute; margin-top:110px;border-color:#C0C0C0;\">\n
      <div id=\"skt-title\" style=\"height:25px;background-color:gray;color:#FFFFFF;font-size:15px;width:100%;\"><center> वाक्यविश्लेषणम्</center></div> \n
      <br /> <font color=\"red\">Below we give the step by step analysis of the input. By default only three rows with the original Sanskrit sentence, relevant morph analysis and the Hindi translation are shown. <br/> You can hide/open other rows using the <font color=\"green\">Show/Hide Rows button</font> at the bottom. The color of each cell indicates the vibhakti / category of the word. Details of color coding are available <a target=\"_blank\" href=\"/scl/SHMT/anu_help.html#sec1.4\">here</a>. <br /> If you bring the cursor on the sentence ID, you will see the <font color=\"green\">parsed tree (Kaaraka Analysis)</font> for the given sentence. Clicking on this link will show you all the possible parses. <br /> Finally each word is linked to the <font color=\"green\">Apte's dictionary</font>. The link is available along with the morph analysis displayed in row C.</font><br /> <br />";

      system("cat $TFPATH/in${pid}.html");
      print "</body></html>";
