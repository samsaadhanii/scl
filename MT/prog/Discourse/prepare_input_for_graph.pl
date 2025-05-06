#!/usr/bin/perl

$file = $ARGV[0];
open(TMP,$file);
while($in = <TMP>) {
      @flds = split(/ /,$in);
      $key = "\@S".$flds[0].".".$flds[1].".".$flds[2];
      $value = $flds[3].",\@S".$flds[4].".".$flds[5].".".$flds[6];
      $DISCOURSE{$key} = $value;
}

print "\n";
while($in = <STDIN>){

 my ($rels);
 $rels = "";
 if($in =~ /\(sid ([0-9]+)/) { $sid = $1;}
 if($in =~ /\(id ([0-9]+)/) { $id = $1;}
 if($in =~ /\(cid ([0-9]+)/) { $cid = $1;}
  $key = "\@S".$sid.".".$id.".".$cid;
 if($in =~ /\(word ([^) ]+)/) { $word = $1; $word =~ s/^-//;}
 if($in =~ /^\(kqw/) { $kqw = "(kqw)";} else {$kqw = "";}
 if($in =~ /\(rel_nm ([^) ]+)/) { $rel = $1;}
 if($in =~ /\(relata_pos_id ([1-9][0-9]*)/) { $relata_pos_id = $1;} else {$relata_pos_id = "";}
 if($in =~ /\(relata_pos_cid ([1-9][0-9]*)/) { $relata_pos_cid = $1;} else {$relata_pos_cid = "";}
 if ($DISCOURSE{$key} eq "") {
      $rels = $rel.","."\@S".$sid.".".$relata_pos_id.".".$relata_pos_cid;
 } elsif (($rel !~ /sambanXaH/) && ($rels !~ /_xyowakaH/)) {
      $rels = $rel.","."\@S".$sid.".".$relata_pos_id.".".$relata_pos_cid;
 }
 if (($DISCOURSE{$key} !~ /,\@S$sid.$relata_pos_id.$relata_pos_cid/) && ($DISCOURSE{$key} ne "")) {
     if ($rels ne "") { $rels .= ";".$DISCOURSE{$key};} else {$rels = $DISCOURSE{$key};}
 } 

 $code = &get_color_code($in);
  
 if($relata_pos_id ne "") {
    print "$key\t$word\t$kqw\t$rels\t$code\n";
 } else {
    print "\@S$sid.$id.$cid\t$word\t-\t-\t$code\n";
 }

}

sub get_color_code {
 my($in) = @_;
 my($code) = "";
 if ($in =~ /^\(sup.*viBakwiH ([1-8])/) { $code = "\@N$1";}
 if ($in =~ /^\(kqw.*viBakwiH ([1-8])/) { $code = "\@N$1";}
 if ($in =~ /^\(wif/) { $code = "\@KP";}
 if ($in =~ /^\(avy/) { $code = "\@NA";}
 if ($word =~ /\-$/) { $code = "\@CP";}
 if ($word =~ /\./) { $code = "\@FS";}
 $code;
}
