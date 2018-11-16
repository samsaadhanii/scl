#!/usr/bin/env perl

use warnings;
# $NO_OF_ROWS -> defined in convert.pl
sub header {
my($NO_OF_ROWS) = @_;

print "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"  \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n
<html>

<head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
<link href=\"style.css\" type=\"text/css\" rel=\"stylesheet\" />
<link href=\"text.css\" type=\"text/css\" rel=\"stylesheet\" />
<script src=\"script.js\" type=\"text/javascript\"></script>
<script src=\"text.js\" type=\"text/javascript\"></script>
<script src=\"show.js\" type=\"text/javascript\"></script>
</head>

<body onload=\"register_keys()\">

<script type=\"text/javascript\" src=\"wz_tooltip.js\"></script>

<div id=\"navigation\" class=\"navigation\">
<form action=\"\">
<p><input type=\"hidden\" name=\"no_of_rows\" value=\"$NO_OF_ROWS\" />
<input type=\"button\" value=\"Show/Hide Rows...\" onclick=\"window.open('rows.html','ShowHideRowsWindow','top=200,left=200,height=500,width=300,location=no,menubar=no,toolbar=no,directories=no,statusbar=no');\">
<input type=\"checkbox\" name=\"numbers_value\" checked=\"checked\" onchange=\"toggle_numbers()\">
Numbers
<input type=\"checkbox\" name=\"border_value\" onchange=\"toggle_borders()\">
Borders
<span style=\"float:right;\" ><a href=\"\"> anvaya file&nbsp;&nbsp;&nbsp;</a><span></p>
</form>
</div>

<div class=\"float_clear\"></div>
<div width=700px>\n";
}
1;
