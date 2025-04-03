# Raspberry Pi 5 als Allround-System vorbereiten

Diese Checkliste verwende ich, um einen neuen **Raspberry Pi 5 (16 GB)** vorzubereiten:

- als Desktop-System **und** als
- Server für Dienste wie Pi-hole, Nextcloud, Grafana-Däshboard für Smart-Home-Anzeigen und
- Routing zwischen zwei WLAN-Netzen im Haus (`192.168.78.0/24` <=> `192.168.180.0/24`).

---

#### Hardware-Einkauf

- [ ] Raspberry Pi 5 mit 16 GB RAM
- [ ] Offizielles USB-C-Netzteil (mind. 5V / 5A, Power Delivery!)
- [ ] NVMe SSD (mind. 256 GB) + M.2 HAT+ (PCIe-auf-M.2-Adapter)
- [ ] Aktives Kühlsystem oder Lüfter-Gehäuse
- [ ] micro-HDMI-zu-HDMI-Kabel (für Monitor)
- [ ] USB-Tastatur & Maus (optional, für Desktop)
- [ ] Zweiter USB-WLAN-Dongle (optional, für Routing zwischen 2 Netzen)
- [ ] (Optional) RTC-Modul bei Bedarf an Offline-Zeitpräzision

---

#### Grundinstallation

- [ ] Raspberry Pi OS (64-bit, Lite oder Desktop je nach Einsatzziel) auf SSD installieren
- [ ] Boot von SSD sicherstellen (ggf. via `raspi-config` aktivieren)
- [ ] Benutzername & SSH-Zugang einrichten
- [ ] Systemzeit und Zeitzone korrekt setzen (`timedatectl`)

---

#### System-Setup für Desktop + Dienste

- [ ] System-Update: `sudo apt update && sudo apt full-upgrade`
- [ ] Optional: XFCE, GNOME oder KDE als Desktop installieren
- [ ] Tools: `htop`, `vim`, `git`, `curl`, `neofetch`, `ufw`, `lm-sensors`, etc.
- [ ] Optional: `cockpit` oder `netdata` zur System-Überwachung

---

#### Dienste umziehen oder neu einrichten

- [ ] Pi-hole:
  - [ ] Neu installieren oder Daten von Pi 3 migrieren
  - [ ] DHCP (optional), Gruppenfilterung, Logging prüfen
- [ ] Nextcloud:
  - [ ] Neu aufsetzen oder via `rsync`, `mysqldump`, `occ` migrieren
  - [ ] Datenverzeichnis auf SSD verschieben
- [ ] Routing:
  - [ ] Zwei Interfaces konfigurieren (z. B. `eth0` und `wlan0`)
  - [ ] `iptables`, `ip route`, `ip rule`, `dnsmasq` etc. wie auf Pi 3 übernehmen
  - [ ] Failover oder Policy Routing ggf. verbessern

---

#### Zusätzliche Features

- [ ] Docker installieren (für spätere Containerisierung)
- [ ] Snapshots via Btrfs/ZFS (sofern SSD unterstützt)
- [ ] Watchdog/Monitoring-Skripte portieren oder neu erstellen

---

#### Abschließende Maßnahmen

- [ ] Backup des finalen Setups (z. B. mit `dd`, `rsync` oder `btrfs send`)
- [ ] Raspi 3 weiter bereithalten oder betreiben als: 
  - [ ] Failover-System
  - [ ] Testumgebung
  - [ ] Netzwerksniffer oder Watchdog-Node

---

<!--
#### Siehe auch:

[Pi-hole](#Pi-hole) |
[Nextcloud](#Nextcloud) |
[Raspberry Pi 3](#raspi3) |
[Routing mit iproute2](#iproute2) |
[Netzwerk-Failover](#failover) |
[Startseite](#Index)
-->
