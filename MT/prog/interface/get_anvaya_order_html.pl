#!/usr/bin/perl

$fbn = $ARGV[0];
$TFPATH = $ARGV[1];
$outscript = $ARGV[2];
$CGIURL = $ARGV[3];
$HERITAGE_CGI = $ARGV[4];
if($ARGV[5] eq "A") {$anvaya = 1;} else {$anvaya = 0;}
$sent_no = $ARGV[6];
$SCL_CGI = $ARGV[7];

@in = <STDIN>;
if ($anvaya == 1) {@new_in = &get_anvaya_order(@in);} else {@new_in = @in;}

for ($word = 1; $word <$#in; $word++) {
$in = $new_in[$word];
chomp($in);

@flds = split(/\t/,$in);

print "<table cellspacing=\"0\" border=\"0\" style=\"float: left\">\n";
foreach ($fld=1;$fld<=$#flds;$fld++){
   if ($fld == 1 || $fld > 2) {
      print "<tr class=\"row",$fld,"\">";
      if($word == 1) {
        print "<td class=\"number\">";
        if($fld == 1) { # words
          print "<a href=\"/",$CGIURL,"/$SCL_CGI/MT/prog/interface/call_parser_summary.cgi?filename=",$TFPATH,"\&amp;outscript=",$outscript,"&rel=''&sentnum=1&save=no&translate=no\"  onmouseover=\"Tip('<img src=/$SCL_CGI/MT/DEMO/tmp_",$fbn,"/1.svg >' ,FONTSIZE,'18pt',HEIGHT,400,WIDTH,900,STICKY,true,CLOSEBTN,true)\">\n";
        }
        if($fld == 3) { # sandhied words
          open(TMP,"<$TFPATH/sandhied_$fbn") || die "file $TFPATH/sandhied_$fbn not found\n";
          $sentences = <TMP>;
          close(TMP);
          chomp($sentences);
          $sentences =~ s/ /\+/g;
	  $sentences =~ s/\.//;
          print "<a href=\"/$CGIURL/$HERITAGE_CGI?lex=MW\&cache=t\&st=t\&us=f\&font=deva\&cp=t\&text=$sentences\&t=WX\&topic=\&mode=b\&pipeline=f\">\n";
        }
        print "<span Onclick=\"toggle();\">";
        print $sent_no,".",chr(64+$fld);
        print "<\/span>";
        if (($fld == 1) || ($fld == 3)) { print "<\/a>";}
        print "<\/td>";
      }
      print "<td class=\"",$flds[8],"\">";
  
      if (($fld==4) || ($fld==5)) {
       @ana = split(/\//,$flds[$fld]);
       for ($j=0;$j<=$#ana;$j++) {
          $ana[$j] =~ s/^([^0-9\-{]+)([0-9\-{])/<a href="javascript:show('$1','$outscript')">$1<\/a>$2/g;
          $ana[$j] =~ s/\-([^0-9\-{]+)([0-9\-{])/-<a href="javascript:show('$1','$outscript')">$1<\/a>$2/g;
          print $ana[$j];
          if($j < $#ana) { print "\/";}
       }
       print "<\/td><\/tr>\n";
      } else { print $flds[$fld]; print "<\/td><\/tr>\n";}
  }
}
        print "<tr class=\"row",$#flds+1,"\">";
        if($word == 1) { 
           print "<td class=\"number\">";
           print "<span Onclick=\"toggle();\">";
           print $sent_no,".",chr(64+$#flds+1);
           print "<\/span>";
           print "<\/td>";
        }
        print "<td class=\"$flds[8]\">";
        print "$flds[0]<\/td><\/tr>\n";
 	print "<\/table>\n";
}

sub get_anvaya_order {
 my(@in) = @_;
 my(@new_in, $i);
 for ($i=1;$i<$#in;$i++) {
  @flds = split('\t',$in[$i]);
  $shloka_order{$i} = $flds[2];
  $word_pos{$flds[2]} = $i;
 }

 @new_order = sort {10*$a <=> 10*$b} (values %shloka_order);
 $i = 1;
 foreach $new_order (@new_order) {
   $new_in[$i] = $in[$word_pos{$new_order}];
   $i++;
 }
@new_in;
}
1;
