#!/usr/bin/env perl

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


my $buffer;
my $pid = $$;

open (TMP,">TFPATH/tmp_$pid");
read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
$buffer =~ s/"//g;
print TMP $buffer;
close (TMP);

print "Access-Control-Allow-Origin: *\n";
print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";

print "<br>\n<center>\n";
print "<body>\n";
system ("CGIDIR/SCL_CGI/MT/prog/kAraka/draw_graph.pl TFPATH  $pid < TFPATH/tmp_$pid");
system ("GraphvizDot -Tsvg -o TFPATH/$pid.svg TFPATH/$pid.dot");
system("CGIDIR/SCL_CGI/MT/prog/kAraka/add_hidden_sub.pl < TFPATH/tmp.svg");

system("rm TFPATH/tmp_$pid");
system("rm TFPATH/tmp.svg");
