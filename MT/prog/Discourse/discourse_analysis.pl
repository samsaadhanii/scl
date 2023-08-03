#!/usr/bin/perl

$sent_id = $ARGV[0];  # Current sentence id
$out_encoding = $ARGV[1];
$para_anal_fl = $ARGV[2];
$sent_anal_fl = $ARGV[3];

$tab = "	";
$wrd_fld_id = 1; #counted from 0
$karaka_rel_fld = 6; #counted from 0
$color_code_fld = 8; #counted from 0
$morph_fld = 5; #counted from 0

$discourse_connective1 = "";
$niwya_connective1 = "";
$niwya_connective1_pos = -1;
$last_verb_indx = -1;

if($sent_id > 1) {
 ($discourse_connective1,$niwya_connective1,$niwya_connective1_pos,$last_verb_indx) = split(/#/,&read_and_print_first_file($para_anal_fl,$sent_id,$color_code_fld));
}

($samuccaya_xyowakaH_indx,$anyawara_xyowakaH_indx,$discourse_connective2,$niwya_connective2,$niwya_connective2_pos,$verb_indx) = 
   split(/#/,&read_second_file($sent_id,$sent_anal_fl,$color_code_fld,$wrd_fld_id));
   &mark_discourse_rels($sent_anal_fl,$sent_id,$wrd_fld_id, $color_code_fld, $karaka_rel_fld, $samuccaya_xyowakaH_indx, $anyatara_xyowakaH_indx, $discourse_connective2, $niwya_connective2, $niwya_connective2_pos, $verb_indx, $discourse_connective1, $niwya_connective1, $niwya_connective1_pos, $last_verb_indx,$tab);


sub read_and_print_first_file {
  my($fl_nm,$sent_id,$color_code_fld) = @_;

  my($in,$indx,@flds,$niwya_connective1_pos,$niwya_connective1,$last_verb_indx);
  $last_verb_indx = -1;
  $discourse_connective1 = "";
  $niwya_connective1 = "";
  $niwya_connective1_pos = -1;

  $sent_id--;	# search for the verb index of the previous sentence

  open (TMP1,"<$fl_nm");

  while($in = <TMP1>){
   @flds = split(/\t/,$in);
   $flds[0] =~ /^([0-9\.]+)/;
   $indx = $1;
   if($flds[0] =~ /^$sent_id\./) {
      if($flds[$color_code_fld] eq "KP") { $last_verb_indx = $indx;}
      else { 
         if ($flds[$karaka_rel_fld] =~ /^(कारण|कार्य|आवश्यकता|परिणाम)_द्योतकः,([0-9\.]+)/) {
             $last_verb_indx = $indx;
         }
         elsif ($flds[$karaka_rel_fld] =~ /^(kāraṇa|kārya|āvaśyakatā|pariṇāma)_dyotakaḥ,([0-9\.]+)/) {
             $last_verb_indx = $indx;
         }
	 elsif (($flds[$morph_fld] =~ /(क्त|क्तवतु)/) && ($flds[$color_code_fld] eq "N1")){ 
             $last_verb_indx = $indx;
         }
      }
   }
   if (&member_discourse_connective1($flds[$wrd_fld_id])) {
       $discourse_connective1 = $flds[$wrd_fld_id];
       $flds[$karaka_rel_fld] =~ /,([0-9\.]+)/;
       $last_verb_indx = $1;
   }
   if (&member_niwya_connective1($flds[$wrd_fld_id])) {
       $niwya_connective1_pos = $indx;
       $niwya_connective1 = $flds[$wrd_fld_id];
   }
 print $in;
 }
 close ($TMP1);
join ('#', $discourse_connective1,$niwya_connective1,$niwya_connective1_pos,$last_verb_indx);
}
1;

sub read_second_file {
 my($sent_id,$sent_anal_fl,$color_code_fld,$wrd_fld_id) = @_;

 my($in,$wrd_id,$indx,$samuccaya_xyowakaH_indx,$anyawara_xyowakaH_indx,$discourse_connective2,$niwya_connective2,$niwya_connective2_pos,$verb_indx); 
 $discourse_connective2 = "";
 $niwya_connective2 = "";
 $niwya_connective2_pos = -1;
 $anyawara_xyowakaH_indx = -1;
 $samuccaya_xyowakaH_indx = -1;
 $verb_indx = -1;

 open (TMP1,"<$sent_anal_fl");

 $in = <TMP1>;  # print title if it is the 1st file. Ignore the titles of the subsequent files
 if($sent_id == 1) { print $in; }

 while($in = <TMP1>){
   @flds = split(/\t/,$in);
   $flds[0] =~ /^([0-9\.]+)/;
   $indx = $1;
   $flds[0] =~ /^([0-9]+)/;
   $wrd_id = $1;
   if (&member_discourse_connective2($flds[$wrd_fld_id])) {
       $discourse_connective2 = $flds[$wrd_fld_id];
       $flds[$karaka_rel_fld] =~ /,([0-9\.]+)/;
       $verb_indx = $1;
   }
   elsif (&member_niwya_connective2($flds[$wrd_fld_id])) {
       $niwya_connective2_pos = $indx;
       $niwya_connective2 = $flds[$wrd_fld_id];
   }
   elsif($wrd_id == 2) {
      if ( ($flds[$wrd_fld_id] eq "च") || ($flds[$wrd_fld_id] eq "ca")) { $samuccaya_xyowakaH_indx = $indx;}
      elsif ( ($flds[$wrd_fld_id] eq "अपि") || ($flds[$wrd_fld_id] eq "api")) { $samuccaya_xyowakaH_indx = $indx;}
      elsif ( ($flds[$wrd_fld_id] eq "वा") || ($flds[$wrd_fld_id] eq "vāā")) { $anyawara_xyowakaH_indx = $indx;}
   }
   if($flds[$color_code_fld] eq "KP") { $verb_indx = $indx;}
   else { 
      if ($flds[$karaka_rel_fld] =~ /^(कारण|कार्य|आवश्यकता|परिणाम)_द्योतकः,([0-9\.]+)/) {
          $verb_indx = $indx;
      }
      elsif ($flds[$karaka_rel_fld] =~ /^(kāraṇa|kārya|āvaśyakatā|pariṇāma)_dyotakaḥ,([0-9\.]+)/) {
          $verb_indx = $indx;
      }
      elsif (($flds[$morph_fld] =~ /(क्त|क्तवतु)/) && ($flds[$color_code_fld] eq "N1")){ 
          $verb_indx = $indx;
      }
   }
 }
 close(TMP1);

join('#',$samuccaya_xyowakaH_indx,$anyawara_xyowakaH_indx,$discourse_connective2,$niwya_connective2,$niwya_connective2_pos,$verb_indx);
}
1;

sub mark_discourse_rels {
  my($sent_anal_fl, $sent_id,$wrd_fld_id, $color_code_fld, $karaka_rel_fld, $samuccaya_xyowakaH_indx, $anyatara_xyowakaH_indx, $discourse_connective2, $niwya_connective1, $niwya_connective2_pos,$verb_indx, $discourse_connective1, $niwya_connective1, $niwya_connective1_pos,$last_verb_indx,$tab) = @_;

 my($wrd_id, @flds );

print "LVI = $last_verb_indx\n";
print "VI = $verb_indx\n";
 open (TMP1,"<$sent_anal_fl");

  $in = <TMP1>; # ignore the title

  while($in = <TMP1>) {
  chomp($in);
  if($in) {
   $in =~ /^([0-9]+)/;
   $wrd_id = $1;
   $in =~ s/^/$sent_id./;
   $in =~ s/,([0-9\.]+)/,$sent_id.$1/g;
   @flds = split(/\t/,$in);

   if($discourse_connective2 ne "") {
      if ($flds[0] =~ /^$sent_id.$verb_indx/) {
         $rel = &get_rel($discourse_connective2);
         $flds[$karaka_rel_fld] = "$rel,$last_verb_indx";
      }
      $in = join("$tab",@flds);
   }
   elsif($discourse_connective1 ne "") {
      if ($flds[0] =~ /^$sent_id.$verb_indx/) {
         $rel = &get_rel($discourse_connective1);
         $flds[$karaka_rel_fld] = "$rel,$last_verb_indx";
      }
      $in = join("$tab",@flds);
   }
   elsif (($niwya_connective1_pos > -1) && ($niwya_connective2_pos > -1)) {
         if (($flds[0] =~ /^$sent_id.$niwya_connective2_pos/) && (&pair($niwya_connective1,$niwya_connective2))) {
            if($out_encoding eq "IAST") { 
               $flds[$karaka_rel_fld] .= ";nitya_sambandhaḥ,$niwya_connective1_pos";
            } else {
               $flds[$karaka_rel_fld] .= ";नित्य_सम्बन्धः,$niwya_connective1_pos";
            }
         }
      $in = join("$tab",@flds);
   }
   else {
     if (($wrd_id == 2) && (($flds[$wrd_fld_id] eq "च") || ($flds[$wrd_fld_id] eq "ca"))){
      if($out_encoding eq "IAST") { 
         $flds[$karaka_rel_fld] = "samuccaya_dyotakaḥ,$sent_id.$verb_indx";
      } else {
         $flds[$karaka_rel_fld] = "समुच्चय_द्योतकः,$sent_id.$verb_indx";
      }
      $in = join("$tab",@flds);
     }
     if (($wrd_id == 2) && (($flds[$wrd_fld_id] eq "वा") || ($flds[$wrd_fld_id] eq "vā"))){
      if($out_encoding eq "IAST") { 
         $flds[$karaka_rel_fld] = "anyatara_dyotakaḥ,$sent_id.$verb_indx";
      } else {
         $flds[$karaka_rel_fld] = "अन्यतर_द्योतकः,$sent_id.$verb_indx";
      }
      $in = join("$tab",@flds);
     }
     if (($samuccaya_xyowakaH_indx > -1) && ($flds[0] =~ /^$sent_id.$verb_indx/)) { 
      if($out_encoding eq "IAST") { 
         $flds[$karaka_rel_fld] = "samuccitaḥ,$last_verb_indx";
      } else {
         $flds[$karaka_rel_fld] = "समुच्चितः,$last_verb_indx";
      }
         $in = join("$tab",@flds);
     }
     if (($anyawara_xyowakaH_indx > -1) && ($flds[0] =~ /^$sent_id.$verb_indx/)) { 
      if($out_encoding eq "IAST") { 
         $flds[$karaka_rel_fld] = "anyataraḥ,$last_verb_indx";
      } else {
         $flds[$karaka_rel_fld] = "अन्यतरः,$last_verb_indx";
      }
         $in = join("$tab",@flds);
     }
   }
  }
   print $in, "\n";
 }
 close (TMP1);
}
1;


sub member_discourse_connective1 {

my($fld) = @_;

my ($word) = "";
 if (($fld eq "यदि") || 
     ($fld eq "यद्यपि") ||
     ($fld eq "अथापि") || 
     ($fld eq "यतः") || 
     ($fld eq "yadi")  ||
     ($fld eq "yadyapi") ||
     ($fld eq "athāpi") ||
     ($fld eq "yataḥ")) {
   $word = $fld;
 }
 $word;
}
1;

sub member_discourse_connective2 {

my($fld) = @_;

my ($word) = "";
 if (($fld eq "तर्हि") || 
     ($fld eq "तथापि") ||
     ($fld eq "चेदपि") || 
     ($fld eq "सन्नपि") || 
     ($fld eq "तर्ह्यपि") || 
     ($fld eq "ततः") || 
     ($fld eq "तस्मात्") || 
     ($fld eq "अतः") || 
     ($fld eq "tarhi")  ||
     ($fld eq "tathāpi") ||
     ($fld eq "cedapi") ||
     ($fld eq "sannapi") ||
     ($fld eq "tarhyapi") ||
     ($fld eq "tataḥ") ||
     ($fld eq "ataḥ")) {
      $word = $fld;
  }
 $word;
}
1;

sub get_rel{

my ($discourse_connective) = @_;

my ($rel);
$rel = "";

if ($discourse_connective eq "yadi") { $rel = "āvaśyakatā-pariṇāma-sambandhaḥ";}
elsif ($discourse_connective eq "यदि") { $rel = "आवश्यकता-परिणाम-सम्बन्धः";}
elsif ($discourse_connective eq "तर्हि") { $rel = "आवश्यकता-परिणाम-सम्बन्धः";}
elsif ($discourse_connective eq "tarhi") { $rel = "āvaśyakatā-pariṇāma-sambandhaḥ";}
elsif ($discourse_connective eq "यद्यपि") { $rel = "व्यभिचारः";}
elsif ($discourse_connective eq "yaxyapi") { $rel = "vyabhicāraḥ";}
elsif ($discourse_connective eq "तर्ह्यपि") { $rel = "व्यभिचारः";}
elsif ($discourse_connective eq "tarhyapi") { $rel = "vyabhicāraḥ";}
elsif ($discourse_connective eq "अथापि") { $rel = "व्यभिचारः";}
elsif ($discourse_connective eq "athāpi") { $rel = "vyabhicāraḥ";}
elsif ($discourse_connective eq "तथापि") { $rel = "व्यभिचारः";}
elsif ($discourse_connective eq "tathāpi") { $rel = "vyabhicāraḥ";}
elsif ($discourse_connective eq "सन्नपि") { $rel = "व्यभिचारः";}
elsif ($discourse_connective eq "sannapi") { $rel = "vyabhicāraḥ";}
elsif ($discourse_connective eq "चेदपि") { $rel = "व्यभिचारः";}
elsif ($discourse_connective eq "cedapi") { $rel = "vyabhicāraḥ";}
elsif ($discourse_connective eq "यतः") { $rel = "कार्य-कारण-भावः";}
elsif ($discourse_connective eq "ततः") { $rel = "कार्य-कारण-भावः";}
elsif ($discourse_connective eq "तस्मात्") { $rel = "कार्य-कारण-भावः";}
elsif ($discourse_connective eq "अतः") { $rel = "कार्य-कारण-भावः";}
elsif ($discourse_connective eq "yataḥ") { $rel = "kārya-kāraṇa-bhāvaḥ";}
elsif ($discourse_connective eq "ataḥ") { $rel = "kārya-kāraṇa-bhāvaḥ";}
elsif ($discourse_connective eq "tataḥ") { $rel = "kārya-kāraṇa-bhāvaḥ";}

$rel;
}
1;

sub member_niwya_connective1 {

my($fld) = @_;

my ($word) = "";
 if (($fld eq "यदा") || 
     ($fld eq "यथा") ||
     ($fld eq "यद्वत्") ||
     ($fld eq "यत्र") || 
     ($fld eq "yadā") ||
     ($fld eq "yathā") ||
     ($fld eq "yadvat") ||
     ($fld eq "yatra")) {
   $word = $fld;
 }
 $word;
}
1;

sub member_niwya_connective2 {

my($fld) = @_;

my ($word) = "";
 if (($fld eq "तदा") || 
     ($fld eq "तथा") ||
     ($fld eq "तद्वत्") ||
     ($fld eq "तत्र") || 
     ($fld eq "tadā") ||
     ($fld eq "tathā") ||
     ($fld eq "tadvat") ||
     ($fld eq "tatra")) {
   $word = $fld;
 }
 $word;
}
1;

sub pair {
my($c1, $c2) = @_;

 if ((($c2 eq "तदा") && ($c1 eq "यदा")) || 
     (($c2 eq "तथा")  && ($c1 eq "यथा")) ||
     (($c2 eq "तद्वत्")  && ($c1 eq "यद्वत्")) ||
     (($c2 eq "तत्र")  && ($c1 eq "यत्र")) || 
     (($c2 eq "tadā") && ($c1 eq "yadā")) ||
     (($c2 eq "tathā") &&  ($c1 eq "yathā")) ||
     (($c2 eq "tadvat") &&  ($c1 eq "yadvat")) ||
     (($c2 eq "tatra") && ($c1 eq "yatra"))) {
  return 1;
} else { return 0;}
}
1;
 
