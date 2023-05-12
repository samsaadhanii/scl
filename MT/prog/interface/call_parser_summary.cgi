#!/usr/bin/env perl

#  Copyright (C) 2009-2023 Amba Kulkarni (ambapradeep@gmail.com)
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
require "../../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";


package main;

print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

my %param = &get_parameters();

      my $dirname=$param{filename};
      my $outscript=$param{outscript};
      my $relations=$param{rel};
      my $sentnum=$param{sentnum};
      my $save=$param{save};
      my $translate=$param{translate};

      $filename = "table_outscript.tsv";
      $pid = $dirname;
      $pid =~ s/.*\/tmp_in//;

      #  my $cgi = new CGI;
      #print $cgi->header (-charset => 'UTF-8');

      if($relations eq "") { $relations = "''";}

      my $total_filtered_solns = 0;
      if($translate eq "yes") {
	  my $lang = "hi";
          my $morph = "UoHyd";
          my $parse = "AVAILABLE";
          my $text_type = "Prose";
          $pid =~ /_([0-9])/;
          my $sentno = $1;
          system("$GlblVar::SCLINSTALLDIR/MT/prog/shell/anu_skt_hnd.sh $GlblVar::CGIDIR/$GlblVar::SCL_CGI $dirname/in$pid $GlblVar::TFPATH $lang $outscript $morph $parse $text_type $sentno 2>> $dirname/err$pid");
	  system("$GlblVar::SCLINSTALLDIR/MT/prog/interface/display_output.pl $GlblVar::SCLINSTALLDIR $GlblVar::TFPATH $outscript $pid NIL $text_type $GlblVar::SCL_HTDOCS $GlblVar::SCL_CGI");
      } else {
      print "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n";
      print "<html xmlns=\"http://www.w3.org/1999/xhtml\">";
      print "<html><head><title>Anusaaraka</title>\n";
      print "<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=UTF-8\" />\n";
      print "<link href=\"/$GlblVar::SCL_HTDOCS/MT/Sanskrit_style.css\" type=\"text/css\" rel=\"stylesheet\" />\n ";
      print "<style type=\"text/css\">\n";
      print "table { margin-top:20px;}\n";
      print "<\/style>\n";
      print "<\/head>\n<body>\n<div>\n";
      print "<center>\n";
      if($save eq "yes") {
        system("$GlblVar::SCLINSTALLDIR/MT/prog/kAraka/mk_summary.pl $GlblVar::SCLINSTALLDIR $outscript $dirname/$filename $GlblVar::SCLINSTALLDIR/MT/prog/kAraka/list_n $dirname $relations $sentnum $dirname/parser_files/parseop_new.txt $save < $dirname/parser_files/parseop$sentnum.txt");
      } else {
      open(TMP,"<$dirname/parser_files/parseop1.txt") || die "Can't open $dirname/parser_files/parseop1.txt for reading";
      @tmp = <TMP>;
      close(TMP);
      if($tmp[0] =~/Total Complete Solutions=([0-9]+)/){
         $total_filtered_solns = $1;
         print "<h2> Summary of Complete Parses <\/h2>\n";
      } else {
         print "<h2> Summary of Possible Relations <\/h2>\n";
      }
        system("$GlblVar::SCLINSTALLDIR/MT/prog/kAraka/mk_summary.pl $GlblVar::SCLINSTALLDIR $outscript $dirname/$filename $GlblVar::SCLINSTALLDIR/MT/prog/kAraka/list_n $dirname $relations $sentnum $dirname/parser_files/parseop_new.txt $save < $dirname/parser_files/parseop$sentnum.txt");
      print "<\/center>\n";
      print "<\/div>\n";
      print "<\/body>\n<\/html>\n";
    }
    }
