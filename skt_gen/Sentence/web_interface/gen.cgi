#!/usr/bin/perl

#  Copyright (C) 2017-2023 Amba Kulkarni (ambapradeep@gmail.com)
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later
#  version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

use utf8;

require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

#use CGI qw/:standard/;

my %param = &get_parameters();
#if (param) {
      $anal_fl=$param{filename};

      open(TMP,"<$anal_fl");
      @in = <TMP>;
      $input = `echo "@in" | $GlblVar::SCLINSTALLDIR/skt_gen/Sentence/input_from_parsed_struct.pl`;
      close(TMP);
      #}

      print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
print <<FIRSTPART;

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sanskrit Sentence Generator</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/$GlblVar::SCL_HTDOCS/skt_gen/Sentence/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="/$GlblVar::SCL_HTDOCS/skt_gen/Sentence/bootstrap/jquery/jquery.min.js"></script>
  <script src="/$GlblVar::SCL_HTDOCS/skt_gen/Sentence/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<script type="text/javascript">

function callgen () {
      \$.ajax({
        url:"/cgi-bin/$GlblVar::SCL_CGI/skt_gen/Sentence/run_skt_gen.cgi", //the page containing php script
        type: "GET", //request type
        data : \$("#inpts").serialize(),
        success:function(result){
                \$("#gen_out").html(result);
       }
     });
}

</script>



</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
	<h3>Sanskrit Sentence Generator (v04)</h3>
  </div>
</nav>
<div class="container">

<table>
<tr><td valign="top">
<form class="form-inline" id="inpts">
  <textarea class="form-control" rows="15" cols="50" id="texts" name="texts">
FIRSTPART

print $input;

print <<SECONDPART;
</textarea> <br /><br />
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="callgen();" >संश्लेषणं दृश्यताम्</button>

</form>

</td>
<td valign="top">
<div id="gen_out"></div>

</td>
</tr>
</table>
<br />

</div><!--div ends container-->

</body>
</html>

SECONDPART
