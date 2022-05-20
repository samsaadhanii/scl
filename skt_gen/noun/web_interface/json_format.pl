#!/usr/bin/perl

@vib_WX=("praWamA","xviwIyA","wqwIyA","cawurWI","paFcamI","RaRTI","sapwamI","samboXana");
@vacanam=("eka","xvi","bahu");
my($str);
$str = "";
$str= "[";
@list = <STDIN>;
$k=0;
for ($vib=0;$vib<9;$vib++) {
  for ($vac=0;$vac<3;$vac++) {
          chomp($list[$k]);
	  $str .= "{";
	  $str .= "\"form\":\"$list[$k]\",";
	  $str .= "\"vib\":\"$vib_WX[$vib]\",";
	  $str .= "\"vac\":\"$vacanam[$vac]\"";
	  $str .= "},";
          $k++;
  }
}
chomp($str);
$str =~ s/,$//;
$str .= "]";
print $str;
