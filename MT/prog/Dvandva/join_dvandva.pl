#!/usr/bin/perl

open (TMP,"<dvandva_list.txt") || die "dvandva_list.txt not found";
while($in = <TMP>) {
 chomp($in);
 $COMPOUND{$in} = 1;
}
close(TMP);

$index_pos = 0;
$word_pos = 1;
$morph_pos = 3;

$hold = "";
$compound_word[0] = "";
$compound_word[1] = "";
$compound_word[2] = "";
$compound_word[3] = "";
$compound_word[4] = "";
$compound_word[5] = "";
$compound_word[6] = "";
$compound_word[7] = "";
$compound_word[8] = ""; # Assuming that max components in a compound = 9

$hold[0] = "";
$hold[1] = "";
$hold[2] = "";
$hold[3] = "";
$hold[4] = "";
$hold[5] = "";
$hold[6] = "";
$hold[7] = "";
$hold[8] = "";

while($in = <STDIN>){
 @flds = split(/\t/,$in);
 if ($flds[$word_pos] =~ /\-/) {
    $pratipadikam = $flds[$morph_pos];
    $pratipadikam =~ s/<.*//;
    $flds[$index_pos] =~ /\.([1-9])/;
    $idx = $1;
    $in[$idx] = $in;
     if($idx == 1) { $sandhied_word = $flds[2];}
    $not_found = 1;
    for ($j=1;$j<=$idx && $not_found;$j++) {
       $hold[$j] .= $in;
       if ($compound_word[$j] ne "") 
         { $compound_word[$j] .= "-".$pratipadikam;}
       else { $compound_word[$j] = $pratipadikam;}
       if ($COMPOUND{$compound_word[$j]} == 1) {
	 for(my $k=1;$k<$j;$k++){
             print $in[$k];
         }
         my $ans = &join_purvapadas($hold[$j],$j,$sandhied_word);
         print $ans,"\n";
         $not_found = 0;
       }
    }
  } else { 
     if ($not_found) { print $hold[1]; $not_found = 0; }
     print $in;
  }
}

sub join_purvapadas {
  my($input,$start_pos,$sandhied_word) = @_;
  my @compound_ana = split(/\n/,$input); 
  my $tot_wrds = $#compound_ana;
  my $i;
  my $purvapada = "";

  for ($i = 0; $i < $tot_wrds; $i++) {
    @flds = split(/\t/,$compound_ana[$i]);
    if ($purvapada ne "") 
       { $purvapada .= "-".$flds[$word_pos];}
    else { $purvapada = $flds[$word_pos];}
  }
  @flds = split(/\t/, $compound_ana[$tot_wrds]);
  $flds[0]=~ s/\..*/.$start_pos/;
  $flds[1] = $purvapada.$flds[1];
  $flds[3] =~ s/\//\/$purvapada/g;
  $flds[3] =~ s/^/$purvapada/g;
  $flds[4] =~ s/\//\/$purvapada/g;
  $flds[4] =~ s/^/$purvapada/g;
  $flds[5] =~ s/\//\/$purvapada/g;
  $flds[5] =~ s/^/$purvapada/g;
  if($start_pos == 1) {$flds[2] = $sandhied_word;}
  my $ans = join("\t",@flds);
  $ans;
} 
