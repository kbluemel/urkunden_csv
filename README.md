# urkunden_csv
Erstellen von Urkunden aus CSV exportierten Daten von Siwidata Canoe123
Ziel: Erstellen von Urkunden für das Programm Canoe123 von Siwita

Das Script ua.pl ist in Perl geschrieben, folglich mus PERL auf den Rechner installiert sein.
Für Windows empfehle ich Strawberry Perl von https://strawberryperl.com/. Die Software ist kostenfrei.

Das Script ua.pl (Urkunden Ausgabe) liest csv Dateien ein, welche von Canoe123 exportiert wurden. Der Aufruf >>ua.pl Rennen26.txt<< erzeugt
z.B. aus der csv Datei Rennen26.txt die Urkunden für die einzelnen Plätze und ein Datei mit allen Uhrkunden.

Das Script separiert aus der CSV Datei die benötigten Werte und erzeugt eine Datei im TEX Format. TEX erzeugt aus dieser Datei eine formatierte PDF Datei. Dazu
muss auf dem Rechner TEX installiert sein. TEX ist ein 37 Jahre altes Textsatzprogramm, welches weit über die Möglichkeit von Word hinaus geht und zu 
einem der besten und komplexesten Programme überhaupt gehört. Für Windows empfehle ich MIKTEX https://miktex.org/ in der Grundversion. Wer alles installiert,
hat hinterher ein Paar Gigabyte weniger auf Rechner. Wer behauptet, dass die Verwundung von TEX für drei Zeilen Text so ist, wie mit 
einer Containerflotte ein Bötchen abzuholen, dem gebe ich recht. Aber es funktioniert und ich kenne keine einfachere Variante. Die Software ist kostenfrei.

Danach werden die erzeugten PDF Dateien mit der Scriptsammlung PDFTK mit dem Hintergrund (KFWG_2022.pdf) zu den Urkunden 
vereinigt. Danach werden alle Urkunden zusätzlich zu einer PDF Datei zusammen gefasst. PDFTK ist ein genials Tool für alles was mit der 
Verarbeitung von PDFs zu tun hat.  Z.B macht der Kommandozeilenbefehl >>pdftk *.pdf cat output alle.pdf<< bei Bedarf aus 
1000 PDF Dateien eine mit dem Namen >>alle.pdf<<. Die Software ist kostenfrei. Zu finden unter https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/.

Für einen Windowsbenutzer sieht das alles sehr kompliziert aus, diese Verfahren ist aber auf Unix Systemen gang und gebe. Unter Linux laufen vom System aus 
hunderte von Perl Scripte, welche weitere spezialisierte Programme wie SED, AWK etc. für ihre Zwecke verwenden, um das System am Laufen zu halten.

Für die Ausführung des Scriptes braucht man keine Kenntnisse von PERL, TEX oder PDFTK, schaden tun sie aber auch nicht. 

Für Manschaften muss das Script noch angepasst werden.



Viel Spaß

Klaus Blümel 21.07.2023
