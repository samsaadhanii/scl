#!/usr/bin/perl

@vib_WX=("praWamA","xviwIyA","wqwIyA","cawurWI","paFcamI","RaRTI","sapwamI","samboXana");
@vacanam=("eka","xvi","bahu");
my($str);
$str = "";
$str= "[\n";
@list = <STDIN>;
for ($vib=1;$vib<9;$vib++) {
  for ($vac=0;$vac<3;$vac++) {
	  $str .= "{\n";
	  $str .= "\"form\":\"$list[$k]\",";
	  $str .= "\"vib\":\"$vib_WX[$vib]\",";
	  $str .= "\"vac\":\"$vacanam[$vac]\"";
	  $str .= "},\n";
  }
}
chomp($str);
$str =~ s/,$//;
$str .= "]\n";
print $str;
