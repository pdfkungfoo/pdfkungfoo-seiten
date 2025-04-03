# Raspberry Pi 3 vs. Raspberry Pi 5 (16 GB) im Vergleich

Dieser tabellarische Vergleich beleuchtet die wichtigsten Unterschiede zwischen dem **Raspberry Pi 3 Model B** und dem **Raspberry Pi 5 (16 GB)** – speziell im Hinblick auf typische bei mir anfallende Aufgaben wie Desktop-Betrieb, Pi-hole, Nextcloud oder Routing.

---

## Technische Daten

| Merkmal                  | Raspberry Pi 3 Model B             | Raspberry Pi 5 (16 GB)                      |
|--------------------------|------------------------------------|---------------------------------------------|
| **CPU**                  | ARM Cortex-A53, Quad-Core, 1.2 GHz | ARM Cortex-A76, Quad-Core, 2.4 GHz          |
| **Leistung**             | ~1x                                | ~5-7x schneller bei vielen Workloads        |
| **Threads/Multitasking** | schwach bei Parallität             | performant durch OoO-Architetur & Takt      |
| **Architektur**          | 32-bit, in-order                   | 64-bit, out-of-order                        |
| **RAM**                  | 1 GB LPDDR2                        | 16 GB LPDDR4X                               |
| **Massenspeicher**       | microSD, sehr langsam im Vergleich | microSD + NVMe-SSD via PCIe (M.2 HAT+)      |
| **USB**                  | 4× USB 2.0                         | 2× USB 3.0 + 2× USB 2.0                     |
| **Stromversorgung**      | microUSB, 2.5 Amp                  | USB-C, mind. 5V/5A empfohlen (25 Watt)      |
| **Netzwerk**             | 100 Mbit Ethernet                  | Gbit Ethernet + schnelleres WLAN            |
| **WLAN**                 | 802.11n (2.4 GHz)                  | 802.11ac (2.4 + 5 GHz), schneller/stabiler  |
| **Bluetooth**            | 4.1                                | 5.0                                         |
| **Videoausgabe**         | HDMI                               | 2× micro-HDMI (4K@60Hz)                     |
| **Kühlung nötig**        | Kaum                               | Ja (aktiver Lüfter empfohlen)               |
| **GPIO**                 | 40-Pin kompatibel                  | 40-Pin kompatibel                           |

---

## Anwendungsszenarien

| Aufgabe                | Raspberry Pi 3                     | Raspberry Pi 5 (16 GB)                   |
|------------------------|------------------------------------|------------------------------------------|
| **Desktop-Einsatz**    | Nur mit Geduld                     | Alltagsfähig (z. B. mit XFCE oder GNOME) |
| **Web-Browsing**       | Langsam, kaum brauchbar            | Flott, auch mit Firefox oder Chromium    |
| **Nextcloud**          | Möglich, aber I/O- & RAM-limitiert | Ideal mit SSD, viel RAM & CPU-Reserven   |
| **Pi-hole**            | Gut geeignet                       | Mehr Headroom für Logging & Statistik    |
| **Routing + NAT**      | Max. ~100 Mbit/s                   | Bis zu 1 Gbit/s mit Optimierung          |
| **Docker & Container** | Sehr eingeschränkt                 | Voll nutzbar, auch parallel              |
| **Monitoring & Logs**  | Kaum performant                    | Netdata, Cockpit etc. problemlos nutzbar |
| **Snapshot-Backups**   | Nur umständlich                    | Mit Btrfs oder ZFS auf SSD möglich       |

---

## Fazit

- Der **Raspberry Pi 3** eignet sich weiterhin gut für kleine, spezialisierte Aufgaben oder als Testsystem.
- Der **Raspberry Pi 5 (16 GB)** ist ein leistungsfähiger Allrounder:
  - Als Desktop-Ersatz verwendbar
  - Für mehrere Dienste parallel geeignet
  - Deutlich höhere Lebensdauer bei Verwendung einer SSD

---

<!--
#### Siehe auch:

[Raspberry Pi 5 vorbereiten](#raspi5-checklist) |
[Nextcloud](#Nextcloud) |
[Pi-hole](#Pi-hole) |
[Failover](#failover) |
[Startseite](#Index)
-->
