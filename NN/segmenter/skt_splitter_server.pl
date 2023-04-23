#!/usr/bin/env perl

require "../../paths.pl";

$daemon_running=1;
#Start Apertium Morph Daemon, if not already started
if (! -p "$GlblVar::TFPATH/skt_splitter_to") { $daemon_running=0;}
if (-e "$GlblVar::TFPATH/skt_splitter_to") { $daemon_running=0;}
#   print "1 daemon_running = $daemon_running\n";
if (! -p "$GlblVar::TFPATH/skt_splitter_from" ) { $daemon_running=0;}
#   print "2 daemon_running = $daemon_running\n";
if (! -s "$GlblVar::TFPATH/skt_splitter_daemonid") { $daemon_running=0;}
#   print "3 daemon_running = $daemon_running\n";
if (-s "$GlblVar::TFPATH/skt_splitter_daemonid"){
   open(TMP,"<$GlblVar::TFPATH/skt_splitter_daemonid") || die "Can't open $GlblVar::TFPATH/skt_splitter_daemonid for reading\n";
   @dpids = <TMP>;
   close(TMP);
   foreach $dpid (@dpids) {
      $t=`ps h -p $dpid`;
      if ($t eq "") { $daemon_running=0; }
   }
}
# When /tmp/to /tmp/from and /tmp/morph_daemonid exists but the lt-proc is not running, then this programme can not detect such processes, and these are to be killed manually.
#print "4 daemon_running = $daemon_running\n";
 
if(!$daemon_running){
   if (-p "$GlblVar::TFPATH/skt_splitter_to") { `rm $GlblVar::TFPATH/skt_splitter_to`;}
   if (-e "$GlblVar::TFPATH/skt_splitter_to") { `rm $GlblVar::TFPATH/skt_splitter_to`;}
   if (-p "$GlblVar::TFPATH/skt_splitter_from") { `rm $GlblVar::TFPATH/skt_splitter_from`;}
   if (-s "$GlblVar::TFPATH/skt_splitter_daemonid"){
      open(TMP,"<$GlblVar::TFPATH/skt_splitter_daemonid");
        @dpids = <TMP>;
      close(TMP);
      foreach $dpid (@dpids) {
          $t=`ps h -p $dpid`;
          if ($t ne "") { `sudo kill -9 $dpid`;}
      }
      `rm $GlblVar::TFPATH/skt_splitter_daemonid`;
    }
    #system("nohup $GlblVar::SCLINSTALLDIR/NN/segmenter/skt_splitter_server.sh > /dev/null &");
    system("nice $GlblVar::SCLINSTALLDIR/NN/segmenter/skt_splitter_server.sh > /dev/null &");
    #print "Skt Morph Daemon Successfully started\n";
} else {
  #print "Skt Morph Daemon is already running\n";
}
