#!/usr/bin/env sh
# Lists every visible "TODO" marker left in the published pages.
# Exits 1 if any remain, 0 when the site is ready to announce.
#
# Usage: sh scripts/check-todos.sh

cd "$(dirname "$0")/.." || exit 2

pages="index.html 404.html"
total=0

for page in $pages; do
  [ -f "$page" ] || continue
  matches=$(grep -n "TODO" "$page")
  [ -n "$matches" ] || continue
  count=$(printf '%s\n' "$matches" | wc -l | tr -d ' ')
  total=$((total + count))
  echo "$page: $count TODO marker(s)"
  # Join wrapped lines, then print each marker's text.
  tr '\n' ' ' < "$page" | tr -s ' ' | grep -o "TODO[^<]*" | sed 's/^/  - /'
done

if [ "$total" -eq 0 ]; then
  echo "No TODO markers. Ready to publish."
  exit 0
fi

echo "$total TODO marker(s) remaining. Fill them in docs/CONTENT.md."
exit 1
