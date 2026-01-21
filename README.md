# File Backup Script

## Overview
The File Backup Script is a Bash-based interactive tool that allows users to create full or incremental backups of a selected directory. Backups are stored as compressed archives with timestamps.

## Features
- Interactive terminal menu
- Full and incremental backups
- Automatic destination directory creation
- Timestamped .tar.gz backup files
- Backup tracking using a timestamp file

## Requirements
- Linux or macOS
- Bash shell
- tar utility

## Getting Started

### Clone the Repository
git clone https://github.com/Evgeniia7/File-BackUp-Script.git
cd File-BackUp-Script

### Make the Script Executable and Run It
chmod +x backup_script.sh && ./backup_script.sh

## Usage
1. Set the source directory
2. Set the destination directory
3. Choose a backup mode (Full or Incremental)
4. Run the backup
5. Exit the script

