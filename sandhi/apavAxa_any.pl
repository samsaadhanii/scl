#!/usr/bin/env perl

#  Copyright (C) 2002-2012 Pankaj Vyays
#  Copyright (C) 2002-2012 Sivaja Nair
#  Copyright (C) 2002-2023 Amba Kulkarni (ambapradeep@gmail.com)
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

# Added one more parameter cont
#If set 1, then the default rules in any_sandhi.pl would also be applied, else only the result of apavAxa will be shown.
# 29th Oct 2016

require "../paths.pl";

sub apavAdaniyamAH{
 my($an)=@_;
 my($first,$second,$ans,$ans1,$ans2,$found,$i,@ans);
 $first = "";
 $second = "";
 $ans = "";
 $ans1 = "";
 $ans2 = "";
 $found = 0;
 $cont = 1;
$an =~ /^([^\+]+)\+(.*)/;
$first = $1; $second = $2;

# Following are two special rules where morphological analyser is invoked.
if ($second =~ /^A/ && `echo "$second" | $GlblVar::LTPROCBIN -c $GlblVar::SCLINSTALLDIR/morph_bin/all_morf.bin | grep 'upasarga:Af'`) { 
   if($an=~/^(.*)[aA]\+(.*)/) {$ans = "$1$2";$ans1="pararUpa";$ans2="omAfoSca(6.1.95)"; $cont = 0;} # To do:show morph analysis in a tooltip
}
else {
   if ($an =~ /^(axy)a\+i(fKawi)/) {
          $ans = "$1e$2";$ans1="ekAxeSa";$ans2="omAfoSca(6.1.95)"; $cont = 0;
   } elsif ($an =~ /^(axy)a\+u(fKawi)/) {
          $ans = "$1o$2";$ans1="ekAxeSa";$ans2="omAfoSca(6.1.95)"; $cont = 0;
   } elsif ($first =~ /[IUe]$/) {
   @ans = split(/\//,`echo "$first" | $GlblVar::LTPROCBIN -c $GlblVar::SCLINSTALLDIR/morph_bin/all_morf.bin`);

     for ($i=1; $i<=$#ans && !$found;$i++){
       if($ans[$i] =~ /<vacanam:xvi>/) { $found = 1;}
   }
   if($found) {
	   $ftmp = $first;
	   $ftmp =~ s/I$/i/;
	   $ftmp =~ s/U$/u/;
	   $ans = $ftmp." ".$second;$ans1="pragqhya";$ans2="IxUxexxvivacanam pragqhyam (1.1.11)-> pluwapragqhyA aci niwyam (6.1.125); *$first paxasya xvivacana viSleRaNam aXikqwya";$cont =1;}
   }

#From here onwards it is just a pattern matching.

#$ans contains the answer after sandhi
#$ans1 contains the short name of the sandhi
#$ans2 contains the Panini's suutras
#$cont tells whether to continue with regular rules after applying these exceptional rules.

if($an=~/^akRa\+Uhin(.*)/){$ans = "akROhiN$1";$ans1="vqxXi";$ans2="akRAxUhinyAmupasaMKyAnam (vA 3604)";$cont =0;}
if($an=~/^sva\+Iri([nN].*)/){$ans = "svEri$1";$ans1="vqxXi";$ans2="svAxIreriNoH (vA 3606)";$cont =0;}
if($an=~/^sva\+IraH/){$ans = "svEraH";$ans1="vqxXi";$ans2="svAxIreriNoH (vA 3606)";$cont =0;}
if($an=~/^pra\+U([hD].*)/){$ans = "prO$1";$ans1="vqxXi";$ans2="prAxUhoDoDyeRERyeRu (vA 3605)";$cont =0;}
if($an=~/^pra\+eR(.*)/){$ans = "prER$1";$ans1="vqxXi";$ans2="prAxUhoDoDyeRERyeRu (vA 3605)";$cont =0;}

# Since the suutras are different, we have two rules. I need to check if pra can be removed from the vaartika
if($an=~/^(vawsawara|kambala|vasana|qNa|xaSa)\+qN(.*)/){$ans = "$1ArN$2";$ans1="vqxXi";$ans2="pravawsawarakambalavasanArNaxaSAnAmqNe (vA 3608-9)";$cont =0;}
if($an=~/^pra\+qN(.*)/){$ans = "prArN$1";$ans1="vqxXi";$ans2="pravawsawarakambalavasanArNaxaSAnAmqNe (vA 3608-9)";$cont =0;}
elsif($an=~/^pra\+q(.*)/){$ans = "prAr$1";$ans1="vqxXi";$ans2="upasargAxqwi XAwoH (6.1.91)";$cont =0;}

if($an=~/(.*)o\+yam$/){$ans = "$1avyam";$ans1="vAnwa";$ans2="vAnwo yi prawyaye (6.1.79)";$cont =0;}
if($an=~/(.*)O\+yam$/){$ans = "$1Avyam";$ans1="vAnwa";$ans2="vAnwo yi prawyaye (6.1.79)";$cont =0;}
if($an=~/^go\+yUw(.*)/){$ans = "gavyUw$1";$ans1="vAnwa";$ans2="aXvaparimANe ca (vA 3544)";$cont =0;}

if($an=~/^(Saka|karka)\+anXuH$/){$ans = "$1nXuH";$ans1="pararUpa";$ans2="SakanXvAxiRu pararUpam vAcyam (vA 3632)";$cont =0;}
if($an=~/^kula\+atA$/){$ans = "kulatA";$ans1="pararUpa";$ans2="SakanXvAxiRu pararUpam vAcyam (vA 3632)";$cont =0;}
if($an=~/^hala\+IRA$/){$ans = "halIRA";$ans1="pararUpa";$ans2="SakanXvAxiRu pararUpam vAcyam (vA 3632)";$cont =0;}
if($an=~/^lAfgala\+IRA$/){$ans = "lAfgalIRA" ;$ans1="pararUpa";$ans2="SakanXvAxiRu pararUpam vAcyam (vA 3632)";$cont =0;}
if($an=~/^manas\+IRA$/){$ans = "manIRA";$ans1="pararUpa";$ans2="SakanXvAxiRu pararUpam vAcyam (vA 3632)";$cont =0;}
if($an=~/^mArwa\+aNdaH$/){$ans = "mArwaNdaH";$ans1="pararUpa";$ans2="SakanXvAxiRu pararUpam vAcyam (vA 3632)";$cont =0;}
if($an=~/^sIman\+anwaH$/){$ans = "sImanwaH";$ans1="pararUpa";$ans2="sImanwaH keSaveSe (vA 3633)";$cont =0;}
if($an=~/^sAra\+afg(.*)/){$ans = "sArafg$1";$ans1="pararUpa";$ans2="sArafgaH paSupakRiNoH (gaNa sUwram 136)";$cont =0;}
if($an=~/^pawaw\+aFjaliH$/){$ans = "pawaFjaliH";$ans1="pararUpa";$ans2="SakanXvAxiRu pararUpam vAcyam (vA 3632)";$cont =0;}
if($an=~/(.*)([aA])\+owuH/){$ans = "$1owuH";$ans1="pararUpa";$ans2="owvoRTayoH samAse vA (vA 3634)";$cont =1;}
if($an=~/(.*)([aA])\+oRT(.*)/){$ans = "$1oRT$3";$ans1="pararUpa";$ans2="owvoRTayoH samAse vA (vA 3634)"; $cont=1;}

if($an=~/^kaH\+kaH$/){$ans = "kaskaH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)"; $cont = 0;}
if($an=~/^kOwaH\+kuwaH$/){$ans = "kOwaskuwaH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)"; $cont = 0;}
if($an=~/^BrAwuH\+puwraH$/){$ans = "BrAwuRpuwraH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)"; $cont = 0;}
if($an=~/^SunaH\+karNaH$/){$ans = "SunaskarNaH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)"; $cont = 0;}
if($an=~/^saxyaH\+(kAlaH|krIH|kaH)$/){$ans = "saxyas$1";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)"; $cont = 0;}
if($an=~/^kAMH\+kAn$/){$ans = "kAMskAn";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)"; $cont = 0;}
if($an=~/^sarpiH\+kuNdikA$/){$ans = "sarpiRkuNdikA";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)"; $cont = 0;}
if($an=~/^XanuH\+kapAlam$/){$ans = "XanuRkapAlam";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)"; $cont = 0;}
if($an=~/^(bar?hi)H\+palam$/){$ans = "$1Rpalam";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)"; $cont = 0;}
if($an=~/^yajuH\+pAwram$/){$ans = "yajuRpAwram";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)"; $cont = 0;}
if($an=~/^ayaH\+kAnwaH$/){$ans = "ayaskAnwaH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)"; $cont = 0;}
if($an=~/^(wama|aya)H\+kANdaH$/){$ans = "$1skANdaH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)"; $cont = 0;}
if($an=~/^mexaH\+piNdaH$/){$ans = "mexaspiNdaH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)"; $cont = 0;}
if($an=~/^(BA|aha)H\+karaH$/){$ans = "$1skaraH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)"; $cont = 0;}

if($an=~/^(nama|pura)H\+([kp].*)/){$ans = "$1s$2";$ans1="sakAra";$ans2="namaspurasorgawyoH (8.3.40)"; $cont = 0;}

if($an=~/^wiraH\+([kp].*)/){$ans = "wiras$1:wiraH $1";$ans1="sakAra:sawwvABAve";$ans2="wirasoZnyawarasyAm (8.3.42)"; $cont = 0;}

if($an=~/^(ap|av|up)a\+q(.*)/){$ans = "$1Ar$2";$ans1="vqxXi";$ans2="upasargAxqwi XAwoH(6.1.91)"; $cont = 0;}

if($an=~/(.*)pra\+([eo].*)/){$ans = "$1pr$2";$ans1="pararUpa";$ans2="efi pararUpam (6.1.94)"; $cont = 0;}
if($an=~/(.*[aAou])pa\+([eo].*)/){$ans = "$1p$2";$ans1="pararUpa";$ans2="efi pararUpam(6.1.94)"; $cont = 0;}
if (($an !~ /wava\+([eo].*)/) && ($an=~/(.*[aA])va\+([eo].*)/)) {$ans = "$1v$2";$ans1="pararUpa";$ans2="efi pararUpam(6.1.94)"; $cont = 0;}

if($an=~/(.*)a\+(o[mzfFnN].*)/){$ans = "$1$2";$ans1="pararUpa";$ans2="omAfoSca(6.1.95)"; $cont = 0;}

if($an=~/^go\+(a.*)/){$ans = "go $1". ":". "gavA$1";$ans1="prakqwiBAva:avafAxeSa";$ans2="sarvawra viBARA goH(6.1.122):avaf sPotAyanasya(6.1.123)-> akaH savarNe xIrGaH (6.1.101)"; $cont = 1;}

# Why was it necessary to give another suutra inxre ca? Already with 6.1.123 '^i' is covered.
if($an=~/^go\+inxr(.*)/){$ans = "gavenxr$1";$ans1="avafAxeSa";$ans2="inxre ca(6.1.124)-> Ax guNaH (6.1.87)"; $cont = 0;}
elsif($an=~/^go\+([iI])(.*)/){$ans = "gave$2";$ans1="avafAxeSa";$ans2="avaf sPotAyanasya(6.1.123)-> Ax guNaH (6.1.87)"; $cont = 0;}

if($an=~/^go\+([uU])(.*)/){$ans = "gavo$2";$ans1="avafAxeSa";$ans2="avaf sPotAyanasya(6.1.123)-> Ax guNaH (6.1.87)"; $cont = 0;}
if($an=~/^go\+([qQ])(.*)/){$ans = "gavar$2";$ans1="avafAxeSa";$ans2="avaf sPotAyanasya(6.1.123)-> Ax guNaH (6.1.87)"; $cont = 0;}
if($an=~/^go\+(L)(.*)/){$ans = "gaval$2";$ans1="avafAxeSa";$ans2="avaf sPotAyanasya(6.1.123)-> Ax guNaH (6.1.87)"; $cont = 0;}
if($an=~/^go\+([eE])(.*)/){$ans = "gavE$2";$ans1="avafAxeSa";$ans2="avaf sPotAyanasya(6.1.123)-> Ax guNaH (6.1.87)"; $cont = 0;}
if($an=~/^go\+([oO])(.*)/){$ans = "gavO$2";$ans1="avafAxeSa";$ans2="avaf sPotAyanasya(6.1.123)-> Ax guNaH (6.1.87)"; $cont = 0;}

if($an=~/(.*)[tTdDN]\+n(Am|avawi|agar.*)$/){$ans = "$1NN$2";$ans1="jaSwva-> RtuwvaniReXaH-> Nawva";$ans2="JalAM jaSoZnwe # (8.2.39)-> RtunA RtuH # (8.4.41)[Rtuwve prApwe]-> na paxAnwAttoranAm # (8.4.42)-> anAmnavawinagarINAmiwi vAcyam(vA 5016)-> yaroZnunAsikeZnunAsiko vA (8.4.45)-> prawyaye BARAyAm niwyam (vA 5017)"; $cont = 0;}
if($an=~/^am([IU])\+(.*)/){$ans = "am$1 $2";$ans1="prakqwiBAva";$ans2="axaso mAw(1.1.12)";$cont=0;}

if($an=~/^uw\+sWA(.*)/){$ans = "uwWA$1:uwWWA$1";$ans1="pUrvasavarNaH->lopaH:pUrvasavarNaH->lopABAvaH";$ans2="uxaH sWAswamBoH pUrvasya (8.4.61)->Jaro Jari savarNe (8.4.65)";$cont=0;}

if($an=~/^uw\+swamB(.*)/){$ans = "uwwamB$1:uwWwamB$1";$ans1="pUrvasavarNaH->lopaH:pUrvasavarNaH->lopABAvaH";$ans2="uxaH sWAswamBoH pUrvasya (8.4.61)->Jaro Jari savarNe (8.4.65)";$cont=0;}

if($an=~/(.*)([kKgG])\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1kC$3$4";$ans1="jaSwva->carwva->Cawva";$ans2="JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)->SaSCoZti (8.4.63)";$cont=1;}

if($an=~/(.*)([cCjJ])\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1cC$3$4";$ans1="jaSwva->carwva->Cawva";$ans2="JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)->SaSCoZti (8.4.63)";$cont=1;}

if($an=~/(.*)([tTdD])\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1tC$3$4";$ans1="jaSwva->carwva->Cawva";$ans2="JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)->SaSCoZti (8.4.63)";$cont=1;}

if($an=~/(.*)([wWxX])\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1cC$3$4";$ans1="jaSwva->Scuwva->carwva->Cawva";$ans2="JalAM jaSoZnwe (8.2.39)->swoH ScunA ScuH (8.4.40)->Kari ca (8.4.55)->SaSCoZti (8.4.63)";$cont=1;}

if($an=~/(.*)([pPbB])\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1pC$3$4";$ans1="jaSwva->carwva->Cawva";$ans2="JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)->SaSCoZti (8.4.63)";$cont=1;}

if($an=~/(.*)(n)\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1FC$3$4:$1FcC$3$4";$ans1="wugAgama->Scuwva->carwva->Cawva->lopaH:wugAgama->Scuwva->carwva->Cawva->lopABAvaH";$ans2="Si wuk (8.3.31)->swoH ScunA ScuH (8.4.40)->Kari ca (8.4.55)->SaSCoZti (8.4.63)->Jaro Jari savarNe (8.4.65):wugAgama->Scuwva->carwva->Cawva->lopABAvaH";$ans2=$ans2.":"."Si wuk (8.3.31)->swoH ScunA ScuH (8.4.40)->Kari ca (8.4.55)->SaSCoZti (8.4.63)";$cont=1;}

if($an=~/(.*)([kKgG])\+S([lfmFNn])(.*)/){$ans = "$1kC$3$4:$1kS$3$4";$ans1="jaSwva->carwva->Cawva:jaSwva->carwva->CawvABAva";$ans2="JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)->CawvamamIwi vAcyam (vA 5025):JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)";$cont=0;}

if($an=~/(.*)([cCjJ])\+S([lFmfNn])(.*)/){$ans = "$1cC$3$4:$1cS$3$4";$ans1="jaSwva->carwva->Cawva:jaSwva->carwva->CawvABAva";$ans2="JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)->CawvamamIwi vAcyam (vA 5025):JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)";$cont=0;}

if($an=~/(.*)([tTdD])\+S([lFmfNn])(.*)/){$ans = "$1tC$3$4:$1tS$3$4";$ans1="jaSwva->carwva->Cawva:jaSwva->carwva->CawvABAva";$ans2="JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)->CawvamamIwi vAcyam (vA 5025):JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)";$cont=0;}

if($an=~/(.*)([wWxX])\+S([lFmfNn])(.*)/){$ans = "$1cC$3$4:$1cS$3$4";$ans1="jaSwva->Scuwva->carwva->Cawva:jaSwva->carwva->CawvABAva";$ans2="JalAM jaSoZnwe (8.2.39)->swoH ScunA ScuH (8.4.40)->Kari ca (8.4.55)->CawvamamIwi vAcyam (vA 5025):JalAM jaSoZnwe (8.2.39)->swoH ScunA ScuH (8.4.40)->Kari ca (8.4.55)";$cont=0;}

if($an=~/(.*)([pPbB])\+S([lfFmnN])(.*)/){$ans = "$1pC$3$4:$1pS$3$4";$ans1="jaSwva->carwva->Cawva:jaSwva->carwva->CawvABAva";$ans2="JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)->CawvamamIwi vAcyam (vA 5025):JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)";$cont=0;}

if($an=~/^praSAn\+([cC])([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "praSAF$1$2$3";$ans1="ruwvaniReXa->Scuwva";$ans2="naSCavyapraSAn (8.3.7)-> swoH ScunA ScuH (8.4.40)";$cont=0;}
if($an=~/^praSAn\+([tT])([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "praSAN$1$2$3";$ans1="ruwvaniReXa->Rtuwva";$ans2="naSCavyapraSAn (8.3.7)-> RtunA RtuH (8.4.41)";$cont=0;}
if($an=~/^praSAn\+([wW])([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "praSAn$1$2$3";$ans1="ruwvaniReXa";$ans2="naSCavyapraSAn (8.3.7)";$cont=0;}

if($an=~/(.*)n\+([cC])([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1zS$2$3$4:$1MS$2$3$4";$ans1="ruwva:ruwva";$ans2="naSCavyapraSAn (8.3.7)-> awrAnunAsikaH pUrvasya wu vA (8.3.2)-> KaravasAnayorvisarjanIyaH (8.3.15)-> visarjanIyasya saH (8.3.34)-> swoH ScunA ScuH (8.4.40):naSCavyapraSAn (8.3.7)-> awrAnunAsikaH pUrvasya wu vA (8.3.2)-> KaravasAnayorvisarjanIyaH (8.3.15)-> visarjanIyasya saH (8.3.34)-> swoH ScunA ScuH (8.4.40)";$cont=0;}

if($an=~/(.*)n\+([tT])([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1zR$2$3$4:$1MR$2$3$4";$ans1="ruwva:ruwva";$ans2="naSCavyapraSAn (8.3.7)->awrAnunAsikaH pUrvasya wu vA (8.3.2)->KaravasAnayorvisarjanIyaH (8.3.15)->visarjanIyasya saH (8.3.34)->RtunA RtuH (8.4.41):naSCavyapraSAn (8.3.7)->anunAsikAw paroZnusvAraH (8.3.4)->KaravasAnayorvisarjanIyaH (8.3.15)->visarjanIyasya saH (8.3.34)->RtunA RtuH (8.4.41)";$cont=0;}

if($an=~/(.*)n\+([wW])([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1zs$2$3$4:$1Ms$2$3$4";$ans1="ruwva:ruwva";$ans2="naSCavyapraSAn (8.3.7)->awrAnunAsikaH pUrvasya wu vA (8.3.2)->KaravasAnayorvisarjanIyaH (8.3.15)->visarjanIyasya saH (8.3.34) :naSCavyapraSAn (8.3.7)->anunAsikAw paroZnusvAraH (8.3.4)->KaravasAnayorvisarjanIyaH (8.3.15)->visarjanIyasya saH (8.3.34)";$cont=0;}

if($an=~/^nQn\+p(.*)/){
   $ans = "nQz><p$1:nQM><p$1:nQzHp$1:nQMHp$1:nQnp$1";
   $ans1="ruwva:ruwva:ruwva:ruwva:ruwvABAve";
   $ans2="nQnpe (8.3.10)->awrAnunAsikaH pUrvasya wu vA (8.3.2)->KaravasAnayorvisarjanIyaH (8.3.15)->kupvoH><ka><pO ca (8.3.37):nQnpe (8.3.10)->anunAsikAw paroZnusvAraH (8.3.4)->KaravasAnayorvisarjanIyaH (8.3.15)->kupvoH><ka><pO ca (8.3.37):nQnpe (8.3.10)->awrAnunAsikaH pUrvasya wu vA (8.3.2)->KaravasAnayorvisarjanIyaH (8.3.15)->visarjanIyasya saH (8.3.34):nQnpe (8.3.10)->anunAsikAw paroZnusvAraH (8.3.4)->KaravasAnayorvisarjanIyaH (8.3.15)->visarjanIyasya saH (8.3.34):nQnpe (8.3.10)";
   $cont=0;
}

if($an=~/^kAn\+kAn$/){
   $ans = "kAzskAn:kAMskAn";
   $ans1="ruwva:ruwva";
   $ans2="kAnAmrediwe (8.3.12)->awrAnunAsikaH pUrvasya wu vA (8.3.2)->KaravasAnayorvisarjanIyaH (8.3.15)->saMpuMkAnAM so vakwavyaH (vA 4892):kAnAmrediwe (8.3.12)->awrAnunAsikaH pUrvasya wu vA (8.3.2)->KaravasAnayorvisarjanIyaH (8.3.15)->saMpuMkAnAM so vakwavyaH (vA 4892)";
   $cont=0;
}

if($an=~/pum\+([kKcCtTwWpP])([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "puMs$1$2$3:puzs$1$2$3";$ans1="ruwva:ruwva";$ans2="pumaH Kayyampare (8.3.6)->anunAsikAw paroZnusvAraH (8.3.4)->KaravasAnayorvisarjanIyaH (8.3.15)->saMpuMkAnAM so vakwavyaH (vA 4892):pumaH Kayyampare (8.3.6)->awrAnunAsikaH pUrvasya wu vA (8.3.2)->KaravasAnayorvisarjanIyaH (8.3.15)->saMpuMkAnAM so vakwavyaH (vA 4892)";$cont=0;}

if($an=~/(.*)H\+([KPCTWctwkpSRs])([SRs])(.*)/){ $ans="$1H $2$3$4";$ans1="visarga";$ans2="Sarpare visarjanIyaH (8.3.35)";$cont=0;}

if($an=~/(.*)H\+([SRs])([KPCTWctwkpSRs])(.*)/){ $ans="$1 $2$3$4:$1H $2$3$4:$1$2$2$3$4";$ans1="visargalopaH:visargalopABAve:sawva";$ans2="Karpare Sari vA visargalopo vakwavyaH (vA 4906):Karpare Sari vA visargalopo vakwavyaH (vA 4906):visarjanIyasya saH (8.3.34)";$cont=0;}

if($an=~/^sam\+rAt/){ $ans="samrAt";$ans1="mawva";$ans2="mo rAji samaH kvO (8.2.35)";$cont=0;}

if($an=~/(.*)m\+hm(.*)/){ 
   $ans ="$1n hm$2:$1M hm$2";
   $ans1="mawva:anusvAraH";
   $ans2="he mapare vA (8.3.26):moZnusvAraH (8.3.23)";
   $cont=0;
}

if($an=~/(.*)m\+h([yvl])(.*)/){ 
   $ans="$1$2z h$2$3:$1M h$2$3";
   $ans1="anunAsika:anusvAraH";
   $ans2="yavalapare yavalA vewi vakwavyam (vA 4902):moZnusvAraH (8.3.23)";
   $cont=0;
}

if($an=~/(.*)m\+hn(.*)/){ 
   $ans ="$1n hn$2:$1M hn$2";
   $ans1="nawva:anusvAraH";
   $ans2="na pare naH (8.3.27):moZnusvAraH (8.3.23)";
   $cont=0;
}

if($an=~/^(eRa|sa)H\+([gGfcCjJFtTdDNwWxXnbBmyrlvh])(.*)/){$ans ="$1 $2$3";$ans1="visargalopa",$ans2= "ewawwaxoH sulopoZkoranaFsamAse hali (6.1.132)";$cont=0;}

if($an =~ /(.*)[aA]\+e(wi|Ri|mi|wA|wArO|wAraH|wAsi|wAsWaH|wAsWa|wAsmi|wAsvaH|wAsmaH|Ryawi|RyawaH|Ryanwi|Ryasi|RyaWaH|RyaWa|RyAmi|RyAvaH|RyAmaH|wu)$/){$ans="$1E$2";$ans1="vqxXi";$ans2="ewyeXawyUTsu (6.1.86)";$cont=0;}
if($an =~ /(.*)[aA]\+E(w|wAm|H|wam|wa|va|ma|Ryaw|RyawAm|Ryan|RyaH|Ryawam|Ryawa|Ryam|RyAva|RyAma)$/){$ans="$1E$2";$ans1="vqxXi";$ans2="ewyeXawyUTsu (6.1.86)";$cont=0;$cont=0;}

if($an =~ /(.*)[aA]\+[eE]X(.*)/){$ans="$1EX$2";$ans1="vqxXi";$ans2="ewyeXawyUTsu (6.1.86)";$cont=0;}

if($an =~ /(.*)[aA]\+Uha(.*)/){$ans="$1Oha$2";$ans1="vqxXi";$ans2="ewyeXawyUTsu (6.1.86)";$cont=0;}

if($an=~/^ahan\+(rUpa|rAwr|raWanwara)(.*)/){$ans="aho $1$2";$ans1="ruwva-> uwva-> guNa";$ans2="roZsupi (8.2.69)(prApwe) -> rUparAwri raWanwareRuruwvam vAcyam (vA 4847)-> haSi ca (6.1.114)-> Ax guNaH (6.1.87)";$cont=0;}

if($an=~/^ahan\+(pawi|puwra)(.*)/){
   $ans="ahar$1$2:ahaH $1$2:aha><$1$2";
   $ans1="rePa:visarga:upaXmAnIya";
   $ans2="roZsupi (8.2.69)-> KaravasAnayorvisarjanIyaH (8.3.15) (prApwe)-> aharAxInAm pawyAxiRu vA rePaH (vA 4851):roZsupi (8.2.69) -> KaravasAnayorvisarjanIyaH (8.3.15)-> kupvo><ka><pO ca (8.3.37):roZsupi (8.2.69) -> KaravasAnayorvisarjanIyaH (8.3.15)-> kupvo><ka><pO ca (8.3.37)";
   $cont=0;
}

if($an=~/^ahan\+gaNa(.*)/){$ans="ahargaNa$1";$ans1="rePa";$ans2="roZsupi (8.2.69)";$cont=0;}

if($an=~/^gIr\+(pawi|puwra)(.*)/){
   $ans="gIr$1$2:gI><$1$2:gIH $1$2";
   $ans1="rePa:upaXmAnIya:visarga";
   $ans2="KaravasAnayorvisarjanIyaH (8.3.15)(prApwe) -> aharAxInAm pawyAxiRu vA rePaH (vA 4851):KaravasAnayorvisarjanIyaH (8.3.15)-> kupvo><ka><pO ca (8.3.37):KaravasAnayorvisarjanIyaH (8.3.15)-> kupvo><ka><pO ca (8.3.37)";
   $cont=0;
}

if($an=~/^gIr\+gaNa(.*)/){$ans="gIrgaNa$1";$ans1="rePa";$ans2="roZsupi (8.2.69)";$cont=0;}

if($an=~/^XUr\+(pawi|puwra)(.*)/){
   $ans="XUr$1$2:XU><$1$:XUH $1$2";
   $ans1="rePa:upaXmAnIya:visarga";
   $ans2="KaravasAnayorvisarjanIyaH (8.3.15)(prApwe)-> aharAxInAm pawyAxiRu vA rePaH (vA 4851):KaravasAnayorvisarjanIyaH (8.3.15)-> kupvo><ka><pO ca (8.3.37):KaravasAnayorvisarjanIyaH (8.3.15)-> kupvo><ka><pO ca (8.3.37)";
   $cont=0;
}

if($an=~/^XUr\+gaNa(.*)/){$ans="XUrgaNa$1";$ans1="rePa";$ans2="roZsupi (8.2.69)";$cont=0;}

if($an=~/^ahan\+ahaH$/){$ans= "aharahaH";$ans1="rePa";$ans2="roZsupi (8.2.69)";$cont=0;}
elsif($an=~/(.*)([aiuqL])([fNn])\+([aAiIuUqQLeEoO])(.*)/){$ans = "$1$2$3$3$4$5";$ans1= "famudAgama";$ans2 = "famo hrasvAxaci famuNniwyam (8.3.32)";$cont=0;}
elsif($an=~/(.*)([^aiuqL])([fNn])\+([aAiIuUqQLeEoO])(.*)/){$ans = "$1$2$3$4$5";$ans1= "diPAlta";$ans2 = "";$cont=0;}

if($an=~/(.*)([iIuUqQLeEoO])H\+([aAiIuUqQLeEoOgGfjJFdDNxXnbBmylvh])(.*)/){$ans = "$1$2r$3$4";$ans1 = "rePa"; $ans2 = "sasajuRo ruH (8.2.66)";$cont=0;}

if($an=~/^(eRa|sa)H\+([kKgGfcCjJFtTdDNwWxXnpPbBmyrlvSRsh])(.*)/){$ans ="$1 $2$3";$ans1="visargalopa",$ans2= "ewawwaxoH sulopoZkoranaFsamAse hali (6.1.132)"; $cont=0;}
elsif($an=~/(.*)aH\+([gGfjJFdDNxXnbBmyrlvh])(.*)/){$ans ="$1o $2$3"; $ans1 ="ruwva-> uwva-> guNa";$ans2 = "sasajuRo ruH (8.2.66)-> haSi ca (6.1.114)-> Ax guNaH (6.1.87)" ;$cont=0;}
elsif($an=~/^BoH\+([kKgGfcCjJFtTdDNwWxXnpPbBmyrlvSRsh])(.*)/){ $ans="Bos$1$2";$ans1="";$ans2="sasajuRo ruH (8.2.66)-> KaravasAnayorvisarjanIyaH (8.3.15)-> visarjanIyasya saH (8.3.34)";$cont=0;}
elsif($an=~/^(Bago|aGo)H\+([kKgGfcCjJFtTdDNwWxXnpPbBmyrlvSRsh])(.*)/){ $ans="$1 $2$3";$ans1="yawvalopaH";$ans2="sasajuRo ruH (8.2.66)->BoBagoaGo apUrvasyayoZSi (8.3.17)->hali sarveRAm (8.3.22)";$cont=0;}
elsif($an=~/^(Bo|Bago|aGo)H\+([aAiIuUqQLeEoO])(.*)/){ 
      $ans="$1y$2$3:$1 $2$3";
      $ans1="sawva->yawva->laGuprayawnAxeSaH sawva->yawva->laGuprayawnABAve yawvalop";
      $ans2="sasajuRo ruH (8.2.66)->BoBagoaGo apUrvasyayoZSi (8.3.17)->vyorlaGuprayawnawaraH SAkatAyanasya (8.3.18):sasajuRo ruH (8.2.66)->BoBagoaGo apUrvasyayoZSi (8.3.17)->owo gArgyasya (8.3.20)";
      $cont=0;
}
elsif($an=~/(.*)([aAiIuUqQLeEoO])H\+([wW])([^sSR].*)/){$ans = "$1$2s$3$4";$ans1 = "sawva";$ans2 = "visarjanIyasya saH (8.3.34)";$cont=0;}
elsif($an=~/(.*)([aAiIuUqQLeEoO])H\+([cC])(.*)/){$ans = "$1$2S$3$4"; $ans1 ="sawva-> Scuwva";$ans2 = "visarjanIyasya saH (8.3.34)-> swoH ScunA ScuH (8.4.40)";$cont=0;}
elsif($an=~/(.*)([aAiIuUqQLeEoO])H\+([tT])(.*)/){$ans = "$1$2R$3$4"; $ans1 ="sawva-> Rtuwva";$ans2 = "visarjanIyasya saH (8.3.34)-> RtunA RtuH (8.4.41)";$cont=0;}
elsif($an=~/(.*)AH\+([gGfjJFdDNxXnbBmyrlvh])(.*)/){$ans ="$1A $2$3"; $ans1 ="ruwva-> yawva-> lopa";$ans2 = "sasajuRo ruH (8.2.66)-> BoBagoaGo apUrvasya yoZSi (8.3.17)-> hali sarveRAm (8.3.22)" ;$cont=0;}

if($an=~/^(miWo|ho|aho|Aho|uwAho|no|aWo)\+([aAiIuUqQLeEoO])(.*)/){$ans ="$1 $2$3" ;$ans1="pragqhyawva->prakqwiBAva";$ans2="ow (1.1.15)-> pluwapragqhyA aci niwyam (6.1.125)";$cont=0;}

if($an=~/^([aiuqLeEoO])\+([aAiIuUqQLeEoO])(.*)/){$ans = "$1 $2$3";$ans1 ="pragqhyawva->prakqwiBAva";$ans2="nipAwa ekAjanAf (1.1.14)-> pluwapragqhyA aci niwyam (6.1.125)"; $cont=0;}


if($an=~/^uF\+iwi/){
   $ans = "u iwi:Uz iwi:viwi";
   $ans1 = "vikalpena pragqhyawva-> prakqwiBAva:vikalpena Uz AxeSa->pragqhyawva->prakqwiBAva :vikalpABAve yaN";
   $ans2="uFaH (1.1.17)-> pluwapragqhyA aci niwyam (6.1.125):Uz (1.1.18)-> pluwapragqhyA aci niwyam (6.1.125):iko yaNaci (6.1.77)";
   $cont=0;
}

if($an=~/^(kR|j)i\+ya(.*)/){
   $ans = "$1ayya$2:$1eya$2";
   $ans1 = "SakyArWe ayAxeSa nipAwana:SakyArWABAve guNa";
   $ans2 = "kRayyajayyO SakyArWe (6.1.81):sArvaXAwukArXaXAwukayoH (7.3.84";
   $cont=0;
}

if($an=~/^krI\+ya(.*)/){
   $ans = "krayya$1:kreya$1";
   $ans1 = "krayaNArhe ayAxeSa nipAwanam:krayaNArhABAve guNa";
   $ans2 = "krayyaswaxarWe (6.1.82):sArvaXAwukArXaXAwukayoH (7.3.84)";
   $cont=0;
}

if($an=~/^(aXa|Sira)H\+paxa(.*)/){
   $ans = "$1spaxa$2:aXa><paxa$1:aXaH paxa$1";
   $ans1 = "samAse sawva:upaXmAnIya:visarga";
   $ans2 = "aXaSSirasI paxe (8.3.47):kupvo ><ka ><pO ca (8.3.37):kupvo ><ka ><pO ca (8.3.37)";
   $cont=0;
}

if($an=~/(.*[iu])H\+([kKpP])(.*)/){
   $ans = "$1iR$2$3:$1i><$2$3:$1iH $2$3"; 
   $ans1 = "sAmarWye Rawvam:RawvABAve jihvAmUlIya:RawvABAve visarga";
   $ans2 = "isusoH sAmarWye (8.3.44):kupvo><ka ><pO ca (8.3.37):kupvo><ka ><pO ca (8.3.37)"; 
   $cont=0;
}

}
#print "ans = $ans\n";
#print "ans1 = $ans1\n";
#print "ans2 = $ans2\n";
#print "cont = $cont\n";
### $cont = 1 indicates, the regular rules are to be applied after these exceptional rules.
## $cont = 0  means after these exce[tional rules are applied, do not apply the regular rules.
$ans.",".$ans1.",".$ans2.",".$cont;
}
1;
#if the SabxaH or XAxu have xvivacan and the second word will start with 'I' 'U' 'e' then there is prakqwiBAva (IxUxexxvivacanaM pragqhyam)
# if the first word is ending with 'a' or 'A' and the second word is an 'i' Xaxu or 'eX' XAxu started with the letter 'e', or the word is 'UD' then there is vqxXi sanXi. (ewyeXwyUDsu)
# if the first word is either 'amU' or 'amI' then there is no sanXi (axaso mAw)
