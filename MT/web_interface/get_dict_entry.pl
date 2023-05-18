#!/usr/bin/env perl
#
#
#  Copyright (C) 2010-2013 Karunakar
#  2014-2023 Amba Kulkarni (ambapradeep@gmail.com)
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later
#  version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.


#use utf8;
#use Encode qw/ decode /;
#use open qw( :std :encoding(UTF-8) );
#binmode(STDOUT, "encoding(UTF-8)");

require "../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

package main;


sub get_dict_entry{

 my($dic_name, $word, $outencoding ) = @_;

my $word_wx = "";

$Files_Path = "$GlblVar::HTDOCSDIR/$GlblVar::SCL_HTDOCS/MT/data";

chomp $word;
# converting word utf8 to wx to get filename
if ($outencoding eq "DEV") {
  $word_wx = `echo $word | $GlblVar::SCLINSTALLDIR/converters/utf82wx.sh $GlblVar::SCLINSTALLDIR`;
  chomp($word_wx);
  $sword = $word;
}elsif($outencoding eq "IAST"){
  $word_wx = `echo $word | $GlblVar::SCLINSTALLDIR/converters/utf8roman2wx.out`;
  chomp($word_wx);
  $sword = `echo $word_wx | $GlblVar::SCLINSTALLDIR/converters/wx2utf8.sh $GlblVar::SCLINSTALLDIR`;
  chomp($sword);
}


#grep the 1st character in a word;
$word_wx =~ /^(.)/; $l = $1;
#forming file name using dic_name and Word
chomp $dic_name;
if($dic_name eq "apte"){
        $sword =~ s/_//;
        $sword =~ s/_/\-/;
        if($word_wx =~ /_/) { $word_wx =~ /_(.)/; $l = $1;}
        else {$word_wx =~ /^(.)/; $l = $1;}
	if ($l eq "A") { $l = "aa";}
	elsif ($l eq "I") { $l = "ii";}
	elsif ($l eq "U") { $l = "uu";}
	elsif ($l eq "E") { $l = "ai";}
	elsif ($l eq "O") { $l = "au";}
	elsif ($l eq "R") { $l = "ss";}
	elsif ($l eq "N") { $l = "nn";}
	elsif (uc($l) eq $l) {$l = lc($l)."h"};
	$filename = "$Files_Path/hi/Apte_dict/$l.xml";
}
elsif($dic_name eq "heritage"){
        $sword =~ s/_//;
	$l = &get_Heritage_Index($sword);
	#print "l = $l\n";
	if($l eq "") {
           print "<br/> $sword not found in ";
           print "Heritage Sanskrit-French dictionary\n";
	   $filename = "";
        } else {
	   $filename = "$Files_Path/fr/Heritage/$l.html";
        }
}
elsif($dic_name eq "mw"){
        $sword =~ s/_//;
	$l = &get_MW_Index($sword);
	if($l eq "") {
           print "<br/> $sword not found in ";
           print "Monier-Williams Sanskrit-English dictionary\n";
	   $filename = "";
        } else {
	   $filename = "$Files_Path/en/MW/$l.html";
        }
}
elsif($dic_name eq "ccs"){
        $sword =~ s/_//;
	$l = &get_CCS_Index($sword);
	if($l eq "") {
           print "<br/> $sword not found in ";
           print "Cappeller's Skt-Ger dictionary\n";
	   $filename = "";
        } else {
	   $filename = "$Files_Path/de/ccs/$l.html";
        }
}

if($sword ne ""){
   if (($dic_name ne "amara") && ($filename ne "")){
	  open(TMP,"$filename") || die print "$filename does not exist";
   }
}


$result = "";
    if($dic_name  eq "amara"){
	    system("$GlblVar::SCLINSTALLDIR/amarakosha/relations.sh NULL 'paryAyavAcI' $word_wx DEV $GlblVar::SCLINSTALLDIR");
	 }
	 elsif($dic_name  eq "apte"){
		$result = &apte_result($sword); #finding word in apt xml files
	 }
	 elsif($dic_name  eq "mw"){
		$result = &mw_result($sword); #finding word in mw files
	 }
	 elsif($dic_name  eq "heritage"){
		$result = &heritage_result($word_wx); #finding word in Heritage files
	 }
	 elsif($dic_name eq "ccs"){
		$result = &ccs_result($sword); #finding word in CCS files
	 }
close(TMP);

# print "result is == $result";
$result;
}
1;

sub apte_result{
	my($sword) = @_;
my $result = "";
my $ans = "";
        my $found = 0;
	$/ = "</lexhead>";
		while($in = <TMP>){
			$lexcount = 0;
				if($in =~ /<prAwipaxikam>$sword<\/prAwipaxikam>/ or $in =~ /<root>$sword<\/root>/){
					$result = &get_exact_data($in);
					$result =~ s/<citation>/(/g;
					$result =~ s/<\/citation>/)/g;
					$result =~ s/<segmenthd>//g;
					$result =~ s/<subsegmenthd>/<div style=\"background:LightCyan;\">/g;
					$result =~ s/<\/subsegmenthd>/<\/DIV><\/BR>/g;
					$result =~ s/<sense no?=\"([0-9]+)\">/<\/BR>$1. /g;
					$result =~ s/<compound>/<div style=\"background:Snow;\">/g;
					$result =~ s/<\/compound>/<\/DIV><\/BR>/g;
					$result =~ s/<\/?[a-z]+>//g;
					$result =~ s/<\/DIV>/<\/div>/g;
					$result =~ s/<\/BR>/<\/br>/g;
					$result  =~ s/>$sword</><span style=\"background:yellow;\">$sword<\/span></g;
					$ans .= "</br></br>". $result;
				}
		   }
#$result;
$ans;
}	
1;

sub get_exact_data{
	my($line) = @_;
my $result = "";
	@lines = split(/<segmenthd>/,$line);
	foreach $lines (@lines){
		#if($lines =~ /<prAwipaxikam>$sword<\/prAwipaxikam>/ or $lines =~ /<dentry>$sword<\/dentry>/  or $in =~ />$sword<\/prAwipaxikam>/){
#		if($lines =~ /<prAwipaxikam>$sword<\/prAwipaxikam>/ or $lines =~ /<dentry>$sword<\/dentry>/  or $lines =~ /<prAwipaxikam gen="स्त्री">$sword<\/prAwipaxikam>/){
                        $lines =~ s/<jAwi>[^<]+<\/jAwi>//g;
                        $lines =~ s/<upAXi>[^<]+<\/upAXi>//g;
                        $lines =~ s/<kind_of>[^<]+<\/kind_of>//g;
                        $lines =~ s/<is_a_part>[^<]+<\/is_a_part>//g;
                        $lines =~ s/<dentry>[^<]+<\/dentry>//g;
			#$result .= "<div style=\"background:cyan;\">".  $lines. "<\/DIV> <\/BR>";
			$result .= "<div>".  $lines. "<\/DIV> <\/BR>";
#		}
	}
$result;
}
1;
#getting mw result

sub mw_result{
	my($sword) = @_;
	my $result = "";
	my ($count) = 0;
	my($epno) = 0;
	$sword1 = $sword;
	$sword1 =~ s/ा//;
     
	$/ = "<hr xmlns=\"\">";
	while($in = <TMP>){
		if($in =~ /<span class=\"Deva\">$sword<\/span>/){
       			  $result .= $in;
      		}
		elsif($in =~ /<span class=\"Deva\">$sword1<\/span>/){
       			  $result .= $in;
      		}
		#elsif($count == 1 and $in !~/<\/xml>/){
		#	 $result = $in;
		#}
		#elsif($count == 1 and $in =~ /<\/xml>/){
		#	$count = 0;
		#}
	}
$result;
}
1;

sub heritage_result{
	my($word_wx) = @_;
	my $result = "";
	$w = `echo $word_wx | $GlblVar::SCLINSTALLDIR/converters/wx-velthuis.out`;
	chomp($w);
	$w =~ s/[ \t\n]//g;
	#print "w = $w###\n";
	$/ = "<span class=\"deva\" lang=\"sa\">";
	while($in = <TMP>){
		if($in =~ /<a class=\"navy\" name=\"$w#/){
		#print $in;
       			  $result = $in;
      		}
		elsif($in =~ /<a class=\"navy\" name=\"$w\"/){
		#print $in;
       			  $result = $in;
      		}
	}
$result;
}
1;

#getting ccs result

sub ccs_result{
	my($sword) = @_;
	my $result = "";
	my ($count) = 0;
	my($epno) = 0;
	$sword1 = $sword;
	$sword1 =~ s/ा//;
     
	$/ = "<p>";
	while($in = <TMP>){
		if($in =~ /<span class=\"Deva\">$sword<\/span>/){
			$result .= $in;
      	}
		elsif($in =~ /<span class=\"Deva\">$sword1<\/span>/){
       			  $result .= $in;
      	}
		elsif($in =~ / $sword/) {
			$result .= $in;
		}
	}
$result;
}
1;

# Following code corresponds to the Ocaml code ML/Chapters.ml
sub get_Heritage_Index {
	my ($w) = @_;
	my $index = "";
	$b[1] = "अ";
	$b[2] = "अद";
	$b[3] = "अनु";
	$b[4] = "अप";
	$b[5] = "अभ";
	$b[6] = "अर";
	$b[7] = "अव";
	$b[8] = "अस्त";
	$b[9] = "आ";
	$b[10] = "आम";
	$b[11] = "इ";
	$b[12] = "ई";
	$b[13] = "उ";
	$b[14] = "उत";
	$b[15] = "उप";
	$b[16] = "उष";
	$b[17] = "ऋ";
	$b[18] = "क";
	$b[19] = "कन";
	$b[20] = "का";
	$b[21] = "काय";
	$b[22] = "कृ";
	$b[23] = "क्ष";
	$b[24] = "ग";
	$b[25] = "गृ";
	$b[26] = "च";
	$b[27] = "ज";
	$b[28] = "झ";
	$b[29] = "ता";
	$b[30] = "तृ";
	$b[31] = "द";
	$b[32] = "दि";
	$b[33] = "देव";
	$b[34] = "ध";
	$b[35] = "ना";
	$b[36] = "नि";
	$b[37] = "नी";
	$b[38] = "प";
	$b[39] = "पर";
	$b[40] = "पा";
	$b[41] = "पि";
	$b[42] = "पो";
	$b[43] = "प्रत";
	$b[44] = "प्रब";
	$b[45] = "प्रा";
	$b[46] = "बल";
	$b[47] = "भ";
	$b[48] = "भे";
	$b[49] = "मन";
	$b[50] = "मर";
	$b[51] = "मि";
	$b[52] = "मु";
	$b[53] = "य";
	$b[54] = "र";
	$b[55] = "रो";
	$b[56] = "लम";
	$b[57] = "व";
	$b[58] = "वा";
	$b[59] = "वि";
	$b[60] = "विप";
	$b[61] = "विष";
	$b[62] = "वृ";
	$b[63] = "श";
	$b[64] = "शु";
	$b[65] = "ष";
	$b[66] = "स";
	$b[67] = "सन";
	$b[68] = "सप";
	$b[69] = "सर";
	$b[70] = "सी";
	$b[71] = "सुर";
	$b[72] = "स्न";
	$b[73] = "ह";
	for ($i=1;$i<74;$i++){
		if($w ge $b[$i]) { 
			$index = $i;
		}
		
	}
	$index;
}
1;

# Following code corresponds to the Ocaml code ML/Chapters.ml
sub get_MW_Index {
	my ($w) = @_;
	my $index = 0;
	$c[1] = "अ";
	$c[2] = "अग्नि";
	$c[3] = "अचिर";
	$c[4] = "अतिकन्दक";
	$c[5] = "अदेय";
	$c[6] = "अध्यावप";
	$c[7] = "अनारम्भण";
	$c[8] = "अनुनी";
	$c[9] = "अनुषण्ड";
	$c[10] = "अन्ति";
	$c[11] = "अपत्रप";
	$c[12] = "अपास";
	$c[13] = "अबुद्ध";
	$c[14] = "अभिप्रस्तु";
	$c[15] = "अभिसंनम";
	$c[16] = "अभ्र";
	$c[17] = "अम्भिणी";
	$c[18] = "अरुश";
	$c[19] = "अर्वाच";
	$c[20] = "अवतप";
	$c[21] = "अवसृज";
	$c[22] = "अोवोष";
	$c[23] = "अश्वन्त";
	$c[24] = "असुख";
	$c[25] = "अहे";
	$c[26] = "आ";
	$c[27] = "आच्छिद";
	$c[28] = "आदितेय";
	$c[29] = "आपालि";
	$c[30] = "आरट्ट";
	$c[31] = "आवृ";
	$c[32] = "आहितुण्डिक";
	$c[33] = "इ";
	$c[34] = "इष";
	$c[35] = "ई";
	$c[36] = "उ";
	$c[37] = "उत्तम";
	$c[38] = "उत्पत";
	$c[39] = "उदक";
	$c[40] = "उद्यम";
	$c[41] = "उपजन";
	$c[42] = "उपरुच";
	$c[43] = "उपाचर";
	$c[44] = "उल्का";
	$c[45] = "ऊ";
	$c[46] = "ऋ";
	$c[47] = "ॠ";
	$c[48] = "ऌ";
	$c[49] = "ऌर";
	$c[50] = "ए";
	$c[51] = "एतृ";
	$c[52] = "ऐ";
	$c[53] = "ओ";
	$c[54] = "औ";
	$c[55] = "क";
	$c[56] = "कणाठ";
	$c[57] = "कपि";
	$c[58] = "करकायु";
	$c[59] = "कर्मष";
	$c[60] = "कश्चन";
	$c[61] = "कानीत";
	$c[62] = "कार्त्स्न";
	$c[63] = "काश";
	$c[64] = "कीम";
	$c[65] = "कुण";
	$c[66] = "कुयोग";
	$c[67] = "कूट";
	$c[68] = "कृप";
	$c[69] = "केल";
	$c[70] = "कोष्ण";
	$c[71] = "क्रष्टव्य";
	$c[72] = "क्षन्तव्य";
	$c[73] = "क्षुद";
	$c[74] = "ख";
	$c[75] = "खव";
	$c[76] = "ग";
	$c[77] = "गन्धर्व";
	$c[78] = "गव";
	$c[79] = "गीत";
	$c[80] = "गुह";
	$c[81] = "गो";
	$c[82] = "गोध";
	$c[83] = "ग्राम";
	$c[84] = "घ";
	$c[85] = "ङ";
	$c[86] = "च";
	$c[87] = "चतसृ";
	$c[88] = "चन्धन";
	$c[89] = "चाार";
	$c[90] = "चित्कणकन्थ";
	$c[91] = "चैत्र";
	$c[92] = "छ";
	$c[93] = "ज";
	$c[94] = "जम";
	$c[95] = "जलडा";
	$c[96] = "जिन";
	$c[97] = "ज्ञा";
	$c[98] = "झ";
	$c[99] = "ञ";
	$c[100] = "ट";
	$c[101] = "ठ";
	$c[102] = "ड";
	$c[103] = "ढ";
	$c[104] = "ण";
	$c[105] = "त";
	$c[106] = "तनक";
	$c[107] = "तवस";
	$c[108] = "तावच";
	$c[109] = "तुक";
	$c[110] = "तृणाङ्कु";
	$c[111] = "त्रि";
	$c[112] = "त्रिङ्ख";
	$c[113] = "थ";
	$c[114] = "द";
	$c[115] = "दन्दश";
	$c[116] = "दहर";
	$c[117] = "दिन";
	$c[118] = "दीर्घ";
	$c[119] = "दुर";
	$c[120] = "दुर्धर्श";
	$c[121] = "दुराक";
	$c[122] = "देवजन";
	$c[123] = "देवट";
	$c[124] = "द्युक";
	$c[125] = "द्वांद्विक";
	$c[126] = "द्वै";
	$c[127] = "ध";
	$c[128] = "धरिणि";
	$c[129] = "धर्कट";
	$c[130] = "धू";
	$c[131] = "ध्वञ्ज";
	$c[132] = "न";
	$c[133] = "नद";
	$c[134] = "नर्दटक";
	$c[135] = "नागम्मा";
	$c[136] = "नारिङ्ग";
	$c[137] = "निः";
	$c[138] = "निर्युक्तिक";
	$c[139] = "निगुः";
	$c[140] = "निमित्त";
	$c[141] = "निर्यत";
	$c[142] = "निष्किर";
	$c[143] = "नीलङ्गु";
	$c[144] = "नैवकि";
	$c[145] = "प";
	$c[146] = "पञ्च";
	$c[147] = "पट";
	$c[148] = "पद";
	$c[149] = "पयोर";
	$c[150] = "पराचर";
	$c[151] = "परिदिह";
	$c[152] = "परिविधाव";
	$c[153] = "पर्ण";
	$c[154] = "पवरु";
	$c[155] = "पाडलीपुर";
	$c[156] = "पापचक";
	$c[157] = "पावष्टुरिकेय";
	$c[158] = "पिपिष्वट्";
	$c[159] = "पुण्डरीक";
	$c[160] = "पुरञ्जर";
	$c[161] = "पुष्कलेत्र";
	$c[162] = "पूल्";
	$c[163] = "पैन्य";
	$c[164] = "प्रकॄत";
	$c[165] = "प्रणिज";
	$c[166] = "प्रतिक";
	$c[167] = "प्रतिविद";
	$c[168] = "प्रत्यभिप्रस्था";
	$c[169] = "प्रधू";
	$c[170] = "प्रमी";
	$c[171] = "प्रविचल";
	$c[172] = "प्रस्ह";
	$c[173] = "प्र्ंशु";
	$c[174] = "प्रातिका";
	$c[175] = "प्रीतु";
	$c[176] = "फ";
	$c[177] = "ब";
	$c[178] = "बलास";
	$c[179] = "बहीनर";
	$c[180] = "बिद";
	$c[181] = "बृह";
	$c[182] = "ब्रह्मन";
	$c[183] = "ब्राध्नायन्य";
	$c[184] = "भ";
	$c[185] = "भन्द";
	$c[186] = "भशिरा";
	$c[187] = "भाव";
	$c[188] = "भिलभूषणा";
	$c[189] = "भू";
	$c[190] = "भूःखार";
	$c[191] = "भ्रज";
	$c[192] = "म";
	$c[193] = "मणित्थ";
	$c[194] = "मधु";
	$c[195] = "मध्व";
	$c[196] = "मनौ";
	$c[197] = "मर्ब";
	$c[198] = "मह";
	$c[199] = "महाप्रभाव";
	$c[200] = "महाशैरीष";
	$c[201] = "मांसपृष्ट";
	$c[202] = "मानव";
	$c[203] = "मास";
	$c[204] = "मुकुट";
	$c[205] = "मुम्मुनि";
	$c[206] = "मृ";
	$c[207] = "मृशालक";
	$c[208] = "मोचि";
	$c[209] = "य";
	$c[210] = "यत";
	$c[211] = "यम";
	$c[212] = "याकृत्क";
	$c[213] = "युवन";
	$c[214] = "र";
	$c[215] = "रट";
	$c[216] = "रम";
	$c[217] = "रस्न";
	$c[218] = "राजकिनेय";
	$c[219] = "रायान";
	$c[220] = "रुद्ध";
	$c[221] = "रोणी";
	$c[222] = "ल";
	$c[223] = "लता";
	$c[224] = "लाली";
	$c[225] = "लोक";
	$c[226] = "व";
	$c[227] = "वञ्चति";
	$c[228] = "वनर";
	$c[229] = "वरोल";
	$c[230] = "वल्भ";
	$c[231] = "वस्क";
	$c[232] = "वाच";
	$c[233] = "वायु";
	$c[234] = "वाल्गुद";
	$c[235] = "वि";
	$c[236] = "विश";
	$c[237] = "विचित्र";
	$c[238] = "विद";
	$c[239] = "विधाव";
	$c[240] = "विपदुमक";
	$c[241] = "विमल";
	$c[242] = "विलिनाथ";
	$c[243] = "विशी";
	$c[244] = "विश्वि";
	$c[245] = "विषयक";
	$c[246] = "विष्पन्द";
	$c[247] = "वीर";
	$c[248] = "वृद्ध";
	$c[249] = "वेण्ठ";
	$c[250] = "वेश";
	$c[251] = "वैमात्र";
	$c[252] = "व्यञ्ज";
	$c[253] = "व्यह";
	$c[254] = "व्यृ";
	$c[255] = "श";
	$c[256] = "शत";
	$c[257] = "शब्द";
	$c[258] = "शरकेतु";
	$c[259] = "शमशमान";
	$c[260] = "शांतनव";
	$c[261] = "शाह";
	$c[262] = "शिवगण";
	$c[263] = "शीत";
	$c[264] = "शुण्ड";
	$c[265] = "शूर्त";
	$c[266] = "शैषिरि";
	$c[267] = "श्यै";
	$c[268] = "श्राम";
	$c[269] = "श्रीकजाक";
	$c[270] = "श्वभ्र";
	$c[271] = "ष";
	$c[272] = "स";
	$c[273] = "संशुष";
	$c[274] = "संस्था";
	$c[275] = "सकलकल";
	$c[276] = "संघट्";
	$c[277] = "सती";
	$c[278] = "सतक्षन";
	$c[279] = "संतप";
	$c[280] = "सपक्ष";
	$c[281] = "सभाज";
	$c[282] = "समवे";
	$c[283] = "समिङ्ग";
	$c[284] = "समृ";
	$c[285] = "सम्फेट";
	$c[286] = "सरघ";
	$c[287] = "सर्व";
	$c[288] = "सर्वसुक्षम";
	$c[289] = "सशकल";
	$c[290] = "सहम";
	$c[291] = "सांजीवीपुत्र";
	$c[292] = "सामनी";
	$c[293] = "सार्षप";
	$c[294] = "सिद्गुण्ड";
	$c[295] = "सील";
	$c[296] = "सुचक्र";
	$c[297] = "सुन्द";
	$c[298] = "सुम";
	$c[299] = "सुर";
	$c[300] = "सुषंसद";
	$c[301] = "सूत्र";
	$c[302] = "सेतु";
	$c[303] = "सोदर";
	$c[304] = "सोर";
	$c[305] = "स्कन्ध";
	$c[306] = "स्थ";
	$c[307] = "स्नायु";
	$c[308] = "स्मृत";
	$c[309] = "स्वस्वध";
	$c[310] = "स्वनुरूप";
	$c[311] = "स्वाक्त";
	$c[312] = "ह";
	$c[313] = "हरि";
	$c[314] = "हल";
	$c[315] = "हिंस";
	$c[316] = "हू";
	$c[317] = "होढ";
	$index = $mw_exception{$w}; 
	if($index == 0) {
	  for ($i=1;$i<318;$i++){
		if($w ge $c[$i]) {
			$index = $i;
		}
	  }
        }
	$index;
}
1;

sub get_CCS_Index {
	my ($w) = @_;
	my $index = "";
	$d[1] = "अ";
	$d[2] = "आ";
	$d[3] = "इ";
	$d[4] = "ई";
	$d[5] = "उ";
	$d[6] = "ऊ";
	$d[7] = "ऋ";
	$d[8] = "ए";
	$d[9] = "ऐ";
	$d[10] = "ओ";
	$d[11] = "औ";
	$d[12] = "क";
	$d[13] = "ख";
	$d[14] = "ग";
	$d[15] = "घ";
	$d[16] = "च";
	$d[17] = "ज";
	$d[18] = "झं";
	$d[19] = "ट";
	$d[20] = "ठ";
	$d[21] = "ड";
	$d[22] = "ढ";
	$d[23] = "णि";
	$d[24] = "त";
	$d[25] = "द";
	$d[26] = "ध";
	$d[27] = "न";
	$d[28] = "प";
	$d[29] = "फ";
	$d[30] = "बं";
	$d[31] = "भ";
	$d[32] = "म";
	$d[33] = "य";
	$d[34] = "र";
	$d[35] = "ल";
	$d[36] = "व";
	$d[37] = "श";
	$d[38] = "ष";
	$d[39] = "स";

	for ($i=1;$i<40;$i++){
		if($w ge $d[$i]) { 
			$index = $i;
		}
	}
	$index;
}
1;
