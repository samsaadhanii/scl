#!/usr/bin/perl

@kqw_prawyayaH = ("wqc","wavyaw","yak","Sawq_lat","SAnac_lat_karwari","SAnac_lat_karmaNi","GaF","Nvul","Nyaw","lyut","yaw","kwa","kwavawu","anIyar");
@kqw_avy_prawyayaH = ("wumun","Namul","kwvA");
@kqw_avy_upa_prawyayaH = ("wumun","Namul","lyap");
@lifga =("puM","swrI","napuM");

my($str);
$str = "";
$str= "[";
@list = <STDIN>;
$k=0;
for ($k=0;$k<14;$k++) {
  for ($l=0;$l<3;$l++) {
          chomp($list[$k]);
	  $str .= "{";
	  $str .= "\"form\":\"$list[$k]\",";
	  $str .= "\"kqw_prawyayaH\":\"$kqw_prawyayaH[$k]\",";
	  $str .= "\"lifgam\":\"$lifga[$l]\"";
	  $str .= "},";
          $k++;
  }
  for ($l=0;$l<3;$l++) {
          chomp($list[$k]);
	  $str .= "{";
	  $str .= "\"form\":\"$list[$k]\",";
          if($upasarga eq "-") {
	     $str .= "\"kqw_prawyayaH\":\"$kqw_avy_prawyayaH[$l]\",";
          } else {
	     $str .= "\"kqw_prawyayaH\":\"$kqw_avy_upa_prawyayaH[$l]\",";
          }
	  $str .= "},";
          $k++;
  }
}
chomp($str);
$str =~ s/,$//;
$str .= "]";
print $str;
