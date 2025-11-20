Date|Remarks
----|-------
20.11.2025|OSCAL Schemata der NIST hinzugefügt
20.11.2025|UTF-8 Signatur (BOM) und XML-Deklaration hinzugefügt

Warum? Die UTF-8 BOM ersetzt hier in unserem Kontext das optionale Encoding-Feature bei XML in der Deklaration, weil das XML-Encoding beim Konvertieren auch für JSON und YAML per File-Defintion sicherzustellen ist. Die Deklaration sollte nach https://www.w3.org/TR/REC-xml/#sec-pi angegeben sein, weil es verschiedene XML Versionen gibt. Ich gehe hier von XML/XSD-Version 1.0 aus. Ohne solche Angaben entscheidet der Parser welche Version und welches Encoding zum Einsatz kommt. Im Mainstream einer Sprachkultur, die bspw. keine Umlaute kennt, mag das zunächst nicht als problematisch empfunden werden. Im Range von US-ASCII, UTF-8 und UTF-16 sehe ich darin eine Möglichkeit das Encoding per Definition abzusichern. Insbesondere deshalb, weil YAML und JSON nach meinem Kennisstand derartige Format-Eigenschaften für die Definition des Encodings nicht kennen.

Date|Remarks
----|-------
