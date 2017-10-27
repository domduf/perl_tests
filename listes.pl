#!/usr/bin/perl

use strict;

use warnings; 

my @tableau =("Dom","Sophie","Aglaé","Barbara");
my $v;

print "salut\n";

print "indice MAX tableau; ".($#tableau)."\n";



for (my $var = 0; $var < $#tableau+1; $var++) {
  print " longueur ".
  $tableau[$var].": ".
  length($tableau[$var]).
  " caractères.\n";
}

foreach  $v (@tableau) {

  print " foreach--> $v longueur: ".length($v)."\n";
}

@tableau[4]= "Grigou";


foreach  $v (@tableau) {

  print " foreach--> $v longueur: ".length($v)."\n";
}


