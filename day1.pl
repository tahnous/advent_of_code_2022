#!/usr/bin/perl

use strict;
use warnings;
use v5.36;

my $i = 1;
my %elf_food_calories;
while (<>) {
    if ($_ eq "\n") {
	$i++;
	next;
    }
    $elf_food_calories{$i} += $_ unless $_ eq "\n";

}
my @a;
@a  = (sort {$b <=> $a} values %elf_food_calories);

# Find the Elf carrying the most Calories. How many total Calories is that Elf carrying
say $a[0];

# Find the top three Elves carrying the most Calories. How many Calories are those Elves carrying in total
say $a[0] + $a[1] + $a[2];
