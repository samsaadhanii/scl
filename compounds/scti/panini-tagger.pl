#! /usr/bin/perl 

sub avyayIBAva{
my($comp_prAwipaxika,$comp,$debug_level) = @_;

if($debug_level >=3)
{
 print "input to avyayIBAva: comp_prAwipaxika = $comp_prAwipaxika comp = $comp\n";
}
my($ans,$tag,$sutra,$w1,$w2);

$ans = "";

my($w1,$w2) = split(/-/,$comp_prAwipaxika);

if($comp =~/^yaWA\-/)
{
	$tag = "A1"; 
	$sutra = "yaWAZsAxqSye (2-1-7)";
  	$ans = $ans.$tag."[".$sutra."]\t";
}

if($comp =~/^yAvaw\-/)
{
	$tag = "A1"; 
	$sutra = "yAvaxavaXAraNe (2-1-8);yAvaw: avaXAraNArWe";
  	$ans = $ans.$tag."[".$sutra."]\t";
}

if($comp =~/\-prawi/)
{
	$tag = "A2"; 
	$sutra = "supprawinA mAwrArWe (2-1-9);prawi: mAwrArWe";
  	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp_prAwipaxika =~/^(akRa|SalAkA)\-pari/)
{
	$tag = "A2";
	$sutra = "akRaSalAkAsaMKyAH pariNA (2-1-10)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

$key1 = $w1.","."saMKyA";
if($LEX{$key1} && ($comp =~ /\-pari$/)) 
{
	$tag = "A2";
	$sutra = "akRaSalAkAsaMKyAH pariNA (2-1-10)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~ /\-iva/)
{
	$tag = "A2";
	$sutra = "ivena samAso viBakwyalopaSca (vArwikam)";
  $ans = $ans.$tag."[".$sutra."]\t";
}

$key1 = $w2.","."SaraxAxigaNa";
if($comp =~ /^(pra|parA|apa|sam|anu|ava|nis|nir|xus|xur|ni|A|vi|aXi|api|su|uw|ux|awi|prawi|pari|upa|yaWA|agra)\-($LEX{$key1})/)
{
	$tag = "A1"; 
	$sutra = "avyayIBAve SarawpraBqwiByaH (5-4-107)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
elsif($w2 eq "akRa") {
  if($comp =~/^(prawi|sam|anu|para)\-/){
	$tag = "A1";
	$sutra = "avyayIBAve SarawpraBqwiByaH [prawiparasamanuByoZkRNaH] (5-4-107)";
	$ans = $ans.$tag."[".$sutra."]\t";
  }
} elsif($w2 eq "jaras") {
	$tag = "A1";
	$sutra = "avyayIBAve SarawpraBqwiByaH (5-4-107)";
	$ans = $ans.$tag."[".$sutra."]\t";
  }

if($comp =~/^(apa|pari|bahir|prAk)\-/) {
	$tag = "A1"; 
	$sutra = "apaparibahiraFcavaH paFcamyAH (2-1-12)";
	$ans = $ans.$tag."[".$sutra."]\t";
} 

if($comp =~/^A\-/){
	$tag = "A1"; 
	$sutra = "Af maryAxAZBiviXyoH (2-1-13);Af:maryAxArWe";
	$ans = $ans.$tag."[".$sutra."]\t";
} 

if($comp =~/^(aBi|prawi)\-/){
	$tag = "A1"; 
	$sutra = "lakRaNenAZBiprawI ABimuKye (2-1-14);maryAxArWe";#$1
	$ans = $ans.$tag."[".$sutra."]\t";
} 

if($comp =~/^anu\-/){
	$tag = "A1"; 
	$sutra = "anuryawsamayA (2-1-15);anu:sAmIpyArWe/yasya cAyAmaH (2-1-16);anu:AyAmArWe";
	$ans = $ans.$tag."[".$sutra."]\t";
} 

if($comp =~/^(pra|parA|apa|sam|anu|ava|nis|nir|xus|xur|ni|A|vi|aXi|api|su|uw|ux|awi|aBi|prawi|pari|upa|agra|iwi|anwar|a|uccEH|waw|sa|saha|wiras|wiro|yaWA|prAwar)\-/){
	$tag = "A1"; 
	$sutra = "avyayaM viBakwi.. (2-1-6)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

$key1 = $comp.","."wiRTaxgu";
if($LEX{$key1}) {
	$tag = "A3";
	$sutra = " wiRTaxgupraBqwIni ca (2-1-17) ";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($comp =~/^(pAre|pAra|maXye|maXya)\-/)
{
	$tag = "A7"; 
	$sutra = "pAre maXye RaRTyA vA (2-1-18)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

$key1 = $w1.","."saMKyA";
$key2 = $w2.","."vaMSya";
if($LEX{$key1} && $LEX{$key2}) 
{
	$tag = "A6"; 
	$sutra = "saMKyA vaMSyena (2-1-19)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
#we have to give prawipadika of saMKyA here,then only it works.	-Arjun
$key2 = $w2.","."naxI";
if($LEX{$key1} && $LEX{$key2}){
	$tag = "A4"; 
	$sutra = "naxIBiSca (2-1-20)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

#if($tag) 
#{
#	$ans = $tag."[".$sutra."]";
#	$ans = $ans;
#}
$ans;
}
1;
#=================================================================
sub tatpuruRa{
my($comp_prAwipaxika,$comp,$kwa,$debug_level) = @_;
my($ans,$tag,$sutra,$mean);

$ans = "";
my($w1,$w2) = split(/-/,$comp_prAwipaxika);

if($debug_level >= 2) { print "Within tatpuruRa module\n comp = $comp_prAwipaxika\n kwa = $kwa\n";}

if($comp_prAwipaxika =~ /\-(Sriwa|awIwa|pawiwa|gawa|awyaswa|prApwa|Apanna)/)
{
	$tag = "T2"; 
	$sutra = "xviwIyA SriwAwIwapawiwagawAwyaswaprApwApannEH (2-1-24)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($comp_prAwipaxika =~/\-(gamI|iwya|buBukRu|nirAkariRNu)/)
{
	$tag = "T2"; 
	$sutra = "gamyAxInAm upasaMKyAnam (vArwikam)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^(svayam|svAyam)\-/)
{
	$tag = "T2"; 
	$sutra = "svayam kwena (2-1-25)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($kwa)
{
if(($comp =~/KatvA\-/) && ($w2 ne "vqnxArikA"))
{
	$tag = "T2"; 
	$sutra = "KatvA kRepe (2-1-26); ninxAyAm";
	$ans = $ans.$tag."[".$sutra."]\t";
}
}
if($comp =~/^sAmi\-/)
{
	$tag = "T2"; 
	$sutra = "sAmi (2-1-27)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
#"safkrAnwa" word have to be put in morph.	-Arjun.
$key1 = $w1.","."kAla";
if($kwa)
{
if($LEX{$key1}){
	$tag = "T2"; 
	$sutra = "kAlAH (2-1-28)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
}

$key1 = $comp_prAwipaxika.","."parimANi";
{
if($LEX{$key1}){
	$tag = "T2"; 
	$sutra = "kAlAH parimANinA (2-2-5) paricCexyavAciSabxe pare";
	$ans = $ans.$tag."[".$sutra."]\t";
}
}

if($comp =~ /^(prApwa|Apanna)\-/)
{
	$tag = "T2";
	$sutra = "prApwApanne ca xviwIyayA (2-2-4) xviwIyAnwe eva";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp_prAwipaxika =~/\-(pUrva|saxqSa|sama|Una|hIna|vikala|nyUna|kalaha|nipuNa|miSra|sammiSra|SlakRNa)/)
{
	$tag = "T3"; 
	$sutra = "pUrvasaxqSasamonArWakalahanipuNamiSraSlakRNEH (2-1-31)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
elsif($comp_prAwipaxika =~/\-avara/)
{
	$tag = "T3";
	$sutra = "avarasyopasafKyAnam (vArwikam) [2-1-31]";
	$ans = $ans.$tag."[".$sutra."]\t";
}
elsif($comp_prAwipaxika =~/\-upaxaMSa/)
{
	$tag = "T3";
	$sutra = "upaxaMSaswqwIyAyAm [3-4-47]";
	$ans = $ans.$tag."[".$sutra."]\t";
}
elsif($comp_prAwipaxika =~/\-(arWa)/)
{
	$tag = "T3";
	$sutra = "wqwIyA wawkqwArWena guNavacanena [2-1-30]";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if(($w1 ne "yaWA") && ($comp_prAwipaxika =~/\-(arWa|bali|hiwa|suKa|rakRiwa)/))
{
	$tag = "T4";
	$sutra = "cawurWI waxarWArWabalihiwasuKarakRiwEH (2-1-36)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
#not only Awmane,any 4th case have to be taken.	-Arjun.
if($comp =~ /^Awmane\-/)
{
	$tag = "T4";
	$sutra = "cawurWI waxarWArWabalihiwasuKarakRiwEH (2-1-36)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp_prAwipaxika =~/\-(Baya|BIwi|BI)/)
{
	$tag = "T5"; 
	$sutra = "paFcamI Bayena (2-1-37)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
elsif($comp_prAwipaxika =~/\-(Baya|nirgawa|jugupsu)/)
{
	$tag = "T5";
	$sutra = "BayanirgawajugupsuBiriwi vakwavyam (vArwikam) [2-1-37]";

}
if($comp_prAwipaxika =~/\-(apewa|apoDa|mukwa|pawiwa|apawraswa)/)
{
	$tag = "T5"; 
	$sutra = "apewApoDamukwapawiwApawraswEralpaSaH (2-1-38)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($kwa)
{
   if($debug_level >=3) { print "kwa = 1\n comp = $comp_prAwipaxika\n"; }
if($comp =~/^(swokAw|alpAw|kRullakAw|sUkRmAw|SlakRNAw|xaBrAw|kqSAw|wanu|mAwrA|wruti|lavAw|leSAw|kaNAw|aNu|samIpAw|nikatAw|AsannAw|sannikqRtAw|sanIdAw|saxeSAw|aByASAw|saviXAw|samaryAxAw|saveSAw|upakaNTAw|anwikAw|aByarNAw|aByagrAw|upahvarAw|xUrAw|viprakqRtAw|parAw|ArAw|kqcCrAw|kqcCra)\-/)
{
	$tag = "T5"; 
	$sutra = "swokAnwikaxUrArWakqcCrANi kwena (2-1-39)";
	$ans = $ans.$tag."[".$sutra."]\t";
if($debug_level >=3) { print "tag = $tag sutra = $sutra\n"; }
}
}
$key2 = $w2.","."SONdAxi";
if(($LEX{$key2}) && ($comp ne "mqga-capalA"))
{
	$tag = "T7";
	$sutra = " sapwamI SONdEH (2-1-40)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($comp_prAwipaxika =~/\-(sixXa|SuRka|pakva|banXa)/)
{
	$tag = "T7"; 
	$sutra = "sixXaSuRkapakvabanXESca (2-1-41)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp_prAwipaxika =~/\-(XvAfkRa|kAka)/)
{
	$tag = "T7"; 
	$sutra = "XvAfkReNa kRepe (2-1-42); kRepArWe";
	$ans = $ans.$tag."[".$sutra."]\t";
}
my $key1 = $w1.","."ahorAwrAvayava";
if($kwa)
{
if($LEX{$key1})
{
	$tag = "T7"; 
	$sutra = "kwenAhorAwrAvayavAH (2-1-45)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
}
if($comp =~/^wawra\-/)
{
	$tag = "T7"; 
	$sutra = "wawra (2-1-46)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp_prAwipaxika =~/^(Ka|Ke|pArSva|pqRta|uxara|uwWAna|avamUrXa|)\-Saya/)
{
	$tag = "T7"; 
	$sutra = "aXikaraNe SeweH (3-2-15)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
$key1 = $comp_prAwipaxika.","."pAwresamiwAxi";
if($LEX{$key1}) 
{
	$tag = "T";
	$sutra = " pAwre samiwAxayaSca (2-1-48) ";
	$ans = $ans.$tag."[".$sutra."]\t";
}

$key1 = $comp_prAwipaxika.","."sajFAyAm";
if($LEX{$key1}) 
{
	$tag = "T";
	$sutra = " sajFAyAm (2-1-44) ";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($comp =~/^nI\-/ && $comp ne "nI-kASa")
{
	$tag = "T";
	$sutra = "anyeByo xqSyawe (3-2-178)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
$key1 = $comp.","."avAxayaH";
if($LEX{$key1})
{
	$tag = "T";
	$sutra = "avAxayaH kruRtAxyarWe wqwIyayA - [vArwikam - 1337] ";
	$ans = $ans.$tag."[".$sutra."]\t";
}
$key2 = $w2.","."yAjakAxi";
if($LEX{$key2})
{
	$tag = "Tm";
	$sutra = "yAjakAxiBiSca (2-2-9)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($kwa)
{
if($comp_prAwipaxika =~/^(eka|sarva|jaraw|purANa|nava|kevala)\-/)
{
	$tag = "K1"; 
	$sutra = "pUrvakAlEkasarvajarawpurANanavakevalAH samAnAXikaraNena (2-1-49)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
}

if($comp_prAwipaxika =~/^(pApa|aNaka)\-/)
{
	$tag = "K3"; 
	$sutra = "pApANake kuwsiwEH (2-1-54)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($comp_prAwipaxika =~/^(pUrva|apara|paSca|praWama|carama|jaGanya|samAna|sa|maXya|maXyama|vIra)\-/)
{
	$tag = "K1"; 
	$sutra = "pUrvAparapraWamacaramajaGanyasamAnamaXyamaXyamavIrASca (2-1-58)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp_prAwipaxika =~/^(san|saw|mahaw|mahA|parama|uwwama|uwkqRta)\-/)
{
	$tag = "K1"; 
	$sutra = "sanmahawparamowwamowkqRtAH pUjyamAnEH (2-1-61)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($comp_prAwipaxika =~/\-(vqnxArikA|vqnxAraka|nAga|kuFjara)/)
{
	$tag = "K2"; 
	$sutra = "vqnxArakanAgakuFjarEH pUjyamAnam (2-1-62);pUjyamAnArWe";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($comp_prAwipaxika =~/^(kawara|kawama)\-/)
{
	$tag = "K1"; 
	$sutra = "kawarakawamO jAwiparipraSne (2-1-63)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($comp_prAwipaxika =~ /kim\-/)
{
	$tag = "K1"; 
	$sutra = "kiM kRepe (2-1-64) kuwsiwArWe";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($comp_prAwipaxika =~/\-(potA|yuvawi|swoka|kawipaya|gqRti|Xenu|vaSA|vehaw|baRkayaNI|pravakwq|Srowriya|aXyApaka|XUrwa)/)
{
	$tag = "K2"; 
	$sutra = "potAyuvawiswokakawipayagqRtiXenuvaSAvehaxbaRkayaNIpravakwqSrowriya... (2-1-65)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($comp_prAwipaxika =~ /\-(mawallikA|macarcikA|prakANda|uxXa|wallaja)/)
{
	$tag = "K2"; 
	$sutra = "praSaMsAvacanESca (2-1-66); praSaMsAvacanArWe";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($comp_prAwipaxika =~/^(yuvan|yuva)\-(Kalawi|paliwa|valina|jarawin)/)
{
	$tag = "K2"; 
	$sutra = "yuvA KalawipaliwavalinajarawIBiH (2-1-67)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

$key1 = $w1.","."cawuRpAw";
$key2 = "garBiNI";
if(($LEX{$key1}) && ($comp_prAwipaxika =~/\-$key2/))
{
	$tag = "K2"; 
	$sutra = "cawuRpAxo garBiNyA (2-1-71)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp_prAwipaxika =~/^(wulya|saxqSa|sama|samAna)\-/)
{
	$tag = "K3";
	$sutra = "kqwyawulyAKyA ajAwyA (2-1-68) jAwivacakapaxABAve";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^(arXa|arxXa|arXam)\-/)
{
	$tag = "T1"; 
	$sutra = "arXaM napuMsakam (2-2-2)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^(xviwIya|wqwIya|cawurWa|wurya|anya)\-/)
{
	$tag = "K1"; 
	$sutra = "xviwIyawqwIyacawurWawuryANyAnyawarasyAm (2-2-3)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^(na|a|an)\-/)
{
	$tag = "Tn"; 
	$sutra = "naF (2-2-6)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
#$key1 = $w2.","."guNa";
#if($LEX{$key1}){
#if($comp =~/^(IRaw|IRax)\-/)
#{
#	$tag = "T"; 
#	$sutra = "IRaxguNavacanenewi vAcyam (vArwika 1316)";
#	$ans = $ans.$tag."[".$sutra."]\t";
#}
#}

if(($comp =~/^(IRaw|IRax)\-/) && ($w2 ne "$kwa"))
{
	$tag = "T"; 
	$sutra = "IRaxakqwA (2-2-7)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($comp =~ /^(pUrva|apara|aXara|uwwara)\-/)
{
	$tag = "T";
	$sutra = "pUrvAparAXarowwaramekaxeSinEkAXikaraNe (2-2-1) avayavipaxapare,ekavacane";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^(ku|kA|kaw)\-/)
{
	$tag = "Tk"; 
	$sutra = "kugawiprAxayaH (2-2-18)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^(pra|parA|apa|sam|anu|ava|nis|nir|xus|xur|ni|A|vi|aXi|api|su|uw|ux|awi|prawi|pari|upa|wiras|wiro|punar)\-/)
{
	$tag = "Tg"; 
	$sutra = "kugawiprAxayaH (2-2-18)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^(Asanna|xUra|aXika)\-/)
{
	$tag = "Bvs"; 
	$sutra = "saMKyayAvyayAsannaxUrAXikasaMKyAH saMKyeye (2-2-25)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^(prawi|pra|nir|awi)\-/)
{
	$tag = "Tp/Tg"; 
	$sutra = "gawiSca (1-4-60)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^(acCa)\-/)
{
	$tag = "Tg";
	$sutra = "acCa gawyarWavaxeRu (1-4-69)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~ /^(alaM|alam)\-/)
{
	$tag = "Tg";
	$sutra = "BURaNeZlam (1-4-64)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~ /^(anwar)\-(hawam|hawya)/)
{
	$tag = "Tg";
	$sutra = "anwaraparigrahe (1-4-65)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~ /^(upAje|anvAje)-(kqwya|kqwvA)/)
{
	$tag = "Tg";
	$sutra = "upAjeZnvAje (1-4-73)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^(saw|asaw)\-kqwya/)
{
	$tag = "Tg";
	$sutra = "AxarAnAxarayoH saxasawI (1-4-63)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^(aswaM|aswam)\-/)
{
	$tag = "Tg";
	$sutra = "aswaM ca (1-4-68)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^axaH\-(kqwam|kqwya)/)
{
	$tag = "Tg";
	$sutra = "axoZnupaxeSe (1-4-70)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^(haswe|pANO)\-(kqwya)/)
{
	$tag = "Tg";
	$sutra = "niwyaM haswe pANAvupayamane (1-4-77)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^(jIvikA|upaniRaw)\-(kqwya)/)
{
	$tag = "Tg";
	$sutra = "jIvikopaniRaxAvOpamye (1-4-79)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^kArikA\-kqwya/)
{
	$tag = "Tg";
	$sutra = "kArikASabxasya upasafKyAnam [vArwikam] (2-2-18)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^KAt\-kqwya/)
{
	$tag = "Tg";
	$sutra = "anukaraNam cAniwiparam (1-4-62)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
$key1 = $w1.","."sAkRAxAxi";

if($LEX{$key1} && (kqwya|kqwvA))
{
	$tag = "Tg";
	$sutra = "sAkRAwpraBqwIni ca (1-4-74)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~/^(urasi|manasi)\-kqwya/)
{
	$tag = "Tg";
	$sutra = "anawyAXAna urasimanasI (1-4-75)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~ /^(maXye|paxe|nivacane)-(kqwya|kqwvA)/)
{
	$tag = "Tg";
	$sutra = "maXye paxe nivacane ca (1-4-76)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~ /^(patapatA)\-kqwya/)
{
	$tag = "Tg";
	$sutra = "avyakwAnukaraNA... (5-4-57)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~ /^((prAXvam|prAXvaM)\-kqwya)/)
{
	$tag = "Tg";
	$sutra = "prAXvaM banXane (1-4-78)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~ /^puras\-kqwya/)
{
	$tag = "Tg";
	$sutra = "puroZvyayam (1-4-67)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($comp =~ /^(UrI|urarI|wanWI|wAlI|AwAlI|vewAlI|XUlI|XUsI|SakalA|SaMskalA|XvaMsakalA|BraMSakalA|gulaguXA|sajUsa|Pala|PalI|viklI|AklI|AloRTI|kevAlI|sevAsI|paryAlI|SevAlI|varRAlI|awymaSA|vaSmasA|maSmasA|masamasA|ORat|SrORat|vORat|vaRat|svAhA|svaXA|pAMpI|prAxus|Sraw|Avis|kArikA|SuklI|)\-(kqwya|kqwam)/)
{
	$tag = "Tg";
	$sutra = "UryAxicvidAcaSca (1-4-61) kriyAyoge";
	$ans = $ans.$tag."[".$sutra."]\t";
}
elsif($comp_prAwipaxika =~/^(mahax|mahaw)\-(BUwa|kqwa)/)
{
	$tag = "Tg";
	$sutra = "kqBvaswiyoge.. (5-4-50)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($comp =~ /^(kaNe|mano)\-hawya/)
{
	$tag = "Tg";
	$sutra = "kaNemanasI SraxXAprawIGAwe (1-4-66)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

$key2 = $w2.","."SramaNAxi";
if(($LEX{$key2}) && ($w1 eq "kumAra"))
{
	$tag = "K2";
	$sutra = "kumAraH SramaNAxiBiH (2-1-70)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

$key2 = $w2.","."vyAGrAxi";
if($LEX{$key2})
{
	$tag = "K5";
	$sutra = "upamiwam vyAGrAxiBiH sAmAnyAprayoge (2-1-56)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
$key1 = $comp.","."vyAGrAxigaNa";
if($LEX{$key1}) 
{
	$tag = "K5";
	$sutra = "upamiwam vyAGrAxiBiH sAmAnyAprayoge (2-1-56)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
$key1 = $comp_prAwipaxika.","."naFviSiRta";
if($LEX{$key1}) {
	$tag = "K";
	$sutra = " kwena naFviSiRtenAnaF (2-1-60) ";
	$ans = $ans.$tag."[".$sutra."]\t";
}

$key1 = $w1.","."SreNyAxi";
$key2 = $w2.","."kqwAxi";
if($LEX{$key1} && $LEX{$key2})
{
	$tag = "T";
	$sutra = "SreNyAxayaH kqwAxiBiH (2-1-59)";
	$ans = $ans.$tag."[".$sutra."]\t";
}
$key1 = $w1.","."varNa";
$key2 = $w2.","."varNa";
if($LEX{$key1} && $LEX{$key2}) 
{
	$tag = "T"; 
	$sutra = "varNo varNena (2-1-69)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

if($comp_prAwipaxika =~ /\-(cara|cAri)/)
{
	$tag = "U";
	$sutra = "careRtaH (3-2-16)";
	$ans = $ans.$tag."[".$sutra."]\t";
}

$key1 = $comp_prAwipaxika.","."mayUravyaMsakAxi";
$key2 = $comp.","."mayUravyaMsakAxi";
if(($LEX{$key1}) || ($LEX{$key2}))
{
	$tag = "Tm";
	$sutra = " mayUravyaMsakAxayaSca (2-1-72) ";
	$ans = $ans.$tag."[".$sutra."]\t";
}
$key1 = $comp_prAwipaxika.","."SaKapArWivAxi";
$key2 = $comp.","."SaKapArWivAxi";
if(($LEX{$key1}) || ($LEX{$key2}))
{
	$tag = "Km";
	$sutra = " SaKapArWivAxInAm... [vArwikam -1310] ";
	$ans = $ans.$tag."[".$sutra."]\t";
}
if($debug_level >= 3) {print "tag = $tag sutra = $sutra\n";}
#if($tag)
#{
#	$ans = $tag."[".$sutra."]";
#}
$ans;
}
1;
