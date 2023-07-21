#!/usr/local/bin/perl -w


#use v5.32;
#use strict;
#use warnings;
#use utf8;



#hierbei werden die Parameter aber ab 0 nummeriert, also $ARGV[0], $ARGV[1] usw.

if(exists($ARGV[0])){
	print "$ARGV[0] existiert\n";		
} else{
	print "$ARGV[0] existiert nicht\n";	 
}



my $RC;
my $i =0;
my $cmd;
my $vorname;
my $name;
my $unbekannte_varialble_1;
my $unbekannte_varialble_2;
my $verein;
my $rang;
my $rennen;
my $unbekannte_varialble_3;
my $unbekannte_varialble_4;
my $info_lauf;
my $info_rennen;
my $line;
my $ausgabedatei;
my @line;


# externe Datei öffnen
#open(RENNEN,"<Männlich Jungend Junioren K1.txt") or die "Kann die Datei Männlich Jungend Junioren K1.txt nicht öffnen$!\n";
open(URKUNDEN,"<$ARGV[0]") or die "Kann die Datei urkunden.txt nicht öffnen$!\n";

# Zeilenweise die Datei ".$ARGV[0]." einlesen
	
# Die Datei Männlich ".$ARGV[0]." in Einzelwerte zerlegen.
# 	"Julian","WINDISCH","","","MTV Luhdorf-Roydorf","Herren LK C1","1","","","3. Lauf zur Landesmeisterschaft","Landesmeisterschaftsfinale"
while($line=<URKUNDEN>){
	@line=split /,/,$line;
    
	# Den Variablen sprechende Namen geben
	(my $vorname,
	$name,
	$unbekannte_varialble_1,
	$unbekannte_varialble_2,
	$verein,
	$rennen,
	$rang,
	$unbekannte_varialble_3,
	$unbekannte_varialble_4,
	$info_lauf,
	$info_rennen)=@line;

	$i++;

	$rang =~ tr/"//d;		
	$name =~ tr/"//d;
	$vorname =~ tr/"//d;
	$verein =~ tr/"//d;
	$info_lauf =~ tr/"//d;
	$info_rennen =~ tr/"//d;
	$rennen =~ tr/"//d;	
	
	print $vorname."\n";

	tex_erstellen($rang, $name, $vorname, $verein, $rennen, $i);
	
	# PDF Datei aus TEX Datei erzeugen
	system("pdflatex $i.tmp.tex");
	#$RC = system($cmd);
	#print "returncode was $RC\n";
	
	# PDF Datei mit Hintergrund verschmelzen
	system("pdftk $i.tmp.pdf multistamp kfwg_2022.pdf output $i.urkunde.pdf");
	#$RC = system($cmd);
	#print "returncode was $RC\n";
	
	# Überflüssige Dateien löschen
	# kann zur Fehlersuche auskommentiert werden
	unlink("$i.tmp.log");
	unlink("$i.tmp.aux");
	unlink("$i.tmp.tex");
	unlink("$i.tmp.pdf");
}


# Alle Urkunden in eine Datei alle.pdf packen
system("pdftk *urkunde.pdf cat output $ARGV[0].pdf");

################################################################################
#
# Funktionsname: tex_erstellen
# Erstellungsdatum:	11.08.2022
# Erstellt von: Klaus Bluemel
#
# Beschreibung: Erzeugt eine Texdatei fuer die Erstellung von Siegerurkunden
#
################################################################################


sub tex_erstellen {
	# Den Variablen sprechende Namen geben
	my $rang 	= $_[0];
	my $name 	= $_[1];
	my $vorname = $_[2];
	my $verein 	= $_[3];
	my $rennen 	= $_[4];
	#my $lauf = $_[4];
	#my $rennen = $_[5];
	my $i 		= $_[5];
	
	print $rang;
	# Ausgabe Datei erzeugen
	open(OUTPUT,">$i.tmp.tex") or die "Kann die Datei $rang.tmp.tex nicht öffnen$!\n";	
	
	# TEX Formatierung erzeugen
	print OUTPUT "\\documentclass[12pt,a4paper]{article} \n";
	print OUTPUT "\\usepackage[ansinew]{inputenc} \n";
	print OUTPUT "\\usepackage[T1]{fontenc} \n";
	print OUTPUT "\\usepackage{color} \n";
	print OUTPUT "\\usepackage{vmargin} \n";
	print OUTPUT "\\setpapersize{A4} \n";
	print OUTPUT "\\setmargnohfrb{26mm}{0mm}{0mm}{0mm} \n";
	print OUTPUT "\\begin{document} \n";
	print OUTPUT "\\vspace*{125mm} \n";
	print OUTPUT "\\center {\\Huge \\bf $rang. Platz} \\hspace*{20mm} \n\n\n";
	print OUTPUT "\\vspace*{40mm} \n";
	print OUTPUT "\\center {\\Huge \\bf $rennen} \\hspace*{20mm} \n";	
	print OUTPUT "\\center {\\Huge \\bf $name $vorname} \\hspace*{20mm} \n\n\n";
	print OUTPUT "\\center {\\Huge  $verein} \\hspace*{20mm} \n";
	print OUTPUT "\\end{document} \n";
	
	close OUTPUT;
}
