#!/usr/bin/env perl

#  Copyright (C) 2010-2023 Amba Kulkarni (ambapradeep@gmail.com)
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
require "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/cgi_interface.pl";
require "$GlblVar::CGIDIR/$GlblVar::SCL_CGI/skt_gen/verb/gen_verb.pl";

package main;
#use CGI qw/:standard/;

## Usage:
# https://sanskrit.uohyd.ac.in/cgi-bin/scl/skt_gen/verb/verb_gen_json.cgi?vb=gam1_gamLz_BvAxiH_gawO&prayoga_paxI=karwari-parasmEpaxI&upasarga=-&encoding=WX&outencoding=Devanagari&mode=json
#prayoga_paxI:karwari-AwmanepaxI/karwari-parasmEpaxI/karmaNi/Nickarwari-AwmanepaxI/Nickarwari-parasmEpaxI
#upasarga:-/pra/ni/Af/ava/apa/...
#vb: list is available in scl/js_files/verb_gen.js

    my %param = &get_parameters();

      my $format = "web";
      my $word=$param{vb};
      my $prayoga_paxI=$param{prayoga_paxI};
      my $upasarga=$param{upasarga};
      my $encoding=$param{encoding};
      my $outencoding=$param{outencoding};

      if($param{mode} eq "json") { $format = "JSON";}

      if($outencoding eq "") { $outencoding="UTF8";}

      if($prayoga_paxI =~ /\-/) {
        ($prayoga,$paxI) = split(/-/,$prayoga_paxI,2);
      } else {$prayoga = $prayoga_paxI; $paxI="-";}

      $upasarga =~ s/Y/_/g;

        if($format eq "web") {
           &open_log($GlblVar::LOG, $GlblVar::TFPATH);
           &print_header();
        }

         if($format eq "JSON") {
           print "Access-Control-Allow-Origin: *\n";
           print "Content-type:text/html;-expires:60*60*24;charset:UTF-8\n\n";
         }

      #my $result = `$GlblVar::CGIDIR/$GlblVar::SCL_CGI/skt_gen/verb/gen_verb.pl $encoding $outencoding $prayoga $upasarga $word $paxI web`;
      #print $result;

      my @forms = &gen_verb_forms($encoding,$outencoding,$prayoga,$upasarga,$word,$paxI,$format);
      print @forms;

      if($format eq "web") {
           &register_log_and_close($GlblVar::LOG,$upasarga,$word,$prayoga,%ENV);
        }
