#!/usr/bin/env perl

#  Copyright (C) 2002-2022 Amba Kulkarni (ambapradeep@gmail.com)
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
      my $text_type=$param{text_type};
      my $mode=$param{mode};


      if ($mode eq "json" ) {   print "Access-Control-Allow-Origin: *\n";}

  if($GlblVar::LOG eq "true") {
      print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."encoding:$encoding\t"."sentences:$sentences\t"."splitter:$splitter\t"."out_encoding:$out_encoding\t"."parse:$parse\n#####################\n\n";
  }
         close(TMP1);

      if ($out_encoding eq "Devanagari") { $script = "DEV";}
      if ($out_encoding eq "IAST") { $script = "IAST";}
      if ($splitter eq "None") { $morph = "UoHyd";}
      if ($splitter eq "best") { $morph = "GH_auto";}
      if ($splitter eq "manual") { $morph = "GH_manual";}

      my $pid = $$;

      my $cpid;
      my $q_id;

      $sentences =~ s/\r\n/ /g;
      $sentences =~ s/[\r\n]/ /g;
      $sentences =~ s/ ।/./g;
      $sentences =~ s/[ ]+\|/./g;
      $sentences =~ s/[ ]+([\.!\?])/$1/g;
      $sentences =~ s/:/ः/g;
      $sentences =~ s/\|[ ]+$/./g;
      $sentences =~ s/\.[ ]+$/./g;
      $sentences =~ s/[ ]+$//g;

      $sentences=&convert($encoding,$sentences,$GlblVar::SCLINSTALLDIR);
      chomp($sentences);

         if(-d "$GlblVar::TFPATH/tmp_in$pid") {
            system("rm -rf $GlblVar::TFPATH/tmp_in$pid");
            system("rm -f $GlblVar::TFPATH/in$pid.html");
            system("rm -f $GlblVar::TFPATH/in$pid_trnsltn");
         }

         system("mkdir -p $GlblVar::TFPATH/tmp_in$pid");
         open(TMP,">$GlblVar::TFPATH/tmp_in${pid}/wor.$pid") || die "Can't open $GlblVar::TFPATH/tmp_in$pid/wor.$pid for writing";
         print TMP $sentences,"\n";
         close(TMP);


      system("cp $GlblVar::TFPATH/tmp_in${pid}/wor.$pid $GlblVar::TFPATH/tmp_in${pid}/sandhied_in$pid");
      print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
      $q_id = &get_queue_id;
      $cpid = &get_curr_id;
      if ($cpid != $q_id) { 
	      #sleep(1);
	      $cpid = &get_curr_id;
      }

      if($morph eq "GH_manual") {
         $sentences =~ s/\.//;
         $sentences =~ s/ /\+/g;
	 $cmd = "QUERY_STRING=\"lex=MW\&cache=f\&st=t\&us=f\&font=deva\&cp=t\&text=$sentences\&t=WX\&topic=\&mode=b&pipeline=f\" $GlblVar::CGIDIR/$GlblVar::HERITAGE_CGI";
         system($cmd);
      } else {
         if($morph eq "GH_auto") {
         $sentences =~ s/\.//;
         $sentences =~ s/ /\+/g;
	 $cmd = "QUERY_STRING=\"lex=MW\&cache=f\&st=t\&us=f\&font=deva\&cp=t\&text=$sentences\&t=WX\&topic=\&mode=f&pipeline=t\" $GlblVar::CGIDIR/$GlblVar::HERITAGE_CGI | tail -1 | $GlblVar::SCLINSTALLDIR/MT/prog/Heritage_morph_interface/Heritage2anusaaraka_morph.sh $GlblVar::SCLINSTALLDIR $GlblVar::TFPATH $pid";
         system($cmd);

         if($display eq "") { $display = "DEV";}

         system("$GlblVar::TIMEOUT $GlblVar::SCLINSTALLDIR/MT/prog/shell/anu_skt_hnd.sh $GlblVar::CGIDIR/scl tmp_in${pid}/in$pid $GlblVar::TFPATH hi $display $morph Full $text_type 2> $GlblVar::TFPATH/tmp_in$pid/err$pid");
         }  else {

         open (TMP,">$GlblVar::TFPATH/tmp_in${pid}/in$pid");
         print TMP "<s>$sentences<\/s>\n"; 
         close (TMP);

          `date > $GlblVar::TFPATH/tmp_in$pid/err$pid`;
          $cmd = "$GlblVar::TIMEOUT $GlblVar::SCLINSTALLDIR/MT/prog/shell/anu_skt_hnd.sh $GlblVar::CGIDIR/scl tmp_in${pid}/in$pid $GlblVar::TFPATH hi $script $morph $parse $text_type 2>> $GlblVar::TFPATH/tmp_in$pid/err$pid;";
          $exec_status = system($cmd);
     }
     `date >> $GlblVar::TFPATH/tmp_in$pid/err$pid`;

     if($exec_status > -1 ) { 
         &increment_curr_id;
     }

     if ($mode eq "web") {
       system("$GlblVar::SCLINSTALLDIR/MT/prog/interface/display_output.pl $GlblVar::SCLINSTALLDIR $GlblVar::TFPATH $script $pid A");
     } elsif ($mode eq "json") {
       system("$GlblVar::SCLINSTALLDIR/MT/prog/reader_generator/csv2json.pl < $GlblVar::TFPATH/tmp_in$pid/table_outscript.tsv"); 
     }
  }
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
