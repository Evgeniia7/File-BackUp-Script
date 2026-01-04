# File Backup Script

A **Bash script** to automate file and directory backups with a **menu-driven interface**.
Supports **full** and **incremental** backups, allows you to set source and destination directories, create `.tar.gz` archives, and delete old backups.

---

## Features

- Menu interface for easy operation
- Set **source** and **destination** directories
- Choose backup type: **full** or **incremental** 
- Create **.tar.gz** backups
- Delete old backups
- Timestamp logging for incremental backups

---
## Requirements

- Linux or macOS
- Bash shell
- `tar` utility installed

---

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/Evgeniia7/File-BackUp-Script.git
cd File-BackUp-Script

#### 2. Make the Script Executable
chmod +x backup.sh

##### 3. Run the Script
sudo ./backup.sh
