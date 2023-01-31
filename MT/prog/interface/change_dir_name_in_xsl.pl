#!/usr/bin/env perl

#  Copyright (C) 2008-2023 Amba Kulkarni (ambapradeep@gmail.com)
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


=pod

=head1 change_dir_name_in_xsl.pl

change_dir_name_in_xsl.pl is needed to change the name of the directory in the xml file.
Since I do not know how to pass parameters to an xslt program, this script is written.

=head1 Usage

./change_dir_name_in_xsl.pl < input_file > output_file

=head1 DESCRIPTION

The name is generated as tmp_anu_dir which is later substituted by the correct path.
When xslt is replaced by a perl program, this program would not be required.

=head1 AUTHORS

Amba Kulkarni ambapradeep@gmail.com

Copyright 2009-2011
=cut

while($in = <STDIN>){
  $in =~ s/tmp_dir_scrpt/$ARGV[0]\&amp;outscript=$ARGV[1]/g;
  $in =~ s/tmp_anu_dir/$ARGV[0]/g;
  print $in;
}
