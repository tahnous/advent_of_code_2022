#!/usr/bin/perl

use strict;
use warnings;
use v5.36;

my $fully_contains_pair = 0;
my $ranges_overlap_pair = 0;
while(<>) {

    if (/(\d+)-(\d+),(\d+)-(\d+)/) {
	if    ($1 <= $3 and $4 <= $2) {$fully_contains_pair++}
	elsif ($3 <= $1 and $2 <= $4) {$fully_contains_pair++}
	elsif ($3 >= $1 and $2 >= $3) {$ranges_overlap_pair++}
	elsif ($4 <= $2 and $4 >= $1) {$ranges_overlap_pair++}
    }
}
#Part 1
say $fully_contains_pair;
#Part 2
say $fully_contains_pair + $ranges_overlap_pair;
