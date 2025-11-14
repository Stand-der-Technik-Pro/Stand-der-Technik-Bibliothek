# Transformation Kompendium nach HTML

Diese beiden Skripte erlauben die Konvertierung der XML-Version des Kompendiums in einfach lesbare HTML-Versionen. Zur Ausführung wird eine JRE und die Saxon-Library (aktuell SaxonHE12-9J, erhältlich unter https://github.com/Saxonica/Saxon-HE/releases/download/SaxonHE12-9/SaxonHE12-9J.zip) benötigt. In den hier angegebenen Beispielen muss die Datei SaxonHE12-9J.zip in das Unterverzeichnis SaxonHE12-9J entpackt werden. Java unterstützt auch XML mit BOM in der Codierung von UTF-8.

## 📄 html-komp.xsl

Hiermit wird eine Version erzeugt, in der jede Praktik als eigene Tabelle dargestellt wird. Angereichert wird dies durch ein paar statistische Daten.

Mögliche Nutzung mit Saxon:
```shell
java -jar "SaxonHE12-9J/saxon-he-12.9.jar" "-xsl:html-komp.xsl" "-s:Grundschutz++-Kompendium.xml" "-o:GS++Komp_2025.html" -t
```

## 📄 html-table.xsl

Hiermit wird eine Version erzeugt, in der alle Anforderungen in einer Tabelle dargestellt werden.

Mögliche Nutzung mit Saxon:
```shell
java -jar SaxonHE12-9J/saxon-he-12.9.jar "-xsl:html-table.xsl" "-s:Grundschutz++-Kompendium.xml" "-o:GS++Tabelle_2025.html" -t
```
