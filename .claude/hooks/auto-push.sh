#!/bin/bash
# Auto-commit and push after Claude edits index.html
# Runs as a PostToolUse hook on Edit/Write

cd "/c/Users/borge/OneDrive/Skrivbord/negative25" || exit 0

# Only proceed if there are staged or unstaged changes to index.html
if git diff --quiet index.html && git diff --cached --quiet index.html; then
  exit 0
fi

git add index.html
git commit -m "Auto: update game ($(date '+%Y-%m-%d %H:%M'))" --no-gpg-sign 2>/dev/null || exit 0
git push origin main 2>/dev/null || exit 0
