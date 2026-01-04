#!/bin/bash

SOURCE=""
DEST=""
MODE=""

menu() {
  clear
  echo "======================"
  echo "   File Backup Script"
  echo "======================"
  echo "1. Set source directory"
  echo "2. Set destination directory"
  echo "3. Select backup mode (full / incremental)"
  echo "4. Create backup (tar.gz)"
  echo "5. Delete old backups"
  echo "6. Exit"
  echo "======================"
  read -p "Choose an option: " CHOICE
}

set_source() {
  read -p "Enter source file or directory: " SRC
  if [ -e "$SRC" ]; then
    SOURCE="$SRC"
    echo "Source set to: $SOURCE"
  else
    echo "Invalid source"
  fi
  sleep 2
}

set_destination() {
  read -p "Enter destination directory: " DST
  mkdir -p "$DST"
  if [ -d "$DST" ]; then
    DEST="$DST"
    echo "Destination set to: $DEST"
  else
    echo "Invalid destination"
  fi
  sleep 2
}

set_mode() {
  echo "1. Full backup"
  echo "2. Incremental backup"
  read -p "Select mode: " MODE_CHOICE

  if [ "$MODE_CHOICE" = "1" ]; then
    MODE="full"
  elif [ "$MODE_CHOICE" = "2" ]; then
    MODE="incremental"
  else
    echo "Invalid choice"
  fi
  sleep 2
}

create_backup() {
  if [ -z "$SOURCE" ] || [ -z "$DEST" ] || [ -z "$MODE" ]; then
    echo "Please set source, destination, and mode first"
    sleep 2
    return
  fi

  TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")
  STAMP_FILE="$DEST/last_backup.timestamp"

  if [ "$MODE" = "full" ]; then
    tar -czf "$DEST/full_backup_$TIMESTAMP.tar.gz" "$SOURCE"
    date +%s > "$STAMP_FILE"
    echo "Full backup created"
  else
    if [ -f "$STAMP_FILE" ]; then
      tar -czf "$DEST/inc_backup_$TIMESTAMP.tar.gz" \
        --newer=@$(cat "$STAMP_FILE") "$SOURCE"
      echo "Incremental backup created"
    else
      tar -czf "$DEST/full_backup_$TIMESTAMP.tar.gz" "$SOURCE"
      echo "No previous backup found. Full backup created"
    fi
    date +%s > "$STAMP_FILE"
  fi

  sleep 2
}

delete_backups() {
  if [ -z "$DEST" ]; then
    echo "Destination not set"
  else
    rm -i "$DEST"/*.tar.gz
    echo "Backups deleted"
  fi
  sleep 2
}

process() {
  case "$CHOICE" in
    1) set_source ;;
    2) set_destination ;;
    3) set_mode ;;
    4) create_backup ;;
    5) delete_backups ;;
    6) exit 0 ;;
    *) echo "Invalid option"; sleep 2 ;;
  esac
}

while true; do
  menu
  process
done
