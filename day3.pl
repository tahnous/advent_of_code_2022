#!/usr/bin/perl

use strict;
use warnings;
use v5.36;

my $item_priority_sum = 0;
my $i = 1;
my %items_priority = map { $_ => $i++ } ('a' .. 'z','A' .. 'Z');
my @items;

while(<>) {
    push @items,$_;
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

sub get_rucksacks_group_badge {
    my($rucksacks1, $rucksacks2, $rucksacks3) = @_;
    my ($group_badge_candidates,$group_badge);

    foreach my $item  (split('',$rucksacks1)) {
	if ($rucksacks2 =~ /$item/ and $rucksacks3 =~ /$item/ ) {
	    $group_badge = $item;
	    last;
	}
    }

    return $group_badge;
}

my $item_badge_sum = 0;
for (my $i = 0; $i < @items; $i += 3) {

    $item_badge_sum +=
	$items_priority{get_rucksacks_group_badge($items[$i],$items[$i+1],$items[$i+2])};
}

say $item_badge_sum;
