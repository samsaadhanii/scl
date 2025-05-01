#!/usr/bin/perl

$sent_no = $ARGV[0];

while($in = <STDIN>) {
$in = "<sid:$sent_no>".$in;
#if($in !~ /<relata_pos:([0-9]+)\.([0-9]+)>/) {
#   $in =~ s/<relata_pos:/<to_id:$1><to_cid:$2>/;
#}
print $in;
}
