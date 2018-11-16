#!/usr/bin/env perl
use strict;
# Convert UTF-8 Devanagari text to ISCII Devanagari text

my $state = 0;
my $len = 0;
my $u;

my %table = (
	'2305' => "\xa1",
	'2306' => "\xa2",
	'2307' => "\xa3",
	# 2308
	'2309' => "\xa4",
	'2310' => "\xa5",
	'2311' => "\xa6",
	'2312' => "\xa7",
	'2313' => "\xa8",
	'2314' => "\xa9",
	'2315' => "\xaa",
	'2316' => "\xa6\xe9",	# Â¦Ã© letter vocalic l
	'2317' => "\xae",
	'2318' => "\xab",
	'2319' => "\xac",
	'2320' => "\xad",
	'2321' => "\xb2",
	'2322' => "\xaf",
	'2323' => "\xb0",
	'2324' => "\xb1",
	'2325' => "\xb3",
	'2326' => "\xb4",
	'2327' => "\xb5",
	'2328' => "\xb6",
	'2329' => "\xb7",
	'2330' => "\xb8",
	'2331' => "\xb9",
	'2332' => "\xba",
	'2333' => "\xbb",
	'2334' => "\xbc",
	'2335' => "\xbd",
	'2336' => "\xbe",
	'2337' => "\xbf",
	'2338' => "\xc0",
	'2339' => "\xc1",
	'2340' => "\xc2",
	'2341' => "\xc3",
	'2342' => "\xc4",
	'2343' => "\xc5",
	'2344' => "\xc6",
	'2345' => "\xc7",
	'2346' => "\xc8",
	'2347' => "\xc9",
	'2348' => "\xca",
	'2349' => "\xcb",
	'2350' => "\xcc",
	'2351' => "\xcd",
	'2352' => "\xcf",
	'2353' => "\xd0",
	'2354' => "\xd1",
	'2355' => "\xd2",
	'2356' => "\xd3",
	'2357' => "\xd4",
	'2358' => "\xd5",
	'2359' => "\xd6",
	'2360' => "\xd7",
	'2361' => "\xd8",
	# 2362 - 2363
	'2364' => "\xe9",	# nukta
	'2365' => "\xea\xe9",	# ÃªÃ© sign avagraha
	'2366' => "\xda",
	'2367' => "\xdb",
	'2368' => "\xdc",
	'2369' => "\xdd",
	'2370' => "\xde",
	'2371' => "\xdf",
	'2372' => "\xdf\xe9",	# ÃÃ© vowel sign vocalic rr
	'2373' => "\xe3",
	'2374' => "\xe0",
	'2375' => "\xe1",
	'2376' => "\xe2",
	'2377' => "\xe7",
	'2378' => "\xe4",
	'2379' => "\xe5",
	'2380' => "\xe6",
	'2381' => "\xe8",
	# 2382 - 2383
	'2384' => "\xa1\xe9",	# om
	'2385' => '?',		# stress sign udatta
	'2386' => "\xf0\xb8",	# Ã°Â¸ stress sign anudatta (uses EXT)
	# 2387 - 2391
	'2392' => "\xb3\xe9",	# Â³Ã© letter qa 
	'2393' => "\xb4\xe9",	# Â´Ã© letter khha 
	'2394' => "\xb5\xe9",	# ÂµÃ© letter ghha 
	'2395' => "\xba\xe9",	# ÂºÃ© letter za 
	'2396' => "\xbf\xe9",	# Â¿Ã© letter dddha 
	'2397' => "\xc0\xe9",	# ÃÃ© letter rha 
	'2398' => "\xc9\xe9",	# ÃÃ© letter fa 
	'2399' => "\xce",
	'2400' => "\xaa\xe9",	# ÂªÃ© letter vocalic rr 
	'2401' => "\xa7\xe9",	# Â§Ã© letter vocalic ll 
	'2402' => "\xdb\xe9",	# ÃÃ© vowel sign vocalic l 
	'2403' => "\xdc\xe9",	# ÃÃ© vowel sign vocalic ll 
	'2404' => "\xea",	# danda
	'2405' => "\xea\xea",	# double danda (ARD)
	'2406' => "\xf1",
	'2407' => "\xf2",
	'2408' => "\xf3",
	'2409' => "\xf4",
	'2410' => "\xf5",
	'2411' => "\xf6",
	'2412' => "\xf7",
	'2413' => "\xf8",
	'2414' => "\xf9",
	'2415' => "\xfa",
	'2416' => "\xf0\xbf",	# Ã°Â¿ abbreviation sign (uses EXT)
	'8204' => "\xe8",	# Unicode ZWNJ -> ISCII HALANTA, iscii uses 2 halantas to show the halant explicitly; Added by AMBA

	'8205' => "\xd9",	# Unicode ZWJ -> ISCII INVisible
);

while ((my $c = getc) ne undef) {
	my $o = ord($c);
	if ($state == 0) {
		if ($o >= 0xc0) {
			$state = 1;
			if ($o >= 0xfe) {
				die "** Invalid initial byte\n";
			} elsif ($o >= 0xfc) {
				$len = 6;
			} elsif ($o >= 0xf8) {
				$len = 5;
			} elsif ($o >= 0xf0) {
				$len = 4;
			} elsif ($o >= 0xe0) {
				$len = 3;
			} else {
				$len = 2;
			}
			$u = $o & ((1 << (7 - $len)) - 1);
		} else {
			print "$c";
		}
	} else {
		if (($o & 0xc0) != 0x80) {
			die "** Invalid follow-up byte\n";
		} else {
			$u <<= 6;
			$u += ($o & 0x3f);
			--$len;
			if ($len <= 1) {
				$state = 0;
				#print "&#$u;";
				my $dev = $table{$u};
				if ($dev) {
					print "$dev";
				} else {
					#print "?"; by Amba
				}
			}
		}
	}
}

