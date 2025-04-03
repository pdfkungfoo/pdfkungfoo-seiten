# 🏠 Home Assistant (HA)

## ✅ Pro

- **Einfacher Einstieg:** Assistenten & Web-GUI bei Erstinstallation
- **Modernes Dashboard:** Lovelace ist touchfreundlich, responsive, anpassbar
- **Riesige Community:** Hilfe, Doku, Add-ons und Integrationen fast zu jedem Gerät
- **HACS:** Inoffizieller Add-on Store mit unzähligen Erweiterungen
- **Regelmäßige Releases:** Verbesserungen, Bugfixes, neue Integrationen im Wochenrhythmus
- **ESPHome nativ integriert:** Für ESP32-/ESP8266-Geräte (OTA, MQTT, YAML)
- **RPI-optimiert:** Eigene Image-Distribution für Raspberry Pi (Home Assistant OS)
- **Backups & Snapshots:** Direkt aus der UI möglich

## ❌ Contra

- **Manchmal zu schnelllebig:** Breaking changes können Konfigs beschädigen
- **YAML-lastig:** Bei komplexeren Automationen wird's textlastig
- **Updates erfordern Aufmerksamkeit:** Vor allem bei Core + HACS + Custom Components
- **Visualisierung nur über Lovelace:** Keine echten Baukastensysteme wie VIS

---

# 🔌 ioBroker

## ✅ Pro

- **Extrem modular:** Adapter-System erlaubt sehr gezielte Funktionserweiterung
- **Skripting-Power:** Blockly + Javascript für beliebig komplexe Abläufe
- **Visualisierungsfreiheit:** Mehrere Dashboards zur Auswahl (VIS, Jarvis, Material UI etc.)
- **Starke Community im DACH-Raum:** Viele Anleitungen auf Deutsch
- **Datenhistorie & Statistik:** InfluxDB, Grafana & Co. leicht integrierbar
- **Parallel einsetzbar:** ioBroker stört andere Dienste nicht (z. B. Nextcloud, Pi-hole)
- **Gerade für Bastler ideal:** Mehr Kontrolle, mehr technische Tiefe

## ❌ Contra

- **Höhere Einstiegshürde:** Adapter + Konfiguration oft fummelig
- **Keine zentrale UI für alles:** Unterschiedliche Tools für Setup, UI, Logs, Skripte
- **Kein einheitlicher Update-Pfad:** Muss manuell über `iobroker upgrade` gepflegt werden
- **Teilweise brüchige Adapter:** Nicht jeder Adapter wird gut gepflegt
- **Keine Mobile-App out of the box:** Mobile Zugriff oft nur über externe Lösungen

---

# 🧠 Wer sollte was wählen?

| Du willst…                                          | Dann nimm…               |
|-----------------------------------------------------|--------------------------|
| …schnell starten und sofort loslegen                | **Home Assistant**       |
| …dein Dashboard visuell gestalten (Pixel für Pixel) | **ioBroker**             |
| …deine Automationen lieber klicken als coden        | **HA (GUI + YAML)**      |
| …sehr komplexe Abläufe in JavaScript abbilden       | **ioBroker**             |
| …ein System mit starker Community & Zukunft         | **HA** (rundum aktiv)    |
| …mehrere Dienste auf einem Raspberry Pi betreiben   | **ioBroker** (flexibler) |

---

