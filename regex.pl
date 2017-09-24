#!/usr/bin/perl

use strict;

use warnings; 

=head1
Ce script permet de tester facilement la validité
de vos regexp avant de le inclure dans vos programmes.

Vous avez le choix entre deux modes:

-le "REGEXP_mode" (mode par defaut) 
	on entre une regexp et cette dernière est mémorisée.
	chaque nouvelle entrée est une chaine de caractères 
	à tester

-le "CHAINE_mode" 
	permet d'entrer une chaine de caractères, les nouvelles
	entrées seront des regexp qui testeront cette chaine.

On bascule entre les modes après l'affichage du résultat 
du test en entrant la lettre "a"

Pour lancer un nouveau test, il suffit d'appuyer sur ENTREE

Bon test.

minique.duf@gmail.com

=cut



# declaration des variables
my $chaine;
my $reg;
my $resultat;
my $boucle = "";
my $bascule = -1;

# fonctions utiles
sub affiche_mode {
	my ($x) = @_ ;
	(print "-REGEXP_mode (on change la chaine)\n"."/".$reg."/\n")if ($x ==1);
	(print "-CHAINE_mode (on change la regex)\n".$chaine."\n" )if ($x == 0);		

}



# boucle principale
while ( $boucle eq "" ){


	affiche_mode($bascule);

	if ($bascule < 0 or $bascule == 1) {
		#------CHAINE à TESTER -----
		print "entrez une chaine\n";
		$chaine = <>;
		chomp $chaine;
	}

	if ($bascule < 0 or $bascule == 0) {
		#---------- REGEX ----------
		print "entrez la regex : \n";
		$reg = <>;
		chomp $reg;
	}



	#--- CALCUL DU RESULTAT ----
	$resultat = ( $chaine =~  m/$reg/ ); #m/$reg/


	#---- AFFICHAGE ------------
	print "----------------------------------------------------\n";
	print "----------------------------------------------------\n";

	print "chaine: ".$chaine."\n".
	"regex: /".$reg."/\n";
			
	# affichage du resultat
	if ($resultat ne "") {
		print "resultat: -->";
		print "$&<--\n";
		print "-> $1\n" if (defined($1));
		print "-> $2\n" if (defined($2));
		print "-> $3\n" if (defined($3));



	}
	print "- - - - - - - - RIEN - - - - - - - - - - - - - - - -\n" if ( $resultat eq "" );


	#----- MENU ----------------

	print "------------------------------------------\n";
	affiche_mode($bascule);
	print "- a pour changer le mode de saisie.\n";
	print "- autre touche pour sortir.\n";
	print "Appuyez sur ENTREE\n";

	print "------------------------------------------\n";

	$boucle = <>;
	chomp $boucle;

	# on passe au mode 1 si $bascule==-1
	$bascule= abs($bascule);

	# changement de mode demandé par l'utilisateur
	if ($boucle eq "a") {
		$boucle = "";
		$bascule = abs($bascule-1);
	}

	# confirmation de desir de sortir du script
	elsif ($boucle ne "") {
			print "Voulez vous vraiement sortir ?\n";
			print " ENTREE pour ANNULER\n";
			$boucle = <>;
			chomp $boucle;
		}
	
	 
}