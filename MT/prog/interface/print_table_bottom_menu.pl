#!/usr/bin/perl

$pid = $ARGV[0];
$sub_pid = $ARGV[1];
$TFPATH = $ARGV[2];
$outscript = $ARGV[3];

print <<header
</table>
</div>
<div id="navigation">
<form action="" onsubmit="goto_section(); return false;">
<p><center>
<a id="logo" href=\"/scl/index.html\"><font color=\"DarkBlue\"> संसाधनी- Saṃsādhanī </font></a>
<a id="about" href="/scl/MT/about.html" target="_new">About</a>
&nbsp; &nbsp; &nbsp; &nbsp;
<a id="help" href="/scl/MT/anu_help.html" target="_new">Help</a>
<input type="hidden" name="no_of_rows" value="8"/>
<input type="button" value="Show/Hide Rows..." onclick="window.open('/scl/MT/rows.html','ShowHideRowsWindow','top=200,left=200,height=500,width=300,location=no,menubar=no,toolbar=no,directories=no,statusbar=no');"/>
header
;

if($#sentences == 1) {
print <<header1
<a href="/scl/MT/DEMO/./tmp_$fbn/table.xlsx">Save Annotation</a> 
&nbsp; &nbsp; &nbsp; &nbsp;
<a href="/cgi-bin/scl/skt_gen/Sentence/gen.cgi?filename=$TFPATH/table_dev.tsv">Generate</a> 
&nbsp; &nbsp; &nbsp; &nbsp;
header1
;
}

print <<header2
</center></p>
</form>
</div>
<div class="float_clear"/>
header2
;
