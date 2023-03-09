#!/usr/bin/env perl


open(TMP,"$ARGV[1]/asm-yuRm.txt");
while(<TMP>) {
chomp;
$VERBLIST{$_}=1;
}
close(TMP);

open(TMP,"$ARGV[1]/Sru-xqS.txt");
while(<TMP>) {
chomp;
$SRULIST{$_}=1;
}
close(TMP);

@input = <STDIN>;
$wax   = 0;
$yax   = 0;

    # checking for sentences
    for($i=0;$i<=$#input;$i++) {
        chomp $input[$i];
        @f=split(/\t/,$input[$i]);
            if($f[8]=~/^wax</) {
                $wax++;
            }
            if($f[8]=~/^yax</||$f[8]=~/\/yax</){
                $yax++;
            }
        }

    # checking inside morph
    $k=0;

    for($i=0;$i<=$#input;$i++) {
       if($input[$i] ne "") {
        $k=$i+1;
        @k=split(/\t/,$input[$k]);
        ($kroot,$krest)=split(/</,$k[8]);
        @f=split(/\t/,$input[$i]);
            if($f[8]=~/viBakwiH:(.)/) {
                $viB=$1;
            }
        else {
            $viB="";
            }
            if($f[8]=~/vacanam:(.)/) {
                $vac=$1;
            }
            if($f[8]=~/lifgam:(.)/) {
                $lif=$1;
            }

        #rl1	# sva-sub_routine
        if($f[8]=~/^sva<|^sva-|^svayam/) {
            &sva_routine();             # Calling sva-rule
        }

        #rl2	# asmax-sub_routine
        elsif($f[8]=~/^asmax<|^asmax-|^maw-/) {
            &asmax_routine();	        # Calling asmax-rule
        }

        #rl3	# yuRmax-sub_routine
        elsif($f[8]=~/yuRmax<|^Bavaw</) {
            &yuRmax_routine();	        # Calling yuRmax-rule
        }

        #rl4	# waw-ixam-Sq-sub_routine
        elsif($f[3] =~/^waw|^ixam/ && ($SRULIST{$kroot} == 1)) {
            &wawixam_routine();	            # Calling waw-ixam-Sq-rule
		}
        
        #rl5	# yaxwax-sub_routine, more yax
        elsif($f[8]=~/^wax</ && $yax>1) {
            &yaxwax_routine();	        # Calling yax-wax-rule
        }

        #rl6	# yax-wax-sub_routine, one yax
        elsif($f[8]=~/^wax</ && $yax == 1) {
            &yaxwax1_routine();         # Calling yax-wax=1-rule
        }

        #rl7	# waxaxas-sub_routine
        elsif($f[8]=~/^wax<|^axas</ && $yax<1 && $f[9]!~/viSeRaNam/) {
            &waxaxas_routine();         # Calling wax-axas-rule
        }

    	#rl8	# yax-sub_routine
        elsif($f[8]=~/^yax</ && $wax<1) {
            &yax_routine();         # Calling yax-rule
        }

        #rl9	# ewaxixam-sub_routine
#        elsif($f3=~/^ewax<|^ixam</ && $f4!~/viSeRaNam|karwqsamAnAXikaraNam/) {
#            &ewaxixam_routine();        # Calling ewax-ixam-rule
#        }

        #rl10	# waxyax-sub_routine, more wax
        elsif($f[8]=~/^yax</ && $wax>1) {
            &waxyax_routine();          # wax-yax-rule
        }

        #rl11	# waxyax-sub_routine, one wax
        elsif($f[8]=~/^yax</ && $wax == 1) {
            &waxyax1_routine();	        # Calling wax-yax=1-rule
        }

        #rl12	# yawrawawra-sub_routine
        elsif($f[8]=~/^wawra/) {
            &yawrawawra_routine();	    # Calling yawra-wawra-rule
        }

        #rl13	# wawrayawra-sub_routine
        elsif($f[8]=~/^yawra/) {
            &wawrayawra_routine();	    # Calling wawra-yawra-rule
        }

        #rl14	# yaxAwaxA-sub_routine
        elsif($f[8]=~/^waxA<|^wasmin_kAle/) {
            &yaxAwaxA_routine();	    # Calling yaxA-waxA-rule
        }

        #rl15	# waxAyaxA-sub_routine
        elsif($f[8]=~/^yaxA|yasmin_kAle/) {
            &waxAyaxA_routine();	    # Calling waxA-yaxA-rule
        }

        #rl16	# yasmAwwasmAw-sub_routine
        elsif($f[8]=~/^wasmAw</) {
            &yasmAwwasmAw_routine();	# Calling yasmAw-wasmAw-rule
        }

        #rl17	# wasmAwyasmAw-sub_routine
        elsif($f[8]=~/^yasmAw</) {
            &wasmAwyasmAw_routine();	# Calling wasmAw-yasmAw-rule
        }

        else {
            $arr[$i]="";
        }
    }
}

#for($j=0;$j<=$#arr;$j++) { 
# With $#arr, when a shloka is given, $#arr was less than the no of words.
#The sentence tried is: paNdiwAH Baviwum na icCAmaH vayam
for($j=0;$j<=$#input;$j++) {
    $arr[$j]=~s/^\///;
     if($input[$j] ne "") {
      print "$input[$j]\t$arr[$j]\n";
     } else { print "\n";}
}

#print "FOUND\n";

untie(%VERBLIST);
untie(%SRULIST);

####################################################

        # sva-rule
        sub sva_routine {
            for($j=0;$j<=$#input;$j++) {
                chomp $input[$j];
                ($n,$w,$m,$r)=split(/\t/,$input[$j]);
                    if($r=~/^karwA/ && $i>$j) {
                    #if($r=~/^karwA/) { # new rule : search in the same sentence. For now take the sentence boundary is '.'; Example, na SqNvan api [sva-]-xoRa-nASAya manwriBiH [pqWivI-pawiH+] boxXavyaH aswi. yaWA vixureNa [ambikA-suwaH??] boXiwaH AsIw.
                        $arr[$i]=$n.":sva-rule";
                }
            }
        }

####################################################

        # asmax-rule
        sub asmax_routine {
            for($j=0;$j<=$#input;$j++) {
                chomp $input[$j];
                if($input[$j] =~ /\tkarwA/){ $val = $input[$j];}
                ($n,$w,$m,$r)=split(/\t/,$input[$j]);
                    if($m=~/<XAwuH/) {
                    ($root,$rest)=split(/</,$m);
                        if($VERBLIST{$root} == 1) {
                            $n =~ /[0-9]\.[0-9]\.([0-9])/; 
                             if($val =~ /karwA,$1/){
                                $val =~ /([0-9])\.([0-9])\.([0-9])/; 
                                $nn="$1.$2.$3";
                                $arr[$i]=$nn.":asmax-rule-1";
                                }
                            # if($i>$j) {
                             #   $arr[$i]=$nn.":asmax-rule-1";
                       # }
                        else {
                            for($jj=0;$jj<$j;$jj++) {
                                chomp $input[$jj];
                                ($n1,$w1,$m1,$r1)=split(/\t/,$input[$jj]);
                                if($r1=~/^karwA/ && $m1!~/^asmax/ && $i>$j) {
                                    $arr[$i]= $n1.":asmax-rule-2";
                                    }
                                }
                            }
                        }
                    }
                }
            }

####################################################

        # yuRmax-rule
        sub yuRmax_routine {
            for($j=0;$j<=$#input;$j++) {
                chomp $input[$j];
                ($n,$w,$m,$r)=split(/\t/,$input[$j]);
                    if($m=~/<XAwuH/) {
                    ($root,$rest)=split(/</,$m);
                    if($VERBLIST{$root} == 1) {
                        for($jj=0;$jj<$j;$jj++) {
                            chomp $input[$jj];
                            ($n1,$w1,$m1,$r1)=split(/\t/,$input[$jj]);
                               # if($r1=~/karma/) {
                                if(($r1=~/karma/) && ($r1 =! /_karma/)) {
                                $arr[$i]=$n1.":yuRmax-rule-1";
                            }
                        }
                    }
                    else {
                        for($jj=0;$jj<$j;$jj++) {
                            chomp $input[$jj];
                            ($n1,$w1,$m1,$r1)=split(/\t/,$input[$jj]);
                            if($r1=~/^samboXyaH/) {
                                $arr[$i]=$n1.":yuRmax-rule-2";
                            }
                        }
                    }
                }
            }
        }

####################################################

        # waw-ixam-Sq-rule
        sub wawixam_routine {
            if($input[$k-3]=~/<XAwuH/) {
                ($n,$jnk)=split(/\t/,$input[$k-3]);
                    $arr[$i]=$n.":waw-ixam-Sq-rule";
			}
        }

####################################################

        # yax-wax-rule
        sub yaxwax_routine {
            for($j=0;$j<=$#input;$j++) {
                chomp $input[$j];
                ($n,$w,$m,$r)=split(/\t/,$input[$j]);
                if($m=~/lifgam:(.)/) {
                    $y_lif=$1;
                }
                if($m=~/viBakwiH:(.)/) {
                    $y_viB=$1;
                }
	            if($m=~/vacanam:(.)/) {
                    $y_vac=$1;
                }
                if(($m=~/yax</) && ($viB eq $y_viB || $lif eq $y_lif && $vac eq $y_vac) && $i>$j && $r!~/RaRTIsambanXaH|hewuH|kriyAviSeRaNam/) {
                    $arr[$i]=$n.":yax-wax-rule-1";
                }
            }
        }

####################################################

        # yax-wax=1-rule
        sub yaxwax1_routine {
            for($j=0;$j<=$#input;$j++) {
                chomp $input[$j];
                ($n,$w,$m,$r)=split(/\t/,$input[$j]);
                if($m=~/lifgam:(.)/) {
                    $y_lif=$1;
                }
                if($m=~/^yax</ && $i>$j && $lif eq $y_lif) {
                    $arr[$i]=$n.":yax-wax-rule-2";
                }
            }
        }
        
####################################################

        # wax-axas-rule            
        sub waxaxas_routine {            
            for($j=0;$j<=$#input;$j++) {
                chomp $input[$j];
                ($n,$w,$m,$r)=split(/\t/,$input[$j]);
                if($m=~/vargaH:nA/ && $i>$j && $r!~/viSeRaNam|karwqsamAnAXikaraNam|aXikaraNam|kAlAXikaraNam|samAnakAlaH|hewuH|upapaxasambanXaH|pUrvakAlaH|gONakarma/) {
                    if($m=~/lifgam:(.)/) {
                        $n_lif=$1;
                    }
                    if($m=~/viBakwiH:(.)/) {
                        $n_viB=$1;
                    }
                    if($m=~/vacanam:(.)/) {
                        $n_vac=$1;
                    }
                    
                     if(($lif eq $n_lif && $vac eq $n_vac) || ($lif eq $n_lif && $viB eq $n_viB)){
                        $arr[$i].="/$n".":wax-axas-rule";
                    }
                }
            }
        }
            
####################################################

# yax-rule            
        sub yax_routine {            
            for($j=0;$j<=$#input;$j++) {
                chomp $input[$j];
                ($n,$w,$m,$r)=split(/\t/,$input[$j]);
                if($m=~/vargaH:nA/ && $i>$j && $r!~/viSeRaNam|karwqsamAnAXikaraNam|aXikaraNam|kAlAXikaraNam|samAnakAlaH|hewuH|gONakarma|upapaxasambanXaH/) {
                    if($m=~/lifgam:(.)/) {
                        $n_lif=$1;
                    }
                    if($m=~/viBakwiH:(.)/) {
                        $n_viB=$1;
                    }
                    if($m=~/vacanam:(.)/){
                        $n_vac=$1;
                    }

                    if($viB eq $n_viB || $lif eq $n_lif && $vac eq $n_vac) {
                        $arr[$i].="/$n".":yax-rule";
                    }
                }
            }
        }

####################################################

        # ewax-ixam-rule            
#        sub ewaxixam_routine {            
#            for($j=0;$j<=$#input;$j++) {
#                chomp $input[$j];
#                ($n,$w,$m,$r)=split(/\t/,$input[$j]);
#                if($m=~/vargaH:nA/ && $i>$j) { #&& $r!~/viSeRaNam|karwqsamAnAXikaraNam/) {
#                    if($m=~/lifgam:(.)/) {
#                        $n_lif=$1;
#                    }
#                    if($m=~/vacanam:(.)/) {
#                        $n_vac=$1;
#                    }
#                    if($lif eq $n_lif && $vac eq $n_vac) {
#                        $arr[$i].="/$n".":ewax-ixam-rule";
#                    }
#                }
#            }
#        }
            
####################################################

        # wax-yax-rule            
        sub waxyax_routine {            
            for($j=0;$j<=$#input;$j++) {
                chomp $input[$j];
                ($n,$w,$m,$r)=split(/\t/,$input[$j]);
                if($m=~/lifgam:(.)/) {
                    $y_lif=$1;
                }
                if($m=~/viBakwiH:(.)/) {
                    $y_viB=$1;
                }
                if($m=~/^wax</ && ($viB eq $y_viB||$lif eq $y_lif) && $i>$j) {
                    $arr[$i]=$n.":wax-yax-rule-1";
                }
            }
        }
          
####################################################

        # wax-yax=1-rule            
        sub waxyax1_routine {            
            for($j=0;$j<=$#input;$j++) {
                chomp $input[$j];
                ($n,$w,$m,$r)=split(/\t/,$input[$j]);
                if($m=~/lifgam:(.)/) {
                    $y_lif=$1;
                }
                if($m=~/^wax</ && $i>$j && $lif eq $y_lif) {
                    $arr[$i]=$n.":wax-yax-rule-2";
                }
            }
        }

####################################################

        # yawra-wawra-rule
        sub yawrawawra_routine {        
            for($j=0;$j<=$#input;$j++) {
                chomp $input[$j];
                ($n,$w,$m,$r)=split(/\t/,$input[$j]);
                if($m=~/^yawra|^yax</ && $i>$j) {
                    $arr[$i]=$n.":yawra-wawra-rule";
                }
            }
        }
            
####################################################

        # wawra-yawra-rule            
        sub wawrayawra_routine {            
            for($j=0;$j<=$#input;$j++) {
                chomp $input[$j];
                ($n,$w,$m,$r)=split(/\t/,$input[$j]);
                if($m=~/^wawra|^wax</ && $i>$j) {
                    $arr[$i]=$n.":wawra-yawra-rule";
                }
            }
        }

####################################################

        # yaxA-waxA-rule
        sub yaxAwaxA_routine {
            for($j=0;$j<=$#input;$j++) {
                chomp $input[$j];
                ($n,$w,$m,$r)=split(/\t/,$input[$j]);
                if($m=~/^yaxA</ && $i>$j) {
                    $arr[$i]=$n.":yaxA-waxA-rule";
                }
            }
        }
            
####################################################

        # waxA-yaxA-rule            
        sub waxAyaxA_routine {            
            for($j=0;$j<=$#input;$j++) {
                chomp $input[$j];
                ($n,$w,$m,$r)=split(/\t/,$input[$j]);
                if($m=~/^waxA</ && $i>$j) {
                    $arr[$i]=$n.":waxA-yaxA-rule";
                }
            }
        }
               
####################################################

        # yasmAw-wasmAw-rule                
        sub yasmAwwasmAw_routine {                
                chomp $input[$j];
                ($n,$w,$m,$r)=split(/\t/,$input[$j]);
                if($m=~/^yasmAw</ && $i>$j) {
                    $arr[$i]=$n.":yasmAw-wasmAw-rule";
                }
            }

####################################################

        # wasmAw-yasmAw-rule
        sub wasmAwyasmAw {
            for($j=0;$j<=$#input;$j++){
                chomp $input[$j];
                ($n,$w,$m,$r)=split(/\t/,$input[$j]);
                if($m=~/^wasmAw</ && $i>$j) {
                    $arr[$i]=$n.":wasmAw-yasmAw-rule";
                }
            }
        }

####################################################
