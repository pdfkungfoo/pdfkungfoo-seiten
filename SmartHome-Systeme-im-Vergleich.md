## 🧠 Grundbegriffe und Landschaft

### 1. **Home Assistant (HA)**
- Sehr aktiv entwickeltes Open-Source-Projekt
- Extrem populär → riesige Community + Integrationen
- Nutzt **YAML + Web-GUI**
- Fokus auf **Lokale Steuerung** (Cloud optional)
- Unterstützt MQTT, Zigbee, Z-Wave, Shelly, Tasmota, …
- Integrierte Automatisierung + Dashboard (Lovelace UI)

**Geeignet für:** Einsteiger *und* Nerds. Ideal für vollständige Haussteuerung.

---

### 2. **ioBroker**
- Ebenfalls Open Source, aus Deutschland
- Extrem modular – basierend auf „Adaptern“
- **Stark bei Visualisierung** (z. B. mit VIS, Jarvis, …)
- Javascript-basierte Automatisierungen
- Komplexer Einstieg als HA, dafür sehr flexibel

**Geeignet für:** Fortgeschrittene Nutzer mit Lust auf Basteln & Visualisieren.

---

### 3. **openHAB**
- Eines der ältesten Projekte im Bereich Open Source SmartHome
- Java-basiert, robust, aber komplex
- Fokus auf **regelbasierte Logik**, wenig visuelle Assistenten
- Hohe Stabilität, weniger „fancy UI“

**Geeignet für:** Profis und Java-affine Nutzer mit Fokus auf Stabilität.

---

### 4. **Apple HomeKit (bzw. Apple Home)**
- Lokale Steuerung über iPhone, iPad, HomePod
- **Sehr nutzerfreundlich**, aber **nur für Apple-Ökosystem**
- Matter-kompatibel, aber eingeschränkt bei Fremdherstellern
- Keine eigene Server-Software nötig

**Geeignet für:** iPhone-Nutzer, die „Plug & Play“ wollen.

---

### 5. **Matter (und früher: Thread + CHIP)**
- **Kein SmartHome-System**, sondern **ein Protokoll/Standard**
- Ziel: Herstellerübergreifende Interoperabilität
- Unterstützt von Apple, Google, Amazon, Samsung, etc.
- Nutzt IPv6 + lokale Kommunikation
- **Noch in früher Phase** – kaum Geräte vollständig Matter-fähig

**Geeignet für:** Zukunftssicherheit – aber (noch) nicht als Steuerzentrale.

---

## 🧾 Vergleichstabelle (Stand 2025)

| Merkmal                        | Home Assistant       | ioBroker           | openHAB           | Apple HomeKit     | Matter              |
|-------------------------------|----------------------|--------------------|-------------------|-------------------|---------------------|
| **Lizenz**                    | Open Source          | Open Source        | Open Source       | Proprietär        | Standard / Open     |
| **Installation**              | Einfach (z. B. Docker, Pi) | Mittel (Node.js, Adapter) | Aufwendig (Java, Konfig) | Keine nötig         | Nur via Partnergeräte |
| **Visualisierung**            | Lovelace UI          | VIS, Jarvis        | Basic/Custom UI   | iOS App           | keine eigene UI     |
| **Automatisierung**           | GUI + YAML           | Javascript         | DSL / Rules       | App (einfach)     | durch Plattform     |
| **Lokale Steuerung**          | ✅ (Standard)         | ✅                 | ✅                | Teilweise         | ✅                   |
| **Cloud-Zwang?**              | ❌                   | ❌                 | ❌                | Teilweise         | ❌                   |
| **Zigbee / Z-Wave / MQTT etc.** | ✅                    | ✅                 | ✅                | ❌                | nur Matter-kompatibel |
| **Komplexität (1–5)**         | 2–3                  | 3–4                | 4–5               | 1                 | n/a                 |
| **Zukunftssicherheit**        | ✅ sehr aktiv         | ✅ aktiv           | ↘️ sinkend         | ✅ groß           | 🟡 in Entwicklung    |

---

