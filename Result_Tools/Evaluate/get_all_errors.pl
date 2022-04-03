#!/usr/bin/perl


%from_rel_names = (
"अभेदः" => 1,
"आभिमुख्यम्" => 1,
"अङ्गविकारः" => 1,
"अनन्तरकालः" => 1,
"अनुयोगी" => 1,
"अन्यतरः" => 1,
"अन्यतरद्योतकः" => 1,
"अपवर्ग_सम्बन्धः" => 1,
"अपादानम्" => 1,
"अपादानम्_उप" => 1,
"अपादानम्_वीप्सा" => 1,
"आरम्भ_बिन्दुः" => 1,
"अवधिः" => 1,
"अत्यन्तसंयोग_सम्बन्धः" => 1,
"अधिकरणम्" => 1,
"अधिकरणम्_उप" => 1,
"अध्याहृतक्रियाकर्म" => 1,
"भावलक्षणसप्तमी_अनन्तरकालः" => 1,
"भावलक्षणसप्तमी_पूर्वकालः" => 1,
"भावलक्षणसप्तमी_समानकालः" => 1,
"भविष्यत्समानकालः" => 1,
"गतिकर्म" => 1,
"गतिकर्ता" => 1,
"गौणकर्म" => 1,
"हेतुः" => 1,
"इष्कर्म" => 1,
"इत्थम्भूतः" => 1,
"कालाधिकरणम्" => 1,
"करणम्" => 1,
"करणम्_वीप्सा" => 1,
"कर्म" => 1,
"कर्मसमानाधिकरणम्" => 1,
"कर्ता" => 1,
"कर्ता_उप" => 1,
"कर्तृरहितकर्तृसमानाधिकरणम्" => 1,
"कर्तृसमानाधिकरणम्" => 1,
"कर्तृसमानाधिकरणम्_उप" => 1,
"क्रियाविशेषणम्" => 1,
"ल्यप्कर्माधिकरणम्" => 1,
"मुख्यकर्म" => 1,
"निर्धारणम्" => 1,
"नित्य_सम्बन्धः" => 1,
"नित्य_सम्बन्धः1" => 1,
"प्रतिषेधः" => 1,
"प्रतियोगी" => 1,
"प्रयोजककर्ता" => 1,
"प्रयोजनम्" => 1,
"प्रयोज्यकर्ता" => 1,
"पूर्वकालः" => 1,
"षष्ठीसम्बन्धः" => 1,
"सञ्ज्ञा" => 1,
"सञ्ज्ञाद्योतकः" => 1,
"सहार्थः" => 1,
"सहार्थ_द्योतकः" => 1,
"सहायकक्रिया" => 1,
"समानाधिकरणम्" => 1,
"सम्बन्धः" => 1,
"सम्बन्ध_उप" => 1,
"सम्बोधनसूचकम्" => 1,
"सम्बोध्यः" => 1,
"सम्प्रदानम्" => 1,
"समुच्चयद्योतकः" => 1,
"समुच्चितः" => 1,
"सन्दर्भ_बिन्दुः" => 1,
"सुप्_अन्यतरः" => 1,
"सुप्_अन्यतरद्योतकः" => 1,
"सुप्_समुच्चयद्योतकः" => 1,
"सुप्_समुच्चितः" => 1,
"स्वामी" => 1,
"उप_आभिमुख्यम्" => 1,
"उप_अपेक्षा" => 1,
"उप_आरम्भ_बिन्दुः" => 1,
"उप_कर्म" => 1,
"उप_कर्मप्रवचनीयः" => 1,
"उपमानम्" => 1,
"उपमानद्योतकः" => 1,
"उप_निर्धारणम्" => 1,
"उप_प्रतिसिद्धः" => 1,
"उप_स्वामी" => 1,
"उप_विना" => 1,
"उप_विषयाधिकरणम्" => 1,
"उद्गारवाचकः" => 1,
"वाक्यकर्म" => 1,
"वाक्यकर्मद्योतकः" => 1,
"वर्तमानसमानकालः" => 1,
"विनार्थः" => 1,
"विनार्थ_द्योतकः" => 1,
"वीप्सा" => 1,
"विषयाधिकरणम्" => 1,
"विशेषणम्" => 1,
"तीव्रतादर्शी" => 1,
"तुलना_बिन्दुः" => 1,
"देशाधिकरणम्" => 1,
"देशाधिकरणम्_उप" => 1,
"अभिहित_कर्ता" => 1,
"अभिहित_कर्तार्म"=> 1,
"नित्यसम्बन्धः" => 1
);

while($in = <STDIN>){
	$in =~ s/" /"/g; # Remove blank space within the quotes if any
	if($in =~ /{/) { 
		$sarga = ""; 
		$shloka = ""; 
		$index = ""; 
	}
	if($in =~ /"/) {

	   if($in =~ /"chpatno": "([0-9]+)"/) { $sarga = $1;}
      	   if($in =~ /"slokano": "([0-9]+)"/) { $shloka = $1;}
      	   if($in =~ /"sentno": "([0-9abc]+)"/) { $sent = $1;
	      $file_nm = $sarga."_".$shloka."_".$sent;
	      &file_initialise($file_nm);
	   }

	   if($in =~ /anvaya_no/) {
	     if($in =~ /"anvaya_no": "([0-9]+)"/) { $index = $1;}
	     &anvaya_num($in);
	  }

	  if($in =~ /word/) { &word($in); }

	  if($in =~ /kaaraka_sambandha/) {
	    &kaaraka_sambandha($in, $index);
	    &kaaraka_morph($in,$morph);
          }

          if($in =~ /poem/) { &poem($in); }

          if($in =~ /sandhied_word/) { &sandhied_word($in); }

          if($in =~ /morph_in_context/) {
	    $morph = $in;
	    &morph_in_context($in);
          }
   }
}

foreach $f (keys %SARGA_SHLOKA_VISITED) {
	open (TMP,">$f");
	if($ANVAYA_ERR{$f} || $WORD_ERR1{$f} || $WORD_ERR2{$f} || $WORD_ERR3{$f}|| $KAARAKA_ERR1{$f} || $KAARAKA_ERR2{$f} || $KAARAKA_ERR3{$f} || $KAARAKA_ERR4{$f} || $POEM_ERR{$f} || $SAN_ERR1{$f} || $SAN_ERR2{$f} || $MO_ERR1{$f} || $KAARAKA_MO_ERR1{$f} || $KAARAKA_MO_ERR2{$f} || $KAARAKA_MO_ERR3{$f} || $KAARAKA_MO_ERR4{$f} || $KAARAKA_MO_ERR5{$f} || $KAARAKA_MO_ERR6{$f} || $KAARAKA_MO_ERR7{$f} || $KAARAKA_MO_ERR8{$f} || $KAARAKA_MO_ERR9{$f} || $KAARAKA_MO_ERR10{$f} || $KAARAKA_MO_ERR11{$f} || $KAARAKA_MO_ERR12{$f}) {
	#print TMP "Error Analysis ----\n";
	#print TMP "Following errors were found during automatic Evaluation of the shloka number $shloka from the Sarga $sarga\n";
	#print TMP "Download the Excel sheet(s) from http://sanskrit.uohyd.ac.in/Evaluate/download.html  and carry out the corrections in it.\n";
	#print TMP "The errors are reported row-wise\n";
	#print TMP "----\n";
        if($ANVAYA_ERR{$f} ne "") {
		print TMP "A. The entry under Index has non numeric characters.\n";
	}

	if ($WORD_ERR1{$f} == 1) {
	  print TMP "B. The entry under word is blank.\n";
	} elsif ($WORD_ERR2{$f} == 1) {
	  print TMP "B. The entry under word has a blank space.\n";
	  print TMP "There can not be two words in one box. If it is a compound word, join them together by a '-', or if these are two different words, enter it in a separate row\n";
	 } elsif ($WORD_ERR3{$f} == 1) {
	  print TMP "B. The entry under word is in Roman.\n";
	  print TMP "Please change it to Devanagari or IAST\n";
	}

	if($KAARAKA_ERR1{$f} == 1) {
	 print TMP "K1. No Kaaraka Relation(s) for word(s)\n";
	}
	if($KAARAKA_ERR2{$f} == 1) {
	 print TMP "K2. There is a Self Loop\n";
	}
	if($KAARAKA_ERR3{$f} == 1) {
	 print TMP "K3. The relation name is not correct\n";
	}

	if($KAARAKA_ERR4 == 1) {
         print "K4. Check the entry under kaaraka relations\n<br/>";
        }

	if($POEM_ERR{$f} == 1) {
	 print TMP "C. Check Poem number entry\n";
	}

	if($SAN_ERR1{$f} ==1) {
	 print TMP "D. Word under sandhied_word column is in split form\n";
	}

	if($SAN_ERR2{$f} ==1) {
	 print TMP "D. Check the entry under sandhied_word column\n";
	}

	if($MO_ERR1{$f} ==1) {
	 print TMP "F. Morph in context has multiple analysis\n";
	}

	if($KAARAKA_MO_ERR1{$f} ==1) {
		print TMP "G. vibhakti of kartā  is not correct\n";
	}
	if($KAARAKA_MO_ERR2{$f} ==1) {
		print TMP "G. vibhakti of karma  is not correct\n";
	}
	if($KAARAKA_MO_ERR3{$f} ==1) {
		print TMP "G. vibhakti of karaṇa  is not correct\n";
	}
	if($KAARAKA_MO_ERR4{$f} ==1) {
		print TMP "G. vibhakti of sampradānam  is not correct\n";
	}
	if($KAARAKA_MO_ERR5{$f} ==1) {
		print TMP "G. vibhakti of apādānam  is not correct\n";
	}
	if($KAARAKA_MO_ERR6{$f} ==1) {
		print TMP "G. vibhakti of ṣaṣṭhīsambandhaḥ  is not correct\n";
	}
	if($KAARAKA_MO_ERR7{$f} ==1) {
		print TMP "G. vibhakti of adhikaraṇam  is not correct\n";
	}
	if($KAARAKA_MO_ERR8{$f} ==1) {
		print TMP "G. vibhakti of hetuḥ  is not correct\n";
	}
        if($KAARAKA_MO_ERR9{$f} ==1) {
		print TMP "G. vibhakti of kartṛsamānādhikaraṇam  is not correct\n";
	}
        if($KAARAKA_MO_ERR10{$f} ==1) {
		print TMP "G. vibhakti of karmasamānādhikaraṇam  is not correct\n";
	}
	if($KAARAKA_MO_ERR11{$f} ==1) {
		print TMP "G. The relation can not be pūrvakāla, since the kṛt suffix is not ktvā / lyap\n";
	}
	if($KAARAKA_MO_ERR12{$f} ==1) {
		print TMP "G. The relation can not be bhāvalakṣaṇa_pūrvakāla, since the kṛt suffix is not kta\n";
	}
 } 
 close(TMP);
}


sub anvaya_num {
	my($in) = @_;
        if($in =~ /"anvaya_no": "[^0-9]+"/) { 
	  $ANVAYA_ERR{$file_nm} = 1;
	  #print "A",$file_nm,"\n";
	}
}
1;

sub word {
	my($in) = @_;
	$in =~ s/ \)/\)/;
	$in =~ s/\( /\(/;
	$in =~ s/^[ \t]+//;
	$in =~ s/[ \t]+$//;
	if($in =~ /"word": "-"/) { 
	  $WORD_ERR1{$file_nm} = 1;
	  #print "B1",$file_nm,"\n";
	}
	elsif($in =~ /"word": ".* .*"/) {
	  $WORD_ERR2{$file_nm} = 1;
	  #print "B2",$file_nm,"\n";
	}
	elsif($in =~ /"word": "[a-zA-Z]*"/) {
	  $WORD_ERR3{$file_nm} = 1;
	  #print "B3",$file_nm,"\n";
	}
}
1;

sub kaaraka_sambandha {
	my($in,$index) = @_;

	if($in =~ /"kaaraka_sambandha": "-"/) { 
	   $KAARAKA_ERR1{$file_nm} = 1;
	   print "C1",$file_nm,"\n";
	}
	if($in =~ /([0-9]+)/) { 
		$rel_to = $1;
		if($index == $rel_to) { 
		  $KAARAKA_ERR2{$file_nm} = 1;
		  #print "C2",$file_nm,"\n";
		}
	}
        
	$in =~ s/ //g;
	if($in =~ /: "([^,]+),[0-9]+[";]/) {
		$rel = $1;
                $rel =~ s/ //g;
                $rel =~ s/\t//g;
		if($from_rel_names{$rel} != 1) { 
			#print "rel = $rel\n";
		  $KAARAKA_ERR3{$file_nm} = 1;
		       #print "C3",$file_nm,"\n";
		}
	} else {
		 $KAARAKA_ERR4{$file_nm} = 1;
	}
}
1;

sub file_initialise {
	my($file_nm) = @_;

	if (!defined($SARGA_SHLOKA_VISITED{$file_nm})) {
	     $SARGA_SHLOKA_VISITED{$file_nm} = 1;
        }
}
1;

sub poem {
	my($in) = @_;
	if($in =~ /"poem": ".*[^0-9-]+.*"/) { 
	     $POEM_ERR{$file_nm} = 1;
	     #print "D1",$file_nm,"\n";
	}
}
1;

sub sandhied_word {
	my($in) = @_;
	if(($in !~ /"-"/) && ($in =~ /\-/)) { 
	     $SAN_ERR1{$file_nm} = 1;
	     #print "S1",$file_nm,"\n";
	}
	if($in =~ /;/) { 
	     $SAN_ERR2{$file_nm} = 1;
	     #print "S2",$file_nm,"\n";
	}
}
1;

sub morph_in_context {
	my($in) = @_;
	if($in =~ /\//) {
	     $MO_ERR1{$file_nm} = 1;
	     #print "M",$file_nm,"\n";
        }
}
1;

sub kaaraka_morph {
	my($kaaraka,$morph) = @_;
	
	if($morph =~ /;([1-8]);/) { $vibh = $1;} else {$vibh = "";}

        if($kaaraka =~ /प्रयोज्यकर्ता/){
             if ($vibh =~ /[^23]/){
                $KAARAKA_MO_ERR1{$file_nm} = 1;
		#print "K1a",$file_nm,"\n";
            }
        } 
        elsif($kaaraka =~ /प्रयोजककर्ता/){
             if ($vibh =~ /[^13]/) {
               $KAARAKA_MO_ERR1{$file_nm} = 1;
	       #print "K1b",$file_nm,"\n";
             }
	}
	elsif(($kaaraka =~ /कर्ता/) && ( $vibh =~ /[^1367]/)){
	    $KAARAKA_MO_ERR1{$file_nm} = 1;
	    #print "K1",$file_nm,"\n";
	}
	elsif(($kaaraka =~ /कर्म/) && ($vibh =~ /[^12]/) && ($kaaraka !~ /वाक्यकर्म/)){
	    $KAARAKA_MO_ERR2{$file_nm} = 1;
	    #print "K2",$file_nm,"\n";
	}
	elsif (($kaaraka =~ /अधिकरणम्/)|| ($kaaraka =~ /कालाधिकरणम्/) || ($kaaraka =~ /देशाधिकरणम्/)|| ($kaaraka =~ /विषयाधिकरणम्/)) {
               if ($vibh =~ /[^7]/){
		  $KAARAKA_MO_ERR7{$file_nm} = 1;
		  #print "K7",$file_nm,"\n";
               } 
        }elsif ($kaaraka =~ /कर्तृसमानाधिकरणम्/) {
               if ($vibh =~ /[^1]/){
		  $KAARAKA_MO_ERR9{$file_nm} = 1;
		  #print "Ka",$file_nm,"\n";
               } 
        }elsif ($kaaraka =~ /कर्मसमानाधिकरणम्/) {
               if ($vibh =~ /[^2]/){
		  $KAARAKA_MO_ERR10{$file_nm} = 1;
		  #print "Kb",$file_nm,"\n";
               } 
	}elsif(($kaaraka =~ /करणम्/) && ( $vibh =~ /[^3]/)){
	  $KAARAKA_MO_ERR3{$file_nm} = 1;
	  #print "K3",$file_nm,"\n";
	}
	elsif(($kaaraka =~ /सम्प्रदानम्/) && ( $vibh =~ /[^4]/)){
	  $KAARAKA_MO_ERR4{$file_nm} = 1;
	  #print "K4",$file_nm,"\n";
	}
	elsif(($kaaraka =~ /अपादानम्/) && ( $vibh =~ /[^5]/)){
	  $KAARAKA_MO_ERR5{$file_nm} = 1;
	  #print "K5",$file_nm,"\n";
	}
	elsif(($kaaraka =~ /हेतु/) && ( $vibh =~ /[^35]/)){
	     $KAARAKA_MO_ERR8{$file_nm} = 1;
	     #print "K8",$file_nm,"\n";
	}
	elsif(($kaaraka =~ /षष्ठीसम्बन्धः/) && ( $vibh =~ /[^6]/)){
	  $KAARAKA_MO_ERR6{$file_nm} = 1;
	  #print "K6",$file_nm,"\n";
	}
	elsif($kaaraka =~ /_पूर्वकाल/) {
	        if ($morph !~ /क्त/) {
	         $KAARAKA_MO_ERR12{$file_nm} = 1;
	 }  
	  #print "K6",$file_nm,"\n";
        } elsif(($kaaraka =~ /पूर्वकाल/) && (($morph !~ /क्त्वा/) && ($morph !~ /ल्यप्/))){
	  $KAARAKA_MO_ERR11{$file_nm} = 1;
	  #print "K6",$file_nm,"\n";
	}
}
1;

