#!/bin/bash
set -e
# Find untracked files and upload each
for FILE in $(git ls-files --others --exclude-standard); do
  git add "$FILE" > /dev/null 2>&1
  git commit -m "Add new file at $(date)" > /dev/null 2>&1
  git push > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "File uploaded to: https://raw.githubusercontent.com/tornikeo/cdn/master/$FILE"
  else
    echo "Error uploading $FILE" >&2
  fi
done