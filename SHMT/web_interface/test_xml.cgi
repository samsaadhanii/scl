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
#use CGI qw/:standard/;
#use URL::Escape;


  if($GlblVar::LOG eq "true") {
    if (! (-e "$GlblVar::TFPATH")){
        mkdir "$GlblVar::TFPATH" or die "Error creating directory $GlblVar::TFPATH";
    }
    open(TMP1,">>$GlblVar::TFPATH/shmt.log") || die "Can't open $GlblVar::TFPATH/shmt.log for writing";
  }

require "$GlblVar::SCLINSTALLDIR/converters/convert.pl";


  my %param = &get_parameters();


#      if (param) {
      my $encoding=$param{encoding};
      my $sentences=$param{text};
      my $splitter=$param{splitter};
      my $out_encoding=$param{out_encoding};
      #$morph=param("morph");
      my $parse=$param{parse};
      my $text_type=$param{text_type};


  if($GlblVar::LOG eq "true") {
      print TMP1 $ENV{'REMOTE_ADDR'}."\t".$ENV{'HTTP_USER_AGENT'}."\n"."encoding:$encoding\t"."sentences:$sentences\t"."splitter:$splitter\t"."out_encoding:$out_encoding\t"."parse:$parse\n#####################\n\n";
  }

      if ($out_encoding eq "Devanagari") { $script = "DEV";}
      if ($out_encoding eq "IAST") { $script = "IAST";}
      if ($splitter eq "None") { $sandhi = "NO"; $morph = "UoHyd";}
      if ($splitter eq "Heritage Splitter") { $sandhi = "YES"; $morph = "GH";}
#      if ($splitter eq "Anusaaraka Splitter") { $sandhi = "YES"; $morph = "UoHyd";}

      $pid = $$;

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

      # my $cgi = new CGI;
      if($morph eq "GH") {
         $sentences =~ s/\.//;
	 $cmd = "$GlblVar::HERITAGE_CGIURL?lex=MW\&cache=t\&st=t\&us=f\&cp=t\&text=$sentences\&t=WX\&topic=\&mode=g";
	 #print CGI-> redirect($cmd);
	 print "location:$cmd\n\n";
      } else {
	      my $q_id = &get_queue_id;
	      $cpid = &get_curr_id;
	      if ($cpid != $q_id) { 
		      sleep(1);
		      $cpid = &get_curr_id;
	      }

         if(-d "$GlblVar::TFPATH/tmp_in$pid") {
            system("rm -rf $GlblVar::TFPATH/tmp_in$pid");
            system("rm -f $GlblVar::TFPATH/in$pid.html");
            system("rm -f $GlblVar::TFPATH/in$pid_trnsltn");
         }
         system("mkdir -p $GlblVar::TFPATH/tmp_in$pid");
         open(TMP,">$GlblVar::TFPATH/tmp_in$pid/wor.$pid") || die "Can't open $GlblVar::TFPATH/tmp_in$pid/wor.$pid for writing";
         print TMP $sentences,"\n";
         close(TMP);

         print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
	 #  print $cgi->header (-charset => 'UTF-8');
           $sentences = '"'. $sentences  . '"';
           my $exit_status = system("$GlblVar::SCLINSTALLDIR/SHMT/prog/shell/callmtshell.pl $GlblVar::TFPATH $GlblVar::SCLINSTALLDIR $GlblVar::GraphvizDot $sentences $encoding $pid $script $sandhi $morph $parse $text_type $GlblVar::LTPROCBIN");

	    if($exit_status > -1) {
	         &increment_curr_id;
            }

           system("$GlblVar::SCLINSTALLDIR/SHMT/prog/interface/display_output.pl $GlblVar::SCLINSTALLDIR $GlblVar::TFPATH $script $pid");
      }
      #  }
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
