#!/bin/bash
#
# tools/update-git-meta.sh
# Trägt automatisch `created`, `createdlink`, `lastmod` und `commitlink`
# ins Frontmatter jeder .md-Datei ein (bzw. aktualisiert sie).
# Muss im Inhalts-Repo ausgeführt werden.
#
set -e

for file in *.md; do
  # Erstes und letztes Commit + Datum extrahieren
  first_commit=$(git log --reverse --format=%h -- "$file" | head -n1)
  first_date=$(git log --reverse --format='%cd' --date=iso-strict -- "$file" | head -n1)
  last_commit=$(git log -1 --format=%h -- "$file")
  last_date=$(git log -1 --format='%cd' --date=iso-strict -- "$file")

  # Falls kein Frontmatter vorhanden: abbrechen
  if ! grep -q '^---' "$file"; then
    echo "WARNUNG: Kein Frontmatter in $file – übersprungen."
    continue
  fi

  # Neue Frontmatter-Zeilen vorbereiten
  new_created="created: $first_date"
  new_createdlink="createdlink: $first_commit"
  new_lastmod="lastmod: $last_date"
  new_commitlink="commitlink: $last_commit"

  # Frontmatter ersetzen (zwischen den ersten beiden --- Blöcken)
  awk -v c="$new_created" -v cl="$new_createdlink" -v m="$new_lastmod" -v ml="$new_commitlink" '
    BEGIN { inmeta=0; count=0 }
    /^---/ { count++; if (count==1) inmeta=1; else inmeta=0 }
    inmeta && /^created:/     { print c; next }
    inmeta && /^createdlink:/ { print cl; next }
    inmeta && /^lastmod:/     { print m; next }
    inmeta && /^commitlink:/  { print ml; next }
    { print }
  ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"

  echo " Metadaten aktualisiert: $file"
done

echo "Alle Markdown-Dateien wurden aktualisiert."


