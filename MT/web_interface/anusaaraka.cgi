#!/usr/bin/env perl

#  Copyright (C) 2002-2023 Amba Kulkarni (ambapradeep@gmail.com)
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
use Fcntl ':flock'; 
require "../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

package main;

  if($GlblVar::LOG eq "true") {
    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }
    open(TMP1,">>$GlblVar::TFPATH/shmt.log") || die "Can't open $GlblVar::TFPATH/shmt.log for writing";
  }

  require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";


  my %param = &get_parameters();


      my $encoding=$param{encoding};
      my $sentences=$param{text};
      my $splitter=$param{splitter};
      my $out_encoding=$param{out_encoding};
      my $parse=$param{parse};
      my $tlang=$param{tlang};
      my $text_type=$param{text_type};
      my $mode=$param{mode};


      if ($mode eq "json" ) {   print "Access-Control-Allow-Origin: *\n";}

  if($GlblVar::LOG eq "true") {
      print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."encoding:$encoding\t"."sentences:$sentences\t"."splitter:$splitter\t"."out_encoding:$out_encoding\t"."parse:$parse\n#####################\n\n";
  }
         close(TMP1);

      if ($out_encoding eq "Devanagari") { $script = "DEV"; $Hscript = "deva";}
      if ($out_encoding eq "IAST") { $script = "IAST"; $Hscript = "roma";}
      if ($out_encoding eq "Telugu") { $script = "Telugu";}
      if ($splitter eq "None") { $morph = "UoHyd";}
      if ($splitter eq "best") { $morph = "Heritage_auto";}
      if ($splitter eq "manual") { $morph = "Heritage_manual";}

      my $Ppid = $$;

      my $cpid;
      my $q_id;

      $sentences =~ s/\r\n/ /g;
      $sentences =~ s/[\r\n]/ /g;
      $sentences =~ s/ ।/./g;
      $sentences =~ s/[ ]+\|/./g;
      $sentences =~ s/[ ]+([\.!\?])/$1/g;
      $sentences =~ s/\|[ ]+$/./g;
      $sentences =~ s/\.[ ]+$/./g;
      $sentences =~ s/[ ]+$//g;
      if ($sentences !~ /\.$/) { $sentences .= ".";}
      

      $sentences=&convert($encoding,$sentences,$GlblVar::SCLINSTALLDIR);
      chomp($sentences);

     @sentences = split(/\./,$sentences);
    
     print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
     system("mkdir -p $GlblVar::TFPATH/tmp_in$Ppid");

     for ($i=1;$i<=$#sentences+1;$i++) {
       $pid = $Ppid."_".$i;
       $sent = $sentences[$i-1]. ".";

      if(-d "$GlblVar::TFPATH/tmp_in$pid") {
            system("rm -rf $GlblVar::TFPATH/tmp_in$pid");
            system("rm -f $GlblVar::TFPATH/in$pid.html");
            system("rm -f $GlblVar::TFPATH/in$pid_trnsltn");
      }

      system("mkdir -p $GlblVar::TFPATH/tmp_in$pid");
      open(TMP,">$GlblVar::TFPATH/tmp_in${pid}/wor.$pid") || die "Can't open $GlblVar::TFPATH/tmp_in$pid/wor.$pid for writing";
      $sent =~ s/\./ ./g;
      $sent =~ s/,/ ,/g;
      print TMP $sent,"\n";
      close(TMP);

      system("cp $GlblVar::TFPATH/tmp_in${pid}/wor.$pid $GlblVar::TFPATH/tmp_in${pid}/sandhied_in$pid");
      $q_id = &get_queue_id;
      $cpid = &get_curr_id;
      if ($cpid != $q_id) { 
	      #sleep(1);
	      $cpid = &get_curr_id;
      }

      # Default values
      $prog = "anu_skt_hnd.sh"; $lang = "hi";
      if ($tlang eq "Telugu") { $prog = "anu_skt_tlg.sh"; $lang = "te";}
      elsif ($tlang eq "Marathi") { $prog = "anu_skt_mrt.sh"; $lang = "mr";}

      if($morph eq "Heritage_manual") {
         $sent =~ s/\.//;
         $sent =~ s/ /\+/g;
	 $cmd = "QUERY_STRING=\"lex=MW\&cache=f\&st=t\&us=f\&font=$Hscript\&cp=t\&text=$sent\&t=WX\&topic=\&mode=b&pipeline=f&fmode=n\" $GlblVar::CGIDIR/$GlblVar::HERITAGE_Graph_CGI";
         system($cmd);
      } else {
         if($morph eq "Heritage_auto") {
         $sent =~ s/\.//;
         $sent =~ s/ /\+/g;
	 $cmd = "QUERY_STRING=\"lex=MW\&cache=f\&st=t\&us=f\&font=$Hscript\&cp=t\&text=$sent\&t=WX\&topic=\&mode=f&pipeline=t&fmode=w\" $GlblVar::CGIDIR/$GlblVar::HERITAGE_CGI |  tail -1  | $GlblVar::SCLINSTALLDIR/MT/prog/Heritage_morph_interface/Heritage2anusaaraka_morph.sh $GlblVar::SCLINSTALLDIR $GlblVar::TFPATH $pid";
         system($cmd);

         system("$GlblVar::TIMEOUT $GlblVar::SCLINSTALLDIR/MT/prog/shell/$prog $GlblVar::CGIDIR/$GlblVar::SCL_CGI tmp_in${pid}/in$pid $GlblVar::TFPATH $lang $script $morph Full $text_type $i 2> $GlblVar::TFPATH/tmp_in$pid/err$pid");
         }  else {

         open (TMP,">$GlblVar::TFPATH/tmp_in${pid}/in$pid");
         #print TMP "<s>$sent<\/s>\n"; 
         print TMP "$sent\n"; 
         close (TMP);

          `date > $GlblVar::TFPATH/tmp_in$pid/err$pid`;
          $cmd = "$GlblVar::TIMEOUT $GlblVar::SCLINSTALLDIR/MT/prog/shell/$prog $GlblVar::CGIDIR/$GlblVar::SCL_CGI tmp_in${pid}/in$pid $GlblVar::TFPATH $lang $script $morph $parse $text_type $i 2>> $GlblVar::TFPATH/tmp_in$pid/err$pid";
          $exec_status = system($cmd);
     }
     `date >> $GlblVar::TFPATH/tmp_in$pid/err$pid`;

     if($exec_status > -1 ) { 
         &increment_curr_id;
     }

    if ($mode eq "web") {
        system("$GlblVar::SCLINSTALLDIR/MT/prog/interface/display_output.pl $GlblVar::SCLINSTALLDIR $GlblVar::TFPATH $script $Ppid $i $text_type $GlblVar::SCL_HTDOCS $GlblVar::SCL_CGI");
        if ($i == $#sentences+1) {
          system("$GlblVar::SCLINSTALLDIR/MT/prog/interface/print_table_bottom_menu.pl $Ppid $#sentences $GlblVar::TFPATH $script");
        }
	print "<\/body><\/html>\n";
    } elsif ($mode eq "json") {
        if ($i == 1) {print "[";}
        system("$GlblVar::SCLINSTALLDIR/MT/prog/reader_generator/csv2json.pl < $GlblVar::TFPATH/tmp_in$pid/table_outscript.tsv"); 
	if ($i <= $#sentences) { print ",";}
    }
    }
	if($i==1) {
	 system("cp $GlblVar::TFPATH/tmp_in$pid/table_outscript.tsv $GlblVar::TFPATH/tmp_in$Ppid/table_outscript.tsv");
        } 
	 system("$GlblVar::SCLINSTALLDIR/MT/prog/Discourse/discourse_analysis.pl $i $out_encoding $GlblVar::TFPATH/tmp_in$Ppid/table_outscript.tsv  $GlblVar::TFPATH/tmp_in$pid/table_outscript.tsv > $GlblVar::TFPATH/tmp_in$Ppid/table_outscript.tsv_$i; cp $GlblVar::TFPATH/tmp_in$Ppid/table_outscript.tsv_$i $GlblVar::TFPATH/tmp_in$Ppid/table_outscript.tsv");
   }
    if ($#sentences >= 1) {
    system("$GlblVar::SCLINSTALLDIR/MT/prog/kAraka/draw_graph.pl $GlblVar::GraphvizDot $GlblVar::TFPATH/tmp_in$Ppid < $GlblVar::TFPATH/tmp_in$Ppid/table_outscript.tsv");
	print "<h2> Discourse Graph </h2>";
	print "<img src=/$GlblVar::SCL_HTDOCS/MT/DEMO/tmp_in$Ppid/1.svg width=\"\" height=\"\" > ";
	print "<\/center><br><br><br><br>";
    }

   if ($mode eq "json") { print "]";}
  if($GlblVar::LOG eq "true") {
    close(TMP1);
  }


  sub get_queue_id {
	  my $p = 1;
	  if (-r "/tmp/QUEUE_PID_SCL") {
	      open (TMP,"</tmp/QUEUE_PID_SCL")  || die "Could not open /tmp/QUEUE_PID_SCL - $!";;
	      flock(TMP,LOCK_EX);
	      $p = <TMP>;
	      chomp($p);
	      close(TMP);
	      open (TMP,">/tmp/QUEUE_PID_SCL") ;
	      flock(TMP,LOCK_EX);
	      $p++;
	      print TMP $p;
	      close(TMP);
          } else {
	      open (TMP,">/tmp/QUEUE_PID_SCL") ;
	      flock(TMP,LOCK_EX);
	      print TMP $p;
	      close(TMP);
	  }
	  $p;
  }
1;
    
  sub increment_curr_id {
          my($p);
	  open (TMP,"</tmp/CURR_PID_SCL")  || die "Could not open /tmp/CURR_PID_SCL - $!";;
	  flock(TMP,LOCK_SH);
	  $p = <TMP>;
	  chomp($p);
	  close(TMP);
	  $p++;
	  open (TMP,">/tmp/CURR_PID_SCL")  || die "Could not open /tmp/CURR_PID_SCL - $!";;
	  flock(TMP,LOCK_EX);
	  print TMP $p;
	  close(TMP);
  }
1;

  sub get_curr_id {
	  my($p);
	  $p = 1;
	  if (-r "/tmp/CURR_PID_SCL") {
	  open (TMP,"</tmp/CURR_PID_SCL")  || die "Could not open /tmp/CURR_PID_SCL - $!";;
	  flock(TMP,LOCK_SH);
	  $p = <TMP>;
	  chomp($p);
	  close(TMP);
          } else {
	      open (TMP,">/tmp/CURR_PID_SCL") ;
	      flock(TMP,LOCK_EX);
	      print TMP $p;
	      close(TMP);
	  }
	  $p;
  }
1;
