#!/usr/bin/env perl

use strict;

use warnings;



# declaration des variables
my $chaine;
my $reg;
my $resultat;
my $boucle = "";
my $bascule = -1;




while ( $boucle eq "" ){



	if ($bascule < 0 or $bascule == 1) {

		#------CHAINE à TESTER -----
		(print "-MODE REGEX (on change la chaine)\n"."/".$reg."/\n")if ($bascule ==1);
		print "entrez une chaine\n";
		$chaine = <>;
		chomp $chaine;
	}

	if ($bascule < 0 or $bascule == 0) {
		#---------- REGEX ----------
		(print "-MODE CHAINE (on change la regex)\n".$chaine."\n" )if ($bascule == 0);		
		print "entrez la regex : \n";
		$reg = <>;
		chomp $reg;
	}



	#--- CALCUL DU RESULTAT ----
	$resultat = ( $chaine =~  m/$reg/ ); #m/$reg/


	#---- AFFICHAGE ------------
	print "chaine: ".$chaine."\n".
	"regex: /".$reg."/\n";
	
	# affichage du resultat
	(print "resultat: ".$resultat."\n") if ( $resultat ne "" );

	$bascule= abs($bascule);


	#----- MENU ----------------

	print "------------------------------------------\n";
	print "-MODE CHAINE " if ($bascule == 0);
	print "-MODE REGEX " if ($bascule ==1);
	print "\n- a pour changer le mode de saisie.\n";
	print "- autre touche pour sortir.\n";
	print "Appuyez sur ENTREE\n";

	print "------------------------------------------\n";

	$boucle = <>;
	chomp $boucle;

	if ($boucle eq "a") {
		$boucle = "";
		$bascule = abs($bascule-1);
	}
	
	 
}

