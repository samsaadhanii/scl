#!/usr/bin/perl

while($in = <STDIN>){
 if($in !~ /#/) {
    if ($in =~ /^([^\t]+)\t/) { $v = '"'.$1.'";'; }

    if ($in =~ /xvi1/) {
        $xvi1 = $xvi1.":".$v;
    }
    if ($in =~ /xvi2/) {
        $xvi2 = $xvi2.":".$v;
    }
    if ($in =~ /\tsakarmaka/) {
        $sak = $sak.":".$v;
    }
    if ($in =~ /\takarmaka/) {
        $ak = $ak.":".$v;
    }
    if ($in =~ /\tgawi/) {
        $gawi = $gawi.":".$v;
    }
    if ($in =~ /\tbuxXi/) {
        $buxXi = $buxXi.":".$v;
    }
    if ($in =~ /\tSabxa/) {
        $Sabxa = $Sabxa.":".$v;
    }
    if ($in =~ /\tprawyavasAnArWa/) {
        $prawya = $prawya.":".$v;
    }
    if ($in =~ /\tvAkyakarma/) {
        $vAkya = $vAkya.":".$v;
    }
    if ($in =~ /\tAxi/) {
        $Axi = $Axi.":".$v;
    }
    if ($in =~ /\tkarwqsamAnAXikaraNa/) {
        $karwq = $karwq.":".$v;
    }
    if ($in =~ /\tkarmasamAnAXikaraNa/) {
   # if (($in =~ /karmasamAnAXikaraNa/) || ($in =~ /buxXi/)) {
# Why buxXi is under karmasamAnAXikaraNa?
        $karmasamA = $karmasamA.":".$v;
    }
    if ($in =~ /\tSliR/) {
        $SliR = $SliR.":".$v;
    }
    if ($in =~ /\tSak/) {
        $Sak = $Sak.":".$v;
    }
  }
}

print_write("shlish_aadi.ml","shlish_aadi_list",$SliR);
print_write("Sabxakarma_dhaatu.ml", "shabdakarma_dhaatu_list",$Sabxa);
print_write("aaxikarma_dhaatu.ml","aaxikarma_XAwu_list",$Axi);
print_write("akarmaka_dhaatu.ml","akarmaka_XAwu_list",$ak);
print_write("buxXyarWa_dhaatu.ml","buxXyarWa_XAwu_list",$buxXi);
print_write("gawyarWa_dhaatu.ml","gawyarWa_XAwu_list",$gawi);
print_write("karmasamAnAXikaraNa_dhaatu.ml","karmasamAnAXikaraNa_XAwu_list",$karmasamA);
print_write("karwqsamAnAXikaraNa_dhaatu.ml","karwqsamAnAXikaraNa_XAwu_list",$karwq);
print_write("prawyavasAnArWa_dhaatu.ml","prawyavasAnArWa_XAwu_list",$prawya);
print_write("sakarmaka_dhaatu.ml","sakarmaka_XAwu_list",$sak);
print_write("shakaadi.ml","shakaadi_list",$Sak);
print_write("shlish_aadi.ml","shlish_aadi_list",$SliR);
print_write("vAkyakarma_dhaatu.ml","vAkyakarma_XAwu_list",$vAkya);
print_write("xvikarmaka1_dhaatu.ml","xvikarmaka_XAwu_list1",$xvi1);
print_write("xvikarmaka2_dhaatu.ml","xvikarmaka_XAwu_list2",$xvi2);

sub print_write {
     ($flnm,$list_nm,$array) = @_;
      open (TMP,">$flnm");
      $array =~ s/^://;
      @array = split(/:/,$array);
      print TMP "value $list_nm = [\n";
      foreach $a ( sort @array){
       print TMP $a,"\n";
      }
      print TMP "]\n;\n";
      close(TMP);
}
1

