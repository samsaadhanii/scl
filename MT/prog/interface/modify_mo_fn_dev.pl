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



sub modify_mo{
 my($in) = @_;
 if($in) {
  $in =~ s/<वर्गः:अव्य्>/ अव्य/g;
  $in =~ s/<वर्गः:[^>]+>//g;
  $in =~ s/<कृत्_प्रटिपडिक:[^>]+>//g;
  $in =~ s/<कृत्_व्र्ब_र्ट्:[^>]+>//g;
  $in =~ s/<वचनम्:([^>]+)>/ $1/g;
  $in =~ s/<लिङ्गम्:अ>/ /g;
  $in =~ s/<लिङ्गम्:([^>]+)>/ $1/g;
  $in =~ s/<विभक्तिः:([^>]+)>/ $1/g;
  $in =~ s/<तोर्ड्:[^>]+>//g;
  $in =~ s/<गणः:?([^>]+)>/ $1/g;
  $in =~ s/<पदी::?([^>]+)>/ $1/g;
  $in =~ s/<धातुः([^>]+)>/ /g;
  $in =~ s/<प्रत्ययः:([^>]+)>/ $1/g;
  $in =~ s/<प्रयोगः:([^>]+)>/ $1/g;
  $in =~ s/<पुरुषः:([^>]+)>/ $1/g;
  $in =~ s/<लकारः:([^>]+)>/ $1/g;
  $in =~ s/<रेल्_न्म्:([^>]*)>//g;
  $in =~ s/<रेलट_पोस्:[0-9]*>//g;
  if ($in !~ /उपसर्ग:ध्/) {
    $in =~ s/\/([^<]+-)?([^\-<]+)<उपसर्ग:([^>]+)>/\/$1$3_$2/g;
    $in =~ s/^([^<]+-)?([^\-<]+)<उपसर्ग:([^>]+)>/$1$3_$2/g;
  } else { $in =~ s/<उपसर्ग:ध्>//;}
  $in =~ s/\/([^<]+)<उपपद_च्प्:([^>]+)>/\/$1-$2/g;
  $in =~ s/^([^<]+)<उपपद_च्प्:([^>]+)>/$1-$2/g;
  $in =~ s/ [ ]+/ /g;
  $in =~ s/\$//g;
  $in =~ s/{TITLE}/<TITLE>/g;
  $in =~ s/{\/TITLE}/<\/TITLE>/g;
  $in =~ s/\/\t/\t/g;
  $in;
 }
}
1;
