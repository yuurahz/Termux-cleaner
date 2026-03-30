#!/bin/bash

# Modded by: YuuraHz (Enhanced Version)
author="YuuraHz"
version="V2.5.0"
LOG_FILE="cleanup_log.txt"

# Colors
RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
BLUE='\e[1;34m'
MAGENTA='\e[1;35m'
CYAN='\e[1;36m'
NC='\e[0m' # No Color

# Set current date in log file
echo -e "${BLUE}-------------------------------${NC}" >> "$LOG_FILE"
echo -e "${BLUE}Date: $(date)${NC}" >> "$LOG_FILE"
echo -e "${BLUE}-------------------------------${NC}" >> "$LOG_FILE"

typing_effect() {
    local text="$1"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep 0.02
    done
    echo
}

draw_progress() {
    echo -ne "${CYAN}Progress: [${NC}"
    for i in {1..20}; do
        echo -ne "${GREEN}#${NC}"
        sleep 0.02
    done
    echo -e "${CYAN}] Done!${NC}"
}

show_banner() {
    clear
    echo -e "${CYAN}    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
    echo -e "${CYAN}    ┃${NC}  ${RED}⚡${NC} ${WHITE}TERMUX SYSTEM ${GREEN}DEEP CLEANER${NC} ${RED}⚡${NC}  ${CYAN}┃${NC}"
    echo -e "${CYAN}    ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫${NC}"
    echo -e "${CYAN}    ┃${NC}  ${YELLOW}Author  :${NC} ${author}                      ${CYAN}┃${NC}"
    echo -e "${CYAN}    ┃${NC}  ${YELLOW}Version :${NC} ${version}                     ${CYAN}┃${NC}"
    echo -e "${CYAN}    ┃${NC}  ${YELLOW}Status  :${NC} ${GREEN}Ready to Optimize${NC}          ${CYAN}┃${NC}"
    echo -e "${CYAN}    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
    echo ""
}

# --- Cleaning Functions ---

clean_cache() {
    typing_effect "${GREEN}[+] Cleaning cache files...${NC}"
    deleted_cache=$(find /data/data/com.termux/files/home/.cache/ -type f -delete -print 2>/dev/null)
    deleted_app_cache=$(find /data/data/com.termux/cache -type f -delete -print 2>/dev/null)
    echo "$deleted_cache" >> "$LOG_FILE"
    echo "$deleted_app_cache" >> "$LOG_FILE"
    draw_progress
}

clean_cached_packages() {
    typing_effect "${GREEN}[+] Cleaning cached packages (pkg clean)...${NC}"
    apt-get clean 2>/dev/null
    pkg clean 2>/dev/null
    draw_progress
}

remove_unused_packages() {
    typing_effect "${GREEN}[+] Removing unused packages (autoremove)...${NC}"
    apt autoremove -y 2>/dev/null
    draw_progress
}

clean_temp_files() {
    typing_effect "${GREEN}[+] Cleaning temporary files...${NC}"
    deleted_temp=$(find /data/data/com.termux/files/home/tmp/ -type f -delete -print 2>/dev/null)
    echo "$deleted_temp" >> "$LOG_FILE"
    draw_progress
}

clean_temp_backup_files() {
    typing_effect "${GREEN}[+] Cleaning backup files (*.bak)...${NC}"
    deleted_temp_backup=$(find /data/data/com.termux/files/home/ -type f -name "*.bak" -delete -print 2>/dev/null)
    echo "$deleted_temp_backup" >> "$LOG_FILE"
    draw_progress
}

clean_unnecessary_logs() {
    typing_effect "${GREEN}[+] Cleaning system logs...${NC}"
    echo -e "--- New Cleanup Session: $(date) ---" > "$LOG_FILE"
    deleted_logs=$(find /data/data/com.termux/files/home -type f -name "*.log" -delete -print 2>/dev/null)
    echo "$deleted_logs" >> "$LOG_FILE"
    draw_progress
}

clean_all() {
    echo -e "${YELLOW}Starting Full System Optimization...${NC}"
    clean_unnecessary_logs
    clean_cache
    clean_cached_packages
    remove_unused_packages
    clean_temp_files
    clean_temp_backup_files
    success_msg
}

success_msg() {
    echo ""
    echo -e "${CYAN}=============================================${NC}"
    echo -e "${GREEN}   CLEANUP COMPLETED SUCCESSFULLY!${NC}"
    echo -e "${YELLOW}   Check ${LOG_FILE} for details.${NC}"
    echo -e "${CYAN}=============================================${NC}"
    echo ""
}

display_help() {
    show_banner
    echo -e "${BLUE}Usage:${NC}"
    echo -e "  ./cleaner.sh [OPTIONS]"
    echo ""
    echo -e "${BLUE}Options:${NC}"
    echo -e "  ${YELLOW}-y, --yes${NC}       Clean ALL junk without asking"
    echo -e "  ${YELLOW}-a${NC}              Clean ALL (with prompt)"
    echo -e "  ${YELLOW}-c${NC}              Clean cache only"
    echo -e "  ${YELLOW}-p${NC}              Clean cached packages"
    echo -e "  ${YELLOW}-h, --help${NC}      Display this help"
    echo ""
}

# --- Main Logic ---

show_banner

# Check arguments
if [[ "$1" == "-y" || "$1" == "--yes" ]]; then
    clean_all
    exit 0
fi

if [ "$#" -gt 0 ]; then
    for option in "$@"; do
        case $option in
            "-h" | "--help") display_help; exit 0 ;;
            "-a") clean_all; exit 0 ;;
            "-c") clean_cache ;;
            "-p") clean_cached_packages ;;
            "-n") remove_unused_packages ;;
            "-t") clean_temp_files ;;
            "-b") clean_temp_backup_files ;;
            "-l") clean_unnecessary_logs ;;
            *) echo -e "${RED}Invalid option: $option${NC}"; exit 1 ;;
        esac
    done
    success_msg
    exit 0
fi

# Interactive Mode (No Arguments)
echo -ne "${MAGENTA} Do you want to clean everything? (y/n): ${NC}"
read -r main_choice

if [[ "$main_choice" == "y" || "$main_choice" == "Y" ]]; then
    clean_all
else
    echo -e "\n${CYAN}--- Custom Selection ---${NC}"
    read -p " Clean logs? (y/n): " c1
    read -p " Clean cache? (y/n): " c2
    read -p " Clean packages? (y/n): " c3
    read -p " Remove unused? (y/n): " c4
    read -p " Clean temp? (y/n): " c5

    [[ "$c1" =~ [yY] ]] && clean_unnecessary_logs
    [[ "$c2" =~ [yY] ]] && clean_cache
    [[ "$c3" =~ [yY] ]] && clean_cached_packages
    [[ "$c4" =~ [yY] ]] && remove_unused_packages
    [[ "$c5" =~ [yY] ]] && clean_temp_files
    success_msg
fi