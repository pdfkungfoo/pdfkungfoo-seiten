#!/bin/bash
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

OUTPUT_FILE="index.md"

echo "---" > "$OUTPUT_FILE"
echo "title: \"Inhaltsverzeichnis\"" >> "$OUTPUT_FILE"
echo "layout: default" >> "$OUTPUT_FILE"
echo "publish: true" >> "$OUTPUT_FILE"
echo "---" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "# Verzeichnis aller veröffentlichten Artikel" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Willkommen zuerst
if [ -f "Willkommen.md" ]; then
  title=$(awk -F': ' '/^title:/ {print $2}' "Willkommen.md" | tr -d '"')
  echo "- [${title}](Willkommen)" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
fi

tempfile=$(mktemp)

# Schleife über alle *.md
git ls-files -z -- '*.md' | while IFS= read -r -d '' file; do
  [[ "$file" == "index.md" || "$file" == "Willkommen.md" ]] && continue

  if awk '
    BEGIN { in_yaml=0; found=0 }
    /^---/ { in_yaml++; next }
    in_yaml == 1 && /^publish:[[:space:]]*true/ { found=1 }
    END { exit !found }
  ' "$file"; then
    ts=$(git log --diff-filter=A --follow --format=%at -- "$file" | tail -1)
    echo "$ts|$file" >> "$tempfile"
  fi
done

# Sortiert einfügen
sort -n "$tempfile" | cut -d'|' -f2- | while IFS= read -r file; do
  title=$(awk -F': ' '/^title:/ {print $2}' "$file" | tr -d '"')
  [[ -z "$title" ]] && title="$file"
  link="${file%.md}"
  echo "- [${title}](${link})" >> "$OUTPUT_FILE"
done

rm "$tempfile"

