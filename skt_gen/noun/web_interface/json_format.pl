#!/usr/bin/perl


my $encoding = $ARGV[0];

@vib = ("प्रथमा","द्वितीया","तृतीया","चतुर्थी","पञ्चमी","षष्ठी","सप्तमी","सं.प्र");
@vib_IAST = ("prathamā","dvitīyā","tṛtīyā","caturthī","pañcamī","ṣaṣṭhī","saptamī","saṃ.pra");
@vacanam=("एकवचनम्","द्विवचनम्","बहुवचनम्");
@vacanam_IAST=("ekavacanam","xvivacanam","bahuvacanam");

my($str);
$str = "";
$str= "[";
@list = <STDIN>;
$k=0;
for ($vib=0;$vib<8;$vib++) {
  for ($vac=0;$vac<3;$vac++) {
          chomp($list[$k]);
	  $str .= "{";
	  $str .= "\"form\":\"$list[$k]\",";
          if($encoding eq "IAST") { $str .= "\"vib\":\"$vib_IAST[$vib]\",";}
          else { $str .= "\"vib\":\"$vib[$vib]\",";}
	  if ($encoding eq "IAST" ) { $str .= "\"vac\":\"$vacanam_IAST[$vac]\"";}
	  else { $str .= "\"vac\":\"$vacanam[$vac]\"";}
	  $str .= "},";
          $k++;
  }
}
chomp($str);
$str =~ s/,$//;
$str .= "]";
print $str;
