#!/usr/bin/perl

$count=1;
while($assignTagLab=<STDIN>){
@allFields=split(/\#/,$assignTagLab);
print "<\@table \@border=1 \@width=\"100\%\">";
print "<\@tr><\@td \@colspan=\@2><\@font \@color=\"\@blue\" \@size=3><\@b><\@center>$allFields[0]</\@center></\@b></\@font></\@td></\@tr>";

for($vv=1;$vv<=$#allFields;$vv++){
$take=$allFields[$vv];
$take=~s/\@//g;
&changeTagLabels();
if($take ne ""){
&makeTable();
}
$comType="";
$comSubType="";
$comLab="";
$taggedOut="";
}
print "</\@table><\@br>";
$count++;

}


sub changeTagLabels()
{
if($take=~/>A1/){
$compType="avyayIBAvaH";
$ttname="A1";
$arWaComp="avyayapUrvapaxa-avyayIBAvaH";
}
if($take=~/>A2/){
$compType="avyayIBAvaH";
$ttname="A2";
$arWaComp="avyaya-uwwarapaxa-avyayIBAvaH";
}
if($take=~/>A3/){
$compType="avyayIBAvaH";
$ttname="A3";
$arWaComp="wiRTaxgupraBqwi(avyayIBAvaH)";
}
if($take=~/>A4/){
$compType="avyayIBAvaH";
$ttname="A4";
$arWaComp="saMKyApUrvapaxa-naxyuwwarapaxa-avyayIBAvaH";
}
if($take=~/>A5/){
$compType="avyayIBAvaH";
$ttname="A5";
$arWaComp="naxyuwwarapaxa-anyapaxArWe-saMjFAyAm";
}
if($take=~/>A6/){
$compType="avyayIBAvaH";
$ttname="A6";
$arWaComp="saMKyApUrvapaxa-vaMSyowwarapaxa-avyayIBAvaH";
}
if($take=~/>A7/){
$compType="avyayIBAvaH";
$ttname="A7";
$arWaComp="pAre-maXye-pUrvapaxa-avyayIBAvaH";
}
if($take=~/>T1/){
$compType="wawpuruRaH";
$ttname="T1";
$arWaComp="praWamAwawpuruRaH";
}
if($take=~/>T2/){
$compType="wawpuruRaH";
$ttname="T2";
$arWaComp="xviwIyAwawpuruRaH";
}
if($take=~/>T3/){
$compType="wawpuruRaH";
$ttname="T3";
$arWaComp="wqwIyAwawpuruRaH";
}
if($take=~/>T4/){
$compType="wawpuruRaH";
$ttname="T4";
$arWaComp="cawurWiwawpuruRaH";
}
if($take=~/>T5/){
$compType="wawpuruRaH";
$ttname="T5";
$arWaComp="paFcamIwawpuruRaH";
}
if($take=~/>T6/){
$compType="wawpuruRaH";
$ttname="T6";
$arWaComp="RaRTIwawpuruRaH";
}
if($take=~/>T7/){
$compType="wawpuruRaH";
$ttname="T7";
$arWaComp="sapwamIwawpuruRaH";
}
if($take=~/>Tn/){
$compType="wawpuruRaH";
$ttname="Tn";
$arWaComp="naFwawpuruRaH";
}
if($take=~/>Tds[^tugkp]/){
$compType="wawpuruRaH";
$ttname="Tds";
$arWaComp="samAharaxviguH";
}

if($take=~/>Tdt[^sugkp]/){
$compType="wawpuruRaH";
$ttname="Tdt";
$arWaComp="waxXiwArWaxviguH";
}

if($take=~/>Tdu[^tsgkp]/){
$compType="wawpuruRaH";
$ttname="Tdu";
$arWaComp="uwwarapaxaxviguH";
}

if($take=~/>Tg[^tukp]*/){
$compType="wawpuruRaH";
$ttname="Tg";
$arWaComp="gawisamAsaH";
}

if($take=~/>Tk[^tugp]*/){
$compType="wawpuruRaH";
$ttname="Tk";
$arWaComp="kusamAsaH";
}

if($take=~/>Tp[^tugk]*/){
$compType="wawpuruRaH";
$ttname="Tp";
$arWaComp="prAxisamAsaH";
}

if($take=~/>Tm[^tugkp]*/){
$compType="wawpuruRaH";
$ttname="Tm";
$arWaComp="maXyamapaxalopiwawpuruRaH";
}

if($take=~/>U/){
$compType="wawpuruRaH";
$ttname="U";
$arWaComp="upapaxasamAsaH";
}

if($take=~/>K1/){
$compType="karmaXArayaH";
$ttname="K1";
$arWaComp="viSeRaNa-pUrvapaxa-karmaXArayaH";
}
if($take=~/>K2/){
$compType="karmaXArayaH";
$ttname="K2";
$arWaComp="viSeRaNa-uwwarapaxa-karmaXArayaH";
}
if($take=~/>K3/){
$compType="karmaXArayaH";
$ttname="K3";
$arWaComp="viSeRaNa-uBayapaxa-karmaXArayaH";
}
if($take=~/>K4/){
$compType="karmaXArayaH";
$ttname="K4";
$arWaComp="upamAna-pUrvapaxa-karmaXArayaH";
}
if($take=~/>K5/){
$compType="karmaXArayaH";
$ttname="K5";
$arWaComp="viSeRaNa-uwwarapaxa-karmaXArayaH";
}
if($take=~/>K6/){
$compType="karmaXArayaH";
$ttname="K6";
$arWaComp="avaXAraNA-pUrvapaxa-karmaXArayaH";
}
if($take=~/>K7/){
$compType="karmaXArayaH";
$ttname="K7";
$arWaComp="saMBAvanA-pUrvapaxa-karmaXArayaH";
}
if($take=~/>Km/){
$compType="karmaXArayaH";
$ttname="Km";
$arWaComp="maXyamapaxalopi-karmaXArayaH";
}
if($take=~/>Bs2/){
$compType="bahuvrIhiH";
$ttname="Bs2";
$arWaComp="xviwIyArWa-bahuvrIhiH";
}
if($take=~/>Bs3/){
$compType="bahuvrIhiH";
$ttname="Bs3";
$arWaComp="wqwIyArWa-bahuvrIhiH";
}
if($take=~/>Bs4/){
$compType="bahuvrIhiH";
$ttname="Bs4";
$arWaComp="cawurwyarWa-bahuvrIhiH";
}
if($take=~/>Bs5/){
$compType="bahuvrIhiH";
$ttname="Bs5";
$arWaComp="paFcamyarWa-bahuvrIhiH";
}
if($take=~/>Bs6/){
$compType="bahuvrIhiH";
$ttname="Bs6";
$arWaComp="RaRTyarWa-bahuvrIhiH";
}
if($take=~/>Bs7/){
$compType="bahuvrIhiH";
$ttname="Bs7";
$arWaComp="sapwamyarWa-bahuvrIhiH";
}
if($take=~/>Bsd/){
$compType="bahuvrIhiH";
$ttname="Bsd";
$arWaComp="xigvAcaka-bahuvrIhiH";
}
if($take=~/>Bsp/){
$compType="bahuvrIhiH";
$ttname="Bsp";
$arWaComp="praharaNaviRayaka-bahuvrIhiH";
}
if($take=~/>Bsg/){
$compType="bahuvrIhiH";
$ttname="Bsg";
$arWaComp="grahaNaviRayaka-bahuvrIhiH";
}
if($take=~/>Bsmn/){
$compType="bahuvrIhiH";
$ttname="Bsmn";
$arWaComp="aswyarWa-maXyamapaxalopi-bahuvrIhiH";
}
if($take=~/>Bvp/){
$compType="bahuvrIhiH";
$ttname="Bvp";
$arWaComp="prAxi-bahuvrIhiH";
}
if($take=~/>Bss/){
$compType="bahuvrIhiH";
$ttname="Bss";
$arWaComp="saMKyopaxa-bahuvrIhiH";
}
if($take=~/>Bsu/){
$compType="bahuvrIhiH";
$ttname="Bsu";
$arWaComp="upamAnapUrvapaxa-bahuvrIhiH";
}
if($take=~/>Bv/){
$compType="bahuvrIhiH";
$ttname="Bv";
$arWaComp="vyaXikaraNa-bahuvrIhiH";
}
if($take=~/>Bvs[^S]/){
$compType="bahuvrIhiH";
$ttname="Bvs";
$arWaComp="saMKyowwarapaxa-vyaXikaraNa-bahuvrIhiH";
}
if($take=~/>BvS[^s]/){
$compType="bahuvrIhiH";
$ttname="BvS";
$arWaComp="sahapUrvapaxa-vyaXikaraNa-bahuvrIhiH";
}
if($take=~/>BvU/){
$compType="bahuvrIhiH";
$ttname="BvU";
$arWaComp="upamAnapUrvapaxa-vyaXikaraNa-bahuvrIhiH";
}
if($take=~/>Bb/){
$compType="bahuvrIhiH";
$ttname="Bb";
$arWaComp="bahupaxa-bahuvrIhiH";
}

if($take=~/>Di/){
$compType="xvanxvaH";
$ttname="Di";
$arWaComp="iwarewarayoga-xvanxvaH";
}

if($take=~/>Ds/){
$compType="xvanxvaH";
$ttname="Ds";
$arWaComp="samAhAra-xvanxvaH";
}



chomp $take;
$take=~s/>/>\@/g;
$tool="$compType#$arWaComp#\@$ttname#$take";
#$take=~s/>$ttname/>$ttname\#$arWaComp/;
#$tool="\<\@a \@href=\"\" \@onmouseover=\"\@Tip('$arWaComp',\@FONTSIZE,50)\" \@onmouseout=\"\@UnTip()\"\>\@$ttname\<\/\@a\>";
#$take=~s/>$ttname/\&\@gt\;$tool/;


}
1;



sub makeTable()
{
($comType,$comSubType,$comLab,$taggedOut)=split(/\#/,$tool);
#print "<\@tr><\@td>\@Compound \@Type</\@td><\@td>$comType</\@td></\@tr>";
#print "<\@tr><\@td>\@Compound \@Sub \@Type</\@td><\@td>$comSubType</\@td></\@tr>";
print "<\@tr><\@td>\@Compound \@Type</\@td><\@td>$comSubType</\@td></\@tr>";
#print "<\@tr><\@td>\@Tag \@Name</\@td><\@td>$comLab</\@td></\@tr>";
####print "<\@tr><\@td>\@Paraphrase</\@td><\@td><\@font \@color=\"\@blue\">";
#print "<\@form \@action=\"\/\@cgi-\@bin\/\@samAsa\/\@makeVigraha.\@cgi\" \@method=\"\@post\" \@target=\"\@instruct\">";

print "<\@input \@type=\"\@hidden\" \@name=\"\@encoding\" \@value=\"\@Unicode\">";
print "<\@input \@type=\"\@hidden\" \@name=\"\@compound\" \@value=\"$taggedOut\">";
###print "<\@input \@type=\"\@submit\" \@name=\"\@submit\" \@value=\"\@Show \@Paraphrase\">";
#print "<\@input \@type=\"\@submit\" \@name=\"\@makeVig\" \@value=\"\@Make \@Paraphrase\">";
#print "</\@form>";
print "</\@font></\@td></\@tr>";
#print "<\@tr><\@td>\@Find \@it \@in \@Manual \@tagged \@data</\@td><\@td>";
#print "<\@form \@action=\"\/\@cgi-\@bin\/\@samAsa\/\@samAsaIdenti\/\@samAsaData\/\@compare.\@cgi\" \@method=\"\@post\" \@target=\"\@instruct\">";
#print "<\@input \@type=\"\@submit\" \@name=\"\@comparetxt\" \@value=\"$allFields[1]\"><\@br>";
#print "</\@form></\@td></\@tr>";
print "<\@tr \@bgcolor=\"\@tan\"><\@td \@colspan=\@2>\&\@nbsp\;</\@td></\@tr>";
}

