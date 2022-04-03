#!/usr/bin/perl

while($shwout=<STDIN>){

if($shwout =~ /<INPUT/){
$clin=$shwout;
$clin=~ s/<INPUT\t|>//g;
chomp $clin;
print "$clin\#";
$fndstat=1;
$count=1;
}elsif($fndstat==1){

	if($shwout =~ /<\/INPUT/){
		$fndstat=0;
	}elsif($count<=3){
	($rank,$prob,$tag,$taggedout)=split(/\t/,$shwout);
	chomp($taggedout);
	$taggedout=~ s/>/>\@/g;
	print "$taggedout\#";
	$count++;
	}

}



}
