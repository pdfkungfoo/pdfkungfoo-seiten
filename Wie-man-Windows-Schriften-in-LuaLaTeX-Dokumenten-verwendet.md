# 1. Stelle sicher, dass LuaLaTeX in WSL installiert ist

Überprüfe zunächst, ob eine TeX-Distribution (wie TeX Live) in deiner WSL-Umgebung installiert ist. Falls nicht, kannst du sie installieren. Zum Beispiel in einer Ubuntu-basierten WSL-Instanz:

~~~bash
sudo apt update
sudo apt install texlive-full
~~~

Dies installiert LuaLaTeX zusammen mit anderen TeX-Werkzeugen.

# 2. Finde das Windows-Schriftartenverzeichnis

Windows-Schriftarten befinden sich normalerweise in `C:\Windows\Fonts`. In WSL ist dieses Verzeichnis unter `/mnt/c/Windows/Fonts` zugänglich, da WSL die Windows-Laufwerke automatisch unter `/mnt` einbindet.

# 3. Konfiguriere Fontconfig, um Windows-Schriftarten zu nutzen

Fontconfig ist die Bibliothek, die LuaLaTeX (über `luaotfload`) verwendet, um Systemschriftarten zu finden. Du musst Fontconfig anweisen, das Windows-Schriftartenverzeichnis einzubeziehen.

- Erstelle oder bearbeite eine Fontconfig-Konfigurationsdatei in deinem WSL-Heimatverzeichnis:

  ~~~bash
  mkdir -p ~/.config/fontconfig
  nano ~/.config/fontconfig/fonts.conf
  ~~~

- Füge den folgenden Inhalt in `fonts.conf` ein:

  ~~~xml
  <?xml version="1.0"?>
  <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
  <fontconfig>
      <dir>/mnt/c/Windows/Fonts</dir>
  </fontconfig>
  ~~~

  Dies weist Fontconfig an, im Windows-Schriftartenverzeichnis nach Schriftarten zu suchen.

- Aktualisiere den Fontconfig-Cache, um das neue Verzeichnis einzubinden:

  ~~~bash
  fc-cache -fv
  ~~~

  Dieser Befehl erstellt den Schriftart-Cache neu, und du solltest `/mnt/c/Windows/Fonts` als eines der durchsuchten Verzeichnisse in der Ausgabe sehen.

# 4. Überprüfe die Verfügbarkeit der Schriftarten

Prüfe, ob die Windows-Schriftarten jetzt für dein WSL-System sichtbar sind:

~~~bash
fc-list | grep "<Schriftname>"
~~~

Ersetze `<Schriftname>` durch einen Teil des Namens einer auf Windows installierten Schriftart (z. B. `Arial`, `Times New Roman`). Wenn die Schriftart in der Liste erscheint, hat Fontconfig sie erfolgreich erkannt.

# 5. Verwende die Schriftart in LuaLaTeX

Erstelle ein einfaches LuaLaTeX-Dokument, um die Schriftart zu testen. Zum Beispiel:

~~~latex
\documentclass{article}
\usepackage{fontspec}
\setmainfont{Arial} % Ersetze dies durch den genauen Namen der Schriftart, wie sie auf Windows installiert ist
\begin{document}
Hallo, Welt! Dies ist ein Test mit einer Windows-Schriftart.
\end{document}
~~~

Speichere dies als `test.tex`.

- Kompiliere das Dokument mit LuaLaTeX:

  ~~~bash
  lualatex test.tex
  ~~~

  Dies sollte `test.pdf` erzeugen. Öffne die PDF-Datei (du kannst sie nach Windows kopieren mit `cp test.pdf /mnt/c/Users/DeinBenutzername/`) und überprüfe, ob die Schriftart korrekt angewendet wurde.

# 6. Fehlerbehebung

- **Schriftart nicht gefunden**: Wenn LuaLaTeX die Schriftart nicht findet, stelle sicher, dass der Schriftname exakt mit dem auf Windows installierten übereinstimmt. Du kannst den genauen Namen mit `fc-list` oder in den Schriftarteigenschaften unter Windows herausfinden. Manche Schriftarten müssen z. B. als `Arial Regular` statt nur `Arial` angegeben werden.
- **Cache-Probleme**: Wenn Änderungen nicht wirken, führe `fc-cache -fv` erneut aus, um den Cache zu aktualisieren.
- **Leistung**: Der Zugriff auf Schriftarten aus `/mnt/c/` kann aufgrund der WSL-Dateisystembrücke langsamer sein. Falls dies ein Problem ist, kannst du die Schriftartdateien in ein Linux-Verzeichnis (z. B. `/usr/local/share/fonts/`) kopieren, was jedoch zusätzlichen Speicherplatz benötigt.

# Hinweise

- LuaLaTeX verwendet `fontspec` und `luaotfload`, um Systemschriftarten zu verwalten, daher musst du `\usepackage{fontspec}` in deinem Dokument einbinden.
- Schriftarten müssen in einem von LuaLaTeX unterstützten Format wie TrueType (`.ttf`) oder OpenType (`.otf`) vorliegen, was bei den meisten Windows-Schriftarten der Fall ist.
- Du musst die Schriftarten nicht in das WSL-Schriftartenverzeichnis installieren; die Verknüpfung mit dem Windows-Verzeichnis vermeidet Duplikate.

Mit diesen Schritten sollte LuaLaTeX in deiner WSL-Instanz erfolgreich Schriftarten verwenden, die auf deinem Windows 11-Hostsystem installiert sind. Lass mich wissen, wenn du Probleme hast!

--- 


