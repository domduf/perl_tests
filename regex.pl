#!/usr/bin/env perl

use strict;

use warnings;

print "entrez une chaine\n";
my $chaine = <>;
chomp $chaine;

#my $chaine= "salut ça va 234 ?";
my $reg;
my $resultat;
my $boucle = "";

while ( $boucle eq "" ){
	print "entrez la regex : \n";
	$reg = <>;
	chomp $reg;

	
	$resultat = ( $chaine =~  m/$reg/ ); #m/$reg/

	print "chaine: ".$chaine."\n".
	"regex: \"".$reg."\"\n";
	
	# affichage du resultat
	(print "resultat: ".$resultat."\n") if ( $resultat ne "" );


	print "\nAppuyez sur une touche differente de ENTREE pour sortir,\net sur 'a' pour changer la chaine à tester\n";
	$boucle = <>;
	chomp $boucle;

	if ($boucle eq "a") {
		$boucle = "";
		print "Entrez la nouvelle chaine à tester : \n";
		$chaine = <>;
		chomp $chaine;
	}


	 
}

