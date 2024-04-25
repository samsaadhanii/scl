#!/usr/bin/env perl
#
#
#  Copyright (C) 2010-2013 Karunakar
#  2014-2024 Amba Kulkarni (ambapradeep@gmail.com)
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
$myDataPATH="$GlblVar::HTDOCSDIR/$GlblVar::SCL_HTDOCS";
$myPATH="$GlblVar::CGIDIR/$GlblVar::SCL_CGI";
require "$myPATH/cgi_interface.pl";

#package main;


sub get_dict_entry{

 my($dic_name, $word, $outencoding ) = @_;

my $word_wx = "";

$Files_Path = "$myDataPATH/MT/data";

### chomp does not work properly.
#Hence all chomps are replaced by s/\n$//;  -- Amba 26th April 2024
$word =~ s/\n$//;
# converting word utf8 to wx to get filename
if ($outencoding eq "DEV") {
  $word_wx = `echo $word | $myPATH/converters/utf82wx.sh $myPATH`;
}elsif($outencoding eq "IAST"){
  $word_wx = `echo $word | $myPATH/converters/utf8roman2wx.out`;
}
  $word_wx =~ s/\n$//;
  $sword_wx = get_normalised_word($word_wx);
  $sword = `echo $sword_wx | $myPATH/converters/wx2utf8.sh $myPATH`;
  $sword =~ s/\n$//;


#grep the 1st character in a word;
$word_wx =~ /^(.)/; $l = $1;
#forming file name using dic_name and Word
$dic_name =~ s/\n$//;
if($dic_name eq "apte"){
        if($word_wx =~ /_/) { $word_wx =~ /_(.)[^_]*$/; $l = $1;}
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
        #print "l = $l\n";
}
elsif($dic_name eq "heritage"){
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
	    system("$myPATH/amarakosha/relations.sh NULL 'paryAyavAcI' $word_wx DEV $myPATH");
	 }
	 elsif($dic_name  eq "apte"){
		$result = &apte_result($sword); #finding word in apt xml files
	 }
	 elsif($dic_name  eq "mw"){
		$result = &mw_result($sword); #finding word in mw files
	 }
	 elsif($dic_name  eq "heritage"){
		$result = &heritage_result($sword); #finding word in Heritage files
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
				#print "in = $in\n";
				if (($in =~ /<prAwipaxikam>$sword<\/prAwipaxikam>/) || ( $in =~ /<root>$sword<\/root>/)) {
					$result = &get_exact_data($in);
					$result =~ s/<citation>/(/g;
					$result =~ s/<\/citation>/)/g;
					#$result =~ s/<segmenthd>/<\/br>------/g;
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
			$result .= "<div>".  $lines. "<\/DIV> <\/BR>----------------<\/BR>";
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
	my($word) = @_;
	my $result = "";
        my($w);
	$w = `echo "$word" | $myPATH/converters/utf82wx.sh $myPATH/ | $myPATH/converters/wx-velthuis.out`;
	$w =~ s/[ \t\n]//g;
        #print "Heritage word = $word\n";
        #print "Heritage w = $w\n";
	$/ = "<span class=\"deva\" lang=\"sa\">";
	while($in = <TMP>){
		if($in =~ /<a class=\"navy\" name=\"$w#/){
       			  $result = $in;
      		}
		elsif($in =~ /<a class=\"navy\" name=\"$w\"/){
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

sub get_normalised_word{

my($w) = @_;

#print "w = $w";

$w =~ s/Af_/A/;


$w =~ s/a_a/A/g;
$w =~ s/A_a/A/g;
$w =~ s/a_A/A/g;
$w =~ s/A_A/A/g;
$w =~ s/i_i/I/g;
$w =~ s/u_u/U/g;
$w =~ s/q_q/Q/g;

$w =~ s/[iIiI]_([aAuqLeEoO])/y\1/;
$w =~ s/[uUuU]_([aiqLeEoO])/v\1/;
$w =~ s/[qqqQ]_([aiuLeEoO])/ar\1/;
$w =~ s/[LL]_([aiuLeEoO])/al\1/;

$w =~ s/e_[aiuqLeEoO]/ya\1/g;
$w =~ s/E_[aiuqLeEoO]/yA\1/g;
$w =~ s/o_[aiuqLeEoO]/va\1/g;
$w =~ s/O_[aiuqLeEoO]/vA\1/g;

$w =~ s/[uU]_([aiqLeEoO])/v\1/g;
$w =~ s/[qQ]_([aiuLeEoO])/ar\1/g;
$w =~ s/L_([aiuLeEoO])/al\1/g;
$w =~ s/[uU]_([aiqLeEoO])/v\1/;
$w =~ s/[qQ]_([aiuLeEoO])/ar\1/;
$w =~ s/L_([aiuLeEoO])/al\1/;

$w =~ s/AC([1-9]?)/AFC\1/;
$w =~ s/Bad([1-9]?)/BaNd\1/;
$w =~ s/Baj([1-9]?)/BaFj\1/;
$w =~ s/Banj([1-9]?)/BaFj\1/;
$w =~ s/BqR([1-9]?)/BqS\1/;
$w =~ s/BqS([1-9]?)/BqMS\1/;
$w =~ s/BranS([1-9]?)/BraMS\1/;
$w =~ s/Brans([1-9]?)/BraMs\1/;
$w =~ s/Cax([1-9]?)/Canx\1/;
$w =~ s/GagG([1-9]?)/GaG\1/;
$w =~ s/Gat([1-9]?)/GaNt\1/;
$w =~ s/Gawt([1-9]?)/Gatt\1/;
$w =~ s/GiN([1-9]?)/GiNN\1/;
$w =~ s/GqN([1-9]?)/GqNN\1/;
$w =~ s/GuN([1-9]?)/GuNN\1/;
$w =~ s/GuR([1-9]?)/GuMR\1/;
$w =~ s/IK([1-9]?)/IfK\1/;
$w =~ s/Kad([1-9]?)/KaNd\1/;
$w =~ s/Kaj([1-9]?)/KaFj\1/;
$w =~ s/Kawt([1-9]?)/Katt\1/;
$w =~ s/Kud([1-9]?)/KuNd\1/;
$w =~ s/NAX([1-9]?)/nAX\1/;
$w =~ s/NAs([1-9]?)/nAs\1/;
$w =~ s/NI([1-9]?)/nI\1/;
$w =~ s/NIl([1-9]?)/nIl\1/;
$w =~ s/NIv([1-9]?)/nIv\1/;
$w =~ s/NU([1-9]?)/nU\1/;
$w =~ s/NaB([1-9]?)/naB\1/;
$w =~ s/NaK([1-9]?)/naK\1/;
$w =~ s/NaK([1-9]?)/nafK\1/;
$w =~ s/NaS([1-9]?)/naS\1/;
$w =~ s/Nah([1-9]?)/nah\1/;
$w =~ s/NakR([1-9]?)/nakR\1/;
$w =~ s/Nakka([1-9]?)/nakk\1/;
$w =~ s/Nal([1-9]?)/nal\1/;
$w =~ s/Nam([1-9]?)/nam\1/;
$w =~ s/Nas([1-9]?)/nas\1/;
$w =~ s/Nat([1-9]?)/nat\1/;
$w =~ s/Nax([1-9]?)/nax\1/;
$w =~ s/Nay([1-9]?)/nay\1/;
$w =~ s/Nex([1-9]?)/nex\1/;
$w =~ s/NiRk([1-9]?)/niRk\1/;
$w =~ s/NiS([1-9]?)/niS\1/;
$w =~ s/Nij([1-9]?)/niFj\1/;
$w =~ s/Nij([1-9]?)/nij\1/;
$w =~ s/NikR([1-9]?)/nikR\1/;
$w =~ s/Nil([1-9]?)/nil\1/;
$w =~ s/Nis([1-9]?)/niMs\1/;
$w =~ s/Niv([1-9]?)/ninv\1/;
$w =~ s/Nix([1-9]?)/ninx\1/;
$w =~ s/Nu([1-9]?)/nu\1/;
$w =~ s/Nux([1-9]?)/nux\1/;
$w =~ s/RAX([1-9]?)/sAX\1/;
$w =~ s/RAnwv([1-9]?)/sAnwv\1/;
$w =~ s/RNE([1-9]?)/snE\1/;
$w =~ s/RTA([1-9]?)/sWA\1/;
$w =~ s/RTuda([1-9]?)/sWud\1/;
$w =~ s/RU([1-9]?)/sU\1/;
$w =~ s/RUrkR([1-9]?)/sUrkR\1/;
$w =~ s/RUrkRy([1-9]?)/sUrkRy\1/;
$w =~ s/RUx([1-9]?)/sUx\1/;
$w =~ s/RWA([1-9]?)/sWA\1/;
$w =~ s/RWal([1-9]?)/RTal\1/;
$w =~ s/RWud([1-9]?)/sWud\1/;
$w =~ s/RaG([1-9]?)/saG\1/;
$w =~ s/RaN([1-9]?)/saN\1/;
$w =~ s/RaN([1-9]?)/san\1/;
$w =~ s/Rac([1-9]?)/sac\1/;
$w =~ s/Rag([1-9]?)/sag\1/;
$w =~ s/Rah([1-9]?)/sah\1/;
$w =~ s/Ral([1-9]?)/sal\1/;
$w =~ s/Ram([1-9]?)/sam\1/;
$w =~ s/Ranb([1-9]?)/samb\1/;
$w =~ s/Ranj([1-9]?)/saFj\1/;
$w =~ s/Rap([1-9]?)/sap\1/;
$w =~ s/Rarj([1-9]?)/sarj\1/;
$w =~ s/Rarv([1-9]?)/sarv\1/;
$w =~ s/Ras([1-9]?)/sas\1/;
$w =~ s/Rasj([1-9]?)/sasj\1/;
$w =~ s/Rasw([1-9]?)/saMsw\1/;
$w =~ s/Rat([1-9]?)/sat\1/;
$w =~ s/Rawt([1-9]?)/satt\1/;
$w =~ s/Rax([1-9]?)/sax\1/;
$w =~ s/Rev([1-9]?)/sev\1/;
$w =~ s/Ri([1-9]?)/si\1/;
$w =~ s/RiX([1-9]?)/siX\1/;
$w =~ s/Ric([1-9]?)/sic\1/;
$w =~ s/Ril([1-9]?)/sil\1/;
$w =~ s/Rit([1-9]?)/sit\1/;
$w =~ s/Riv([1-9]?)/siv\1/;
$w =~ s/RkaB([1-9]?)/skamB\1/;
$w =~ s/RnA([1-9]?)/snA\1/;
$w =~ s/RnE([1-9]?)/snE\1/;
$w =~ s/Rnas([1-9]?)/snas\1/;
$w =~ s/Rnih([1-9]?)/snih\1/;
$w =~ s/Rnu([1-9]?)/snu\1/;
$w =~ s/Rnuh([1-9]?)/snuh\1/;
$w =~ s/Rnus([1-9]?)/snus\1/;
$w =~ s/Rnusa([1-9]?)/snus\1/;
$w =~ s/Ro([1-9]?)/so\1/;
$w =~ s/RqB([1-9]?)/sqB\1/;
$w =~ s/RqX([1-9]?)/SqX\1/;
$w =~ s/RqnB([1-9]?)/sqmB\1/;
$w =~ s/RtIm([1-9]?)/swIm\1/;
$w =~ s/RtqkR([1-9]?)/swqkR\1/;
$w =~ s/Rtu([1-9]?)/swu\1/;
$w =~ s/RtuB([1-9]?)/swuB\1/;
$w =~ s/Rtuc([1-9]?)/swuc\1/;
$w =~ s/Rtuca([1-9]?)/swuc\1/;
$w =~ s/RtyE([1-9]?)/swyE\1/;
$w =~ s/Ru([1-9]?)/su\1/;
$w =~ s/Ruh([1-9]?)/suh\1/;
$w =~ s/Rur([1-9]?)/sur\1/;
$w =~ s/Ruwt([1-9]?)/sutt\1/;
$w =~ s/Rvanj([1-9]?)/svaFj\1/;
$w =~ s/Rvap([1-9]?)/svap\1/;
$w =~ s/Rvax([1-9]?)/svax\1/;
$w =~ s/Rvix([1-9]?)/svix\1/;
$w =~ s/RwE([1-9]?)/swE\1/;
$w =~ s/RwIm([1-9]?)/swIm\1/;
$w =~ s/RwUp([1-9]?)/swup\1/;
$w =~ s/RwaB([1-9]?)/swamB\1/;
$w =~ s/Rwak([1-9]?)/swak\1/;
$w =~ s/Rwam([1-9]?)/swam\1/;
$w =~ s/Rwan([1-9]?)/swan\1/;
$w =~ s/Rwep([1-9]?)/Rtep\1/;
$w =~ s/RwiG([1-9]?)/swiG\1/;
$w =~ s/Rwim([1-9]?)/swim\1/;
$w =~ s/Rwip([1-9]?)/swip\1/;
$w =~ s/Rwu([1-9]?)/swu\1/;
$w =~ s/RwuB([1-9]?)/swuB\1/;
$w =~ s/Rwuc([1-9]?)/swuc\1/;
$w =~ s/SaTa([1-9]?)/SaT\1/;
$w =~ s/Sad([1-9]?)/SaNd\1/;
$w =~ s/Sak([1-9]?)/Safk\1/;
$w =~ s/Sanb([1-9]?)/Samb\1/;
$w =~ s/Sans([1-9]?)/SaMs\1/;
$w =~ s/SiG([1-9]?)/SifG\1/;
$w =~ s/Sij([1-9]?)/SiFj\1/;
$w =~ s/Slag([1-9]?)/Slafg\1/;
$w =~ s/Slak([1-9]?)/Slafk\1/;
$w =~ s/SraW([1-9]?)/SranW\1/;
$w =~ s/Srag([1-9]?)/Srafg\1/;
$w =~ s/Srak([1-9]?)/Srafk\1/;
$w =~ s/SranB([1-9]?)/SramB\1/;
$w =~ s/SuT([1-9]?)/SuNT\1/;
$w =~ s/SunB([1-9]?)/SumB\1/;
$w =~ s/SvaTa([1-9]?)/SvaT\1/;
$w =~ s/Svac([1-9]?)/SvaFc\1/;
$w =~ s/Svix([1-9]?)/Svinx\1/;
$w =~ s/Xav([1-9]?)/Xanv\1/;
$w =~ s/Xiv([1-9]?)/Xinv\1/;
$w =~ s/Xqj([1-9]?)/XqFj\1/;
$w =~ s/XrAkR([1-9]?)/XrAfkR\1/;
$w =~ s/Xraj([1-9]?)/XraFj\1/;
$w =~ s/XvAkR([1-9]?)/XvAfkR\1/;
$w =~ s/Xvaj([1-9]?)/XvaFj\1/;
$w =~ s/Xvans([1-9]?)/XvaMs\1/;
$w =~ s/aG([1-9]?)/afG\1/;
$w =~ s/aMSa([1-9]?)/aMsa\1/;
$w =~ s/aT([1-9]?)/aNT\1/;
$w =~ s/ab([1-9]?)/amb\1/;
$w =~ s/ag([1-9]?)/afg\1/;
$w =~ s/ah([1-9]?)/aMh\1/;
$w =~ s/aj([1-9]?)/aFj\1/;
$w =~ s/anc([1-9]?)/aFc\1/;
$w =~ s/anj([1-9]?)/aFj\1/;
$w =~ s/anu-ruX([1-9]?)/anoruX\1/;
$w =~ s/at([1-9]?)/ant\1/;
$w =~ s/aw([1-9]?)/anw\1/;
$w =~ s/awt([1-9]?)/att\1/;
$w =~ s/ax([1-9]?)/anx\1/;
$w =~ s/axd([1-9]?)/add\1/;
$w =~ s/bah([1-9]?)/baMh\1/;
$w =~ s/bix([1-9]?)/binx\1/;
$w =~ s/bqh([1-9]?)/bqMh\1/;
$w =~ s/cad([1-9]?)/caNd\1/;
$w =~ s/cah([1-9]?)/caha\1/;
$w =~ s/canc([1-9]?)/caFc\1/;
$w =~ s/cap([1-9]?)/camp\1/;
$w =~ s/cax([1-9]?)/canx\1/;
$w =~ s/ciw([1-9]?)/cinw\1/;
$w =~ s/cub([1-9]?)/cumb\1/;
$w =~ s/cud([1-9]?)/cuNd\1/;
$w =~ s/cut([1-9]?)/cuNt\1/;
$w =~ s/cuwt([1-9]?)/cutt\1/;
$w =~ s/cuxd([1-9]?)/cudd\1/;
$w =~ s/cyu([1-9]?)/cy\1/;
$w =~ s/gad([1-9]?)/gaNd\1/;
$w =~ s/gaj([1-9]?)/gaFj\1/;
$w =~ s/gaxI([1-9]?)/gax\1/;
$w =~ s/geRta([1-9]?)/geR\1/;
$w =~ s/glunc([1-9]?)/gluFc\1/;
$w =~ s/gqj([1-9]?)/gqFj\1/;
$w =~ s/graW([1-9]?)/granW\1/;
$w =~ s/guT([1-9]?)/guNT\1/;
$w =~ s/gud([1-9]?)/guNd\1/;
$w =~ s/guj([1-9]?)/guFj\1/;
$w =~ s/gunP([1-9]?)/gumP\1/;
$w =~ s/hid([1-9]?)/hiNd\1/;
$w =~ s/his([1-9]?)/hiMs\1/;
$w =~ s/hiv([1-9]?)/hinv\1/;
$w =~ s/hud([1-9]?)/huNd\1/;
$w =~ s/iK([1-9]?)/ifK\1/;
$w =~ s/ig([1-9]?)/ifg\1/;
$w =~ s/iv([1-9]?)/inv\1/;
$w =~ s/ix([1-9]?)/inx\1/;
$w =~ s/jaB([1-9]?)/jamB\1/;
$w =~ s/jaj([1-9]?)/jaFj\1/;
$w =~ s/jiv([1-9]?)/jinv\1/;
$w =~ s/jqB([1-9]?)/jqmB\1/;
$w =~ s/jug([1-9]?)/jufg\1/;
$w =~ s/kAc([1-9]?)/kAFc\1/;
$w =~ s/kAkR([1-9]?)/kAfkR\1/;
$w =~ s/kRaj([1-9]?)/kRaFj\1/;
$w =~ s/kRap([1-9]?)/kRamp\1/;
$w =~ s/kUta([1-9]?)/kUt\1/;
$w =~ s/kaNda([1-9]?)/kaNd\1/;
$w =~ s/kaT([1-9]?)/kaNT\1/;
$w =~ s/kac([1-9]?)/kaFc\1/;
$w =~ s/kad([1-9]?)/kaNd\1/;
$w =~ s/kak([1-9]?)/kafk\1/;
$w =~ s/kakK([1-9]?)/kaK\1/;
$w =~ s/kala([1-9]?)/kal\1/;
$w =~ s/kap([1-9]?)/kamp\1/;
$w =~ s/karwq([1-9]?)/karwa\1/;
$w =~ s/kav([1-9]?)/ikav\1/;
$w =~ s/kax([1-9]?)/kanx\1/;
$w =~ s/kaxd([1-9]?)/kadd\1/;
$w =~ s/klax([1-9]?)/klanx\1/;
$w =~ s/klix([1-9]?)/klinx\1/;
$w =~ s/kqv([1-9]?)/kqNv\1/;
$w =~ s/krax([1-9]?)/kranx\1/;
$w =~ s/krunc([1-9]?)/kruFc\1/;
$w =~ s/kuS([1-9]?)/kuMS\1/;
$w =~ s/kuT([1-9]?)/kuNT\1/;
$w =~ s/kuW([1-9]?)/kunW\1/;
$w =~ s/kub([1-9]?)/kumb\1/;
$w =~ s/kud([1-9]?)/kuNd\1/;
$w =~ s/kunc([1-9]?)/kuFc\1/;
$w =~ s/kus([1-9]?)/kuMs\1/;
$w =~ s/kut([1-9]?)/kutt\1/;
$w =~ s/kuwt([1-9]?)/kutt\1/;
$w =~ s/kuxr([1-9]?)/kunxr\1/;
$w =~ s/lAC([1-9]?)/lAFC\1/;
$w =~ s/lAj([1-9]?)/lAFj\1/;
$w =~ s/laG([1-9]?)/lafG\1/;
$w =~ s/laK([1-9]?)/lafK\1/;
$w =~ s/lab([1-9]?)/lamb\1/;
$w =~ s/lad([1-9]?)/laNd\1/;
$w =~ s/lag([1-9]?)/lafg\1/;
$w =~ s/laj([1-9]?)/laFj\1/;
$w =~ s/laja([1-9]?)/laj\1/;
$w =~ s/lig([1-9]?)/lifg\1/;
$w =~ s/luT([1-9]?)/luNT\1/;
$w =~ s/luW([1-9]?)/lunW\1/;
$w =~ s/lub([1-9]?)/lumb\1/;
$w =~ s/luj([1-9]?)/luFj\1/;
$w =~ s/lut([1-9]?)/luNt\1/;
$w =~ s/mUrcC([1-9]?)/murC\1/;
$w =~ s/maG([1-9]?)/mafG\1/;
$w =~ s/maK([1-9]?)/mafK\1/;
$w =~ s/maT([1-9]?)/maNT\1/;
$w =~ s/maW([1-9]?)/manW\1/;
$w =~ s/mac([1-9]?)/kac\1/;
$w =~ s/mac([1-9]?)/maFc\1/;
$w =~ s/mad([1-9]?)/maNd\1/;
$w =~ s/mah([1-9]?)/maMh\1/;
$w =~ s/mak([1-9]?)/mafk\1/;
$w =~ s/mawr([1-9]?)/manwr\1/;
$w =~ s/max([1-9]?)/manx\1/;
$w =~ s/mij([1-9]?)/miFj\1/;
$w =~ s/miv([1-9]?)/minv\1/;
$w =~ s/mix([1-9]?)/minx\1/;
$w =~ s/mlunc([1-9]?)/mluFc\1/;
$w =~ s/mrunc([1-9]?)/mruFc\1/;
$w =~ s/muT([1-9]?)/muNT\1/;
$w =~ s/muc([1-9]?)/muFc\1/;
$w =~ s/mud([1-9]?)/muNd\1/;
$w =~ s/muj([1-9]?)/muFj\1/;
$w =~ s/nIva([1-9]?)/nIv\1/;
$w =~ s/nax([1-9]?)/nanx\1/;
$w =~ s/naya([1-9]?)/nay\1/;
$w =~ s/nuxa([1-9]?)/nux\1/;
$w =~ s/paW([1-9]?)/panW\1/;
$w =~ s/pac([1-9]?)/paFc\1/;
$w =~ s/pad([1-9]?)/paNd\1/;
$w =~ s/parv([1-9]?)/parva\1/;
$w =~ s/pat([1-9]?)/pata\1/;
$w =~ s/paxa([1-9]?)/pax\1/;
$w =~ s/picc([1-9]?)/piC\1/;
$w =~ s/pid([1-9]?)/piNd\1/;
$w =~ s/pij([1-9]?)/piFj\1/;
$w =~ s/pij([1-9]?)/pin\1/;
$w =~ s/pis([1-9]?)/piMs\1/;
$w =~ s/piv([1-9]?)/pinv\1/;
$w =~ s/puW([1-9]?)/punW\1/;
$w =~ s/pud([1-9]?)/puNd\1/;
$w =~ s/put([1-9]?)/puNt\1/;
$w =~ s/puwt([1-9]?)/putt\1/;
$w =~ s/q([1-9]?)/sq\1/;
$w =~ s/qj([1-9]?)/qFj\1/;
$w =~ s/qnP([1-9]?)/qmP\1/;
$w =~ s/raG([1-9]?)/rafG\1/;
$w =~ s/raK([1-9]?)/rafK\1/;
$w =~ s/raP([1-9]?)/ramP\1/;
$w =~ s/rab([1-9]?)/ramb\1/;
$w =~ s/rag([1-9]?)/rafg\1/;
$w =~ s/rah([1-9]?)/raMh\1/;
$w =~ s/ranj([1-9]?)/raFj\1/;
$w =~ s/rav([1-9]?)/raNv\1/;
$w =~ s/rig([1-9]?)/rifg\1/;
$w =~ s/riv([1-9]?)/riNv\1/;
$w =~ s/ruT([1-9]?)/ruNT\1/;
$w =~ s/rus([1-9]?)/ruMS\1/;
$w =~ s/rut([1-9]?)/ruNt\1/;
$w =~ s/sPat([1-9]?)/sPaNt\1/;
$w =~ s/sPiwt([1-9]?)/sPitt\1/;
$w =~ s/sPud([1-9]?)/sPuNd\1/;
$w =~ s/sWal([1-9]?)/RTal\1/;
$w =~ s/saMgrAm([1-9]?)/saMgrAma\1/;
$w =~ s/skaB([1-9]?)/skamB\1/;
$w =~ s/skux([1-9]?)/skunx\1/;
$w =~ s/spax([1-9]?)/spanx\1/;
$w =~ s/spud([1-9]?)/spuNd\1/;
$w =~ s/sqnB([1-9]?)/sqmB\1/;
$w =~ s/srak([1-9]?)/srafk\1/;
$w =~ s/sranB([1-9]?)/sramB\1/;
$w =~ s/suwt([1-9]?)/sutt\1/;
$w =~ s/swqnhU([1-9]?)/swqh\1/;
$w =~ s/tak([1-9]?)/tafk\1/;
$w =~ s/uC([1-9]?)/uFC\1/;
$w =~ s/uK([1-9]?)/ufK\1/;
$w =~ s/ucCI([1-9]?)/uC\1/;
$w =~ s/unB([1-9]?)/umB\1/;
$w =~ s/vAC([1-9]?)/vAFC\1/;
$w =~ s/vAkR([1-9]?)/vAfkR\1/;
$w =~ s/vaK([1-9]?)/vafK\1/;
$w =~ s/vaT([1-9]?)/vaNT\1/;
$w =~ s/vad([1-9]?)/vaNd\1/;
$w =~ s/vag([1-9]?)/vafg\1/;
$w =~ s/vah([1-9]?)/vaMh\1/;
$w =~ s/vak([1-9]?)/vafk\1/;
$w =~ s/vall([1-9]?)/val\1/;
$w =~ s/vanc([1-9]?)/vaFc\1/;
$w =~ s/vat([1-9]?)/vaNt\1/;
$w =~ s/vax([1-9]?)/vanx\1/;
$w =~ s/vell([1-9]?)/vel\1/;
$w =~ s/viRk([1-9]?)/viRka\1/;
$w =~ s/vqh([1-9]?)/vqMh\1/;
$w =~ s/vrasc([1-9]?)/vraSc\1/;
$w =~ s/wad([1-9]?)/waNd\1/;
$w =~ s/wag([1-9]?)/wafg\1/;
$w =~ s/wak([1-9]?)/wafk\1/;
$w =~ s/wanc([1-9]?)/waFc\1/;
$w =~ s/wanj([1-9]?)/waFj\1/;
$w =~ s/wawr([1-9]?)/wanwr\1/;
$w =~ s/wqh([1-9]?)/wqMh\1/;
$w =~ s/wqnP([1-9]?)/wqmP\1/;
$w =~ s/wqnh([1-9]?)/wqMh\1/;
$w =~ s/wrak([1-9]?)/wrafk\1/;
$w =~ s/wrax([1-9]?)/wranx\1/;
$w =~ s/wrunP([1-9]?)/wrumP\1/;
$w =~ s/wrunp([1-9]?)/wrump\1/;
$w =~ s/wub([1-9]?)/wumb\1/;
$w =~ s/wud([1-9]?)/wuNd\1/;
$w =~ s/wuj([1-9]?)/wuFj\1/;
$w =~ s/wunP([1-9]?)/wumP\1/;
$w =~ s/wunp([1-9]?)/wump\1/;
$w =~ s/wvag([1-9]?)/wvafg\1/;
$w =~ s/wvanc([1-9]?)/wvaFc\1/;
$w =~ s/xASa([1-9]?)/xAS\1/;
$w =~ s/xaG([1-9]?)/xafG\1/;
$w =~ s/xaS([1-9]?)/xaMS\1/;
$w =~ s/xanB([1-9]?)/xamB\1/;
$w =~ s/xanS([1-9]?)/xaMS\1/;
$w =~ s/xas([1-9]?)/xaMs\1/;
$w =~ s/xav([1-9]?)/xanv\1/;
$w =~ s/xiv([1-9]?)/xinv\1/;
$w =~ s/xqh([1-9]?)/xqMh\1/;
$w =~ s/xqnP([1-9]?)/xqmP\1/;
$w =~ s/xrAkR([1-9]?)/xrAfkR\1/;
$w =~ s/yawr([1-9]?)/yanwr\1/;
$w =~ s/yug([1-9]?)/yufg\1/;

$w =~ s/_//g;

$w;
}
1;
