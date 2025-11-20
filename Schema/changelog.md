Date|Remarks
----|-------
20.11.2025|OSCAL Schemata der NIST hinzugefügt
20.11.2025|UTF-8 Signatur (BOM) und XML-Deklaration hinzugefügt

Warum? Die UTF-8 BOM ersetzt hier in unserem Kontext das optionale Encoding-Feature bei XML in der Deklaration, weil das XML-Encoding beim Konvertieren auch für JSON und YAML per File-Defintion sicherzustellen ist. Die Deklaration sollte nach https://www.w3.org/TR/REC-xml/#sec-pi angegeben sein, weil es verschiedene XML Versionen gibt. Ich gehe hier von XML/XSD-Version 1.0 aus. Ohne solche Angaben entscheidet der Parser welche Version und welches Encoding zum Einsatz kommt.

- Dokumentiert ist XSD 1.1: https://pages.nist.gov/OSCAL/learn/concepts/layer/overview/

Im Mainstream einer Sprachkultur, die bspw. keine Umlaute kennt, mag das zunächst nicht als problematisch empfunden werden. Im Range von US-ASCII, UTF-8 und UTF-16 sehe ich darin eine Möglichkeit das Encoding per Definition abzusichern. Insbesondere deshalb, weil YAML und JSON nach meinem Kennisstand derartige Format-Eigenschaften für die Definition des Encodings nicht kennen.

Date|Remarks
----|-------
20.11.2025|SemVer-Pattern für Versionsfelder hinzugefügt

Gesprochen wird von Semantic Versioning bei der NIST und auch darauf referenziert: https://pages.nist.gov/OSCAL/learn/tutorials/general/releases/. Im XSD gibt es dazu aber kein Pattern. Pattern von https://semver.org übernommen und auf XSD Kompatibilität geachtet. Das heißt: 

- ohne Anchors
- ohne non-capturing groups und
- `0-9` statt `d`. 
 
Vgl. dazu: https://www.w3.org/XML/2008/03/xsdl-regex/re.xml

Ein gültiger SemVer-String ist bspw: `0.113.0-alpha.2+branch.develop.sha.52ca1738646d386aff89bbe672df32500df85082.3.8.development.12131`

Schon beobachtet, dass man auf die Patch-Version häufig verzichtet. Gelegentlich auch auf die Minor-Version. Solche Version-Strings wären dann mit dem Pattern ungültig. Strings wie oben als Musterbeispiel ermöglichen eine vollständig durchorgansierte maschinelle Verarbeitung in Verbinung mit Git.