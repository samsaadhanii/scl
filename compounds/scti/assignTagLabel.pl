#!/usr/bin/perl

$count=1;
while($take=<STDIN>){
chomp $take;
&changeTagLabels();
#$take =~ s/$take/$arWaComp/;
#$take =~ s/\#|\t/\<\@br\>/g;
print "$take\n";

}

sub changeTagLabels()
{
if($take=~/A1/){
$compType="avyayIBAvaH";
$ttname="A1";
$arWaComp="avyayapUrvapaxa-avyayIBAvaH";
$take =~ s/A1/avyayapUrvapaxa-avyayIBAvaH\(\@A1\)/g;
}
if($take=~/A2/){
$compType="avyayIBAvaH";
$ttname="A2";
$arWaComp="avyaya-uwwarapaxa-avyayIBAvaH";
$take =~ s/A2/avyaya-uwwarapaxa-avyayIBAvaH/g;
}
if($take=~/A3/){
$compType="avyayIBAvaH";
$ttname="A3";
$arWaComp="wiRTaxgupraBqwi(avyayIBAvaH)";
$take =~ s/A3/wiRTaxgupraBqwi(avyayIBAvaH)/g;
}
if($take=~/A4\[/){
$compType="avyayIBAvaH";
$ttname="A4";
$arWaComp="saMKyApUrvapaxa-naxyuwwarapaxa-avyayIBAvaH";
$take =~ s/A4/saMKyApUrvapaxa-naxyuwwarapaxa-avyayIBAvaH\(\@\A4\)/g;
}
if($take=~/A5/){
$compType="avyayIBAvaH";
$ttname="A5";
$arWaComp="naxyuwwarapaxa-anyapaxArWe-saMjFAyAm";
$take =~ s/A5/naxyuwwarapaxa-anyapaxArWe-saMjFAyAm/g;
}
if($take=~/A6/){
$compType="avyayIBAvaH";
$ttname="A6";
$arWaComp="saMKyApUrvapaxa-vaMSyowwarapaxa-avyayIBAvaH";
$take =~ s/A6/saMKyApUrvapaxa-vaMSyowwarapaxa-avyayIBAvaH/g;
}
if($take=~/A7/){
$compType="avyayIBAvaH";
$ttname="A7";
$arWaComp="pAre-maXye-pUrvapaxa-avyayIBAvaH";
$take =~ s/A7/pAre-maXye-pUrvapaxa-avyayIBAvaH/g;
}
if($take=~/T1/){
$compType="wawpuruRaH";
$ttname="T1";
$arWaComp="praWamAwawpuruRaH";
$take =~ s/T1/praWamAwawpuruRaH/g;
}
if($take=~/T2/){
$compType="wawpuruRaH";
$ttname="T2";
$arWaComp="xviwIyAwawpuruRaH";
$take =~ s/T2/xviwIyAwawpuruRaH/g;
}
if($take=~/T3/){
$compType="wawpuruRaH";
$ttname="T3";
$arWaComp="wqwIyAwawpuruRaH";
$take =~ s/T3/wqwIyAwawpuruRaH/g;
}
if($take=~/T4/){
$compType="wawpuruRaH";
$ttname="T4";
$arWaComp="cawurWiwawpuruRaH";
$take =~ s/T4/cawurWiwawpuruRaH/g;
}
if($take=~/T5/){
$compType="wawpuruRaH";
$ttname="T5";
$arWaComp="paFcamIwawpuruRaH";
$take =~ s/T5/paFcamIwawpuruRaH/g;
}
if($take=~/T6/){
$compType="wawpuruRaH";
$ttname="T6";
$arWaComp="RaRTIwawpuruRaH";
$take =~ s/T6/RaRTIwawpuruRaH/g;
}
if($take=~/T7/){
$compType="wawpuruRaH";
$ttname="T7";
$arWaComp="sapwamIwawpuruRaH";
$take =~ s/T7/sapwamIwawpuruRaH/g;
}
if($take=~/Tn/){
$compType="wawpuruRaH";
$ttname="Tn";
$arWaComp="naFwawpuruRaH";
$take =~ s/Tn/naFwawpuruRaH/g;
}
if($take=~/Tds[^tugkp]/){
$compType="wawpuruRaH";
$ttname="Tds";
$arWaComp="samAharaxviguH";
$take =~ s/Tds/samAharaxviguH/g;
}

if($take=~/Tdt[^sugkp]/){
$compType="wawpuruRaH";
$ttname="Tdt";
$arWaComp="waxXiwArWaxviguH";
$take =~ s/Tdt/waxXiwArWaxviguH/g;
}

if($take=~/Tdu[^tsgkp]/){
$compType="wawpuruRaH";
$ttname="Tdu";
$arWaComp="uwwarapaxaxviguH";
$take =~ s/Tdu[^tsgkp]/uwwarapaxaxviguH/g;
}

if($take=~/Tg[^tukp]*/){
$compType="wawpuruRaH";
$ttname="Tg";
$arWaComp="gawisamAsaH";
$take =~ s/Tg/gawisamAsaH/g;
}

if($take=~/Tk[^tugp]*/){
$compType="wawpuruRaH";
$ttname="Tk";
$arWaComp="kusamAsaH";
$take =~ s/Tk/kusamAsaH/g;
}

if($take=~/Tp[^tugk]*/){
$compType="wawpuruRaH";
$ttname="Tp";
$arWaComp="prAxisamAsaH";
$take =~ s/Tp[^tugk]*/prAxisamAsaH/g;
}

if($take=~/Tm[^tugkp]*/){
$compType="wawpuruRaH";
$ttname="Tm";
$arWaComp="maXyamapaxalopiwawpuruRaH";
$take =~ s/Tm[^tugkp]*/maXyamapaxalopiwawpuruRaH/g;
}

if($take=~/U/){
$compType="wawpuruRaH";
$ttname="U";
$arWaComp="upapaxasamAsaH";
$take =~ s/U\[/upapaxasamAsaH/g;
}

if($take=~/K1/){
$compType="karmaXArayaH";
$ttname="K1";
$arWaComp="viSeRaNa-pUrvapaxa-karmaXArayaH";
$take =~ s/K1/viSeRaNa-pUrvapaxa-karmaXArayaH/g;
}
if($take=~/K2/){
$compType="karmaXArayaH";
$ttname="K2";
$arWaComp="viSeRaNa-uwwarapaxa-karmaXArayaH";
$take =~ s/K2/viSeRaNa-uwwarapaxa-karmaXArayaH/g;
}
if($take=~/K3/){
$compType="karmaXArayaH";
$ttname="K3";
$arWaComp="viSeRaNa-uBayapaxa-karmaXArayaH";
$take =~ s/K3/viSeRaNa-uBayapaxa-karmaXArayaH/g;
}
if($take=~/K4/){
$compType="karmaXArayaH";
$ttname="K4";
$arWaComp="upamAna-pUrvapaxa-karmaXArayaH";
$take =~ s/K4/upamAna-pUrvapaxa-karmaXArayaH/g;
}
if($take=~/K5/){
$compType="karmaXArayaH";
$ttname="K5";
$arWaComp="viSeRaNa-uwwarapaxa-karmaXArayaH";
$take =~ s/K5/viSeRaNa-uwwarapaxa-karmaXArayaH/g;
}
if($take=~/K6/){
$compType="karmaXArayaH";
$ttname="K6";
$arWaComp="avaXAraNA-pUrvapaxa-karmaXArayaH";
$take =~ s/K6/avaXAraNA-pUrvapaxa-karmaXArayaH/g;
}
if($take=~/K7/){
$compType="karmaXArayaH";
$ttname="K7";
$arWaComp="saMBAvanA-pUrvapaxa-karmaXArayaH";
$take =~ s/K7/saMBAvanA-pUrvapaxa-karmaXArayaH/g;
}
if($take=~/Km/){
$compType="karmaXArayaH";
$ttname="Km";
$arWaComp="maXyamapaxalopi-karmaXArayaH";
$take =~ s/Km/maXyamapaxalopi-karmaXArayaH/g;
}
if($take=~/Bs2/){
$compType="bahuvrIhiH";
$ttname="Bs2";
$arWaComp="xviwIyArWa-bahuvrIhiH";
$take =~ s/Bs2/xviwIyArWa-bahuvrIhiH/g;
}
if($take=~/Bs3/){
$compType="bahuvrIhiH";
$ttname="Bs3";
$arWaComp="wqwIyArWa-bahuvrIhiH";
$take =~ s/Bs3/wqwIyArWa-bahuvrIhiH/g;
}
if($take=~/Bs4/){
$compType="bahuvrIhiH";
$ttname="Bs4";
$arWaComp="cawurwyarWa-bahuvrIhiH";
$take =~ s/Bs4/cawurwyarWa-bahuvrIhiH/g;
}
if($take=~/Bs5/){
$compType="bahuvrIhiH";
$ttname="Bs5";
$arWaComp="paFcamyarWa-bahuvrIhiH";
$take =~ s/Bs5/paFcamyarWa-bahuvrIhiH/g;
}
if($take=~/Bs6/){
$compType="bahuvrIhiH";
$ttname="Bs6";
$arWaComp="RaRTyarWa-bahuvrIhiH";
$take =~ s/Bs6/RaRTyarWa-bahuvrIhiH/g;
}
if($take=~/Bs7/){
$compType="bahuvrIhiH";
$ttname="Bs7";
$arWaComp="sapwamyarWa-bahuvrIhiH";
$take =~ s/Bs7/sapwamyarWa-bahuvrIhiH/g;
}
if($take=~/Bsd/){
$compType="bahuvrIhiH";
$ttname="Bsd";
$arWaComp="xigvAcaka-bahuvrIhiH";
$take =~ s/Bsd/xigvAcaka-bahuvrIhiH/g;
}
if($take=~/Bsp/){
$compType="bahuvrIhiH";
$ttname="Bsp";
$arWaComp="praharaNaviRayaka-bahuvrIhiH";
$take =~ s/Bsp/praharaNaviRayaka-bahuvrIhiH/g;
}
if($take=~/Bsg/){
$compType="bahuvrIhiH";
$ttname="Bsg";
$arWaComp="grahaNaviRayaka-bahuvrIhiH";
$take =~ s/Bsg/grahaNaviRayaka-bahuvrIhiH/g;
}
if($take=~/Bsmn/){
$compType="bahuvrIhiH";
$ttname="Bsmn";
$arWaComp="aswyarWa-maXyamapaxalopi-bahuvrIhiH";
}
if($take=~/Bvp/){
$compType="bahuvrIhiH";
$ttname="Bvp";
$arWaComp="prAxi-bahuvrIhiH";
}
if($take=~/Bss/){
$compType="bahuvrIhiH";
$ttname="Bss";
$arWaComp="saMKyopaxa-bahuvrIhiH";
}
if($take=~/Bsu/){
$compType="bahuvrIhiH";
$ttname="Bsu";
$arWaComp="upamAnapUrvapaxa-bahuvrIhiH";
}
if($take=~/Bv/){
$compType="bahuvrIhiH";
$ttname="Bv";
$arWaComp="vyaXikaraNa-bahuvrIhiH";
}
if($take=~/Bvs[^S]/){
$compType="bahuvrIhiH";
$ttname="Bvs";
$arWaComp="saMKyowwarapaxa-vyaXikaraNa-bahuvrIhiH";
}
if($take=~/BvS[^s]/){
$compType="bahuvrIhiH";
$ttname="BvS";
$arWaComp="sahapUrvapaxa-vyaXikaraNa-bahuvrIhiH";
}
if($take=~/BvU/){
$compType="bahuvrIhiH";
$ttname="BvU";
$arWaComp="upamAnapUrvapaxa-vyaXikaraNa-bahuvrIhiH";
}
if($take=~/Bb/){
$compType="bahuvrIhiH";
$ttname="Bb";
$arWaComp="bahupaxa-bahuvrIhiH";
}

if($take=~/Di/){
$compType="xvanxvaH";
$ttname="Di";
$arWaComp="iwarewarayoga-xvanxvaH";
}

if($take=~/Ds/){
$compType="xvanxvaH";
$ttname="Ds";
$arWaComp="samAhAra-xvanxvaH";
}

if($take=~/T\[/){
$compType="tatpuruRaH";
$ttname="T";
$arWaComp="wawpuruRaH";
$take =~ s/T\[/wawpuruRaH\[/g;
}


}
1;

