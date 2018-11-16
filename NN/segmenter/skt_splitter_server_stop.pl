#!/usr/bin/env perl

require "../../paths.pl"

$daemon_running=0;
#Start Apertium Morph Daemon, if not already stoped
if (-p "$GlblVar::TFPATH/skt_splitter_to") { $daemon_running=1;}
#   printf "1 daemon_running = $daemon_running\n";
if (-p "$GlblVar::TFPATH/skt_splitter_from" ) { $daemon_running=1;}
#   printf "2 daemon_running = $daemon_running\n";
if (-s "$GlblVar::TFPATH/skt_splitter_daemonid"){
   open(TMP,"<$GlblVar::TFPATH/skt_splitter_daemonid");
   @dpids = <TMP>;
   close(TMP);
   foreach $dpid (@dpids) {
      $t=`ps h -p $dpid`;
      if ($t ne "") { $daemon_running=1; }
   }
}
# When /tmp/to /tmp/from and /tmp/morph_daemonid exists but the lt-proc is not running, then this programme can not detect such processes, and these are to be killed manually.
#printf "4 daemon_running = $daemon_running\n";
 
if($daemon_running){
   if (-p "$GlblVar::TFPATH/skt_splitter_to") { `rm $GlblVar::TFPATH/skt_splitter_to`;}
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
    printf("Skt Morph Splitter Daemon Successfully stopped\n");
} else {
  printf("There is no process: Skt Morph Splitter Daemon\n");
}
