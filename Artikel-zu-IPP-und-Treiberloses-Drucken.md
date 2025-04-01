---
title: "Artikel: Was Entwickler, Nerds und Admins über IPP wissen sollten"
layout: default
created: PLACEHOLDER_CREATED_DATE
createdlink: PLACEHOLDER_CREATED_LINK
lastmod: PLACEHOLDER_LASTMOD_DATE
commitlink: PLACEHOLDER_COMMIT_LINK
---


# **Was IT-Entwickler, -Nerds und -Administratoren über IPP wissen sollten**

## **Einleitung**

Drucken hat sich in den letzten Jahrzehnten stark verändert.
Früher waren Drucker und ihre Treiber zwei getrennte Systeme.
Drucker waren "dumme" Geräte, die keine eigenen Informationen über sich selbst wussten oder preisgeben konnten.
Administratoren mussten vor der ersten Nutzung Handbücher lesen, den passenden Druckertreiber finden, herunterladen und installieren.
Ohne diesen Treiber wusste das Betriebssystem nichts über das Druckgerät.

Mit dem **Internet Printing Protocol (IPP)** änderte sich das grundlegend.
Moderne Drucker sind in der Lage, sich selbst zu identifizieren und auf Anfrage ihre Eigenschaften detailliert zu berichten.
Druckertreiber sind nicht mehr zwingend erforderlich.
IPP ermöglicht eine standardisierte Kommunikation zwischen Clients und Druckern über das Internet oder lokale Netzwerke -- alleine aufgrund der eingebauten Selbstauskunft der Drucker über ihre spezifischen Eigenschaften.

In diesem kurzen Artikel erfahrt ihr, was IT-Entwickler, -Administratoren, -Nerds und -Poweruser an Grundlegendem über IPP wissen sollten.
Dabei vermeiden wir in seiner ersten Hälfte jeglichen Technik-Slang, so dass er auch für andere Computer-Nutzer interessant sein könnte.

Allerdings könnten in der zweiten Hälfte und vor allem im ***[Anhang](#Anhang)*** sogar die meisten Nerds noch auf ihre Kosten kommen.

---

## **1. Treiberloses Drucken – Die neue Druck-Architektur**

**1.1 Früher: Treiberabhängige Drucksysteme**

In klassischen Drucksystemen musste ein Administrator vorab den richtigen Druckertreiber installieren und einrichten.
Der Treiber war eine Software, die alle relevanten Informationen über das Druckgerät kennen musste.
Dazu gehörten:

- Unterstützte Papierformate
- Maximale Druckauflösung
- Verfügbare Druckmodi (Farbe, Schwarz-Weiß, Duplexdruck)
- Unterstützte Dokumentformate (PostScript, PCL, PDF usw.)

Der Treiber bereitete den Druckauftrag auf und wandelte die Daten in ein für den Drucker verständliches Format um.
Ohne Treiber war kein Drucken möglich.

**1.2 Heute: IPP und der Wandel zum treiberlosen Drucken**

Mit IPP hat sich diese Architektur grundlegend geändert.
Moderne IPP-fähige Drucker speichern ihre Fähigkeiten direkt im Gerät.
Auf Anfrage teilen sie diese Informationen dem Druck-Client mit.
Die Kommunikation läuft über die standardisierte **IPP-Operation "Get-Printer-Attributes"**.

Ein Client kann damit jederzeit nachfragen, jetzt in simples Deutsch übersetzt:

- Welche Papierformate sind verfügbar?
- Unterstützt der Drucker Duplexdruck?
- Welche Druckauflösungen kann er verarbeiten?
- Welche Dokumentformate versteht er direkt?

Da der Drucker diese Informationen bereitstellt, ist kein Treiber mehr von Nöten.
Die Client-Software ruft die Eigenschaften dynamisch ab und generiert den Druckauftrag genau dazu passend.

**1.3 Vorteile des treiberlosen Druckens mit IPP**

- Kein manuelles Installieren von Druckertreibern
- Weniger Administrationsaufwand in Unternehmen
- Automatische Erkennung von Druckereinstellungen
- Einheitliches Protokoll für alle Plattformen (Windows, Linux, macOS)
- Bessere Interoperabilität zwischen Druckern verschiedener Hersteller

---

## **2. IPP Everywhere – Das Standard-Protokoll für treiberloses Drucken**

**2.1 Die minimal unterstützten Dateiformate**

Mit *IPP Everywhere* hat sich nicht nur die Drucker-Kommunikation geändert, sondern auch die akzeptierten Druckaten-/Dokumenten-Formate.
IPP-Drucker MÜSSEN mindestens folgende Datei-Typen zum Druck annehmen:

- **JPEG** (für Bilder)
- **PWG-Raster** (ein standardisiertes Rasterformat für Drucker)
- **URF-Raster** (von Apple entwickeltes Rasterformat)

Optional dürfen Drucker auch **PDF** unterstützen -- und die meisten tun es heutzutage auch.

Client-Software muss sicherstellen, dass sie Druckdaten in mindestens einem dieser Formate liefern kann.
Dadurch entfällt die komplexe Konvertierung von Druckdaten, die früher die Treiber erledigen mussten.

**2.2 Vorteile von IPP Everywhere**

- Drucker müssen nur wenige Standard-Formate verarbeiten können
- Client-Software kann sich auf eine einheitliche Schnittstelle verlassen
- Administratoren müssen sich keinerlei Kopfzerbrechen mehr machen über geeignete Drucker-Treiber
- Weniger Inkompatibilitäts-Probleme zwischen Geräten verschiedener Hersteller

**2.3 Die erste Inkarnation von IPP Everywhere: *Airprint von Apple***

Während der Begriff "IPP Everywhere" nicht unbedingt sehr bekannt ist -- von *Apple Airprint* hat wohl jeder iPhone- oder iPad-Besitzer schonmal gehört.
In Wirklichkeit verbarg sich damals schon die Magie des *IPP Everyhwere*-Konzepts hinter der Sache.
Airprint war die erste populäre Implementierung von IPP Everywhere (dessen genaue Spezifikation damals zugegebenermaßen noch nicht final war, jedoch bereits seit Jahren in der Diskussion).

Apple preschte mit der Airprint-Veröffentlichung im November 2010 vor.
Dabei waren zunächst nur ganze 12 Geräte offiziell Airprint-fähig (alles HP PhotoSmarts).

Inzwischen können dies mehr als 10.000 verschiedene Modelle von mehr als einem Dutzend Hersteller.
Man muss seit mehr als 14 Jahren keinen Treiber mehr installieren, um Airprint-zertifizierte Drucker direkt verwenden zu können.
Es funktioniert.
Einfach so.

Seit 2010 ist praktisch kein neues Druckermodell mehr auf dem Consumer-Markt erschienen, bei dem der Hersteller nicht größten Wert darauf legte, dass sein Drucker genauso einfach benutzbar war.

Selbstverständlich, wie sollte es auch anders sein!, gab es in der IT-Welt und der Industrie einige Parteien, die in andere Richtungen zogen, und etwas abgeänderte Konzepte vorlegten. Damit haben wir heute mehrere Marken-Namen (und Spezifikationen, alle basierend auf IPP) für treiberloses Drucken:

- *Airprint*
- *Mopria*
- *WiFi Direct Print*
- *IPP Everywhere*

---

## **3. IPP – Wie funktioniert die Kommunikation?**

IPP basiert auf dem HTTP-Protokoll.
Jeder Druckauftrag ist eine HTTP-POST-Anfrage mit speziellen IPP-Daten.
Die wichtigsten IPP-Operationen sind:

### **3.1 Wichtige IPP-Operationen**

1. **Get-Printer-Attributes**
   - Fragt die Druckereigenschaften ab (Medien, Formate, Druckmodi).

2. **Print-Job**
   - Sendet einen Druckauftrag inklusive der zu druckenden Datei.

3. **Validate-Job**
   - Prüft, ob ein Druckauftrag mit den aktuellen Druckereinstellungen kompatibel ist.

4. **Get-Job-Attributes**
   - Ruft den Status eines laufenden oder abgeschlossenen Druckauftrags ab.

5. **Cancel-Job**
   - Bricht einen laufenden Druckauftrag ab.

6. **Pause-Printer / Resume-Printer**
   - Setzt einen Drucker in den Pause- oder Wiederaufnahme-Modus.

**3.2 HTTP und IPP**

IPP verwendet HTTP als Transportprotokoll.
Ein Drucker fungiert als HTTP-Server, der auf IPP-Anfragen antwortet.
Der Client (z. B. ein Computer oder Smartphone) sendet die IPP-Befehle als HTTP-POST-Anfragen.

Moderne IPP-Drucker unterstützen auch **HTTPS (ipps://)** für verschlüsselte Druckaufträge.

---

## **4. Sicherheitsaspekte bei IPP**

Da IPP über das Netzwerk läuft, sind Sicherheits-Vorkehrungen wichtig.
Besonders im Unternehmens-Umfeld lauern es potenzielle Risiken:

1. **Unverschlüsseltes Drucken kann man abhören**
   - Lösung: Immer `ipps://` (verschlüsselte IPP-Verbindung) nutzen.

2. **Zugriffskontrolle und Authentifizierung**
   - IPP unterstützt verschiedene Authentifizierungsmechanismen (z. B. Kerberos, Zertifikate).

3. **Schutz vor DNS-Rebinding-Angriffen**
   - Drucker sollten nur vertrauenswürdige Verbindungen akzeptieren.

4. **Sichere Druckaufträge (Secure Print)**
   - Dokumente können mit einem Passwort geschützt werden (`job-password`).

---

## **5. Drucker finden und ansprechen**

Ein IPP-Drucker lässt sich auf verschiedene Weise finden:

1. **Automatische Erkennung über Bonjour / mDNS**
   - Apple- und Linux-Systeme nutzen diese Methode zur Druckersuche.

2. **Manuelle Verbindung per IP-Adresse oder Hostname**
   - Funktioniert in Firmennetzwerken mit festen IP-Adressen.

3. **Zentrale Verzeichnisse wie LDAP oder Active Directory**
   - Unternehmen verwalten Drucker über ein zentrales System.

4. **Software wie CUPS:**
   - Administratoren nutze das Web-Interface des Schedulers oder CLI-Tools zum Auffinden angeschlossener neuer Drucker

5. **Kommandozeilen-Werkzeuge (CLI-Tools):**
   - Der `ippfind`-Befehl auf Linux, macOS (und sogar Windows, wenn er installiert ist) meldet die URI aller auffindbaren Drucker im LAN oder WLAN.

---

## **6. Unterschiede zu traditionellen Drucksystemen**

| **Feature**                        | **Früher (Druckertreiber)**            | **Heute (IPP Everywhere)**                   |
|------------------------------------|----------------------------------------|----------------------------------------------|
| Druckertreiber nötig?              | Ja                                     | Nein                                         |
| Erkennung von Druckereinstellungen | Manuell (Treiber-Setup)                | Automatisch (*"Get-Printer-Attributes"*)     |
| Unterstützte Dateiformate          | PCL, PostScript, PDF                   | JPEG, PWG-Raster, URF, PDF                   |
| Sicherheit                         | Unverschlüsselte Kommunikation möglich | IPPS für verschlüsselte Übertragung          |
| Plattformabhängigkeit              | Treiber für jedes OS nötig             | Einheitliches Protokoll für alle Plattformen |

---

## **Fazit**

IPP hat das Drucken revolutioniert.
Entwickler und Administratoren profitieren von einer standardisierten, treiberlosen Lösung.
IPP Everywhere vereinfacht den Druckprozess erheblich und reduziert den Wartungsaufwand.
Moderne IPP-Drucker gewährliesten eine direkte Kommunikation mit Clients, ohne zusätzliche Software installieren zu müssen.

Für Unternehmen bedeutet IPP weniger Administrationsaufwand, bessere Sicherheit und höhere Kompatibilität.
Entwickler können sich auf standardisierte Zugriffe verlassen, die unabhängig von der Plattform funktioniert.

IPP ist die Zukunft des Druckens – einfach, sicher und flexibel.


# **Anhang** {#Anhang}

## Was mir mein Drucker über sich mitteilt

Damit wir Infos aus dem Drucker herauskitzeln, verwenden wir zwei Kommandozeilen-Tools: `ippfind` und `ipptools`.
Beide sind für Linux, macOS und Windows verfügbar.

1. **`ippfind` verwenden, um seinen IPP-URI ausfindig zu machen:**

   Unter Linux oder macOS ist das ganz easy-peasy im Terminal:

   ~~~bash
   # Unter Linux oder macOS im selben LAN oder WLAN wie der Drucker:
   $> ippfind
   ipp://HP10E7C65B6968-741.local:631/ipp/print
   ~~~

   Unter Windows muss man leider von der [PWG-Webseite](https://pwg.org/ippeveselfcert/) die *IPP Self-Certification Tools* sowie *Bonjour for Windows* herunterladen und installieren.

   Bei meinem Drucker, einem *HP PageWide* ist die IPP-URI diese hier, wie oben herausgefunden: `ipp://HP10E7C65B6968-741.local:631/ipp/print`.
   Alternativ könnte man anstatt des *hostname.local* auch einfach die bekannte IP-Adresse einsetzen.

2. **`ipptool` verwenden, um alle Infos aus dem Drucker zu kitzeln:**

   Dieses Tool lässt auf der Kommandozeile die *Get-Printer-Attributes* IPP-Operation ausführen.
   Die Operation veranlasst den Drucker dazu, alles, aber auch wirklich *ALLES* über sich und sein Setup zu verraten.

   Das Tool erfordert auf der Kommandozeile mehrere Parameter, damit die Rückgabe Menschen-lesbarer Text ist:

   - **`-t`**: 

   - **`-t`**: 

   - **eine Text-Datei**: in ihr sind die Details IPP-Protokoll-konform hinterlegt, die das `ipptool` befolgen soll, damit der Drucker alles über sich verrät.
      Im vorliegenden Fall die mitgelieferte Datei *get-printer-attributes.test*.

   Das Kommando lautet für Linux und macOS so: `ipptool -tv ipp://HP10E7C65B6968-741.local:631/ipp/print get-printer-attributes.test`
   Da die Rückgabe viele Zeilen Text ergeben kann, ist es ratsam, diesen in einer Text-Datei aufzufangen, um ihn in Ruhe studieren zu können:

   ~~~bash
   ipptool -tv ipp://HP10E7C65B6968-741.local:631/ipp/print get-printer-attributes.test | tee output-von-get-printer-attributes.txt
   ~~~

   Spaßeshalber führte ich es bei mir in der PowerShell-Konsole durch.
   Da die Dateien nicht im Suchpfad liegen, musste ich sie mit komplettem Pfad spezifizieren:

   ~~~powershell
   kurtp: & "C:\Program Files\IPP Everywhere v1.1 Update 4 Printer Self-Certification Tools\ipptool.exe" -tv ipp://192.168.18.126/ipp/print C:\Users\kurtp\get-printer-attributes.test
   ~~~
 
3. **Hier kommt das Ergebnis für meinen PageWide:**

~~~bash
    "C:\Users\kurtp\get-printer-attributes.test":
    Get-Printer-Attributes:
        attributes-charset (charset) = utf-8
        attributes-natural-language (naturalLanguage) = en
        printer-uri (uri) = ipp://192.168.18.126:631/ipp/print
    Get printer attributes using Get-Printer-Attributes                  [PASS]
        RECEIVED: 16483 bytes in response
        status-code = successful-ok (successful-ok)
        attributes-charset (charset) = utf-8
        attributes-natural-language (naturalLanguage) = en
        printer-uri-supported (1setOf uri) = ipp://192.168.18.126/ipp/print,ipps://192.168.18.126:443/ipp/print
        uri-security-supported (1setOf keyword) = none,tls
        uri-authentication-supported (1setOf keyword) = requesting-user-name,requesting-user-name
        printer-settable-attributes-supported (keyword) = none
        printer-wifi-ssid (nameWithoutLanguage) = FRITZBox18 Repeater739O
        printer-wifi-state (enum) = 8
        printer-name (nameWithoutLanguage) = HP5B6968
        printer-location (textWithoutLanguage) = ##### unkenntlich gemacht wg. Datenschutz #####
        printer-more-info (uri) = http://192.168.18.126/#hId-pgAirPrint
        printer-info (textWithoutLanguage) = HP PageWide MFP P57750 \[5B6968]
        printer-dns-sd-name (nameWithoutLanguage) = HP PageWide MFP P57750 \[5B6968]
        printer-make-and-model (textWithoutLanguage) = HP PageWide MFP P57750
        printer-state (enum) = idle
        printer-state-reasons (keyword) = none
        printer-state-message (textWithoutLanguage) = 
        ipp-versions-supported (1setOf keyword) = 1.0,1.1,2.0
        operations-supported (1setOf enum) = Print-Job,Validate-Job,Cancel-Job,Cancel-My-Jobs,Get-Job-Attributes,Get-Jobs,Get-Printer-Attributes,Create-Job,Send-Document,Set-Printer-Attributes,0x4029,0x402a,Print-URI,Send-URI,Close-Job,Identify-Printer
        charset-configured (charset) = utf-8
        charset-supported (charset) = utf-8
        natural-language-configured (naturalLanguage) = de
        generated-natural-language-supported (1setOf naturalLanguage) = en,fr,de,es,it,sv,da,no,nl,fi,ja,pt,pl,tr,zh-tw,zh-cn,ru,cs,hu,ko,he,el,ar,bg,hr,ro,sk,sl
        printer-strings-languages-supported (1setOf naturalLanguage) = en,fr,de,es,it,sv,da,no,nl,fi,ja,pt,pl,tr,zh-tw,zh-cn,ru,cs,hu,ko,he,el,ar,bg,hr,ro,sk,sl
        printer-strings-uri (uri) = http://192.168.18.126/ipp/files/en.strings
        document-format-default (mimeMediaType) = application/octet-stream
        document-format-supported (1setOf mimeMediaType) = application/vnd.hp-PCL,application/vnd.hp-PCLXL,application/postscript,application/pdf,image/jpeg,application/PCLm,image/urf,image/pwg-raster,application/octet-stream
        document-format-version-supported (1setOf textWithoutLanguage) = PCL5c,PCLXL,PS/3,NATIVEOFFICE,PDF/1.7,PCL3GUI,PCL3,PJL,Automatic,JPEG,PCLM,AppleRaster,PWGRaster
        printer-is-accepting-jobs (boolean) = true
        queued-job-count (integer) = 0
        pdl-override-supported (keyword) = attempted
        printer-up-time (integer) = 1306791
        printer-current-time (dateTime) = 2025-04-01T15:49:44Z
        compression-supported (1setOf keyword) = none,deflate,gzip
        color-supported (boolean) = true
        job-creation-attributes-supported (1setOf keyword) = copies,finishings,finishings-col,job-pages-per-set,sides,orientation-requested,media,print-quality,printer-resolution,output-bin,media-col,output-mode,print-content-optimize,pclm-source-resolution,print-color-mode,ipp-attribute-fidelity,job-name,page-ranges,multiple-document-handling,job-mandatory-attributes,overrides,print-rendering-intent,print-scaling
        reference-uri-schemes-supported (1setOf uriScheme) = http,https
        printer-device-id (textWithoutLanguage) = MFG:HP;MDL:HP PageWide MFP P57750;CMD:PCL5c,PCLXL,POSTSCRIPT,NATIVEOFFICE,PDF,PCL3GUI,PCL3,PJL,Automatic,JPEG,PCLM,AppleRaster,PWGRaster,802.11,802.3,DESKJET,DYN;CLS:PRINTER;DES:J9V82B;CID:HPIJPDLV1;LEDMDIS:USB#FF#CC#00,USB#FF#04#01;MCT:MF;MCL:DI;MCV:3.1;SN:CN86CHY0DX;S:038080C484100001005800000004600000045000000440000004100001e;Z:05000009000005000005000005000001,12000,17000000000000000000000000000000,181;
        printer-alert (1setOf octetString) = code=unknown;severity=other;group=other,code=unknown;severity=other;group=other
        printer-alert-description (1setOf textWithoutLanguage) = Previously Used Genuine HP Cartridge Installed,Non-HP Ink Cartridge Installed
        printer-uuid (uri) = urn:uuid:9d9b9571-3618-5edf-a53b-e8b9e16aff51
        landscape-orientation-requested-preferred (enum) = 4
        job-constraints-supported (1setOf collection) = {resolver-name=fullbleed-sizes media-top-margin=0 media-bottom-margin=0 media-left-margin=0 media-right-margin=0 media=na_letter_8.5x11in,na_legal_8.5x14in,na_executive_7.25x10.5in,na_invoice_5.5x8.5in,na_foolscap_8.5x13in,na_oficio_8.5x13.4in,na_index-3x5_3x5in,na_index-4x6_4x6in,na_5x7_5x7in,na_index-5x8_5x8in,iso_a4_210x297mm,iso_a5_148x210mm,iso_a6_105x148mm,jis_b5_182x257mm,jis_b6_128x182mm,oe_photo-l_3.5x5in,om_small-photo_100x150mm,om_16k_195x270mm,om_16k_184x260mm,roc_16k_7.75x10.75in,jpn_hagaki_100x148mm,jpn_oufuku_148x200mm,na_number-10_4.125x9.5in,na_monarch_3.875x7.5in,iso_dl_110x220mm,iso_b5_176x250mm,iso_c5_162x229mm,iso_c6_114x162mm,jpn_chou3_120x235mm,jpn_chou4_90x205mm},{resolver-name=duplex-types sides=two-sided-short-edge,two-sided-long-edge media=na_letter_8.5x11in,na_legal_8.5x14in,na_executive_7.25x10.5in,na_foolscap_8.5x13in,na_oficio_8.5x13.4in,iso_a4_210x297mm,iso_a5_148x210mm,jis_b5_182x257mm,om_16k_195x270mm,om_16k_184x260mm,roc_16k_7.75x10.75in media-type=com.hp.advanced-photo,envelope,envelope-heavyweight,labels},{resolver-name=duplex-sizes sides=two-sided-short-edge,two-sided-long-edge media=na_invoice_5.5x8.5in,na_index-3x5_3x5in,na_index-4x6_4x6in,na_5x7_5x7in,na_index-5x8_5x8in,iso_a6_105x148mm,jis_b6_128x182mm,oe_photo-l_3.5x5in,om_small-photo_100x150mm,jpn_hagaki_100x148mm,jpn_oufuku_148x200mm,na_number-10_4.125x9.5in,na_monarch_3.875x7.5in,iso_dl_110x220mm,iso_b5_176x250mm,iso_c5_162x229mm,iso_c6_114x162mm,jpn_chou3_120x235mm,jpn_chou4_90x205mm}
        job-resolvers-supported (1setOf collection) = {resolver-name=fullbleed-sizes media-top-margin=423 media-bottom-margin=423 media-left-margin=423 media-right-margin=423},{resolver-name=duplex-types sides=one-sided},{resolver-name=duplex-sizes sides=one-sided}
        ipp-features-supported (1setOf keyword) = airprint-1.5,ipp-everywhere
        which-jobs-supported (1setOf keyword) = completed,not-completed,all
        job-ids-supported (boolean) = true
        requesting-user-uri-supported (boolean) = true
        multiple-operation-time-out-action (keyword) = process-job
        printer-geo-location (unknown) = unknown
        preferred-attributes-supported (boolean) = false
        printer-config-change-date-time (dateTime) = 2025-03-17T12:53:27Z
        printer-config-change-time (integer) = 0
        printer-state-change-date-time (dateTime) = 2025-04-01T15:28:08Z
        printer-state-change-time (integer) = 1305496
        document-password-supported (integer) = 0
        printer-kind (1setOf keyword) = document,envelope,photo,postcard
        media-supported (1setOf keyword) = na_letter_8.5x11in,na_legal_8.5x14in,na_executive_7.25x10.5in,na_invoice_5.5x8.5in,na_foolscap_8.5x13in,na_oficio_8.5x13.4in,na_index-3x5_3x5in,na_index-4x6_4x6in,na_5x7_5x7in,na_index-5x8_5x8in,iso_a4_210x297mm,iso_a5_148x210mm,iso_a6_105x148mm,jis_b5_182x257mm,jis_b6_128x182mm,oe_photo-l_3.5x5in,om_small-photo_100x150mm,om_16k_195x270mm,om_16k_184x260mm,roc_16k_7.75x10.75in,jpn_hagaki_100x148mm,jpn_oufuku_148x200mm,na_number-10_4.125x9.5in,na_monarch_3.875x7.5in,iso_dl_110x220mm,iso_b5_176x250mm,iso_c5_162x229mm,iso_c6_114x162mm,jpn_chou3_120x235mm,jpn_chou4_90x205mm,custom_min_3x5in,custom_max_8.5x14in
        media-default (keyword) = iso_a4_210x297mm
        media-col-supported (1setOf keyword) = media-type,media-size,media-top-margin,media-left-margin,media-right-margin,media-bottom-margin,media-source,media-size-name
        media-col-default (collection) = {media-size={x-dimension=21000 y-dimension=29700} media-top-margin=423 media-bottom-margin=423 media-left-margin=423 media-right-margin=423 media-source=auto media-type=stationery}
        finishings-col-database (no-value) = no-value
        media-left-margin-supported (integer) = 423
        media-right-margin-supported (integer) = 423
        media-top-margin-supported (integer) = 423
        media-bottom-margin-supported (integer) = 423
        media-source-supported (1setOf keyword) = side,main,auto
        media-type-supported (1setOf keyword) = stationery,com.hp.ecosmart-lite,stationery-lightweight,com.hp.intermediate,com.hp.midweight,stationery-heavyweight,com.hp.premium-presentation-matte,com.hp.extra-heavy,com.hp.brochure-matte,com.hp.brochure-glossy,cardstock,com.hp.advanced-photo,envelope,envelope-heavyweight,stationery-letterhead,stationery-preprinted,stationery-prepunched,labels
        media-size-supported (1setOf collection) = {x-dimension=21590 y-dimension=27940},{x-dimension=21590 y-dimension=35560},{x-dimension=18415 y-dimension=26670},{x-dimension=13970 y-dimension=21590},{x-dimension=21590 y-dimension=33020},{x-dimension=21590 y-dimension=34036},{x-dimension=7620 y-dimension=12700},{x-dimension=10160 y-dimension=15240},{x-dimension=12700 y-dimension=17780},{x-dimension=12700 y-dimension=20320},{x-dimension=21000 y-dimension=29700},{x-dimension=14800 y-dimension=21000},{x-dimension=10500 y-dimension=14800},{x-dimension=18200 y-dimension=25700},{x-dimension=12800 y-dimension=18200},{x-dimension=8890 y-dimension=12700},{x-dimension=10000 y-dimension=15000},{x-dimension=19500 y-dimension=27000},{x-dimension=18400 y-dimension=26000},{x-dimension=19685 y-dimension=27305},{x-dimension=10000 y-dimension=14800},{x-dimension=14800 y-dimension=20000},{x-dimension=10477 y-dimension=24130},{x-dimension=9842 y-dimension=19050},{x-dimension=11000 y-dimension=22000},{x-dimension=17600 y-dimension=25000},{x-dimension=16200 y-dimension=22900},{x-dimension=11400 y-dimension=16200},{x-dimension=12000 y-dimension=23500},{x-dimension=9000 y-dimension=20500},{x-dimension=7620-21590 y-dimension=12700-35560}
        media-ready (1setOf keyword) = iso_a4_210x297mm,iso_a4_210x297mm
        media-col-ready (1setOf collection) = {media-size={x-dimension=21000 y-dimension=29700} media-top-margin=423 media-bottom-margin=423 media-left-margin=423 media-right-margin=423 media-source=side media-type=stationery},{media-size={x-dimension=21000 y-dimension=29700} media-top-margin=423 media-bottom-margin=423 media-left-margin=423 media-right-margin=423 media-source=side media-type=stationery},{media-size={x-dimension=21000 y-dimension=29700} media-top-margin=423 media-bottom-margin=423 media-left-margin=423 media-right-margin=423 media-source=main media-type=stationery},{media-size={x-dimension=21000 y-dimension=29700} media-top-margin=423 media-bottom-margin=423 media-left-margin=423 media-right-margin=423 media-source=main media-type=stationery}
        finishings-col-ready (no-value) = no-value
        finishings-col-supported (keyword) = finishing-template
        printer-finisher (octetString) = 
        printer-finisher-description (octetString) = 
        pages-per-minute (integer) = 50
        pages-per-minute-color (integer) = 50
        jpeg-k-octets-supported (rangeOfInteger) = 0-16384
        jpeg-x-dimension-supported (rangeOfInteger) = 0-16384
        jpeg-y-dimension-supported (rangeOfInteger) = 1-16384
        pdf-k-octets-supported (rangeOfInteger) = 0-117760
        pdf-size-constraints (rangeOfInteger) = 0-117760
        pdf-fit-to-page-default (boolean) = false
        pdf-fit-to-page-supported (boolean) = false
        pdf-versions-supported (1setOf keyword) = iso-32000-1_2008,adobe-1.7,adobe-1.6,adobe-1.5,iso-19005-1_2005,adobe-1.4,adobe-1.3,adobe-1.2
        urf-supported (1setOf keyword) = CP1,MT1-2-8-9-10-11,PQ3-4-5,RS300-600,SRGB24,OB10,W8,DEVW8,DEVRGB24,ADOBERGB24,DM3,FN3,IS19-1,V1.5
        marker-names (1setOf nameWithoutLanguage) = yellow ink,magenta ink,cyan ink,black ink
        marker-colors (1setOf nameWithoutLanguage) = #FFFF00,#FF00FF,#00FFFF,#000000
        marker-types (1setOf keyword) = ink-cartridge,ink-cartridge,ink-cartridge,ink-cartridge
        marker-low-levels (1setOf integer) = 1,1,1,1
        marker-high-levels (1setOf integer) = 100,100,100,100
        marker-levels (1setOf integer) = -2,-2,-2,30
        printer-supply (1setOf octetString) = type=inkCartridge;maxcapacity=100;level=-2;class=supplyThatIsConsumed;unit=percent;colorantname=yellow;,type=inkCartridge;maxcapacity=100;level=-2;class=supplyThatIsConsumed;unit=percent;colorantname=magenta;,type=inkCartridge;maxcapacity=100;level=-2;class=supplyThatIsConsumed;unit=percent;colorantname=cyan;,type=inkCartridge;maxcapacity=100;level=30;class=supplyThatIsConsumed;unit=percent;colorantname=black;
        printer-supply-description (1setOf textWithoutLanguage) = Yellow Cartridge,Magenta Cartridge,Cyan Cartridge,Black Cartridge
        printer-firmware-name (nameWithoutLanguage) = MAHDWOPP1N001.2506A.00
        printer-firmware-string-version (textWithoutLanguage) = MAHDWOPP1N001.2506A.00
        printer-firmware-version (octetString) = MAHDWOPP1N001.2506A.00
        printer-input-tray (1setOf octetString) = type=unRemovableBin;dimunit=micrometers;mediafeed=297000;mediaxfeed=210000;maxcapacity=-2;level=-2;status=0;name=InputTray1,type=sheetFeedAutoNonRemovable;dimunit=micrometers;mediafeed=297000;mediaxfeed=210000;maxcapacity=-2;level=-2;status=0;name=InputTray2,type=other;dimunit=micrometers;mediafeed=-2;mediaxfeed=-2;maxcapacity=-2;level=-2;status=0;name=auto
        printer-output-tray (octetString) = type=unknown;maxcapacity=-2;remaining=-2;status=5;stackingorder=unknown;pagedelivery=faceDown;name=OutputTray1
        copies-default (integer) = 1
        finishings-default (enum) = none
        finishings-col-default (no-value) = no-value
        orientation-requested-default (enum) = portrait
        print-quality-default (enum) = normal
        printer-resolution-default (resolution) = 600dpi
        sides-default (keyword) = one-sided
        output-bin-default (keyword) = face-down
        output-mode-default (keyword) = auto
        print-color-mode-default (keyword) = auto
        multiple-document-handling-default (keyword) = separate-documents-uncollated-copies
        number-up-default (integer) = 1
        presentation-direction-number-up-default (keyword) = toright-tobottom
        print-rendering-intent-default (keyword) = auto
        print-scaling-default (keyword) = auto
        copies-supported (rangeOfInteger) = 1-99
        finishings-supported (enum) = none
        job-pages-per-set-supported (rangeOfInteger) = 1-2147483647
        orientation-requested-supported (1setOf enum) = portrait,landscape,reverse-landscape,reverse-portrait,none
        print-quality-supported (1setOf enum) = draft,normal,high
        printer-resolution-supported (1setOf resolution) = 300dpi,600dpi,1200dpi
        sides-supported (1setOf keyword) = one-sided,two-sided-short-edge,two-sided-long-edge
        output-bin-supported (keyword) = face-down
        output-mode-supported (1setOf keyword) = auto,auto-monochrome,monochrome,color
        print-color-mode-supported (1setOf keyword) = auto,auto-monochrome,monochrome,color,process-monochrome
        page-ranges-supported (boolean) = true
        multiple-document-handling-supported (1setOf keyword) = separate-documents-uncollated-copies,separate-documents-collated-copies
        number-up-supported (integer) = 1
        presentation-direction-number-up-supported (keyword) = toright-tobottom
        overrides-supported (1setOf keyword) = pages,media,media-col
        print-rendering-intent-supported (1setOf keyword) = auto,perceptual
        print-scaling-supported (1setOf keyword) = auto,auto-fit,fill,fit,none
        printer-icons (1setOf uri) = http://192.168.18.126/webApps/images/printer-small.png,http://192.168.18.126/webApps/images/printer.png,http://192.168.18.126/webApps/images/printer-large.png
        printer-supply-info-uri (uri) = http://192.168.18.126/#hId-pgInkConsumables
        print-content-optimize-default (keyword) = auto
        print-content-optimize-supported (1setOf keyword) = auto,photo,graphics,text,text-and-graphics
        pwg-raster-document-sheet-back (keyword) = rotated
        pwg-raster-document-type-supported (1setOf keyword) = sgray_8,srgb_8,adobe-rgb_8,rgb_8
        pwg-raster-document-resolution-supported (1setOf resolution) = 300dpi,600dpi
        epcl-version-supported (textWithoutLanguage) = 1.0
        manual-duplex-supported (boolean) = false
        pclm-source-resolution-supported (1setOf resolution) = 300dpi,600dpi
        pclm-source-resolution-default (resolution) = 600dpi
        pclm-strip-height-supported (integer) = 32
        pclm-strip-height-preferred (integer) = 32
        pclm-raster-back-side (keyword) = rotated
        pclm-compression-method-preferred (1setOf keyword) = jpeg,flate,rle
        document-format-varying-attributes (1setOf keyword) = copies,orientation-requested
        printer-get-attributes-supported (keyword) = document-format
        printer-organization (textWithoutLanguage) = 
        printer-organizational-unit (textWithoutLanguage) = 
        identify-actions-default (keyword) = display
        identify-actions-supported (1setOf keyword) = display,sound,pin
        limit-operations-supported (enum) = 10
        multiple-operation-time-out (integer) = 120
        multiple-document-jobs-supported (boolean) = false
~~~

Ich wette, viel von euch besitzen einen IPP-Drucker, drucken erfolgreich damit und... wissen gar nicht, was der vor jedem Druckjob den Druck-Clients über sich erzählt, bevor er auch nur 1 Blatt Paper ausspuckt.


<!-- 
## **Siehe auch:**

- [Index](#Index) |
-->
