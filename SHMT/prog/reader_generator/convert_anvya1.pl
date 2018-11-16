#!/usr/bin/env perl
$/="\n\n";
$sent=1;
$i=1;
$j=0;
print "<html>\n";
print "<head>\n";
print "<link href=\"style.css\" type=\"text/css\" rel=\"stylesheet\" />";
print "<link href=\"text.css\" type=\"text/css\" rel=\"stylesheet\" />";
print "<script src=\"script.js\" type=\"text/javascript\"></script>";
print "<script src=\"text.js\" type=\"text/javascript\"></script>";
print "</head>\n";
print "<body onload=\"register_keys()\">\n";
print "<script type=\"text/javascript\" src=\"wz_tooltip.js\"></script>\n";
print "<div id=\"navigation\" class=\"navigation\">\n";
print"<form action=\"\">\n";
	print"<p><input type=\"hidden\" name=\"no_of_rows\" value=\"6\" />
			<input type=\"button\" value=\"Show/Hide Rows...\" onclick=\"window.open('rows.html','ShowHideRowsWindow','top=200,left=200,height=500,width=300,location=no,menubar=no,toolbar=no,directories=no,statusbar=no');\">
			<input type=\"checkbox\" name=\"numbers_value\" checked=\"checked\" onchange=\"toggle_numbers()\">Numbers
			<input type=\"checkbox\" name=\"border_value\" onchange=\"toggle_borders()\">Borders
		<a href=\"\" style=\"float:right;\">ksdlafjas &nbsp;&nbsp;&nbsp;</a>	</p>
		</form>
	</div>";
print "<div width=700px>\n";
print "<script type=\"text/javascript\" src=\"wz_tooltip.js\"></script>\n";
@alpha=("A","B","C","D","E","F","G","H","I","J","K");
$c=1;
while($in=<STDIN>) {
$j++;
$count=0;
@in=split("\n",$in);
$length=$#in+1;
  for($k=0;$k<$length;$k++){
	@fields=split("\t",$in[$k]);
	for($ln=3;$ln<$#fields+1;$ln++) {   #newly added code here
		chomp($fields[$ln]);
		if($fields[$ln]!~/^[0-9]/ and $fields[$ln]=~/([1-8];)/){
			$num="n".$1;
			$num=~s/;//g;
			$count=1;
		}
		if($fields[$ln]!~/^[0-9]/ and $fields[$ln]=~/कर्तरि/){
			$num="v";
			
		}
		if($fields[$ln]!~/^[0-9]/ and $fields[$ln]=~/कर्मणि/){
			$num="v";
			
		}
		if($fields[$ln]!~/^[0-9]/ and $fields[$ln]=~/अव्य/){
			$num="NA";
			
		}
		if($fields[$ln]!~/^[0-9]/ and $fields[$ln]=~/क्त्वा/){
			$num="NA";
			
		}

		if($fields[$ln]!~/^[0-9]/ and $fields[$ln]=~/ल्यप्/){
			$num="NA";
			
		}

		if($fields[$ln]!~/^[0-9]/ and $fields[$ln]=~/तुमुन्/){
			$num="NA";
			
		}
	}
	if($k==0) {
		$y=1;
		print "<form>";
		print "<table border=\"\">\n";
		print"<tr class=\"row$y\" style=\"border-right:dashed;\"><td calss=\"number\"><a href=\"$j.jpg\"  onmouseout=\"UnTip()\" onmouseover=\"Tip('<center><img src=$j.jpg></center>',FONTSIZE,'18pt',HEIGHT,400,STICKY,true,CLOSEBTN,true) \">".$i.".".$j.".".$alpha[0]."</a></td><td class=\"$num\">".$fields[2]."</td></tr>\n";
		for($l=3;$l<$#fields+1;$l++) {
		$y++;
				chomp($fileds[$l]);
			if($fields[$l]=~/^[0-9]/){
		print"<tr class=\"row$y\"><td calss=\"number\">".$i.".".$j.".".$alpha[$l-2]."</td><td class=\"$num\">"."B-".$num."</td></tr>\n";
		}
		elsif($fields[$l]=~/^</){
		if($fields[$l] ne ""){
				print "<tr class=\"row$y\"><td calss=\"number\">".$i.".".$j.".".$alpha[$l-2]."</td><td class=\"$num\"><a href=\"input$c.jpg\"  onmouseout=\"UnTip()\" onmouseover=\"Tip('<center><img src=input$c.jpg></center>',FONTSIZE,'18pt',HEIGHT,300,STICKY,true,CLOSEBTN,true) \">".$fields[$l]."</a></td></tr>\n";
				$c++;
				}
				else {
			print "<tr class=\"row$y\"><td class=\"$num\">".$fields[$l]."</td></tr>\n";
				}
		}
		else {
		print"<tr class=\"row$y\"><td calss=\"number\">".$i.".".$j.".".$alpha[$l-2]."</td><td class=\"$num\">".$fields[$l]."</td></tr>\n";
		}
		}
		}
	
	else {
			$x=1;
			
		print "<table border=\"1\">\n";
		for($m=2;$m<$#fields+1;$m++) {
			
			if($fields[$m]=~/^[0-9]/){
		print"<tr class=\"row$x\"><td class=\"$num\">"."B-".$num."</td></tr>\n";
		}
		else {
			if($fields[$m]=~/^</) {
				if($fields[$m] ne ""){
				print "<tr class=\"row$x\"><td class=\"$num\"><a href=\"input$c.jpg\"  onmouseout=\"UnTip()\" onmouseover=\"Tip('<center><img src=input$c.jpg></center>',FONTSIZE,'18pt',HEIGHT,300,STICKY,true,CLOSEBTN,true) \">".$fields[$m]."</a></td></tr>\n";
				$c++;
				}
				else {
			print "<tr class=\"row$x\"><td class=\"$num\">".$fields[$m]."</td></tr>\n";
				}
			}
			else {
				print"<tr class=\"row$x\"><td class=\"$num\">".$fields[$m]."</td></tr>\n";
			}
		}
		$x++;
		
		}
	}
	
}
print "</table>";
print "</from>";
}
print "</div>";
print "<div class=\"float_clear\"></div>\n";
print "<div class=\"bottom\"></div>\n";
print "<br/>\n";
print "</body>";
print "</html>";

