#!/usr/bin/env perl

#  Copyright (C) 2015-2023 Amba Kulkarni (ambapradeep@gmail.com)
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

#use CGI qw/:standard/;

 print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

  my %param = &get_parameters();

#if(param) {
 $pid = $param{pid};
 
 # my $cgi = new CGI;

$filepath = "$TFPATH/tmp_in$pid/in${pid}_table.tsv";
print ("Content-Type:application/x-download\n");
print "Content-Disposition: attachment; filename=$file\n\n";

open FILE, "< $filepath" or die "can't open : $!";
binmode FILE;
local $/ = \10240;
while (<FILE>){
    print $_;
}

    close FILE;
}

