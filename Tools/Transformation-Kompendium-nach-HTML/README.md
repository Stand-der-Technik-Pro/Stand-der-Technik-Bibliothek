# Transformation Kompendium nach HTML

Diese beiden Skripte erlauben die Konvertierung der XML-Version des Kompendiums in einfach lesbare HTML-Versionen

## 📄 html-komp.xsl

Hiermit wird eine Version erzeugt, in der jede Praktik als eigene Tabelle dargestellt wird. Angereichert wird dies durch ein paar statistische Daten.

Mögliche Nutzung mit Saxon:

java -jar "SaxonHE12-9J/saxon-he-12.9.jar" "-xsl:html-komp.xsl" "-s:Grundschutz++-Kompendium.xml" "-o:GS++Komp_2025.html" -t

## 📄 html-table.xsl

Hiermit wird eine Version erzeugt, in der alle Anforderungen in einer Tabelle dargestellt werden.

Mögliche Nutzung mit Saxon:

java -jar SaxonHE12-9J/saxon-he-12.9.jar "-xsl:html-table.xsl" "-s:Grundschutz++-Kompendium.xml" "-o:GS++Tabelle_2025.html" -t

