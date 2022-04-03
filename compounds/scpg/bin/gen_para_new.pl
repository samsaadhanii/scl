#!/usr/bin/perl

# Open various databases
#PARA: Rules for paraphrases of the tags
#DICT: dictionary giving the default gender of a noun
#BAHU: pronominal forms in various vibhaktis required for bahuvriihi
#FEM: feminine pratipadika required for bahuvriihi cmpds 
#NUM: number words for marking them as saMKyeya
#PRON: Forms of the pronoun waw for diff gen,num,vib combination
#EXCP_EX: Exceptional cases to be treated directly
#pUrvapaxa_rt_gen: rt and gender of the pUrvapaxa

use GDBM_File;

#print "ARGV[0] = $ARGV[0]\n";
tie(%PARA,GDBM_File,"$ARGV[0]/samasa_rules.gdbm",GDBM_READER,0444);
tie(%DICT,GDBM_File,"$ARGV[0]/dict_gen.gdbm",GDBM_READER,0444);
tie(%BAHU,GDBM_File,"$ARGV[0]/bahu_pron.gdbm",GDBM_READER,0444);
tie(%FEM,GDBM_File,"$ARGV[0]/fem_viSeRaNa.gdbm",GDBM_READER,0444);
tie(%NUM,GDBM_File,"$ARGV[0]/num.gdbm",GDBM_READER,0444);
tie(%PRON,GDBM_File,"$ARGV[0]/pronoun_forms.gdbm",GDBM_READER,0444);
tie(%EXCP_EX,GDBM_File,"$ARGV[0]/excp_ex.gdbm",GDBM_READER,0444);
tie(%pUrvapaxa_rt_gen,GDBM_File,"$ARGV[0]/pUrvapaxa_rt_gen.gdbm",GDBM_READER,0644);
tie(%uwwarapaxa_rt_gen,GDBM_File,"$ARGV[0]/uwwarapaxa_rt_gen.gdbm",GDBM_READER,0644);
tie(%jAwi,GDBM_File,"$ARGV[0]/jAwi.gdbm",GDBM_READER,0644);

#print "ARGV = ", $ARGV[0]," ",$ARGV[1],"\n";
if($ARGV[1] eq "D") { $DEBUG = 1;} else {$DEBUG = 0;}

require "$ARGV[0]/sandhi.pl";

$pid = $$;
while($in=<STDIN>)
{
chomp($in);
#print "$in =>\n";
 $pattern = "";
 $pUrvapaxa = "";
 $uwwarapaxa = "";
 $tag = "";
 $rest = "";
 $cmpd_gen = "";
 $cmpd_vib = "";
 $cmpd_num = "";
# Grab the pattern <word1-word2>tag
 while($in =~ /(<([a-zA-Z;123\+\-]+\-)([a-zA-Z;123\+]+)>([A-Zd]+[A-Za-z]*[1-7]*))(.*)/)
 {
    $pattern = $1;
    $pUrvapaxa = $2;
    $uwwarapaxa = $3;
    $tag = $4;
    $rest = $5;

#If this pattern is from exceptional list, get its paraphrase from the exceptional list database.
# Replace the pattern by word1-word2, and proceed recursively.
    if($EXCP_EX{$pattern}) { 
       if($DEBUG)  {print "pattern = $pattern, $EXCP_EX{$pattern}\n";}
       print $EXCP_EX{$pattern},"\n"; 
       $in =~ s/$pattern/$pUrvapaxa-$uwwarapaxa/;
    } else {
#If it not from the exceptional list
#Then process the compound and get its paraphrase
       ($para,$sc_prefix,$sc_root,$scgen,$scnum,$tmp_cmpd_gen,$tmp_cmpd_vib,$cmpd_num) = 
        split(/,/,&process_compound($pattern,$pUrvapaxa,$uwwarapaxa,$tag,$rest,$pid,$cmpd_gen, $cmpd_vib));

# We need the gender and vibhakti of the compound for generating the
#correct form of the compound word at the end. Only the last word in
#the compound will have gender/vibh information. So we check whether the
#pattern is followed by a '-'.
#If not, then we assume that the given word is the final word, and we
#record its gender and vibhakti.

       if(($rest !~ /\-/) && ($cmpd_gen eq "")) {
          $cmpd_gen = $tmp_cmpd_gen; $cmpd_vib = $tmp_cmpd_vib;
       }

       print $para,"\n";
# After a paraphrase is generated, now we replace the <word1-word2>Tag pattern by
# word1-root,gen,num.  gen,num are the gen and num of the compound word thus 
# formed, which is a pUrvapaxa/uwwarapaxa for the next compound.
# We need the gender and number for correct generation of the paraphrase with 
# this compound word as one of the components.
# For example, in <<wapaH-svAXyAya>Di-nirawam>T7
# after the 1st round, <wapaH-svAXyAya>Di is replaced by wapa+svAXyAya,puM,2
# where puM is the gender of svAXyAya , and the combined word is to be 
# inflected in dual.
       $pattern =~ s/\+/\\\+/g;
       $pUrvapaxa =~ s/\-//;
       $pUrvapaxa =~ s/;.*//;
       if($sc_prefix ne "") { $sc_root = $sc_prefix."+".$sc_root;}
       $in =~ s/$pattern/$pUrvapaxa\+$sc_root;$scgen;$scnum/;
       if($DEBUG) { print "in = $in\n";}
    }
 }

 if($DEBUG) { print "cmpd_vib $cmpd_vib cmpd_gen $cmpd_gen  cmpd_num = $cmpd_num \n";}
 if($DEBUG) { print $pUrvapaxa,$uwwarapaxa,$sc_root,$sc_prefix,$tag,$cmpd_gen,$scgen;}

# If the final compound is either B or T, then we generate the form with the specified gen, num, vib.
# For example, <xaSaRaWa-puwrasya>T6  should generate at the end 
# xasaRaWapuwrasya and not xaSaraWa-puwraH as the final form.
# This is done at this stage.

#If the cmpd vib == 1 or if the cmpd_vib == 2 and the lifga = napum, we need not generate the form.

 if((($cmpd_vib != 1) || ($cmpd_num != 1))&& (($cmpd_vib != 2) || ($cmpd_gen ne "napuM")) && ($tag !~ /A/) && !$EXCP_EX{$pattern}){
   $word = &print_inflected_form($pUrvapaxa,$uwwarapaxa,$sc_root,$sc_prefix,$tag,$cmpd_gen,$scgen,$cmpd_num);
   print $word;
 }
#print "-----\n";
}

sub print_inflected_form {
 my($pUrvapaxa,$uwwarapaxa,$sc_root,$sc_prefix,$tag,$cmpd_gen,$scgen,$cmpd_num) = @_;
 my($level);
#Call generator and get the compound form
      if (($tag =~ /B/) && ($cmpd_gen ne $scgen)) { $level = 4;} else {$level = 1;}
# In case the gender of the second component does not match with the gender of 
# the complete compounded word, and if the tag is B, then it means, we 
# have to inform the generator that the word is to be formed by changing its 
# gender. This is done by declaring the 'level' as '4'.
      $cmpd_form = &gen($sc_root,$cmpd_gen,$cmpd_num,$cmpd_vib,$level,$pid);
      if($DEBUG) {print "cmpd_form = $cmpd_form\n";}

# If the generator fails to generate the correct form then copy the uwwarapaxa 
# as it is.
# If the correct form is generated, then add all other prefixes( words that are pUrvapaxas as a part of embeded compounds) etc.
      if($cmpd_form =~ /#/) { 
         $cmpd_form = $uwwarapaxa;
         $cmpd_form =~ s/;.*//;
         $cmpd_form = &get_sandhied_form($cmpd_form);
      }  else {
      if($sc_prefix) { $cmpd_form = $sc_prefix."+".$cmpd_form;}
      $cmpd_form = &get_sandhied_form($cmpd_form);
      if($DEBUG) {print "cmpd_form = $cmpd_form\n";}
      }

      if($DEBUG) { print "sc_form = $cmpd_form\n";}

# Join the words in the pUrvapadas by sandhi
     $pUrvapaxa =~ s/;.*//;
     $pUrvapaxa = &get_sandhied_form($pUrvapaxa);
     $pUrvapaxa =~ s/\-$//;

# Call a sandhi program to join the pUrvapaxa and uwwarapaxa words thus generated.
     $final_word = &do_sandhi($pUrvapaxa,$cmpd_form);
     $final_word =~ s/://;
     $final_word =~ s/,?:.*//g;

# The structure of the paraphrase has a pronoun. Generate correct form of this pronoun, that agrees in gender and vibh with the compounded form.

     $pron_features = $cmpd_gen.",".$cmpd_vib.",".$cmpd_num;
     $ans = $PRON{$pron_features}." ".$final_word."\n";
$ans;
}
1;

sub call_gen
{
my($word_gen,$pid) = @_;
my($genWrd,$GENWRD);

# This program just calls a generator and writes the o/p in a file.
system("/bin/echo '$word_gen' | /usr/bin/lt-proc -c -g $ARGV[0]/skt_samAsanoun_gen.bin > /tmp/gen_out$pid");

  open(GENWRD,"</tmp/gen_out$pid");
  $genWrd=<GENWRD>;
  $genWrd =~ s/\/.*//;
  chomp($genWrd);
  close(GENWRD);

$genWrd;
}
1;

sub get_sandhied_form{
 my($in) = @_;
 my($tmp,$f,$s);
# This program joins the two words viz. pUrvapaxa and uwwarapaxa together.
 while($in =~ /^([^\+]+)\+(.*)/){
  $f = $1;
  $s = $2;
  $tmp = &do_sandhi($1,$2);
  $tmp =~ s/://;
  $tmp =~s/,?:.*//g;
  $in  = $tmp;
 }
 $in;
}
1;

sub morph{
  my($wrd,$pid) = @_;
  my($ans,$vacanam,$viBakwiH); 

   $ans = "";
   $vacanam = 1;
   $viBakwiH = 1;
   system("/bin/echo $wrd | /usr/bin/lt-proc -c $ARGV[0]/skt_samAsanoun_morf.bin > /tmp/morph$pid");

   open(TMP,"</tmp/morph$pid") || die "Can't open /tmp/morph$pid for reading";
      $mrf = <TMP>;
   close(TMP);
      @mrf = split(/\//,$mrf);
      $found = 0;
      for($i = 1; $i <= $#mrf && !$found; $i++) # 0th item is the word, hence ignore
      {
       $mrf = $mrf[$i];
       if($DEBUG) { print "mrf = $mrf\n";}
       if($mrf  =~ /^([^<]+).*<lifgam:([^>]+)><viBakwiH:([^>]+)><vacanam:([^>]+)><level:4>/){
          $rt = $1;
          $lifgam = $2;
          $viBakwiH = $3;
          $vacanam = $4;
          $ans = $rt.",".$lifgam.",".$viBakwiH.",".$vacanam;
          $found = 1;
        } elsif($mrf  =~ /^([^<]+)<vargaH:sa\-pU\-pa><lifgam:([^>]+)>/){
            $rt = $1;
            $lifgam = $2;
            if($DEBUG) { print "mrf = $mrf\n";}
            if($DEBUG) { print "DICT{rt} = $DICT{$rt}\n";}
            if(($DICT{$rt} =~ /^$lifgam/) || ($DICT{$rt} =~ /#$lifgam/)) {  # Check whether the root is availble in apte's dict
               $ans = $rt.",".$lifgam.",".$viBakwiH.",".$vacanam;
               $found = 1;
            }
        }
  }
$ans =~ s/^#//;
$ans =~ s/#.*//;
if($DEBUG) {print "morph ans = $ans\n";}
$ans;
}
1;

sub morph_noun{
  my($wrd,$tag,$rest,$pid) = @_;
  my($ans,$rt,$lifgam,$viBakwiH,$vacanam,$mrf,@mrf,$level,$new_rt,$scgen,$found,$i); 

if($DEBUG) { print "Calling morph noun $wrd\n";}
   $ans = "";
   system("/bin/echo $wrd | /usr/bin/lt-proc -c $ARGV[0]/skt_samAsanoun_morf.bin > /tmp/morph$pid");

   open(TMP,"</tmp/morph$pid") || die "Can't open /tmp/morph$pid for reading";
      $mrf = <TMP>;
   close(TMP);
      @mrf = split(/\//,$mrf);
      $found = 0;
      for($i = 1; $i <= $#mrf && !$found; $i++) # 0th item is the word, hence ignore
      {
       $mrf = $mrf[$i];
       if($mrf  =~ /^([^<]+).*<lifgam:([^>]+)><viBakwiH:([^>]+)><vacanam:([^>]+)><level:(.)>/){
         if($DEBUG) { print "mrf = $mrf\n";}
          $rt = $1;
          $lifgam = $2;
          $viBakwiH = $3;
          $vacanam = $4;
          $level = $5;
          if($level != 4) {
             if($DEBUG) { print $DICT{$rt},"\n";}
            if(($DICT{$rt} =~ /^$lifgam/) || ($DICT{$rt} =~ /#$lifgam/)) {  # Check whether the root is availble in apte's dict
                if(($tag !~ /D/) || ($vacanam !~ /1/)){
                  $ans = $rt.",".$lifgam.",".$viBakwiH.",".$vacanam;
                  $found = 1;
                }
             }
          }
            elsif(($level == 4) && (($tag =~ /^B/) || (($rest !~ /\-/) && ($rest =~ />B/)))){
               ($new_rt,$scgen) = split(/,/,&morph_uwwarapaxa_rt_gen($rt));
                if($DEBUG) { print "new rt = $new_rt\n";}
               if($DICT{$new_rt}) {  # Check whether the root is availble in apte's dict
                  $ans = $rt.",".$lifgam.",".$viBakwiH.",".$vacanam;
                  $found = 1;
               }
          }
       }
    }
$ans =~ s/^#//;
$ans =~ s/#.*//;
if($DEBUG) {print "morph noun ans = $ans\n";}
$ans;
}
1;

sub morph_uwwarapaxa_rt_gen{
  my($wrd) = @_;
  my($ans,$rt,$mrf,@mrf,$lifgam,$i); 

if($DEBUG) { print "Calling morph uwwarapaxa rt gen $wrd\n";}
   $ans = "";
   system("/bin/echo $wrd | /usr/bin/lt-proc -c $ARGV[0]/skt_samAsanoun_morf.bin > /tmp/morph$pid");

   open(TMP,"</tmp/morph$pid") || die "Can't open /tmp/morph$pid for reading";
      $mrf = <TMP>;
   close(TMP);
      @mrf = split(/\//,$mrf);
      $found = 0;
      for($i = 1; $i <= $#mrf && !$found; $i++) # 0th item is the word, hence ignore
      {
       $mrf = $mrf[$i];
        if($DEBUG) { print "mrf = $mrf\n";}
        if($mrf  =~ /^([^<]+)<vargaH:sa\-u\-pa\-[^>]+><lifgam:([^>]+)>/){
           $rt = $1;
           $lifgam = $2;
           if($DEBUG) { print "rt = $rt, $DICT{$rt}\n";}
           if($DICT{$rt}) {  # Check whether the root is availble in apte's dict
              $ans = $rt.",".$lifgam;
              $found = 1;
           }
        }
     }
#print "ans = $ans\n";
$ans;
 }
1;

sub lcat {
my($rt) = @_;
my($lcat);

# This program returns the category of a noun.
# This is needed for correct generation.
$lcat = "nA";
if(($rt eq "sarva") || ($rt eq "pUrvA")|| ($rt eq "uwwarA") || ($rt eq "Bavaw")){ $lcat="sarva";}
elsif($NUM{$rt}) { $lcat = "saMKyeyam";}
$lcat;
}
1;

sub gen{

my($rt,$gen,$num,$vib,$level,$pid) = @_;
if($DEBUG) {print "calling gen with $rt $gen $num $vib \n";}
my($lcat,$word);

    $lcat = &lcat($rt);
    if($lcat eq "saMKyeyam") { 
       if(($rt ne "eka") && ($rt ne "xvi") && ($rt ne "wri" ) && ($rt ne "cawur")) { $gen = "a";}
# Special treatment for certain numbers
       if($rt eq "eka") { $num = 1;}
       elsif($rt eq "xvi") { $num = 2;}
       else { $num = 3;}
    }
    $word = "^".$rt."<vargaH:".$lcat."><lifgam:".$gen."><viBakwiH:".$vib."><vacanam:".$num."><level:$level>\$";
    if($DEBUG) {print "word = $word\n";}
    $word = &call_gen($word,$pid);
}
1;

sub do_sandhi{
my($f,$s) = @_;
if($DEBUG) { print "within do_sandhi\n";}
if($DEBUG) { print "f s = $f $s\n";}
# Following two lines take care of naF wawpuruRa, 
# where the negation is expressed as 'na' in the tagged compound, and in the o/p we need only 'a'.
if(($f eq "na") && ($s =~ /^[aAiIuUqQLeEoO]/)){ $f = "an";}
elsif(($f eq "na") && ($s !~ /^[aAiIuUqQLeEoO]/)){ $f = "a";}
#here also add condition for 'following svara'.
if($s =~ /^na\+/) { $s =~ s/^na\+/a\+/}

$f =~ s/#//;
$s =~ s/#//;
$t = &sandhi($f,$s);
if($DEBUG) { print "t = $t\n";}
$t;
}
1;

 sub process_compound{
  my ($pattern,$pUrvapaxa,$uwwarapaxa,$tag,$rest,$pid, $cmpd_gen,$cmpd_vib) = @_;
  my($fcvib,$scvib,$fcnum,$scnu,$para,$fc_root,$fcgen,$sc_root,$scgen,$num,$fc_prefix,$sc_prefix,$ans);

if($DEBUG) { print "within process compound\n";}
#Analysis Part
# Get the rule for generating paraphrase corresponding to a given tag
# fc: First Component; sc: Second Component
    ($fcvib,$scvib,$para,$fcnum,$scnum)=split(/,/,$PARA{$tag});
    if($DEBUG) {print "rule = $PARA{$tag}\n";}

    if($pUrvapaxa =~ /\-/) {
       @pUrvapaxa = split(/\-/,$pUrvapaxa);
       $fc_root_dvandva = "";
       foreach $tmp (@pUrvapaxa) {
# Get the root and gender of the pUrvapada 
         $tmp .= "-";
         ($fc_root,$fc_prefix,$fcgen,$fcnum) = split(/,/,&get_pUrvapaxa_analysis($tmp,$fcnum,$pid));
         if($DEBUG) {print "fc root fc prefix fcgen fcnum = $fc_root,$fc_prefix,$fcgen,$fcnum\n";}
         $fc_root_dvandva .= "-". $fc_root;
      }
         $fc_root_dvandva =~ s/^\-//;
         $fc_root = $fc_root_dvandva;
    } else {
       ($fc_root,$fc_prefix,$fcgen) = split(/,/,&get_pUrvapaxa_analysis($pUrvapaxa,$pid));
       if($DEBUG) {print "fc root fc prefix fcgen fcnum = $fc_root,$fc_prefix,$fcgen,$fcnum\n";}
    }

# Get the morph analysis of the uttarapada.
#Save the gender of the compound for future use. The gender of the compound may be different from the default gender of the uttarapada, and hence this gender needs to be saved for generating the paraphrase, in case of (especially) bahuvrihi properly.
    ($sc_root,$sc_prefix,$scgen,$tmp_cmpd_gen,$tmp_cmpd_vib,$cmpd_num) = split(/,/,&get_uwwarapaxa_analysis($uwwarapaxa,$rest,$tag,$pid));
    if(($rest !~ /\-/) && ($cmpd_gen eq "")) { $cmpd_gen = $tmp_cmpd_gen; $cmpd_vib = $tmp_cmpd_vib;}
    
         if($DEBUG) { print "fcgen  scgen  fcroot = $fcgen, $scgen $fc_root\n";}
#Transformations needed
         if(($tag =~/K[1-7]/)||($tag =~ /Bs[2-7]/) || ($tag =~ /A5/)){
             if(($scgen eq "swrI") && (($fcgen eq "puM") || ($fcgen eq "napuM"))) {
#In case of certain compounds, the viSeRaNa acquires the gender of the viSeRya. In such cases, if the resulting gender is feminine, even the stem undergoes changes.
                 if($FEM{$fc_root}) {$fc_root = $FEM{$fc_root};}
  }
             $fcgen = $scgen;
         }
         if($DEBUG) { print "fcgen  scgen  fcroot= $fcgen, $scgen $fc_root\n";}
         if($tag =~ /Bsd/) { if($FEM{$fc_root}) {$fc_root = $FEM{$fc_root}; $fcgen = "swrI";}}

      if($fcgen eq "") { $fcgen = $scgen;}

#Paraphrase Generation
#For generation, we need cat, gender, num and Vib.

      #if($pUrvapaxa =~ /\-/)
      if($tag =~ /D/) {
         @pUrvapaxa = split(/\-/,$pUrvapaxa);
         @fc_root = split(/\-/,$fc_root);
         if($DEBUG && ($#pUrvapaxa != $#fc_root)) { 
	    print "Mismatch in pUrvapaxa and fc_root data= $pUrvapaxa fc_root = $fc_root\n";
         } 
         $word1_dvandva = "";
         for ($i = 0; $i <= $#pUrvapaxa; $i++){
            $tmp = $pUrvapaxa[$i]."-";
            $word1 = &generate_first_word_form($tmp,$tag,$fc_root[$i],$fcgen,$fcnum,$fcvib,$fc_prefix,$pid);
            $word1_dvandva .= "-".$word1;
         }
         $word1 = $word1_dvandva;
         $word1 =~ s/^\-//;
         $word1 =~ s/\-/ ca /g;
       } else { 
	 $word1 = &generate_first_word_form($pUrvapaxa,$tag,$fc_root,$fcgen,$fcnum,$fcvib,$fc_prefix,$pid);
       }
      #print "tag = $tag cmpd_num = $cmpd_num scnum = $scnum no = $#pUrvapaxa\n";
#EX: <baka-kAkO>Di Vs <baka-kAkAH>Di
#<baka-kAkO>Di ==> bakaH ca kAkaH ca bakakAkO
#<baka-kAkAH>Di ==> bakaH ca kAkAH ca bakakAkAH
      if(($tag =~ /D/) && ($cmpd_num == 3) && ($#pUrvapaxa == 0)) {
        $word2 = &generate_second_word_form($uwwarapaxa,$tag,$sc_root,$scgen,$cmpd_num,$scvib,$sc_prefix,$pid);
      } else {
      $word2 = &generate_second_word_form($uwwarapaxa,$tag,$sc_root,$scgen,$scnum,$scvib,$sc_prefix,$pid);
      }

     $para =~ s/word1/$word1/;
     $para =~ s/word2/$word2/;

     if($DEBUG) {print "para = $para\n";}
     $para = &modify_pron($para,$cmpd_gen,$tag,$scgen);

     if($para eq "") { $ans = "&lt;".$word1.$word2."&gt;".$tag." = ";}
     else { $ans =  $para." = ";}

     if($DEBUG) { print "ans = $ans\n";}

   #  if($tag =~ /D/) { 
        #if($pUrvapaxa =~ /\-.*\-/) { 
        #   $scnum = 3; 
        #} else { 
        #   if($jAwi{$sc_root}) {  $scnum = 3; } else {$scnum = 2; }
        #}
   #  }
     if($tag !~ /D/) { 
        $word = &generate_compound_word_form($pUrvapaxa,$uwwarapaxa,$sc_root,$sc_prefix,$scgen,$cmpd_gen,1,$tag,$pid);
     } else { 
        $word = &generate_compound_word_form($pUrvapaxa,$uwwarapaxa,$sc_root,$sc_prefix,$scgen,$cmpd_gen,$cmpd_num,$tag,$pid);
     }
     if($DEBUG) { print "generated word = $word\n";}

     $ans .= $word.",".$sc_prefix.",".$sc_root.",".$scgen.",".$scnum.",".$cmpd_gen.",".$cmpd_vib.",".$cmpd_num;
if($DEBUG){ print "Within process compound $ans,\n";}
$ans;
 }
1;

sub get_pUrvapaxa_analysis{
  my($pUrvapaxa,$fcnum,$pid) = @_;
  my($fc_root,$fcgen,$num,$fc_prefix,$morph_ans);

  if($DEBUG) { print "Within get_pUrvapaxa_analysis\n";}

      if($DEBUG) { print "pUrvapaxa = $pUrvapaxa\n";}
      if($pUrvapaxa =~ /;/) {# combined from earlier compound
         $pUrvapaxa =~ s/\-$//;
         if($DEBUG) { print "pUrvapaxa = $pUrvapaxa\n";}
           ($fc_root,$fcgen,$num) = split(/;/,$pUrvapaxa);
            $fc_root =~ /(.*)\+([^\+]+)/;
            $fc_prefix = $1;
            $fc_root = $2;
            if(($num ne "") && ($num ne $fcnum)){$fcnum = $num;}
         } elsif($pUrvapaxa !~ /;/) {
 	   $tmp = $pUrvapaxa_rt_gen{$pUrvapaxa};
           if($tmp ne "") {
             ($fc_root,$fcgen) = split(/,/,$tmp);
           } else { 
           $morph_ans = &morph($pUrvapaxa,$pid);
           if($DEBUG) { print "morph_ans = $morph_ans\n";}
           ($fc_root,$fcgen) = split(/,/,$morph_ans);
            $fc_prefix = "";
          }
        }
     if($DEBUG) {print "FC $fc_root,$fcgen\n";}
  $ans = $fc_root.",".$fc_prefix.",".$fcgen.",".$fcnum;
$ans;
}
1;

sub get_uwwarapaxa_analysis{
  my($uwwarapaxa,$rest,$tag,$pid) =@_;
  my($sc_root,$sc_prefix,$scgen,$cmpd_gen,$cmpd_vib,$cmpd_num,$ans);
  $cmpd_num = 1;
 if($DEBUG) { print "within get uwwarapaxa_analysis $uwwarapaxa $rest $tag $pid\n";}
     if($DEBUG) { print "uwwarapaxa = $uwwarapaxa\n";}

     if($uwwarapaxa =~ /;/) {
          ($sc_root,$scgen) = split(/;/,$uwwarapaxa);
          $sc_root =~ /(.*)\+([^\+]+)/;
          $sc_prefix = $1;
          $sc_root = $2;
    } elsif($uwwarapaxa !~ /;/) {
       if($rest =~ /\-/) {
 # If more words exist, this is not the uwwarapaxa of the big compound. It is intermidiate one and hence pUrvapaxa of the following word.
          $uwwarapaxa .= "-";
 	  $tmp = $pUrvapaxa_rt_gen{$pUrvapaxa};
          if($tmp ne "") {
            ($sc_root,$scgen) = split(/,/,$tmp);
          } else { 
            ($sc_root,$cmpd_gen,$cmpd_vib,$cmpd_num) = split(/,/,&morph($uwwarapaxa,$pid));
            $scgen = $cmpd_gen;
            $sc_prefix = "";
         }
       } else {
 	  $tmp = $uwwarapaxa_rt_gen{$uwwarapaxa};
          #print "tmp = $tmp\n";
          if($tmp ne "") {
            ($sc_root,$scgen) = split(/,/,$tmp);
          } else { 
            ($sc_root,$cmpd_gen,$cmpd_vib,$cmpd_num) = split(/,/,&morph_noun($uwwarapaxa,$tag,$rest,$pid));
            if($DEBUG) { print "sc_root cmpd_gen cmpd_vib = $sc_root,$cmpd_gen,$cmpd_vib\n";}
            $scgen = $cmpd_gen;
            if($DEBUG) { print "dict sc_root = $DICT{$sc_root}\n";}
            #if(($tag =~ /B/) && ($DICT{$sc_root} !~ /.*#.*#/)) {
            if(($tag =~ /B/) && ($DICT{$sc_root} eq "")) {
              ($sc_root,$scgen) = split(/,/,&morph_uwwarapaxa_rt_gen($sc_root));
            }
            else { 
               $scgen = $DICT{$sc_root};
               $scgen =~ s/#.*//;
            }
        }
      }
   }
     if($DEBUG) {print "SC $sc_root,$cmpd_gen,$scgen\n";}
   $ans = $sc_root.",".$sc_prefix.",".$scgen.",".$cmpd_gen.",".$cmpd_vib.",".$cmpd_num;
$ans;
}
1;

sub generate_first_word_form{
  my ($pUrvapaxa,$tag,$fc_root,$fcgen,$fcnum,$fcvib,$fc_prefix,$pid) = @_;
  my($word1);

       if($DEBUG) { print "Within generate_first_word_form\n";}
       if($DEBUG) { print $pUrvapaxa,$tag,$fc_root,$fcgen,$fcnum,$fcvib,$fc_prefix,$pid,"\n";}
        if($tag=~/A1/){
          if($pUrvapaxa =~ /^aXi\-/){
             $word1 = "iwi";
          }elsif($pUrvapaxa =~ /^upa\-|^aBi\-/){
             $word1 = "samIpam";
          }elsif($pUrvapaxa =~ /^anu\-/){
             $word1 = "yogyam paScAw Anupurvyam vA";
	  }elsif($pUrvapaxa =~ /^awi\-/){
              $word1 = "AXikyam";
          }elsif($pUrvapaxa =~ /^yaWA\-/){
              $word1 = "anusqwya anawikramya vA";
          }
        } else {$word1 = &gen($fc_root,$fcgen,$fcnum,$fcvib,1,$pid);}

        if($DEBUG) {print "word1 = $word1\n";}
# Add all the prefixes.
      if($word1 =~ /#/) { 
         $word1 = $pUrvapaxa;
         $word1 =~ s/\-//;
         $word1 =~ s/;.*//;
      } else {
        if($fc_prefix ne "") { $word1 = $fc_prefix . "+" . $word1;}
      }
         $word1 = &get_sandhied_form($word1);
        if($DEBUG) {print "fc_form = $word1\n";}
$word1;
}
1;

sub generate_second_word_form{
  my($uwwarapaxa,$tag,$sc_root,$scgen,$scnum,$scvib,$sc_prefix,$pid) = @_;
  my($word1);

  if($DEBUG) { print $uwwarapaxa,$tag,$sc_root,$scgen,$scnum,$scvib,$sc_prefix,$pid,"\n";}

  if($tag =~ /Bsd/) { 
     if($FEM{$sc_root}) {
        $sc_root = $FEM{$sc_root}; 
        $scgen = "swrI";
     }
  }
  $word2 = &gen($sc_root,$scgen,$scnum,$scvib,1,$pid);
  if($DEBUG) {print "Word2 = $word2\n";}
  if($word2 =~ /#/) { 
     $word2 = $uwwarapaxa;
     $word2 =~ s/;.*//;
  }elsif($sc_prefix ne "") { 
     $word2 = $sc_prefix . "+" . $word2;
  }
  $word2 = &get_sandhied_form($word2);
  if($DEBUG) { print "sc_form = $word2\n";}
$word2;
}
1;

sub modify_pron{
   my($para,$cmpd_gen,$tag,$scgen) = @_;
   if($DEBUG) { print "within Modify_pron\n";}
   if($DEBUG) { print "$para $cmpd_gen $tag $scgen\n";}

# This program modifies the pronoun according to the gender of the compound and the compound type.
     if($tag =~ /Bs/) {
        $key = $cmpd_gen.",".$tag;
        $pron = $BAHU{$key};
        $para =~ s/ yaw/ $pron/;
     }
     if($tag =~ /K1/) {
        if($scgen eq "puM") {
           $para =~ s/ waw/ saH/;
        }
        if($scgen eq "swrI") {
           $para =~ s/ waw/ sA/;
        }
     }
$para;
}
1;

sub generate_compound_word_form{
my($pUrvapaxa,$uwwarapaxa,$sc_root,$sc_prefix,$scgen,$cmpd_gen,$scnum,$tag,$pid) = @_;
my($gen,$level,$tmp1,$tmp2,$word, @pUrvapaxa);

if($DEBUG) { print "within generate_compound_word_form\n";}
if($DEBUG) { print "$pUrvapaxa,$uwwarapaxa,$sc_root,$sc_prefix,$scgen,$cmpd_gen,$scnum,$tag,$pid\n";}

     @pUrvapaxas = split(/\-/,$pUrvapaxa);
     if(($tag =~ /D/)  && ($pUrvapaxa =~ /\-.*\-/)) { 
           $tmp = $pUrvapaxas[0];
           for($i=1;$i<=$#pUrvapaxas; $i++){
              $tmp = &do_sandhi($tmp,$pUrvapaxas[$i]);
              $tmp =~ s/://;
              $tmp =~ s/,?:.*//g;
           }
           $pUrvapaxa = $tmp;
           $pUrvapaxa =~ s/://;
           $pUrvapaxa =~ s/,?:.*//g;
     }
     if (($tag =~ /B/) && ($cmpd_gen ne $scgen)) { 
          $level = 4; 
          $gen = $cmpd_gen;
     } else {$level = 1; $gen = $scgen;}

     if(($tag =~ /D/) && ($scnum == 1) && ($#pUrvapaxas == 0)) { $scnum = 2;}
     if(($tag =~ /D/) && ($scnum == 1) && ($#pUrvapaxas == 1)) { $scnum = 3;}
     if($tag =~ /^A/) { $tmp2 = $uwwarapaxa; $tmp2 =~ s/,.*//;} 
     else {$tmp2 = &gen($sc_root,$gen,$scnum,1,$level,$pid);}
    
     if($DEBUG) { print "tmp2 = $tmp2\n";}

     if($tmp2 =~ /#/) { 
         $tmp2 = $uwwarapaxa;
         $tmp2 =~ s/;.*//;
         $tmp2 = &get_sandhied_form($tmp2);
     } elsif($sc_prefix ne "") { 
         $tmp2 = $sc_prefix . "+" . $tmp2;
     }
     $tmp2 = &get_sandhied_form($tmp2);

     if($DEBUG) { print "pUrvapaxa = $pUrvapaxa tmp2 = $tmp2\n";}
     $tmp1 = $pUrvapaxa;
     $tmp1 =~ s/;.*//;
     $tmp1 = &get_sandhied_form($tmp1);
     $tmp1 =~ s/\-$//;

     if($DEBUG) { print "tmp1 = $tmp1 tmp2 = $tmp2\n";}
     $word = &do_sandhi($tmp1,$tmp2);
     $word =~ s/://;
     $word =~ s/,?:.*//g;
if($DEBUG) { print "generated compound form = $word\n";}
$word;
}
1;
