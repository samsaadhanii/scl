#!/usr/bin/perl

$i=1;
while($i<=75){

	system("cd SV-$i && rm -rf *.js *.css rows.html && cd ../");
$i++;

}
