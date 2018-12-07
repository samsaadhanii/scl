#!/usr/bin/env perl


require "../paths.pl";
require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";
require "$GlblVar::SCLINSTALLDIR/sandhi/sandhi.pl";
require "$GlblVar::SCLINSTALLDIR/sandhi/apavAxa_any.pl";
require "$GlblVar::SCLINSTALLDIR/sandhi/any_sandhi.pl";

package main;

if($GlblVar::VERSION eq "SERVER"){
    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }
  open(TMP1,">>$GlblVar::TFPATH/sandhi.log") || die "Can't open $GlblVar::TFPATH/sandhi.log for writing";
}

use CGI qw/:standard/;
#use CGI::Carp qw(fatalsToBrowser);

  if (param) {
     $encoding=param("encoding");
     $word1=param("text");
     $word2=param("text1");
     $word1 =~ s/\r//g;
     $word2 =~ s/\r//g;
     chomp($word1);
     chomp($word2);
     $sandhi_type = "any";

      $word1_wx=&convert($encoding,$word1,$GlblVar::SCLINSTALLDIR);
      chomp($word1_wx);

      $word2_wx=&convert($encoding,$word2,$GlblVar::SCLINSTALLDIR);
      chomp($word2_wx);
      
      $ans = &sandhi($word1_wx,$word2_wx);
      @ans=split(/,/,$ans);

       $string = $word1_wx.",".$word2_wx.",".$ans[0].",".$ans[1].",".$ans[2].",".$ans[3].",".$ans[4].",".$ans[5].",".$ans[6].",".$ans[7].",";

      $cmd = "echo \"$string\" | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1";
      $san = `$cmd`;
      $san=~s/,:/,/g;

if($GlblVar::VERSION eq "SERVER"){
      if($san){ 
            print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n\n"."encoding:$encoding\t"."word1:$word1\t"."word2:$word2###############\n\n"; 
      } else { 
            print TMP1 "error:","$san\n###############\n\n";
      }
}

      @san=split(/,/,$san);
      @san2=split(/:/,$san[2]);
      @san3=split(/:/,$san[3]);
      @san4=split(/:/,$san[4]);

##using table and giving ouput to the html file

      $cgi = new CGI;
      print $cgi->header (-charset => 'UTF-8');
	
      print "<br>\n<center>";
      print "<table border='1' cellpadding='2' style='border-collapse:collapse' bordercolor='brown' width='92%' id='AoutoNumber1'>";
      
	print "<tr bgcolor=#297e96>";

        for (my $k = 5; $k < 10; $k++) {
	  print "<td><center><font size=4 color=white>$san[$k]</font></center></td>";
        }
	
      for($i=0;$i<=$#san2;$i++){ 
	print "<tr bgcolor='white'><td><center><font color='blue'>$san[0]</font></center></td>";
	print "<td><center><font color='blue'>$san[1]</font></center></td>";
        print "<td><center><font color='blue'>$san2[$i]</font></center></td>";
	print "<td><center><font color='blue'>$san3[$i]</font></center></td>"; 
	print"<td><center><font color='blue'>$san4[$i]</font><center></td></tr>";
      }
 print  "</table>\n</center>\n";
 print  "<br><br>";

print "<br></BODY></HTML>";
}
if($GlblVar::VERSION eq "SERVER"){
  close (TMP1);
}
