#!/usr/bin/perl


$out_encoding = $ARGV[0];

@kqw_prawyayaH = ("तृच्","तव्यत्", "यक्" ,"शतृ_लट्", "शानच्_लट्_कर्तरि", "शानच्_लट्_कर्मणि", "घञ्","ण्वुल्","ण्यत्","ल्युट्","यत्","क्त","क्तवतु","अनीयर्");
@kqw_avy_prawyayaH = ("तुमुन्","णमुल्","क्त्वा");
@kqw_avy_upa_prawyayaH = ("तुमुन्","णमुल्","ल्यप्");
@lifga = ("पुं","स्त्री","नपुं");
@kqw_prawyayaH_IAST = ("tṛc","tavyat","yak","śatṛ_laṭ","śānac_laṭ_kartari","śānac_laṭ_karmaṇi","ghañ","ṇvul","ṇyat","lyuṭ","yat","kta","ktavatu","anīyar");
@kqw_avy_prawyayaH_IAST = ("tumun","ṇamul","ktvā");
@kqw_avy_upa_prawyayaH_IAST = ("tumun","ṇamul","lyap");
@lifga_IAST = ("puṃ","strī","napuṃ");

my($str);
$str = "";
$str= "[";
@list = <STDIN>;
$count=0;
for ($k=0;$k<14;$k++) {
  for ($l=0;$l<3;$l++) {
          chomp($list[$count]);
	  $str .= "{";
	  $str .= "\"form\":\"$list[$count]\",";
          if($out_encoding eq "IAST") {
	     $str .= "\"kqw_prawyayaH\":\"$kqw_prawyayaH_IAST[$k]\",";
          } else {
	     $str .= "\"kqw_prawyayaH\":\"$kqw_prawyayaH[$k]\",";
          }
          if($out_encoding eq "IAST") {
	     $str .= "\"lifgam\":\"$lifga_IAST[$l]\"";
	  } else { 
             $str .= "\"lifgam\":\"$lifga[$l]\"";
          }
	  $str .= "},";
          $count++;
  }
 }
  for ($l=0;$l<3;$l++) {
          chomp($list[$count]);
	  $str .= "{";
	  $str .= "\"form\":\"$list[$count]\",";
          if($upasarga eq "-") {
            if($out_encoding eq "IAST") {
	       $str .= "\"kqw_prawyayaH\":\"$kqw_avy_prawyayaH_IAST[$l]\"";
            } else {
	       $str .= "\"kqw_prawyayaH\":\"$kqw_avy_prawyayaH[$l]\"";
            }
          } else {
            if($out_encoding eq "IAST") {
	       $str .= "\"kqw_prawyayaH\":\"$kqw_avy_upa_prawyayaH_IAST[$l]\"";
	    } else {
               $str .= "\"kqw_prawyayaH\":\"$kqw_avy_upa_prawyayaH[$l]\"";
            }
          }
	  $str .= "},";
          $count++;
  }
chomp($str);
$str =~ s/,$//;
$str .= "]";
print $str;
