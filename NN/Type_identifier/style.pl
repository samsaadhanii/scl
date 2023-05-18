#!/usr/bin/env perl -w

#This has the definitions for style required by an html file

require "../../paths.pl";

$style_header = "<!DOCTYPE html>
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
</style>
<script>
	\$(document).ready(function(){
	 \$('textarea').autosize();
	
    	  \$('.list-inline a').tooltip({
        placement : 'top'
    });
});
        \$(\"form\").submit(function(){
                if(\$(\"#encoding\").val() == \"\"){
                        \$(\"#encoding\").focus();
                        return false;
                }else if(\$(\"#text\").val() ==\"\"){
                        \$(\"#text\").focus();
                        return false;
                }
                else{
                        return  check();
                }
        });
</script>
</head>
<body>";

#sub tail {
# my($output,$file) = @_;
# print "<center><div id=\"navigation\">
#        <p >Type: $output</p></div>
#        <a href=\"http://localhost/$GlblVar::SCL_HTDOCS/NN/segmenter/index.html\">Try Another<\/a>
#        </div></center></body></html>";
#}
#1;

$title = "<div class=\"container-full\">

<header class=\"head_div col-md-12 text-center\">
	<h3>न्यायचित्रदीपिका</h3>
	<p>A Type-identifier for Navya-Nyaya Expressions</p>
	<p>Department of Sanskrit Studies, University of Hyderabad.</p>
	<h3><a href=\"/$GlblVar::SCL_HTDOCS/\">Samsaadhanii</a></h3>
</header> 
<section id=\"inputarea\">
<div class=\"container\">
<div class=\"col-md-12 text-center text\">";
