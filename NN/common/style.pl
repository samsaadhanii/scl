#!/usr/bin/env perl -w

#This has the definitions for style required by an html file


require "../../paths.pl";

package NN;

$NN::style_header = "<!DOCTYPE html>
<html>
<head>
<meta charset=\"UTF-8\">
<meta http-equiv=\"CONTENT-TYPE\" content=\"text/html; charset=UTF-8\">
<title>Nyaayacitradeepika</title>
<link rel=\"stylesheet\" href=\"/$GlblVar::SCL_HTDOCS/NN/css_files/bootstrap.min.css\">
<link rel=\"stylesheet\" href=\"/$GlblVar::SCL_HTDOCS/NN/css_files/bootstrap-theme.min.css\">
<link rel=\"stylesheet\" href=\"/$GlblVar::SCL_HTDOCS/css_files/menu.css\">
<link rel=\"stylesheet\" href=\"/$GlblVar::SCL_HTDOCS/css_files/samsaadhanii.css\">
<script src=\"/$GlblVar::SCL_HTDOCS/NN/js_files/jquery.min.js\"></script>
<script src=\"/$GlblVar::SCL_HTDOCS/NN/js_files/bootstrap.min.js\"></script>
<script src=\"/$GlblVar::SCL_HTDOCS/NN/js_files/jquery.autosize.js\"></script>
<style>
.head_div{background:none repeat scroll 0px 0px #5678AA; color:#fff;}
h3{margin-top:2px !important; font-size:30px;}
.head_div p{font-size:16px !important; }
.text div{padding:5px;}
.list-inline {font-size:18px;}
.text{padding:75px 0 ; }
input[type=\"submit\"]{width:200px;}
select{width:178px !important; padding:3px !important;}
.text{font-size:18px;}
/*body{background:none repeat scroll 0px 0px #F5F4F2 !important;}
.container{background:#fff !important;}*/
.tooltip-inner { font-size : 16px ;}
#navigation {
             position: relative;
	     margin-top:10%;
	     margin-left:auto;
	     margin-right:auto;
             background: white;
             border-top: ridge;
             /*bottom: 10%;*/
             width: 100%;
         }
         #tables {
            position: relative;
            margin-left:150px;
            margin-top:10px;
	    border-style:solid;
	    border-width:1px;
	    border-color:#FFFFFF;
         }
         table{
            float:left;
         }
         td.relation{ 
           padding-left: 3px;
           padding-right: 3px;
           border-left: solid 2px black;
           text-align:center;
           background-color: lightgreen 
         }
         td.concept{ 
           padding-left: 3px;
           padding-right: 3px;
           border-left: solid 2px black;
           text-align:center;
           background-color: lightblue
         }
</style>
<script>
	\$(document).ready(function(){
	 \$('textarea').autosize();
    });
</script>
</head>
<body>";

sub tail {
 my($ans) = @_;
 my($ans1) = $ans;
 $ans1 =~ s/</&lt;/g;
 $ans1 =~ s/>/&gt;/g;
 $ans1 =~ s/:[0-9]+//g;
 $ans1 =~ s/\-\^/\^/;
 print "<div id = \"navigation\"><center> Constituency parse:$ans1 <br />";
        print "<a href=\"/cgi-bin/$GlblVar::SCL_CGI/NN/CG/generate.cgi?nne=$ans&amp;type=C\" target=\"_blank\">View Conceptual Graph</a><br />";
        print "<a href=\"/cgi-bin/$GlblVar::SCL_CGI/NN/CG/generate.cgi?nne=$ans&amp;type=R\" target=\"_blank\">View Compressed Conceptual Graph</a><br />";
        print "<a href=\"/cgi-bin/$GlblVar::SCL_CGI/NN/Type_identifier/generate.cgi?nne=$ans1;\" target=\"_blank\">Compound Type-identifier</a><br />";
 print "<a href=\"/$GlblVar::SCL_CGI/NN/segmenter/index.html\">Try Another<\/a></center>
        <br />
</div>
<font color=\"black\"><font style=\"background-color:white;\">";
}
1;

$NN::title = "<div class=\"container-full\">

<header class=\"head_div col-md-12\">
    <div class=\"col-md-6 text-right\"><h2><a class=\"link\" href=\"/$GlblVar::SCL_CGI/NN/segmenter/index.html\"><font color=\"white\">न्यायचित्रदीपिका</font></a></h2>
    <p>A Segmenter for Navya-Nyāya Expressions</p>
        </div>
<div class=\"col-md-6 text-left\"><h2><a class=\"link\" href=\"/$GlblVar::SCL_CGI/index.html\"><font color=\"white\">संसाधनी-Saṃsādhanī  </font></a></h2>
    <p>Department of Sanskrit Studies, University of Hyderabad.</p>
    </div>

</header>
<section id=\"inputarea\">
<div class=\"container-full\">
<div class=\"col-md-12 text-center text\">
<ul class=\"list-inline\">";

$NN::instructions = "<span>Semi-Automatic Parser</span><br /> 
	<span> Columns in <b><font color=\"lightgreen\">lightgreen</font></b> correspond to the relation terms</span><br />
	<span> The anuyogin (अनु) of a relation is a <b><font color=\"lightblue\">concept term</font></b> to its right.</span><br />
	<span>To get the parse, manually select the anuyogin for each relation term.</span><br /> ";


$NN::style_tail = "<font color=\"white\" size=2>
<center>
    
    <footer>
        <div class=\"col-md-12 copy-info copyright-lb tail nav\">
            <span class=\"cons link\">© 2012-19  Arjuna S.R. &amp; <a href=\"http://sanskrit.uohyd.ac.in/faculty/amba\" class=\"link\"><font color=\"darkblue\">Amba Kulkarni</font></a></span>
        </div>
    
    </footer>
</center>
 <div class=\"col-md-6 text-left\">
    <a href=\"http://validator.w3.org/check?uri=referer\"><img
        src=\"/$GlblVar::SCL_HTDOCS/imgs/w3c.jpg\"
        alt=\"Valid XHTML 1.0 Transitional\" height=\"31\" width=\"\" style=\"border-style:none;\" /></a>
  </div>
<!-- <img src=\"http://scl.samsaadhanii.in/cgi-bin/Count.cgi?ft=0&df=sample.dat\" alt=\"Count\"> -->
    
 <div class=\"col-md-6 text-right\">
<!-- Start of StatCounter Code for Default Guide -->
<script type=\"text/javascript\" src=\"/$GlblVar::SCL_HTDOCS/statcounter_dummy.js\">
</script>
<noscript><div class=\"statcounter\"><a title=\"web analytics\" href=\"http://statcounter.com/\" target=\"_blank\"><img class=\"statcounter\" src=\"https://c.statcounter.com/8421849/0/34917efe/0/\" alt=\"web analytics\"></a></div></noscript>
<!-- End of StatCounter Code for Default Guide -->
 </div>
</body>
</html>";
