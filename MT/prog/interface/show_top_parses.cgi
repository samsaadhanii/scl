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
package main;
#use CGI qw/:standard/;
require "../../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

#use CGI::Carp qw(fatalsToBrowser);

 print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

  my %param = &get_parameters();

  #      if (param) {
          my $filename=$param{filename};
          my $sentnum=$param{sentnum};
       #   $sentnumalter=$sentnum;
       #   if($sentnumalter =~ /c.$/) { 
       #      $sentnumalter =~ s/c\.$/./;
       #      $alter = "Expand";}
       #   else {
       #      $sentnumalter =~ s/\.$/c./;
#	     $alter = "Collapse";
#          }
       #          my $cgi = new CGI;
       #   print $cgi->header (-charset => 'UTF-8');
	  print "<head>\n";
	  print "</head>\n<body>";
	  print "<div id=\"imgitems\" class=\"parsetrees\">\n<center>\n<ul id=\"trees\">\n"; 
          $filename =~ s/^..//;
          $filename =~ s/\/$//;
          $i=1;
          while(-e "$GlblVar::HTDOCSDIR/$GlblVar::SCL_HTDOCS/MT/DEMO/$filename/${sentnum}$i.dot") {
            print "<li>Solution $i: <img src=\"/$GlblVar::SCL_HTDOCS/MT/DEMO/$filename/${sentnum}$i.svg\" width=\"\" height=\"\" kddalt=\"graph showing all relations\"></li>\n";
     $i++;
    }
        print "</ul> </center> </div> </body> </html>\n";
	#}
