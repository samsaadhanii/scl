#!/usr/bin/perl -w

#This has the definitions for style required by an html file


require "../../paths.pl";

$style_header = "<!DOCTYPE html>
<html>
<head>
<meta charset=\"UTF-8\">
<meta http-equiv=\"CONTENT-TYPE\" content=\"text/html; charset=UTF-8\">
<title>Nyaayacitradeepika</title>
<link rel=\"stylesheet\" href=\"/$GlblVar::SCL_HTDOCS/css_files/bootstrap.min.css\">
<link rel=\"stylesheet\" href=\"/$GlblVar::SCL_HTDOCS/css_files/bootstrap-theme.min.css\">
<link rel=\"stylesheet\" href=\"/$GlblVar::SCL_HTDOCS/css_files/menu.css\">
<link rel=\"stylesheet\" href=\"/$GlblVar::SCL_HTDOCS/css_files/samsaadhanii.css\">
<script src=\"/$GlblVar::SCL_HTDOCS/js_files/callcgiscripts.js\"></script>
<script src=\"/$GlblVar::SCL_HTDOCS/js_files/jquery.min.js\"></script>
<script src=\"/$GlblVar::SCL_HTDOCS/js_files/bootstrap.min.js\"></script>
<script src=\"/$GlblVar::SCL_HTDOCS/js_files/jquery.autosize.js\"></script>
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
	     margin-top:20%;
	     margin-left:auto;
	     margin-right:auto;
             background: white;
             border-top: ridge;
             bottom: 10%;
             width: 100%;
         }
         #tables {
            position: relative;
            margin-left:250px;
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
 $ans1 =~ s/\-\^/\^/;
 print "<div id = \"navigation\"><center> Constituency parse:$ans1 <br />";
        print "<a href=\"/cgi-bin/$GlblVar::SCL_CGI/NN/CG/generate.cgi?nne=$ans&amp;type=C\" target=\"_blank\">View Conceptual Graph</a><br />";
        print "<a href=\"/cgi-bin/$GlblVar::SCL_CGI/NN/CG/generate.cgi?nne=$ans&amp;type=R\" target=\"_blank\">View Compressed Conceptual Graph</a><br />";
        print "<a href=\"/cgi-bin/$GlblVar::SCL_CGI/NN/Type_identifier/generate.cgi?nne=$ans;\" target=\"_blank\">Type-identifier</a><br />";
 print "<a href=\"/$GlblVar::SCL_HTDOCS/NN/segmenter/index.html\">Try Another<\/a></center>
        <br />
</div>
</div>
<font color=\"black\"><font style=\"background-color:white;\">
</body></html>";
}
1;

$title = "<div class=\"container-full\">
<center>
<header class=\"head_div col-md-12 text-center\">
	<h3>न्यायचित्रदीपिका</h3>
	<p>A Constituency Parser for Navya-Nyaya Expressions</p>
	<p>Department of Sanskrit Studies, University of Hyderabad.</p>
	<h3><a href=\"/$GlblVar::SCL_HTDOCS/\">Samsaadhanii</a></h3>
</header> 
</center>";

$contribution = "<div class=\"tail\"> &nbsp; </div>
<div id=\"copyright-lb\">
<table>
<tr>
<td id=\"copy-verify\">
<p>
    <a href=\"http://validator.w3.org/check?uri=referer\"><img
        src=\"/$GlblVar::SCL_HTDOCS/images/w3c.jpg\"
        alt=\"Valid XHTML 1.0 Transitional\" height=\"31\" width=\"\" style=\"border-style:none;\" /></a>
</p>
</td>
<td id=\"copy-info\">
<center>
<p> <span class=\"cons\">© 2012-19 <a href=\"http://sanskrit.uohyd.ac.in/faculty/amba\">Arjuna S.R. &amp; Amba Kulkarni</a></span></p>
</center>
</td>
<td>
<center>
<p> <span class=\"cons1\"><a href=\"/$GlblVar::SCL_HTDOCS/contributors.html\">Contributors</a></span></p>
</center>
</td>
</tr>
</table>";

$instructions = "<span>Semi-Automatic Parser</span><br /> 
	<span> Columns in <b><font color=\"lightgreen\">lightgreen</font></b> correspond to the relation terms<br />
	<span> The anuyogin (अनु) of a relation is a <b><font color=\"lightblue\">concept term</font></b> to its right.</span><br />
	<span>To get the parse, manually select the anuyogin for each relation term.</span><br /> ";
