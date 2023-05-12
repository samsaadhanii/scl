#!/usr/bin/env perl
#
#
#  Copyright (C) 2012-2023 Amba Kulkarni (ambapradeep@gmail.com)
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
require "../../paths.pl";
require "$GlblVar::SCLINSTALLDIR/cgi_interface.pl";

my $myPATH ="$GlblVar::HTDOCSDIR/$GlblVar::SCL_HTDOCS/skt_gen/compounds";

use warnings;
#use CGI ':standard';

#my $cgi = new CGI;

#print $cgi->header(-type    => 'text/html',
#                   -charset => 'utf-8');

 print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

  my %param = &get_parameters();

#if (param) {
  my $expert = $param{expert};

  if(! (-e "$GlblVar::TFPATH")) { system("mkdir -p $GlblVar::TFPATH");}
  &display_index($expert);

  #}

sub display_index {
 my ($expert) = @_;
    if ($expert eq "No") {
       system ("cat $myPATH/index_dev.html");
    }

    if ($expert eq "Yes") {
       system ("cat $myPATH/expert.html");
    }
}
1;
