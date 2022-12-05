#!/usr/bin/perl

use strict;
use warnings;
use v5.36;

my %elf_rule =  (
    A => 'Rock',
    B => 'Paper',
    C => 'Scissors',
);

my %human_rule1 =  (
    X => 'Rock',
    Y => 'Paper',
    Z => 'Scissors',
);

my %score_shape =  (
    Rock     => 1,
    Paper    => 2,
    Scissors => 3,
);

my %round_score =  (
    lost  => 0,
    drawn => 3,
    won   => 6,
);

my %winner_mov_rules = (
    Rock     => 'Scissors',
    Paper    => 'Rock',
    Scissors => 'Paper',
);

my %loser_mov_rules = (
    Rock     => "Paper",
    Paper    => "Scissors",
    Scissors => "Rock"
);

my %human_rule2 =  (
    X => sub { return $winner_mov_rules{$elf_rule{$_[0]}}},
    Z => sub { return $loser_mov_rules{$elf_rule{$_[0]}}},
    Y => sub { return $elf_rule{$_[0]}},
);


sub round_result_human {

    my ($elf_mov,$human_mov) = @_;

    return 'won'  if ($elf_mov   eq $winner_mov_rules{$human_mov});
    return 'lost' if ($human_mov eq $winner_mov_rules{$elf_mov});
    return 'drawn';
}


my $total_score_pt1 = 0;
my $total_score_pt2 = 0;
while (<>) {

    my ($elf_strategy,$human_strategy) = split;
    my $elf_mov   = $elf_rule{$elf_strategy};
    my $human_mov = $human_rule1{$human_strategy};
    $total_score_pt1 +=
	$round_score{round_result_human($elf_mov,$human_mov)}
    +
	$score_shape{$human_rule1{$human_strategy}};

    $human_mov = $human_rule2{$human_strategy}->($elf_strategy);
    $total_score_pt2 +=
	$round_score{round_result_human($elf_mov,$human_mov)}
    +
	$score_shape{$human_rule2{$human_strategy}->($elf_strategy)};


}

say $total_score_pt1;
say $total_score_pt2;
