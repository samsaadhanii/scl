#!/usr/bin/env perl -w

#  Copyright (C) 2023-2024 Amba Kulkarni (ambapradeep@gmail.com)
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



# important, this limits the size
# of the file to upload.  This
# prevents people from uploading
# large files to slow down your
# server:
$CGI::POST_MAX=1024 * 100;

use strict;
use File::Copy;
use CGI qw/:standard/;
use strict;
use warnings;


# get filename args
my $cgi = new CGI or die "new CGI: $!\n";

# The contents of your file is contained
# in this scalar:
my $file = $cgi->param('file');
$file =~ /.*\."?(\w*)"?$/;

my $in; 
my $pid = $$;

print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

print "<br>\n<center>";
open (TMP,">$TFPATH/tmp_$pid");
while (read ($file, my $Buffer, 1024)) {
    print TMP $Buffer;
}
close (TMP);

print "<body>";
system ("$CGIDIR/scl/MT/prog/kAraka/draw_graph.pl $GraphvizDot $TFPATH  $pid < $TFPATH/tmp_$pid");
print "<img src=\"/scl/MT/DEMO/$pid.svg\" width=\"\" height=\"\" \">\n";
print "<\/body>";
print "<\/html>";
