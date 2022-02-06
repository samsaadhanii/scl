#!/usr/bin/env perl

while($in = <STDIN>){

$in =~ s/ aXaH aXah / aXoZXaH /;
$in =~ s/ aWa ki[mM] / aWakim /;
$in =~ s/ aWa vA / aWavA /;
$in =~ s/ Aho sviw / Ahosviw /;
$in =~ s/ iwaH para[mM] / iwaHparam /;
$in =~ s/ ce[wx] api / cexapi /;
$in =~ s/ san api / sannapi /;
$in =~ s/ eva[mM] ca / evaFca /;
$in =~ s/ eva[mM] eva / evameva /;
$in =~ s/ uwa aho / uwAho /;
$in =~ s/ uwa Aho sviw / uwAhosviw /;
$in =~ s/ upari upari / uparyupari /;
$in =~ s/ ki[mM] api / kimapi /;
$in =~ s/ ki[mM] arWa[mM] / kimarWam /;
$in =~ s/ ki[mM] ca / kiFca /;
$in =~ s/ ki[mM] vA / kiMvA /;
$in =~ s/ ki[mM] uwa / kimuwa /;
$in =~ s/ ki[mM] u / kimu /;
$in =~ s/ ki[mM] afga / kimafga /;
$in =~ s/ kim punar / kimpunar /;
$in =~ s/ waWA hi / waWAhi /;
$in =~ s/ waWA iwi / waWewi /;
$in =~ s/ na ca / naca /;
$in =~ s/ na hi / nahi /;
$in =~ s/ no cew / nocew /;
$in =~ s/ prawi uwa / prawuwa /;
$in =~ s/ yaw sawyam / yawsawyam /;
$in =~ s/ yaWA yaWam / yaWAyaWam /;
$in =~ s/ yax vA / yaxvA /;
$in =~ s/ yaxi api / yaxyapi /;
$in =~ s/ warhi api / warhyapi /;
$in =~ s/ warhi eva / warhyeva /;

print $in;
}
