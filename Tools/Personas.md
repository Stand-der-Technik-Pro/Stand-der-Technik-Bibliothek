# Persona - Tools

## Zielsetzung

Diese Datei soll es Interessierten ermöglichen schnell passende Toolvorschläge für ihren Umgang mit der Stand der Technik Bibliothek zu machen.
Die Datei lebt von den Contributionen aller Beteiligten. Wenn also entsprechende Tools identifiziert werden, können diese gerne hinzugefügt werden (PR).
Sofern jemand ein konkretes Problem hat, für das er kein Tool in dieser Liste findet, kann er einen Issue aufmachen.

## Struktur

* Titel der Persona
* Beschreibung der Persona
* Liste der Usecases und der möglichen Tools

## Persona: Provider

Auch: Regulierer, Hersteller

### Beschreibung Provider

Die Provider-Persona stellt anderen Nutzern (Auditoren, Automatisierern, Beratern) Quellinformationen zur Verfügung, auf deren Basis diese ihre Tätigkeiten durchführen können.

### Usecases und Tools Provider

|Usecase|Tool|
|---|---|
|Erstellt und Editiert Kataloge (bspw. GS++ Katalog)||
|Selektieren von relevanten Requirements aus einem Katalog und Festlegung der Abdeckung für eigene Produkte||
|Definieren technischer Regeln/Prüfungen für eigene Produkte||
|Konsumieren von Regulatorik (bspw. GS++ Katalog) als Basis für eigene Kataloge/Spezifizierungen|[HTML-Viewer](tbd), [OSCAL-Viewer](https://viewer.oscal.io/)|
|Erstellen von Mappings von Quell-Katalogen auf technische Regeln/Prüfungen||

## Persona: Auditor

### Beschreibung Auditor

Der Auditor prüft die Abdeckung und Implementierung von Anforderungen in einem Unternehmen. Er nutzt hierfür Beweise, die auf Basis von Dokumentationen vorliegen (bspw. Prozessbeschreibungen) und aus technischen Systemen automatisiert erzeugt wurden.

### Usecases und Tools Auditor

|Usecase|Tool|
|---|---|
|Prüfung durchführen||
|Konsumieren von Regulatorik (bspw. GS++ Katalog, oder Produktspezifische Regelsätze)| [HTML-Viewer](tbd), [OSCAL-Viewer](https://viewer.oscal.io/)|
|Konsumieren von automatisierten Prüf-Ergebnissen der technischen Systeme||

## Persona: Automatisierer

Auch: System Owner, Operator/Administrator, DevSecOps/System Engineer, Control Assessor

### Beschreibung Automatisierer

Der Automatisierer ist eine übergreifende Persona, die versucht sicherzustellen, dass möglichst viele Artefakte, die für ein kontinuierliches Erzeugen von Prüfnachweisen notwendig sind, automatisiert erzeugt werden. Dies umfasst insbesondere die technische Prüfung von Systemen.

### Usecases und Tools Automatisierer

|Usecase|Tool|
|---|---|
|Konsumieren von Regulatorik (bspw. GS++ Katalog, oder Produktspezifische Regelsätze)| [HTML-Viewer](tbd), [OSCAL-Viewer](https://viewer.oscal.io/)|
|Konsumieren von Implementierungsplänen||
|Prüfen der Formate für die technische Implementierung| [utf8-checks](./check_utf8_encoding.py), [utf8-bom-check](./check_utf8_bom.py)|
|Implementieren von CI/CD Pipelines|[github-actions](../.github/workflows), [gitlab-ci](tbd)|
|Implementieren von technischen Prüfungen für IT-Systeme||
|Erzeugen von Prüfergebnissen der technischen System-Prüfung||
|Erzeugen von Prüf-Profilen für die IT-Systeme||

## Persona: Berater

Auch: CISO (interne Audit-Instanz)

### Beschreibung Berater

Der Berater ist Zwischenschicht zwischen dem Automatisierer (System-Spezialist), dem potentiell Wissen rund um die Regulatorik fehlt, und den Providern. Er verbindet die Regulatorik mit der tatsächlichen Umsetzung. Hierzu priorisiert er Maßnahmen auf Basis der entsprechenden Risiken und unterstützt Automatisierer mit seinem Verständnis rund um die Regulatorik.

### Usecases und Tools Berater

|Usecase|Tool|
|---|---|
|Konsumieren von Regulatorik (bspw. GS++ Katalog, oder Produktspezifische Regelsätze)| [HTML-Viewer](tbd), [OSCAL-Viewer](https://viewer.oscal.io/)|
|Erzeugen von Implementierungsplänen||
|Definieren der Erfüllung der Regulatorik (Bspw. GS++ Katalog)||
|Definieren der Compliance-Relevanten Parameter (Schutzbedarf, relevante Maßnahmen)||
|Erzeugen und Definieren von Prüf-Profilen für IT-Systeme||
|Definieren des Implementierungs-Plans||
