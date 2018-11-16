#!/usr/bin/perl

require "../../paths.pl";

use CGI qw/:standard/;

if (param) {
      $anal_fl=param("filename");

      open(TMP,"<$anal_fl");
      @in = <TMP>;
      $input = `echo "@in" | $GlblVar::SCLINSTALLDIR/skt_gen/Sentence/input_from_parsed_struct.pl`;
      close(TMP);
}

print <<FIRSTPART;

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sanskrit Sentence Generator</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/scl/skt_gen/Sentence/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="/scl/skt_gen/Sentence/bootstrap/jquery/jquery.min.js"></script>
  <script src="/scl/skt_gen/Sentence/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<script type="text/javascript">

function callgen () {
      \$.ajax({
        url:"/cgi-bin/scl/skt_gen/Sentence/run_skt_gen.cgi", //the page containing php script
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
