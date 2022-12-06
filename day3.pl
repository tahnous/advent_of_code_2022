#!/usr/bin/perl

use strict;
use warnings;
use v5.36;

my $item_priority_sum = 0;
my $i = 1;
my %items_priority = map { $_ => $i++ } ('a' .. 'z','A' .. 'Z');

while(<>) {
    my $rucksack_len =  (length() - 1)/2;
    my @rucksacks = /.{$rucksack_len}/g;
    my (%items_rucksacks1,%items_rucksacks2);
    map{$items_rucksacks1{$_}++} (split('',$rucksacks[0]));
    map{$items_rucksacks2{$_}++} (split('',$rucksacks[1]));

    foreach my $item (keys %items_rucksacks2) {
	$item_priority_sum += $items_priority{$item}
	if $items_rucksacks1{$item};
    }
}

say $item_priority_sum;
