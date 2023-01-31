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

my $myPATH = "$GlblVar::SCLINSTALLDIR/skt_gen/compounds";

use warnings;
#use CGI ':standard';

#my $cgi = new CGI;

#print $cgi->header(-type    => 'text/html',
#                   -charset => 'utf-8');

 print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

  my %param = &get_parameters();

 #if (param) {
  my $encoding = $param{encoding};
  my $avigraha = $param{vigraha};

  #print "avigraha = $avigraha\n";
  #print "encoding = $encoding\n";
  $avigraha =~ /^([^\+ ]+)\+?([^ ]*) ([^\+ ]+)\+?([^ ]*) \(([1-8].[1-4].[0-9]+)\)/;
  my $p1 = $1; 
  my $s1 = $2; 
  my $p2 = $3; 
  my $s2 = $4; 
  my $sUwra = $5; 

  $avigraha =~ s/ \(([1-8].[1-4].[0-9]+)\)//;

  #print "Calling samAsaprakAra.out";
  my $cmd = "$myPATH/samAsaprakAra.out \"$encoding\" \"$avigraha\" \"$p1\" \"$s1\" \"$p2\" \"$s2\" \"$sUwra\"";
  #print "cmd = $cmd";
  system($cmd);
  #}
