#!/usr/bin/env perl
$/="\n\n";
while($in=<STDIN>) {
@input=split("\n",$in);
for($i=0;$i<$#input+1;$i++){
	for($j=0;$j<$#input+1;$j++) {
	 @fields=split("\t",$input[$j]);
		 if($fields[2]==$i+1){
		print "$input[$j]\n"; 
		}
	}
}
	print "\n";
}

