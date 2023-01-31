#!/usr/bin/env perl

#  Copyright (C) 2002-2012 Pankaj Vyays, Sivaja Nair
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


sub apavAdaniyamAH{
 my($an)=@_;
 my($ans) ;
#if($an=~/akRa\+UhinI/){$ans = "akROhiNI";$ans1="vqxXi";$ans2="akRAxUhinyAmupasaMKyAnam (vA 3604)";}
if($an=~/([kp])Aras\+kara/){$ans = $1."Araskara";$ans1="";$ans2="nipAwana";}
if($an=~/kAs\+wIra/){$ans = "kAswIra";$ans1="";$ans2="nipAwana";}
if($an=~/aparas\+para/){$ans = "aparaspara";$ans1="";$ans2="nipAwana";}
if($an=~/apas\+kara/){$ans = "apaskara";$ans1="";$ans2="nipAwana";}
if($an=~/ayas\+xawq/){$ans = "ayoxawq";$ans1="";$ans2="nipAwana";}
if($an=~/ajas\+wunxa/){$ans = "ajaswunxa";$ans1="";$ans2="nipAwana";}
if($an=~/akRa\+Uhin(.*)/){$ans = "akROhiN$1";$ans1="vqxXi";$ans2="akRAxUhinyAmupasaMKyAnam (vA 3604)";}
#if$an eq "akRa+UhinI"){"$ans = akROhiNI;}
if($an=~/sva\+Irin(.*)/){$ans = "svErin$1";$ans1="vqxXi";$ans2="svAxIreriNoH (vA 3606)";}
if($an=~/sva\+IraH/){$ans = "svEraH";$ans1="vqxXi";$ans2="svAxIreriNoH (vA 3606)";}
if($an=~/sva\+IriN(.*)/){$ans = "svEriN$1";$ans1= "vqxXi";$ans2="svAxIreriNoH (vA 3606)";}
if($an=~/pra\+Uh(.*)/){$ans = "prOh$1";$ans1="vqxXi";$ans2="prAxUhoDoDyeRERyeRu (vA 3605)";}
if($an=~/pra\+UD(.*)/){$ans = "prOD$1";$ans1= "vqxXi";$ans2="prAxUhoDoDyeRERyeRu (vA 3605)";}
if($an=~/pra\+eRy(.*)/){$ans = "prERy$1";$ans1="vqxXi";$ans2="prAxUhoDoDyeRERyeRu (vA 3605)";}
if($an=~/pra\+eR(.*)/){$ans = "prER$1";$ans1="vqxXi";$ans2="prAxUhoDoDyeRERyeRu (vA 3605)";}
if($an=~/pra\+qN(.*)/){$ans = "prArN$1";$ans1="vqxXi";$ans2="pravawsawarakambalavasanArNaxaSAnAmqNe (vA 3608-9)";}
elsif($an=~/pra\+q(.*)/){$ans = "prAr$1";$ans1="vqxXi";$ans2="upasargAxqwi XAwoH (6.1.91)";}
if($an=~/vawsawara\+qN(.*)/){$ans = "vawsawarArN$1";$ans1="vqxXi";$ans2="pravawsawarakambalavasanArNaxaSAnAmqNe (vA 3608-9)";}
if($an=~/kambala\+qN(.*)/){$ans = "kambalArN$1";$ans1="vqxXi";$ans2="pravawsawarakambalavasanAqNaxaSAnAmqNe (vA 3608-9)";}
if($an=~/vasana\+qN(.*)/){$ans = "vasanArN$1";$ans1="vqxXi";$ans2="pravawsawarakambalavasanAqNaxaSAnAmqNe (vA 3608-9)";}
if($an=~/qNa\+qN(.*)/){$ans = "qNArN$1";$ans1="vqxXi";$ans2="pravawsawarakambalavasanAqNaxaSAnAmqNe (vA 3608-9)";}
if($an=~/xaSa\+qN(.*)/){$ans = "xaSArN$1";$ans1="vqxXi";$ans2="pravawsawarakambalavasanArNaxaSAnAmqNe (vA 3608-9)";}
if($an=~/(.*)o\+yam/){$ans = "$1avyam";$ans1="vAnwa";$ans2="vAnwo yi prawyaye (6.1.79)";}
if($an=~/(.*)O\+yam/){$ans = "$1Avyam";$ans1="vAnwa";$ans2="vAnwo yi prawyaye (6.1.79)";}
if($an=~/go\+yUw(.*)/){$ans = "gavyUw$1";$ans1="vAnwa";$ans2="aXvaparimANe ca (vA 3544)";}
if($an=~/Saka\+anXuH/){$ans = "SakanXuH";$ans1="pararUpa";$ans2="SakanXvAxiRu pararUpam vAcyam (vA 3632)";}
if($an=~/karka\+anXuH/){$ans = "karkanXuH";$ans1="pararUpa";$ans2="SakanXvAxiRu pararUpam vAcyam (vA 3632)";}
if($an=~/kula\+atA/){$ans = "kulatA";$ans1="pararUpa";$ans2="SakanXvAxiRu pararUpam vAcyam (vA 3632)";}
if($an=~/hala\+IRA/){$ans = "halIRA";$ans1="pararUpa";$ans2="SakanXvAxiRu pararUpam vAcyam (vA 3632)";}
if($an=~/lAfgala\+IRA/){$ans = "lAfgalIRA" ;$ans1="pararUpa";$ans2="SakanXvAxiRu pararUpam vAcyam (vA 3632)";}
if($an=~/mArwa\+aNdaH/){$ans = "mArwaNdaH";$ans1="pararUpa";$ans2="SakanXvAxiRu pararUpam vAcyam (vA 3632)";}
if($an=~/sIman\+anwaH/){$ans = "sImanwaH";$ans1="pararUpa";$ans2="sImanwaH keSaveSe (vA 3633)";}
if($an=~/sAra\+afg(.*)/){$ans = "sArafg$1";$ans1="pararUpa";$ans2="sArafgaH paSupakRiNoH (gaNa sUwram 136)";}
if($an=~/manas\+IRA/){$ans = "manIRA";$ans1="pararUpa";$ans2="SakanXvAxiRu pararUpam vAcyam (vA 3632)";}
if($an=~/pawaw\+aFjaliH/){$ans = "pawaFjaliH";$ans1="pararUpa";$ans2="SakanXvAxiRu pararUpam vAcyam (vA 3632)";}
if($an=~/(.*)([aA])\+owuH/){$ans = "$1owuH";$ans1="pararUpa";$ans2="owvoRTayoH samAse vA (vA 3634)";}
if($an=~/(.*)([aA])\+owuH/){$ans =$ans.":". "$1OwuH";$ans1=$ans1.":"."vqxXi";$ans2=$ans2.":"."vqxXireci (6.1.88)";}
if($an=~/(.*)([aA])\+oRT(.*)/){$ans = "$1oRT$3";$ans1="pararUpa";$ans2="owvoRTayoH samAse vA (vA 3634)";}
if($an=~/(.*)([aA])\+oRT(.*)/){$ans =$ans.":". "$1ORT$3";$ans1=$ans1.":"."vqxXi";$ans2=$ans2.":"."vqxXireci (6.1.88)";}
if($an=~/kaH\+kaH/){$ans = "kaskaH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/kOwaH\+kuwaH/){$ans = "kOwaskuwaH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/BrAwuH\+puwraH/){$ans = "BrAwuRpuwraH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/SunaH\+karNaH/){$ans = "SunaskarNaH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/saxyaH\+kAlaH/){$ans = "saxyaskAlaH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/saxyaH\+krIH/){$ans = "saxyaskrIH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/sAxyaH\+kaH/){$ans = "sAxyaskaH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/kAMH\+kAn/){$ans = "kAMskAn";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/sarpiH\+kuNdikA/){$ans = "sarpiRkuNdikA";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/XanuH\+kapAlam/){$ans = "XanuRkapAlam";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/bahiH\+palam/){$ans = "bahiRpalam";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/barhiH\+palam/){$ans = "barhiRpalam";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/yajuH\+pAwram/){$ans = "yajuRpAwram";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/ayaH\+kAnwaH/){$ans = "ayaskAnwaH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/wamaH\+kANdaH/){$ans = "wamaskANdaH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/ayaH\+kANdaH/){$ans = "ayaskANdaH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/mexaH\+piNdaH/){$ans = "mexaspiNdaH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/BAH\+karaH/){$ans = "BAskaraH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/ahaH\+karaH/){$ans = "ahaskaraH";$ans1="sakAra";$ans2="kaskAxiRu ca (8.3.48)";}
if($an=~/namaH\+([kp].*)/){$ans = "namas$1";$ans1="sakAra";$ans2="namaspurasorgawyoH (8.3.40)";}
if($an=~/puraH\+([kp].*)/){$ans = "puras$1";$ans1="sakAra";$ans2="namaspurasorgawyoH (8.3.40)";}
if($an=~/wiraH\+([kp].*)/){$ans = "wiras$1";$ans1="sakAra";$ans2="wirasoZnyawarasyAm (8.3.42)";}
if($an=~/wiraH\+([kp].*)/){$ans = $ans. ":wiraH $1";$ans1=$ans1.":sawwvABAve";$ans2=$ans2.":wirasoZnyawarasyAm (8.3.42)";}
if($an=~/apa\+q(.*)/){$ans = "apAr$1";$ans1="vqxXi";$ans2="upasargAxqwi XAwoH(6.1.91)";}
if($an=~/ava\+q(.*)/){$ans = "avAr$1";$ans1="vqxXi";$ans2="upasargAxqwi XAwoH(6.1.91)";}
if($an=~/upa\+q(.*)/){$ans = "upAr$1";$ans1="vqxXi";$ans2="upasargAxqwi XAwoH(6.1.91)";}
if($an=~/(.*)pra\+([eo].*)/){$ans = "$1pr$2";$ans1="pararUpa";$ans2="efi pararUpam (6.1.94)";}
if($an=~/(.*[aAou])pa\+([eo].*)/){$ans = "$1p$2";$ans1="pararUpa";$ans2="efi pararUpam(6.1.94)";}
if($an=~/(.*[aA])va\+([eo].*)/){$ans = "$1v$2";$ans1="pararUpa";$ans2="efi pararUpam(6.1.94)";}
if($an=~/(.*)a\+(oz.*)/){$ans = "$1$2";$ans1="pararUpa";$ans2="omAfoSca(6.1.95)";}
if($an=~/go\+(a.*)/){$ans = "go $1";$ans1="prakqwiBAva";$ans2="sarvawra viBARA goH(6.1.122)";}
if($an=~/go\+([Aa])(.*)/){$ans =$ans.":"."gavA$2";$ans1=$ans1.":"."avafAxeSa";$ans2=$ans2.":"."avaf sPotAyanasya(6.1.123)-> akaH savarNe xIrGaH (6.1.101)";}
if($an=~/go\+a(.*)/){$ans =$ans.":"."goZ$1";$ans1=$ans1.":"."pararUpa";$ans2=$ans2.":"."efaH paxAnwAxawi (6.1.109)";}
if($an=~/go\+([iI])(.*)/){$ans = "gave$2";$ans1="avafAxeSa";$ans2="avaf sPotAyanasya(6.1.123)-> Ax guNaH (6.1.87)";}
if($an=~/go\+([uU])(.*)/){$ans = "gavo$2";$ans1="avafAxeSa";$ans2="avaf sPotAyanasya(6.1.123)-> Ax guNaH (6.1.87)";}
if($an=~/go\+([qQ])(.*)/){$ans = "gavar$2";$ans1="avafAxeSa";$ans2="avaf sPotAyanasya(6.1.123)-> Ax guNaH (6.1.87)";}
if($an=~/go\+(L)(.*)/){$ans = "gaval$2";$ans1="avafAxeSa";$ans2="avaf sPotAyanasya(6.1.123)-> Ax guNaH (6.1.87)";}
if($an=~/go\+([eE])(.*)/){$ans = "gavE$2";$ans1="avafAxeSa";$ans2="avaf sPotAyanasya(6.1.123)-> Ax guNaH (6.1.87)";}
if($an=~/go\+([oO])(.*)/){$ans = "gavO$2";$ans1="avafAxeSa";$ans2="avaf sPotAyanasya(6.1.123)-> Ax guNaH (6.1.87)";}
if($an=~/go\+inxr(.*)/){$ans = "gavenxr$1";$ans1="avafAxeSa";$ans2="inxre ca(6.1.124)-> Ax guNaH (6.1.87)";}
if($an=~/(.*)[tTdDN]\+nAm/){$ans = "$1NNAm";$ans1="jaSwva-> RtuwvaniReXaH-> Nawva";$ans2="JalAM jaSoZnwe # (8.2.39)-> RtunA RtuH # (8.4.41)[Rtuwve prApwe]-> na paxAnwAttoranAm # (8.4.42)-> anAmnavawinagarINAmiwi vAcyam(vA 5016)-> yaroZnunAsikeZnunAsiko vA (8.4.45)-> prawyaye BARAyAm niwyam (vA 5017)";}
if($an=~/(.*)[tTdDN]\+navawi/){$ans = "$1NNavawi";$ans1="jaSwva-> RtuwvaniReXaH-> Nawva-> anunAsikawvam";$ans2="JalAM jaSoZnwe # (8.2.39)-> RtunA RtuH # (8.4.41)[Rtuwve prApwe]-> na paxAnwAttoranAm # (8.4.42)-> anAmnavawinagarINAmiwi vAcyam(vA 5016)-> yaroZnunAsikeZnunAsiko vA (8.4.45)";}
if($an=~/(.*)[tTdD]\+navawi/){$ans =$ans.":". "$1dNavawi";$ans1=$ans1.":"."jaSwva-> RtuwvaniReXaH-> Nawva";$ans2=$ans2.":"."JalAM jaSoZnwe # (8.2.39)-> RtunA RtuH # (8.4.41)[Rtuwve prApwe]-> na paxAnwAttoranAm # (8.4.42)-> anAmnavawinagarINAmiwi vAcyam(vA 5016)";}
if($an=~/(.*)[tTdDN]\+nagar(.*)/){$ans = "$1NNagar$2";$ans1="jaSwva-> RtuwvaniReXaH-> Nawva-> anunAsikawvam";$ans2="JalAM jaSoZnwe # (8.2.39)-> RtunA RtuH # (8.4.41)[Rtuwve prApwe]-> na paxAnwAttoranAm # (8.4.42)-> anAmnavawinagarINAmiwi vAcyam(vA 5016)-> yaroZnunAsikeZnunAsiko vA (8.4.45)";}
if($an=~/(.*)[tTdD]\+nagar(.*)/){$ans =$ans.":". "$1dNagar$2";$ans1=$ans1.":"."jaSwva->RtuwvaniReXaH->Nawva";$ans2=$ans2.":"."JalAM jaSoZnwe # (8.2.39)->RtunA RtuH # (8.4.41)[Rtuwve prApwe]->na paxAnwAttoranAm # (8.4.42)->anAmnavawinagarINAmiwi vAcyam(vA 5016)";}
if($an=~/^amI\+(.*)/){$ans = "amI $1";$ans1="prakqwiBAva";$ans2="axaso mAw(1.1.12)";}
if($an=~/^amU\+(.*)/){$ans = "amU $1";$ans1="prakqwiBAva";$ans2="axaso mAw(1.1.12)";}
if($an=~/uw\+sWA(.*)/){$ans = "uwWA$1";$ans1="pUrvasavarNaH->lopaH";$ans2="uxaH sWAswamBoH pUrvasya (8.4.61)->Jaro Jari savarNe (8.4.65)";}
if($an=~/uw\+sWA(.*)/){$ans =$ans.":". "uwWWA$1";$ans1=$ans1.":"."pUrvasavarNaH->lopABAvaH";$ans2=$ans2.":"."uxaH sWAswamBoH pUrvasya (8.4.61)->Jaro Jari savarNe (8.4.65)";}
if($an=~/uw\+swamB(.*)/){$ans = "uwwamB$1";$ans1=" pUrvasavarNaH->lopaH";$ans2=" uxaH sWAswamBoH pUrvasya (8.4.61)->Jaro Jari savarNe (8.4.65)";}
if($an=~/uw\+swamB(.*)/){$ans =$ans.":". "uwWwamB$1";$ans1=$ans1.":"."pUrvasavarNaH->lopABAvaH";$ans2=$ans2.":"."uxaH sWAswamBoH pUrvasya (8.4.61)->Jaro Jari savarNe (8.4.65)";}
if($an=~/(.*)([kKgG])\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1kC$3$4";$ans1="jaSwva->carwva->Cawva";$ans2="JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)->SaSCoZti (8.4.63)";}
if($an=~/(.*)([kKgG])\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans =$ans.":". "$1kS$3$4";$ans1=$ans1.":"."jaSwva->carwva->CawvABAva";$ans2=$ans2.":"."JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)";}
if($an=~/(.*)([cCjJ])\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1cC$3$4";$ans1="jaSwva->carwva->Cawva";$ans2="JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)->SaSCoZti (8.4.63)";}
if($an=~/(.*)([cCjJ])\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans =$ans.":". "$1cS$3$4";$ans1=$ans1.":"."jaSwva->carwva->CawvABAva";$ans2=$ans2.":"."JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)";}
if($an=~/(.*)([tTdD])\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1tC$3$4";$ans1="jaSwva->carwva->Cawva";$ans2="JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)->SaSCoZti (8.4.63)";}
if($an=~/(.*)([tTdD])\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans =$ans.":". "$1tS$3$4";$ans1=$ans1.":"."jaSwva->carwva->CawvABAva";$ans2=$ans2.":"."JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)";}
if($an=~/(.*)([wWxX])\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1cC$3$4";$ans1="jaSwva->Scuwva->carwva->Cawva";$ans2="JalAM jaSoZnwe (8.2.39)->swoH ScunA ScuH (8.4.40)->Kari ca (8.4.55)->SaSCoZti (8.4.63)";}
if($an=~/(.*)([wWxX])\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans =$ans.":". "$1cS$3$4";$ans1=$ans1.":"."jaSwva->Scuwva->carwva->CawvABAva";$ans2=$ans2.":"."JalAM jaSoZnwe (8.2.39)->swoH ScunA ScuH (8.4.40)->Kari ca (8.4.55)";}
if($an=~/(.*)([pPbB])\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1pC$3$4";$ans1="jaSwva->carwva->Cawva";$ans2="JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)->SaSCoZti (8.4.63)";}
if($an=~/(.*)([pPbB])\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans =$ans.":". "$1pS$3$4";$ans1=$ans1.":"."jaSwva->carwva->CawvABAva";$ans2=$ans2.":"."JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)";}
if($an=~/(.*)(n)\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1FC$3$4";$ans1="wugAgama->Scuwva->carwva->Cawva->lopaH";$ans2="Si wuk (8.3.31)->swoH ScunA ScuH (8.4.40)->Kari ca (8.4.55)->SaSCoZti (8.4.63)->Jaro Jari savarNe (8.4.65)";}
if($an=~/(.*)(n)\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans =$ans.":". "$1FcC$3$4";$ans1=$ans1.":"."wugAgama->Scuwva->carwva->Cawva->lopABAvaH";$ans2=$ans2.":"."Si wuk (8.3.31)->swoH ScunA ScuH (8.4.40)->Kari ca (8.4.55)->SaSCoZti (8.4.63)";}
if($an=~/(.*)(n)\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans =$ans.":". "$1FcS$3$4";$ans1=$ans1.":"."wugAgama->Scuwva->carwva->CawvABAvaH";$ans2=$ans2.":"."Si wuk (8.3.31)->swoH ScunA ScuH (8.4.40)->Kari ca (8.4.55)";}
if($an=~/(.*)(n)\+S([aAiIuUqQLeEoOhyvr])(.*)/){$ans =$ans.":". "$1FS$3$4";$ans1=$ans1.":"."Scuwva";$ans2=$ans2.":"."swoH ScunA ScuH (8.4.40)";}
if($an=~/(.*)([kKgG])\+S([lfmFNn])(.*)/){$ans = "$1kC$3$4";$ans1="jaSwva->carwva->Cawva";$ans2="JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)->CawvamamIwi vAcyam (vA 5025)";}
if($an=~/(.*)([kKgG])\+S([lfmFNn])(.*)/){$ans =$ans.":". "$1kS$3$4";$ans1=$ans1.":"."jaSwva->carwva->CawvABAva";$ans2=$ans2.":"."JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)";}
if($an=~/(.*)([cCjJ])\+S([lFmfNn])(.*)/){$ans = "$1cC$3$4";$ans1="jaSwva->carwva->Cawva";$ans2="JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)->CawvamamIwi vAcyam (vA 5025)";}
if($an=~/(.*)([cCjJ])\+S([lFmfNn])(.*)/){$ans =$ans.":". "$1cS$3$4";$ans1=$ans1.":"."jaSwva->carwva->CawvABAva";$ans2=$ans2.":"."JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)";}
if($an=~/(.*)([tTdD])\+S([lFmfNn])(.*)/){$ans = "$1tC$3$4";$ans1="jaSwva->carwva->Cawva";$ans2="JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)->CawvamamIwi vAcyam (vA 5025)";}
if($an=~/(.*)([tTdD])\+S([lFmfNn])(.*)/){$ans =$ans.":". "$1tS$3$4";$ans1=$ans1.":"."jaSwva->carwva->CawvABAva";$ans2=$ans2.":"."JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)";}
if($an=~/(.*)([wWxX])\+S([lFmfNn])(.*)/){$ans = "$1cC$3$4";$ans1="jaSwva->Scuwva->carwva->Cawva";$ans2="JalAM jaSoZnwe (8.2.39)->swoH ScunA ScuH (8.4.40)->Kari ca (8.4.55)->CawvamamIwi vAcyam (vA 5025)";}
if($an=~/(.*)([wWxX])\+S([lFmfNn])(.*)/){$ans =$ans.":". "$1cS$3$4";$ans1=$ans1.":"."jaSwva->Scuwva->carwva->CawvABAva";$ans2=$ans2.":"."JalAM jaSoZnwe (8.2.39)->swoH ScunA ScuH (8.4.40)->Kari ca (8.4.55)";}
if($an=~/(.*)([pPbB])\+S([lfFmnN])(.*)/){$ans = "$1pC$3$4";$ans1="jaSwva->carwva->Cawva";$ans2="JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)->CawvamamIwi vAcyam (vA 5025)";}
if($an=~/(.*)([pPbB])\+S([lfFmnN])(.*)/){$ans =$ans.":". "$1pS$3$4";$ans1=$ans1.":"."jaSwva->carwva->CawvABAva";$ans2=$ans2.":"."JalAM jaSoZnwe (8.2.39)->Kari ca (8.4.55)";}
if($an=~/(.*)n\+([cC])([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1zS$2$3$4";$ans1=" ruwva";$ans2="naSCavyapraSAn (8.3.7)-> awrAnunAsikaH pUrvasya wu vA (8.3.2)-> KaravasAnayorvisarjanIyaH (8.3.15)-> visarjanIyasya saH (8.3.34)-> swoH ScunA ScuH (8.4.40)";}
if($an=~/(.*)n\+([cC])([aAiIuUqQLeEoOhyvr])(.*)/){$ans =$ans.":". "$1MS$2$3$4";$ans1=$ans1.":"."ruwva";$ans2=$ans2.":"."naSCavyapraSAn (8.3.7)->anunAsikAw paroZnusvAraH (8.3.4)->KaravasAnayorvisarjanIyaH (8.3.15)->visarjanIyasya saH (8.3.34)->swoH ScunA ScuH (8.4.40)";}
if($an=~/(.*)n\+([tT])([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1zR$2$3$4";$ans1="ruwva";$ans2="naSCavyapraSAn (8.3.7)->awrAnunAsikaH pUrvasya wu vA (8.3.2)->KaravasAnayorvisarjanIyaH (8.3.15)->visarjanIyasya saH (8.3.34)->RtunA RtuH (8.4.41)";}
if($an=~/(.*)n\+([tT])([aAiIuUqQLeEoOhyvr])(.*)/){$ans = $ans.":"."$1MR$2$3$4";$ans1=$ans1.":"."ruwva";$ans2=$ans2.":"."naSCavyapraSAn (8.3.7)->anunAsikAw paroZnusvAraH (8.3.4)->KaravasAnayorvisarjanIyaH (8.3.15)->visarjanIyasya saH (8.3.34)->RtunA RtuH (8.4.41)";}
if($an=~/(.*)n\+([wW])([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "$1zs$2$3$4";$ans1="ruwva";$ans2="naSCavyapraSAn (8.3.7)->awrAnunAsikaH pUrvasya wu vA (8.3.2)->KaravasAnayorvisarjanIyaH (8.3.15)->visarjanIyasya saH (8.3.34)";}
if($an=~/(.*)n\+([wW])([aAiIuUqQLeEoOhyvr])(.*)/){$ans =$ans.":". "$1Ms$2$3$4";$ans1=$ans1.":"."ruwva";$ans2=$ans2.":"."naSCavyapraSAn (8.3.7)->anunAsikAw paroZnusvAraH (8.3.4)->KaravasAnayorvisarjanIyaH (8.3.15)->visarjanIyasya saH (8.3.34)";}
if($an=~/^praSAn\+([cC])([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "praSAF$1$2$3";$ans1=" ruwvaniReXa->Scuwva";$ans2="naSCavyapraSAn (8.3.7)-> swoH ScunA ScuH (8.4.40)";}
if($an=~/^praSAn\+([tT])([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "praSAN$1$2$3";$ans1=" ruwvaniReXa->Rtuwva";$ans2="naSCavyapraSAn (8.3.7)-> RtunA RtuH (8.4.41)";}
if($an=~/^praSAn\+([wW])([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "praSAn$1$2$3";$ans1=" ruwvaniReXa";$ans2="naSCavyapraSAn (8.3.7)";}
if($an=~/nQn\+p(.*)/){$ans = "nQz><p$1";$ans1="ruwva";$ans2="nQnpe (8.3.10)->awrAnunAsikaH pUrvasya wu vA (8.3.2)->KaravasAnayorvisarjanIyaH (8.3.15)->kupvoH><ka><pO ca (8.3.37)";}
if($an=~/nQn\+p(.*)/){$ans =$ans.":"."nQM><p$1";$ans1=$ans1.":"."ruwva";$ans2=$ans2.":"."nQnpe (8.3.10)->anunAsikAw paroZnusvAraH (8.3.4)->KaravasAnayorvisarjanIyaH (8.3.15)->kupvoH><ka><pO ca (8.3.37)";}
if($an=~/nQn\+p(.*)/){$ans =$ans.":"."nQzHp$1";$ans1=$ans1.":"."ruwva";$ans2=$ans2.":"."nQnpe (8.3.10)->awrAnunAsikaH pUrvasya wu vA (8.3.2)->KaravasAnayorvisarjanIyaH (8.3.15)->visarjanIyasya saH (8.3.34)";}
if($an=~/nQn\+p(.*)/){$ans =$ans.":"."nQMHp$1";$ans1=$ans1.":"."ruwva";$ans2=$ans2.":"."nQnpe (8.3.10)->anunAsikAw paroZnusvAraH (8.3.4)->KaravasAnayorvisarjanIyaH (8.3.15)->visarjanIyasya saH (8.3.34)";}
if($an=~/nQn\+p(.*)/){$ans =$ans.":"."nQnp$1";$ans1=$ans1.":"."ruwvABAve";$ans2=$ans2.":"."nQnpe (8.3.10)";}
if($an=~/kAn\+kAn/){$ans = "kAzskAn";$ans1="ruwva";$ans2="kAnAmrediwe (8.3.12)->awrAnunAsikaH pUrvasya wu vA (8.3.2)->KaravasAnayorvisarjanIyaH (8.3.15)->saMpuMkAnAM so vakwavyaH (vA 4892)";}
if($an=~/kAn\+kAn/){$ans =$ans.":"."kAMskAn";$ans1=$ans1.":"."ruwva";$ans2=$ans2.":"."kAnAmrediwe (8.3.12)->anunAsikAw paroZnusvAraH (8.3.4)->KaravasAnayorvisarjanIyaH (8.3.15)->saMpuMkAnAM so vakwavyaH (vA 4892)";}
if($an=~/pum\+([kKcCtTwWpP])([aAiIuUqQLeEoOhyvr])(.*)/){$ans = "puMs$1$2$3";$ans1="ruwva";$ans2="pumaH Kayyampare (8.3.6)->anunAsikAw paroZnusvAraH (8.3.4)->KaravasAnayorvisarjanIyaH (8.3.15)->saMpuMkAnAM so vakwavyaH (vA 4892)";}
if($an=~/pum\+([kKcCtTwWpP])([aAiIuUqQLeEoOhyvr])(.*)/){$ans =$ans.":". "puzs$1$2$3";$ans1=$ans1.":"."ruwva";$ans2=$ans2.":"."pumaH Kayyampare (8.3.6)->awrAnunAsikaH pUrvasya wu vA (8.3.2)->KaravasAnayorvisarjanIyaH (8.3.15)->saMpuMkAnAM so vakwavyaH (vA 4892)";}
#if($an=~/(.*)([aAiIuUqQLeEoO])([rh])\+([yvrlfmFNnJBGDXjbgdxKPCTWctwkpSRs])(.*)/){ $ans=" $1$2$3$4$4$5";$ans1="xviwva";$ans2="aco rahAByAM xve (8.4.46)";}
if($an=~/(.*)H\+([KPCTWctwkpSRs])([SRs])(.*)/){ $ans=" $1H $2$3$4";$ans1="visarga";$ans2="Sarpare visarjanIyaH (8.3.35)";}
if($an=~/(.*)H\+([SRs])([KPCTWctwkpSRs])(.*)/){ $ans=" $1 $2$3$4";$ans1="visargalopaH";$ans2="Karpare Sari vA visargalopo vakwavyaH (vA 4906)";}
if($an=~/(.*)H\+([SRs])([KPCTWctwkpSRs])(.*)/){ $ans=$ans.":"." $1H $2$3$4";$ans1=$ans1.":"."visargalopABAve";$ans2=$ans2.":"."Karpare Sari vA visargalopo vakwavyaH (vA 4906)";}
if($an=~/(.*)H\+([SRs])([KPCTWctwkpSRs])(.*)/){ $ans=$ans.":"." $1$2$2$3$4";$ans1=$ans1.":"."sawva";$ans2=$ans2.":"."visarjanIyasya saH (8.3.34)";}
if($an=~/^sam\+rAt/){ $ans=" samrAt";$ans1="mawva";$ans2="mo rAji samaH kvO (8.2.35)";}
if($an=~/(.*)m\+hm(.*)/){ $ans=" $1m hm$2";$ans1="mawva";$ans2="he mapare vA (8.3.26)";}
if($an=~/(.*)m\+hm(.*)/){ $ans=$ans.":"." $1Mhm$2";$ans1=$ans1.":"."anusvAraH";$ans2=$ans2.":"."moZnusvAraH (8.3.23)";}
if($an=~/(.*)m\+h([yvl])(.*)/){ $ans=" $1$2z h$2$3";$ans1="anunAsika";$ans2="yavalapare yavalA vewi vakwavyam (vA 4902)";}
if($an=~/(.*)m\+h([yvl])(.*)/){ $ans=$ans.":"."$1M h$2$3";$ans1=$ans1.":"."anusvAraH";$ans2=$ans2.":"."moZnusvAraH (8.3.23)";}
if($an=~/(.*)m\+hn(.*)/){ $ans =" $1n hn$2";$ans1="nawva";$ans2="na pare naH (8.3.27)";}
if($an=~/(.*)m\+hn(.*)/){$ans=$ans.":"." $1M hn$2";$ans1=$ans1.":"."anusvAraH";$ans2=$ans2.":"."moZnusvAraH (8.3.23)";}
if($an=~/^(eRa|sa)H\+([kKgGfcCjJFtTdDNwWxXnpPbBmyrlvSRsh])(.*)/){$ans ="$1 $2$3";$ans1="visargalopa",$ans2= "ewawwaxoH sulopoZkoranaFsamAse hali (6.1.132)";}
#if($an=~/^saH\+([kKgGfcCjJFtTdDNwWxXnpPbBmyrlvSRsh])(.*)/){$ans ="sa $1$2";$ans1="visargalopa";$ans2="ewawwaxoH sulopoZkoranaFsamAse hali (6.1.132)";}
elsif($an=~/(.*)aH\+([gGfjJFdDNxXnbBmyrlvh])(.*)/){$ans ="$1o $2$3"; $ans1 ="ruwva-> uwva-> guNa";$ans2 = "sasajuRo ruH (8.2.66)-> haSi ca (6.1.114)-> Ax guNaH (6.1.87)" ;}
if($an =~ /(.*)[aA]\+[eE](Rya|Ry|wA)?(wi|Ri|mi|rO|raH|si|sWaH|sWa|smi|svaH|smaH|awi|awaH|anwi|asi|aWaH|aWa|Ami|AvaH|AmaH|wa|wAm|H|wam|va|ma|w|an|H|wam|am|AvaH|Amm)/){$ans="$1E$3";$ans1="vqxXi";$ans2="ewyeXawyUTsu (6.1.86)";}
if($an =~ /(.*)[aA]\+[eE]X(.*)/){$ans="$1EX$2";$ans1="vqxXi";$ans2="ewyeXawyUTsu (6.1.86)";}
#if($an=~/(.*)a\+ewi/){$ans="$1Ewi";$ans1="vqxXi";$ans2="ewyeXawyUTsu (6.1.86)";}
#if($an=~/(.*)a\+eXawe/){$ans="$1EXawe";$ans1="vqxXi";$ans2="ewyeXawyUTsu (6.1.86)";}
if($an=~/ahan\+rUpa(.*)/){$ans="aho rUpa$1";$ans1="ruwva-> uwva-> guNa";$ans2="roZsupi (8.2.69)(prApwe) -> rUparAwri raWanwareRuruwvam vAcyam (vA 4847)-> haSi ca (6.1.114)-> Ax guNaH (6.1.87)";}
if($an=~/ahan\+rAwr(.*)/){$ans="aho rAwr$1";$ans1="ruwva-> uwva-> guNa";$ans2="roZsupi (8.2.69) (prApwe) -> rUparAwri raWanwareRuruwvam vAcyam (vA 4847)-> haSi ca (6.1.114)-> Ax guNaH (6.1.87)";}
if($an=~/ahan\+raWanwara(.*)/){$ans="aho raWanwara$1";$ans1="ruwva-> uwva-> guNa";$ans2="roZsupi (8.2.69) (prApwe) -> rUparAwriraWanwareRu ruwvam vAcyam (vA 4847)-> haSi ca (6.1.114)-> Ax guNaH (6.1.87)";}
if($an=~/ahan\+pawi(.*)/){$ans="aharpawi$1";$ans1="rePa";$ans2="roZsupi (8.2.69)-> KaravasAnayorvisarjanIyaH (8.3.15) (prApwe)-> aharAxInAm pawyAxiRu vA rePaH (vA 4851)";}
if($an=~/ahan\+pawi(.*)/){$ans=$ans.":"." ahaH pawi$1";$ans1=$ans1.":"."visarga";$ans2=$ans2.":"."roZsupi (8.2.69) -> KaravasAnayorvisarjanIyaH (8.3.15)-> kupvo><ka><pO ca (8.3.37)";}
if($an=~/ahan\+pawi(.*)/){$ans=$ans.":"." aha><pawi$1";$ans1=$ans1.":"."upaXmAnIya";$ans2=$ans2.":"."roZsupi (8.2.69)->  KaravasAnayorvisarjanIyaH (8.3.15) -> kupvo><ka><pO ca (8.3.37)";}
if($an=~/ahan\+gaNa(.*)/){$ans="ahargaNa$1";$ans1="rePa";$ans2="roZsupi (8.2.69)";}
#if($an=~/ahan\+gaNa(.*)/){$ans=$ans.":"." ahaH gaNa$1";$ans1=$ans1.":"."visarga";$ans2=$ans2.":"."roZsupi (8.2.69)-> visarjanIyasya saH (8.3.34)";}
if($an=~/ahan\+puwra(.*)/){$ans="aharpuwra$1";$ans1="rePa";$ans2="roZsupi (8.2.69)-> aharAxInAm pawyAxiRu vA rePaH (vA 4851)";}
if($an=~/ahan\+puwra(.*)/){$ans=$ans.":"." aha><puwra$1";$ans1=$ans1.":"."upaXmAnIya";$ans2=$ans2.":"."roZsupi (8.2.69)-> kupvo><ka><pO ca (8.3.37)";}
if($an=~/ahan\+puwra(.*)/){$ans=$ans.":"." ahaH puwra$1";$ans1=$ans1.":"."visarga";$ans2=$ans2.":"."roZsupi (8.2.69)-> kupvo><ka><pO ca (8.3.37)";}
if($an=~/gIr\+pawi(.*)/){$ans="gIrpawi$1";$ans1="rePa";$ans2=" KaravasAnayorvisarjanIyaH (8.3.15)(prApwe) -> aharAxInAm pawyAxiRu vA rePaH (vA 4851)";}
if($an=~/gIr\+pawi(.*)/){$ans=$ans.":"." gI><pawi$1";$ans1=$ans1.":"."upaXmAnIya";$ans2=$ans2.":"."KaravasAnayorvisarjanIyaH (8.3.15)-> kupvo><ka><pO ca (8.3.37)";}
if($an=~/gIr\+pawi(.*)/){$ans=$ans.":"." gIH pawi$1";$ans1=$ans1.":"."visarga";$ans2=$ans2.":"."KaravasAnayorvisarjanIyaH (8.3.15)-> kupvo><ka><pO ca (8.3.37)";}
if($an=~/gIr\+gaNa(.*)/){$ans="gIrgaNa$1";$ans1="rePa";$ans2="roZsupi (8.2.69)";}
#if($an=~/gIr\+gaNa(.*)/){$ans=$ans.":"." gIH gaNa$1";$ans1=$ans1.":"."visarga";$ans2=$ans2.":"."visarjanIyasya saH (8.3.34)";}
if($an=~/gIr\+puwra(.*)/){$ans="gIrpuwra$1";$ans1="rePa";$ans2="roZsupi (8.2.69)-> aharAxInAm pawyAxiRu vA rePaH (vA 4851)";}
if($an=~/gIr\+puwra(.*)/){$ans=$ans.":"." gIH puwra$1";$ans1=$ans1.":"."visarga";$ans2=$ans2.":"."roZsupi (8.2.69)-> kupvo><ka><pO ca (8.3.37)";}
if($an=~/gIr\+puwra(.*)/){$ans=$ans.":"." gI><puwra$1";$ans1=$ans1.":"."upaXmAnIya";$ans2=$ans2.":"."roZsupi (8.2.69)-> kupvo><ka><pO ca (8.3.37)";}
if($an=~/XUr\+pawi(.*)/){$ans="XUrpawi$1";$ans1="rePa";$ans2=" KaravasAnayorvisarjanIyaH (8.3.15)(prApwe)-> aharAxInAm pawyAxiRu vA rePaH (vA 4851)";}
if($an=~/XUr\+pawi(.*)/){$ans=$ans.":"." XU><pawi$1";$ans1=$ans1.":"."upaXmAnIya";$ans2=$ans2.":"."KaravasAnayorvisarjanIyaH (8.3.15)-> kupvo><ka><pO ca (8.3.37)";}
if($an=~/XUr\+pawi(.*)/){$ans=$ans.":"." XUH pawi$1";$ans1=$ans1.":"."visarga";$ans2=$ans2.":"."KaravasAnayorvisarjanIyaH (8.3.15)-> kupvo><ka><pO ca (8.3.37)";}
if($an=~/XUr\+gaNa(.*)/){$ans="XUrgaNa$1";$ans1="rePa";$ans2="roZsupi (8.2.69)";}
#if($an=~/XUr\+gaNa(.*)/){$ans=$ans.":"." XUH gaNa$1";$ans1=$ans1.":"."visarga";$ans2=$ans2.":"."roZsupi (8.2.69)->visarjanIyasya saH (8.3.34)";}
if($an=~/XUr\+puwra(.*)/){$ans="XUrpuwra$1";$ans1="rePa";$ans2="roZsupi (8.2.69)-> aharAxInAm pawyAxiRu vA rePaH (vA 4851)";}
if($an=~/XUr\+puwra(.*)/){$ans=$ans.":"." XUH puwra$1";$ans1=$ans1.":"."visarga";$ans2=$ans2.":"."roZsupi (8.2.69)->kupvo><ka><pO ca (8.3.37)";}
if($an=~/XUr\+puwra(.*)/){$ans=$ans.":"." XU><puwra$1";$ans1=$ans1.":"."upaXmAnIya";$ans2=$ans2.":"."roZsupi (8.2.69)-> kupvo><ka><pO ca (8.3.37)";}
if($an=~/ahan\+ahaH/){$ans= "aharahaH";$ans1="rePa";$ans2="roZsupi (8.2.69)";}
elsif($an=~/(.*)([aiuqL])([fNn])\+([aAiIuUqQLeEoO])(.*)/){$ans = "$1$2$3$3$4$5";$ans1= "famudAgama";$ans2 = "famo hrasvAxaci famuNniwyam (8.3.32)";}
if($an=~/(.*)([iIuUqQLeEoO])H\+([aAiIuUqQLeEoOgGfjJFdDNxXnbBmylvh])(.*)/){$ans = "$1$2r$3$4";$ans1 = "rePa"; $ans2 = "sasajuRo ruH (8.2.66)";}
if($an=~/(.*)([aAiIuUqQLeEoO])H\+([wW])([^sSR].*)/){$ans = "$1$2s$3$4";$ans1 = "sawva";$ans2 = "visarjanIyasya saH (8.3.34)";}
if($an=~/(.*)([aAiIuUqQLeEoO])H\+([cC])(.*)/){$ans = "$1$2S$3$4"; $ans1 ="sawva-> Scuwva";$ans2 = "visarjanIyasya saH (8.3.34)-> swoH ScunA ScuH (8.4.40)";}
if($an=~/(.*)([aAiIuUqQLeEoO])H\+([tT])(.*)/){$ans = "$1$2R$3$4"; $ans1 ="sawva-> Rtuwva";$ans2 = "visarjanIyasya saH (8.3.34)-> RtunA RtuH (8.4.41)";}
if($an=~/(.*)AH\+([gGfjJFdDNxXnbBmyrlvh])(.*)/){$ans ="$1A $2$3"; $ans1 ="ruwva-> yawva-> lopa";$ans2 = "sasajuRo ruH (8.2.66)-> BoBagoaGo apUrvasya yoZSi (8.3.17)-> hali sarveRAm (8.3.22)" ;}
if($an=~/BoH\+([kKgGfcCjJFtTdDNwWxXnpPbBmyrlvSRsh])(.*)/){ $ans=" Bo $1$2";$ans1="yawvalopaH";$ans2="sasajuRo ruH (8.2.66)->BoBagoaGo apUrvasyayoZSi (8.3.17)->hali sarveRAm (8.3.22)";}
if($an=~/BoH\+([aAiIuUqQLeEoO])(.*)/){ $ans=" Boy$1$2";$ans1="sawva->yawva->laGuprayawnAxeSaH";$ans2="sasajuRo ruH (8.2.66)->BoBagoaGo apUrvasyayoZSi (8.3.17)->vyorlaGuprayawnawaraH SAkatAyanasya (8.3.18)";}
if($an=~/BoH\+([aAiIuUqQLeEoO])(.*)/){ $ans=$ans.":"."Bo $1$2";$ans1=$ans1.":"."sawva->yawva->laGuprayawnABAve yawvalopa";$ans2=$ans2.":"."sasajuRo ruH (8.2.66)->BoBagoaGo apUrvasyayoZSi (8.3.17)->owo gArgyasya (8.3.20)";}
if($an=~/BagoH\+([kKgGfcCjJFtTdDNwWxXnpPbBmyrlvSRsh])(.*)/){ $ans=" Bago $1$2";$ans1="yawvalopaH";$ans2="sasajuRo ruH (8.2.66)->BoBagoaGo apUrvasyayoZSi (8.3.17)->hali sarveRAm (8.3.22)";}
if($an=~/BagoH\+([aAiIuUqQLeEoO])(.*)/){ $ans=" Bagoy$1$2";$ans1="sawva->yawva->laGuprayawnAxeSaH";$ans2="sasajuRo ruH (8.2.66)->BoBagoaGo apUrvasyayoZSi (8.3.17)->vyorlaGuprayawnawaraH SAkatAyanasya (8.3.18)";}
if($an=~/BagoH\+([aAiIuUqQLeEoO])(.*)/){ $ans=$ans.":"."Bago $1$2";$ans1=$ans1.":"."sawva->yawva->laGuprayawnABAve yawvalopa";$ans2=$ans2.":"."sasajuRo ruH (8.2.66)->BoBagoaGo apUrvasyayoZSi (8.3.17)->owo gArgyasya (8.3.20)";}
if($an=~/aGoH\+([kKgGfcCjJFtTdDNwWxXnpPbBmyrlvSRsh])(.*)/){ $ans=" aGo $1$2";$ans1="yawvalopaH";$ans2="sasajuRo ruH (8.2.66)->BoBagoaGo apUrvasyayoZSi (8.3.17)->hali sarveRAm (8.3.22)";}
if($an=~/aGoH\+([aAiIuUqQLeEoO])(.*)/){ $ans="aGoy$1$2";$ans1="sawva->yawva->laGuprayawnAxeSaH";$ans2="sasajuRo ruH (8.2.66)->BoBagoaGo apUrvasyayoZSi (8.3.17)->vyorlaGuprayawnawaraH SAkatAyanasya (8.3.18)";}
if($an=~/aGoH\+([aAiIuUqQLeEoO])(.*)/){ $ans=$ans.":"."aGo $1$2";$ans1=$ans1.":"."sawva->yawva->laGuprayawnABAve yawvalopa";$ans2=$ans2.":"."sasajuRo ruH (8.2.66)->BoBagoaGo apUrvasyayoZSi (8.3.17)->owo gArgyasya (8.3.20)";}
if($an=~/miWo\+([aAiIuUqQLeEoO])(.*)/){$ans ="miWo $1$2" ;$ans1="pragqhyawva->prakqwiBAva";$ans2="ow (1.1.15)-> pluwapragqhyA aci niwyam (6.1.125)";}
if($an=~/ho\+([aAiIuUqQLeEoO])(.*)/){$ans ="ho $1$2" ;$ans1="pragqhyawva->prakqwiBAva";$ans2="ow (1.1.15)-> pluwapragqhyA aci niwyam (6.1.125)";}
if($an=~/aho\+([aAiIuUqQLeEoO])(.*)/){$ans ="aho $1$2" ;$ans1="pragqhyawva->prakqwiBAva";$ans2="ow (1.1.15)-> pluwapragqhyA aci niwyam (6.1.125)";}
if($an=~/Aho\+([aAiIuUqQLeEoO])(.*)/){$ans ="Aho $1$2" ;$ans1="pragqhyawva->prakqwiBAva";$ans2="ow (1.1.15)-> pluwapragqhyA aci niwyam (6.1.125)";}
if($an=~/uwAho\+([aAiIuUqQLeEoO])(.*)/){$ans ="uwAho $1$2" ;$ans1="pragqhyawva->prakqwiBAva";$ans2="ow (1.1.15)-> pluwapragqhyA aci niwyam (6.1.125)";}
if($an=~/no\+([aAiIuUqQLeEoO])(.*)/){$ans ="no $1$2" ;$ans1="pragqhyawva->prakqwiBAva";$ans2="ow (1.1.15)-> pluwapragqhyA aci niwyam (6.1.125)";}
if($an=~/aWo\+([aAiIuUqQLeEoO])(.*)/){$ans ="aWo $1$2" ;$ans1="pragqhyawva->prakqwiBAva";$ans2="ow (1.1.15)-> pluwapragqhyA aci niwyam (6.1.125)";}
if($an=~/^([aiuqLeEoO])\+([aAiIuUqQLeEoO])(.*)/){$ans = "$1 $2$3";$ans1 ="pragqhyawva->prakqwiBAva";$ans2="nipAwa ekAjanAf (1.1.14)-> pluwapragqhyA aci niwyam (6.1.125)"; }
if($an=~/uF\+iwi/){$ans = "u iwi";$ans1 = "vikalpena pragqhyawva-> prakqwiBAva";$ans2="uFaH (1.1.17)-> pluwapragqhyA aci niwyam (6.1.125)";}
if($an=~/uF\+iwi/){$ans = $ans.":"."Uz iwi";$ans1 = $ans1.":". "vikalpena Uz AxeSa->pragqhyawva->prakqwiBAva";$ans2 = $ans2.":". "Uz (1.1.18)-> pluwapragqhyA aci niwyam (6.1.125)";}
if($an=~/uF\+iwi/){$ans = $ans.":". "viwi" ;$ans1 = $ans1.":". "vikalpABAve yaN";$ans2 = $ans2.":". "iko yaNaci (6.1.77)";}
#if($an=~/(.*)([kKgGfcCjJtTdDNpPbBmwWxXn])u\+([aAiIuUqQLeEoO])(.*)/){$ans = "$1$2v$3$4";$ans1 = "vikalpena vAxeSaH";$ans2 = "maya uFo vo vA (8.3.33)";}
#if($an=~/(.*)([mfNnJBGDXjbgdxKFCTWctwkp])u\+([aAiIuUqQLeEoO])(.*)/){$ans = "$1$2v$3$4";$ans1 = "vikalpena vAxeSaH";$ans2 = "maya uFo vo vA (8.3.33)";}
#if($an=~/(.*)([kKgGfcCjJtTdDNpPbBmwWxXn])u\+([aAiIuUqQLeEoO])(.*)/){$ans = $ans.":"."$1$2u $3$4"; $ans1 = $ans1.":". "vAxeSABAve->pragqhyawva->prakqwiBAva";$ans2 = $ans2.":"."uFaH (1.1.17)-> pluwapragqhyA aci niwyam (6.1.125)";}
#commented the above 2 srules since it produced wrong result with maXu+ariH
#if($an=~/(.*)([kKgGfcCjJtTdDNpPbBmwWxXn])u\+([aAiIuUqQLeEoO])(.*)/){$ans = $ans.":"."$1$2u $3$4"; $ans1 = $ans1.":". "vAxeSABAve->pragqhyawva->prakqwiBAva";$ans2 = $ans2.":"."uFaH (1.1.17)-> pluwapragqhyA aci niwyam (6.1.125)";}
if($an=~/kRi\+ya(.*)/){$ans = "kRayya$1";$ans1 = "SakyArWe ayAxeSa nipAwana";$ans2 = "kRayyajayyO SakyArWe (6.1.81)";}
if($an=~/kRi\+ya(.*)/){$ans =$ans.":". "kReya$1";$ans1 =$ans1.":". "SakyArWABAve guNa";$ans2 = $ans2.":"."sArvaXAwukArXaXAwukayoH (7.3.84)";}
if($an=~/ji\+ya(.*)/){$ans = "jayya$1";$ans1 = "SakyArWe ayAxeSa nipAwana";$ans2 = "kRayyajayyO SakyArWe (6.1.81)";}
if($an=~/ji\+ya(.*)/){$ans =$ans.":". "jeya$1";$ans1 =$ans1.":". "SakyArWABAve guNa";$ans2 = $ans2.":"."sArvaXAwukArXaXAwukayoH (7.3.84)";}
if($an=~/krI\+ya(.*)/){$ans = "krayya$1";$ans1 = "krayaNArhe ayAxeSa nipAwanam";$ans2 = "krayyaswaxarWe (6.1.82)";}
if($an=~/krI\+ya(.*)/){$ans =$ans.":". "kreya$1";$ans1 =$ans1.":". "krayaNArhABAve guNa";$ans2 = $ans2.":"."sArvaXAwukArXaXAwukayoH (7.3.84)";}
if($an=~/^aXaH\+paxa(.*)/){$ans = "aXaspaxa$1";$ans1 = "samAse sawva";$ans2 = "aXaSSirasI paxe (8.3.47)";}
if($an=~/^aXaH\+paxa(.*)/){$ans = $ans .":". "aXa><paxa$1";$ans1 = $ans1 .":". "upaXmAnIya";$ans2 = $ans2 .":". "kupvo ><ka ><pO ca (8.3.37)";}
if($an=~/^aXaH\+paxa(.*)/){$ans = $ans .":". "aXaH paxa$1";$ans1 = $ans1 .":". "visarga";$ans2 = $ans2 .":". "kupvo ><ka ><pO ca (8.3.37)";}
if($an=~/^SiraH\+paxa(.*)/){$ans = "Siraspaxa$1";$ans1 = "samAse sawva";$ans2 = "aXaSSirasI paxe (8.3.47)";}
if($an=~/^SiraH\+paxa(.*)/){$ans = $ans .":". "Sira><paxa$1";$ans1 = $ans1 .":". "upaXmAnIya";$ans2 = $ans2 .":". "kupvo ><ka ><pO ca (8.3.37)";}
if($an=~/^SiraH\+paxa(.*)/){$ans = $ans .":". "SiraH paxa$1";$ans1 = $ans1 .":". "visarga";$ans2 = $ans2 .":". "kupvo ><ka ><pO ca (8.3.37)";}
if($an=~/(.*)iH\+([kK])(.*)/){$ans = "$1iR$2$3"; $ans1 = "sAmarWye Rawvam";$ans2 = "isusoH sAmarWye (8.3.44)" }
if($an=~/(.*)iH\+([kK])(.*)/){$ans = $ans .":". "$1i><$2$3";$ans1 = $ans1 .":".  "RawvABAve jihvAmUlIya";$ans2 = $ans2 .":". "kupvo><ka ><pO ca (8.3.37)";}
if($an=~/(.*)iH\+([kK])(.*)/){$ans = $ans.":"."$1iH $2$3";$ans1 = $ans1 .":". "RawvABAve visarga"; $ans2 = $ans2 .":". "kupvo><ka ><pO ca (8.3.37)";}
if($an=~/(.*)iH\+([pP])(.*)/){$ans = "$1iR$2$3"; $ans1 = "sAmarWye Rawvam";$ans2 = "isusoH sAmarWye (8.3.44)" }
if($an=~/(.*)iH\+([pP])(.*)/){$ans = $ans .":". "$1i><$2$3";$ans1 = $ans1 .":".  "RawvABAve upaxmAnIya";$ans2 = $ans2 .":". "kupvo><ka ><pO ca (8.3.37)";}
if($an=~/(.*)iH\+([pP])(.*)/){$ans = $ans.":"."$1iH $2$3";$ans1 = $ans1 .":". "RawvABAve visarga"; $ans2 = $ans2 .":". "kupvo><ka ><pO ca (8.3.37)";}
if($an=~/(.*)uH\+([kK])(.*)/){$ans = "$1uR$2$3"; $ans1 = "sAmarWye Rawvam";$ans2 = "isusoH sAmarWye (8.3.44)" }
if($an=~/(.*)uH\+([kK])(.*)/){$ans = $ans .":". "$1u><$2$3";$ans1 = $ans1 .":".  "RawvABAve jihvAmUlIya";$ans2 = $ans2 .":". "kupvo><ka ><pO ca (8.3.37)";}
if($an=~/(.*)uH\+([kK])(.*)/){$ans = $ans.":"."$1uH $2$3";$ans1 = $ans1 .":". "RawvABAve visarga"; $ans2 = $ans2 .":". "kupvo><ka ><pO ca (8.3.37)";}
if($an=~/(.*)uH\+([pP])(.*)/){$ans = "$1uR$2$3"; $ans1 = "sAmarWye Rawvam";$ans2 = "isusoH sAmarWye (8.3.44)" }
if($an=~/(.*)uH\+([pP])(.*)/){$ans = $ans .":". "$1u><$2$3";$ans1 = $ans1 .":".  "RawvABAve upaxmAnIya";$ans2 = $ans2 .":". "kupvo><ka ><pO ca (8.3.37)";}
if($an=~/(.*)uH\+([pP])(.*)/){$ans = $ans.":"."$1uH $2$3";$ans1 = $ans1 .":". "RawvABAve visarga"; $ans2 = $ans2 .":". "kupvo><ka ><pO ca (8.3.37)";}

if($debug) { 
#print "ans within apavAda before returning = $ans\n";
}
$ans;

}
1;
#if the SabxaH or XAxu have xvivacan and the second word will start with 'I' 'U' 'e' then there is prakqwiBAva (IxUxexxvivacanaM pragqhyam)
# if the first word is ending with 'a' or 'A' and the second word is an 'i' Xaxu or 'eX' XAxu started with the letter 'e', or the word is 'UD' then there is vqxXi sanXi. (ewyeXwyUDsu)
# if the first word is either 'amU' or 'amI' then there is not sanXi (axaso mAw)
