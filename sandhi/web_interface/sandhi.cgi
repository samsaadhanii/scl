#!/usr/bin/env perl
#
#  Copyright (C) 2006-2023 Amba Kulkarni (ambapradeep@gmail.com)
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later
#  version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.


use utf8;

require "../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";
require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";
require "$GlblVar::SCLINSTALLDIR/sandhi/sandhi.pl";
require "$GlblVar::SCLINSTALLDIR/sandhi/apavAxa_any.pl";
require "$GlblVar::SCLINSTALLDIR/sandhi/any_sandhi.pl";

package main;

if($GlblVar::LOG eq "true"){
    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }
  open(TMP1,">>$GlblVar::TFPATH/sandhi.log") || die "Can't open $GlblVar::TFPATH/sandhi.log for writing";
}

#use CGI qw/:standard/;
#use CGI::Carp qw(fatalsToBrowser);

  my %param = &get_parameters();
#  if (param) {
     $encoding=$param{encoding};
     $outencoding=$param{outencoding};
     $word1=$param{text};
     $word2=$param{text1};
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

      if($outencoding eq "IAST") {
         $cmd = "echo \"$string\" | $GlblVar::SCLINSTALLDIR/converters/wx2utf8roman.out";
      } else {
         $cmd = "echo \"$string\" | $GlblVar::SCLINSTALLDIR/converters/ri_skt | $GlblVar::SCLINSTALLDIR/converters/iscii2utf8.py 1";
      }

      $san = `$cmd`;
      $san=~s/,:/,/g;

if($GlblVar::LOG eq "true"){
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

      print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

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

if($GlblVar::VERSION eq "SERVER"){
  close (TMP1);
}
