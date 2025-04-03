#!/bin/bash

set -e

OUTFILE="index.md"
TMPFILE="toc.tmp"

# Kopfbereich mit Frontmatter (Platzhalter für Datum)
created_hash=$(git log --diff-filter=A --follow --format=%h -1 -- index.md)
created_date=$(git log --diff-filter=A --follow --format=%cd -1 -- index.md)
lastmod_hash=$(git log --follow --format=%h -1 -- index.md)
lastmod_date=$(git log --follow --format=%cd -1 -- index.md)

created_link="https://github.com/pdfkungfoo/pdfkungfoo-seiten/commit/${created_hash}"
lastmod_link="https://github.com/pdfkungfoo/pdfkungfoo-seiten/commit/${lastmod_hash}"

cat <<EOF > "$OUTFILE"
---
title: "Inhaltsverzeichnis"
created: ${created_date}
createdlink: ${created_link}
lastmod: ${lastmod_date}
commitlink: ${lastmod_link}
---

# Übersicht über alle Artikel

EOF

# Immer ganz oben: Willkommen.md
if [ -f "Willkommen.md" ]; then
  title=$(grep -m1 '^title:' Willkommen.md | cut -d ':' -f2- | sed 's/^ *//; s/"//g')
  [[ -z "$title" ]] && title="Willkommen"
  echo "- [${title}](./Willkommen)" >> "$OUTFILE"
  echo "" >> "$OUTFILE"
fi

# Hole alle .md-Dateien außer index.md und Willkommen.md
find . -maxdepth 1 -name "*.md" ! -name "index.md" ! -name "Willkommen.md" | while read file; do
  # Erstes Commit-Datum ermitteln
  date=$(git log --reverse --format="%ct" -- "$file" | head -n 1)
  printf "%s\t%s\n" "$date" "$file"
done | sort -n > "$TMPFILE"

# Liste einfügen
while IFS=$'\t' read -r timestamp file; do
  # Titel extrahieren
  title=$(grep -m1 '^title:' "$file" | cut -d ':' -f2- | sed 's/^ *//; s/"//g')
  [[ -z "$title" ]] && title=$(basename "$file" .md)
  link=$(basename "$file" .md)
  echo "- [${title}](./${link})" >> "$OUTFILE"
done < "$TMPFILE"

rm "$TMPFILE"

