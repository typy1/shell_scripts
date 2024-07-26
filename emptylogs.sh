#!/bin/bash
#
## Directorul unde se află fișierele de log
LOG_DIR="/var/log"
#
## Golește toate fișierele de log din directorul specificat
sudo find "$LOG_DIR" -type f -name "*.log" -exec truncate -s 0 {} \;
#
echo "Toate fișierele de log au fost golite."
