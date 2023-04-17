#!/usr/bin/env perl

require "../../../paths.pl";

$CSSPATH = "/$GlblVar::SCL_HTDOCS/MT";
$CGIPATH = "/cgi-bin/$GlblVar::SCL_CGI/MT";

$pid = $ARGV[0];
$TFPATH = $ARGV[1];
#print "TFPATH=$TFPATH\n";
#print "pid=$pid\n";

      print "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n
             <html><head><title>Anusaaraka</title>\n
      <META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=UTF-8\" />\n
      <link href=\"$CSSPATH/Sanskrit_style.css\" type=\"text/css\" rel=\"stylesheet\" />\n
      <link href=\"$CSSPATH/Sanskrit_hindi.css\" type=\"text/css\" rel=\"stylesheet\" />\n
      <script src=\"$CSSPATH/script.js\" type=\"text/javascript\"></script>\n
      <script src=\"$CSSPATH/Sanskrit_hindi.js\" type=\"text/javascript\"></script>\n
<!--       <script src=\"$CSSPATH/toggle.js\" type=\"text/javascript\"></script>\n  -->
      <script type=\"text/javascript\">\n
      function show(word,encod){\n
      window.open('$CGIPATH/dict_options.cgi?word='+word+'&outencoding='+encod+'','popUpWindow','height=500,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes');\n }\n </script>
      <style>
       body { background-color: FFFED1;}
      </style>
      </head>\n
      <body onload=\"register_keys()\"> <script src=\"$CSSPATH/wz_tooltip.js\" type=\"text/javascript\"></script>\n
      <div id=\"container\">\n
      <center>\n
      <div id=\"project-name\">\n
      <img src=\"/$GlblVar::SCL_HTDOCS/imgs/sktmt.jpg\" alt=\"anusaaraka logo\" style=\"width:300px\" />\n
    </div>\n
    </center>\n
    </div>\n
    <div id=\"line1\">
    <table width=\"100%\"><tr>
    <td width=\"80%\">
    <h3><a href=\"/$GlblVar::SCL_HTDOCS/index.html\"><font color=\"DarkBlue\"> संसाधनी-Saṃsādhanī </font></a></h3></td><td text-align=\"center\" width=\"20%\"><nt color=\"magenta\" size=\"3\">Updated on 27 Jan 2023</font></td><td text-align=\"right\">  </td></tr></table>
    </center>
    </div>

      <!-- Main division starts here -->\n
      <div id=\"main-division\" style=\"width:100%;margin-top:5px; border-style:none;border-width:1px;position:relative;height:490px;\">\n
      <!--division for Anusaaraka output starts here-->\n
      <div id=\"anusaaraka-output\" style=\"width:99%;min-height:320px; margin-left:5px;margin-right:5px;border-style:solid;border-width:1px; overflow:auto; position:absolute; margin-top:110px;border-color:#C0C0C0;\">\n
      <div id=\"skt-title\" style=\"height:25px;background-color:gray;color:#FFFFFF;font-size:15px;width:100%;\"><center> वाक्यविश्लेषणम्</center></div> \n
      <br /> <font color=\"red\">Below we give the step by step analysis of the input. By default only three rows with the original Sanskrit sentence, relevant morph analysis and the Hindi translation are shown. <br/> You can hide/open other rows using the <font color=\"green\">Show/Hide Rows button</font> at the bottom. The color of each cell indicates the vibhakti / category of the word. Details of color coding are available <a target=\"_blank\" href=\"/$GlblVar::SCL_HTDOCS/MT/anu_help.html#sec1.4\">here</a>. <br /> If you bring the cursor on the sentence ID, you will see the <font color=\"green\">parsed tree (Kaaraka Analysis)</font> for the given sentence. Clicking on this link will show you all the possible parses. <br /> Finally each word is linked to various dictionaries such as <font color=\"green\">Apte, Monier Williams, Heritage dictionary and Amarakosha</font>. The link is available along with the morph analysis displayed in row C and E.</font><br /> <br />";

      system("cat $TFPATH/in${pid}.html");
      print "</body></html>";
