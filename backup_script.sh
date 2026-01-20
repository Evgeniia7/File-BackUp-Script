#!/bin/bash
SOURCE=""
DEST=""
MODE=""
while true; do
  clear
  echo "--- File Backup Script ---"
  echo "1. Set Source: $SOURCE"
  echo "2. Set Destination: $DEST"
  echo "3. Set Mode: $MODE"
  echo "4. Run Backup"
  echo "5. Exit"
  read -p "Selection: " CHOICE
  if [ "$CHOICE" == "1" ]; then
    read -p "Enter source path: " SOURCE
  elif [ "$CHOICE" == "2" ]; then
    read -p "Enter destination path: " DEST
    mkdir -p "$DEST"
  elif [ "$CHOICE" == "3" ]; then
    echo "1. Full"
    echo "2. Incremental"
    read -p "Choose 1 or 2: " M_CHOICE
    [ "$M_CHOICE" == "1" ] && MODE="full" || MODE="incremental"
  elif [ "$CHOICE" == "4" ]; then
    TIME=$(date +"%Y-%m-%d_%H%M")
    TRACKER="$DEST/last_backup.txt"
    if [ "$MODE" == "full" ] || [ ! -f "$TRACKER" ]; then
      tar -czf "$DEST/full_$TIME.tar.gz" "$SOURCE"
    else
      LAST_DATE=$(cat "$TRACKER")
      tar -czf "$DEST/inc_$TIME.tar.gz" --newer-mtime="$LAST_DATE" "$SOURCE"
    fi
    date +"%Y-%m-%d %H:%M:%S" > "$TRACKER"
    echo "Done"; sleep 2
  elif [ "$CHOICE" == "5" ]; then
    exit 0
  fi
done
