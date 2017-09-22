#!/usr/bin/env perl

use strict;

use warnings;

my @r = qw(Un programme Perl est 5 fois plus rapide a ecrire);
map { tr/A-Z/a-z/; s/\d//g; } @r;
foreach (sort grep !/^$/, @r) { print "$_\n"; }
