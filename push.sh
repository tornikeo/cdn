#!/bin/bash
set -e
# Find untracked and modified files and upload each
FILES=$(git ls-files --others --exclude-standard)
FILES+=$(git ls-files --modified)

for FILE in $FILES; do
  git add "$FILE" > /dev/null 2>&1
  git commit -m "Update file at $(date)" > /dev/null 2>&1 || true
  git push > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "File uploaded to: https://raw.githubusercontent.com/tornikeo/cdn/master/$FILE"
  else
    echo "Error uploading $FILE" >&2
  fi
done