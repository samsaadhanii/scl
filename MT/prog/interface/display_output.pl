#!/usr/bin/env perl

#require "../paths.pl";

$SCLINSTALLDIR = $ARGV[0];
$TFPATH = $ARGV[1];
$out_encoding = $ARGV[2];
$pid = $ARGV[3];
$sub_pid = $ARGV[4];
$order = $ARGV[5]; # Prose or Shloka
$SCL_HTDOCS = $ARGV[6];
$SCL_CGI = $ARGV[7];

if($sub_pid eq "NIL") {
   $pid =~ /^(.*)_([0-9])$/;
   $pid = $1;
   $sub_pid = $2;
}

$CSSPATH = "/$SCL_HTDOCS/MT";
$CGIPATH = "/cgi-bin/$SCL_CGI/MT";

require "$SCLINSTALLDIR/converters/convert.pl";

$scl_conv = $SCLINSTALLDIR."/converters";
$my_converter = &get_conv($scl_conv, $out_encoding);

## Print Head
  if($sub_pid == 1) { &print_head;}
 
  &print_skt_hnd_tables ($TFPATH, $pid, $sub_pid, $order);

#Print Analysis Table

&print_ana ($ana,$pid, $sub_pid,$order);

####  Sub Routine ###
sub get_conv {
  my($sclconvpath, $enc) = @_;
 
  my($conv) = "";

 if ( $enc eq "IAST" ){ $conv="$sclconvpath/wx2utf8roman.out";
 } elsif ( $enc eq "DEV" ){ $conv="$sclconvpath/ri_skt | $sclconvpath/iscii2utf8.py 1"; }

$conv;
}
1;

## print Head
  sub print_head {
      print "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n
             <html><head><title>Anusaaraka</title>\n
      <META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=UTF-8\" />\n
      <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
      <link href=\"$CSSPATH/Sanskrit_style.css\" type=\"text/css\" rel=\"stylesheet\" />\n
      <link href=\"$CSSPATH/Sanskrit_hindi.css\" type=\"text/css\" rel=\"stylesheet\" />\n
      <link rel=\"stylesheet\" href=\"/$SCL_HTDOCS/css_files/sktmt.css\"/>\n
      <script src=\"$CSSPATH/script.js\" type=\"text/javascript\"></script>\n
      <script src=\"$CSSPATH/Sanskrit_hindi.js\" type=\"text/javascript\"></script>\n
      <link href=\"https://cdn.jsdelivr.net/npm/bootstrap\@5.2.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">
      <script src=\"https://cdn.jsdelivr.net/npm/bootstrap\@5.2.3/dist/js/bootstrap.bundle.min.js\"></script>

      <script type=\"text/javascript\">\n
         function show(word,encod){\n
         window.open('$CGIPATH/dict_options.cgi?word='+word+'&outencoding='+encod+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes');\n }\n 
      </script>
         <style>
          body { background-color: FFFED1;}
         </style>\n
      </head>
      <body onload=\"register_keys()\"> <script src=\"$CSSPATH/wz_tooltip.js\" type=\"text/javascript\"></script>\n
      <br>
      <div id=\"container\">
         <center>
         <div id=\"project-name\">
            <img src=\"/$SCL_HTDOCS/imgs/sktmt.jpg\" alt=\"anusaaraka logo\" />
         </div>
         </center>
      </div> <!-- project name div ends here-->

     <div id=\"line1\">
        <table width=\"100%\">
          <tr>
            <td width=\"10%\"> </td>
            <td width=\"65%\">
              <h3>
                <a href=\"/$SCL_HTDOCS\">
                  <font color=\"DarkBlue\">संसाधनी- Saṃsādhanī</font>
                </a>
              </h3>
            </td>
            <td text-align=\"center\" width=\"25%\">
              <font color=\"magenta\" size=\"3\">Updated on 17th Apr 2023</font>
            </td>
            <td text-align=\"right\"> </td>
          </tr>
    </table>
  </div>\n";
}
1;

## print Skt-Hnd table headers
    
  sub print_skt_hnd_table_hdrs {
     my ($orig) = @_;

      print " <tr><td width=\"50%\"> <div id=\"sanskrit-text\" style=\"height:35px; color:blue; overflow:scroll; border-style:solid; border-left-width:1px; border-top-width:1px; border-bottom-width:1px; border-right-width:1px;border-color:#C0C0C0;\">\n
      <div id=\"skt-title\" style=\"height:35px;background-color:gray;color:#FFFFFF;\"><center>";
      if ($out_encoding eq "IAST") { print "saṃskṛta-vākyam";} else { print "संस्कृत वाक्यम् ";}
      print "</center></div> \n";
      print "</div>\n<!--division for sanskrit texts ends here-->\n";

      print "<!--division for hindi texts starts here-->\n</td>";
      #print "<td width=\"20%\">";
      #print " <div id=\"anu-output\" style=\"height:35px;color: blue; overflow: scroll; border-style:solid; border-left-width:1px; border-top-width:1px; border-bottom-width:1px; border-right-width:1px;border-color:#C0C0C0;\">\n";
      #print "<div id=\"anu-title\" style=\"height:35px;background-color:gray;color:#FFFFFF;\"><center>";
      #if ($out_encoding eq "IAST") { print "vākya viśleṣaṇa";} else { print "वाक्य विश्लेषण";}
      #print "</center></div> \n";
      #print "</div></td>\n";

      print "<td width=\"50%\">";

      print " <div id=\"hindi-text\" style=\"height:35px;color: blue; overflow: scroll; border-style:solid; border-left-width:1px; border-top-width:1px; border-bottom-width:1px; border-right-width:1px;border-color:#C0C0C0;\">\n";
      print "<div id=\"hnd-title\" style=\"height:35px;background-color:gray;color:#FFFFFF;\"><center>";
      if ($out_encoding eq "IAST") { print "hindī translation";} else { print "हिन्दी-अनुवाद";}
      print "</center></div> \n";

      print "</div></td></tr>\n";
}
1;
## print Skt-Hnd tables
    
  sub print_skt_hnd_tables {
     my ($TFPATH, $pid,$sub_pid,$order) = @_;
     
      if ($sub_pid == 1){
         print "<div class=\"container mt-3\">\n";
         print "<table width=\"100%\" style=\"border-style:none;border-width:1px;border-color:#C0C0C0;\">\n";
         &print_skt_hnd_table_hdrs ("orig");
      }
      print "<tr>\n";

          #print " <td width=\"40%\" data-bs-toggle=\"collapse\" data-bs-target=\"#anuout$sub_pid\" style=\"cursor:pointer\"> <div id=\"sanskrit-text\" style=\"height:35px; color:blue; overflow:scroll; border-style:solid; border-left-width:1px; border-top-width:1px; border-bottom-width:1px; border-right-width:1px;border-color:#C0C0C0;\">\n";
          print " <td> <div id=\"sanskrit-text\" style=\"height:35px; color:blue; overflow:scroll; border-style:solid; border-left-width:1px; border-top-width:1px; border-bottom-width:1px; border-right-width:1px;border-color:#C0C0C0;\">\n";

          $skt = "tmp_in".$pid."_".$sub_pid."/wor.".$pid."_".$sub_pid;
          print "<a href=\"#anuout$sub_pid\" data-bs-toggle=\"collapse\">";
          print "$sub_pid. ";
          print "</a>\n";
          if($order eq "Sloka") {
             if ($out_encoding eq "IAST") { print "(mūlam) ";} else { print "(मूलम्) ";} 
          }
          system("cat $TFPATH/$skt | sed 's/\- \-/\-/g' | $my_converter ");
          print "</div>\n<!--division for sanskrit orig text ends here-->\n";

       if($order eq "Sloka") {
         print " <div id=\"sanskrit-text\" style=\"height:35px;color:red; overflow: scroll; border-style:solid; border-left-width:1px; border-top-width:1px; border-bottom-width:1px; border-right-width:1px;border-color:#C0C0C0;\">\n";
         $skt = "tmp_in".$pid."_".$sub_pid."/anvaya_in".$pid."_".$sub_pid;
         print "<a href=\"#anuoutsloka$sub_pid\" data-bs-toggle=\"collapse\">";
         print "$sub_pid. ";
         print "</a>\n";
         if ($out_encoding eq "IAST") { print "(anvayaḥ) ";} else { print "(अन्वयः) ";} 
         system("cat $TFPATH/$skt | sed 's/ \-/\-/g' | $my_converter ");
         print "</div>\n <!--division for sanskrit anvaya texts ends here-->\n";
       }
       print "</td>\n";

      print " <td width=\"40%\"> <div id=\"hindi-text\" style=\"height:35px; color:blue; overflow:scroll; border-style:solid; border-left-width:1px; border-top-width:1px; border-bottom-width:1px; border-right-width:1px;border-color:#C0C0C0;\">\n";

       $hnd = "in".$pid."_".$sub_pid."_trnsltn";
       print "$sub_pid. ";
          if($order eq "Sloka") {
            if ($out_encoding eq "IAST") { print "(mūlam) ";} else { print "(मूलम्) ";} 
          }
       system("cat $TFPATH/$hnd| sed 's/\- /-/' ; echo '<br \/>'");

       print "</div>\n<!--division for Hindi text ends here-->\n";

       if($order eq "Sloka") {
          print " <div id=\"hindi-text\" style=\"height:35px;color:red; overflow: scroll; border-style:solid; border-left-width:1px; border-top-width:1px; border-bottom-width:1px; border-right-width:1px;border-color:#C0C0C0;\">\n";
          $hnd = "tmp_in".$pid."_".$sub_pid."/anvaya_in".$pid."_".$sub_pid."_trnsltn";
          print "$sub_pid. ";
          if ($out_encoding eq "IAST") { print "(anvayaḥ) ";} else { print "(अन्वयः) ";} 
          system("cat $TFPATH/$hnd| sed 's/\- /-/' ; echo '<br \/>'");
          print "</div>\n";
       }

      print "</td>\n";
      print "</tr>\n";
      print "<tr><td colspan=\"3\"></td></tr>\n";
      print "<tr><td colspan=\"3\"></td></tr>\n";
      print "<tr><td colspan=\"3\"></td></tr>\n";
}
1;

 sub print_ana{
      my($ana,$pid,$sub_pid,$order) = @_;

        print "<tr><td colspan=\"3\" id=\"anuout$sub_pid\" class=\"collapse\">\n";
        $ana = "shloka_in".$pid."_".$sub_pid.".html";
        system("cat $TFPATH/$ana");
        print "</td></tr>\n";

        if($order eq "Sloka") {
         print "<tr><td colspan=\"3\" id=\"anuoutsloka$sub_pid\" class=\"collapse\">\n";
         $ana = "anvaya_in".$pid."_".$sub_pid.".html";
         system("cat $TFPATH/$ana");
         print "</td></tr>\n";
        }
}
1;
