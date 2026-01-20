# File Backup Script

## Overview
The File Backup Script is a Bash-based interactive tool that allows users to create full or incremental backups of a selected directory. Backups are stored as compressed archives with timestamps.

## Features
- Interactive terminal menu
- Full and incremental backups
- Automatic destination directory creation
- Timestamped `.tar.gz` backup files
- Backup tracking using a timestamp file

## Requirements
- Linux or macOS
- Bash shell
- `tar` utility

## Getting Started

1. Clone the Repository
```bash
git clone https://github.com/Evgeniia7/File-BackUp-Script.git
cd File-BackUp-Script

2. Make the Script Executable
chmod +x backup_script.sh

3. Run the Script
./backup_script.sh
