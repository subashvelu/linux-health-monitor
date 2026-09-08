#!/bin/bash

LOGFILE="health.log"

log() {
    echo "$1"
    echo "$1" >> "$LOGFILE"
}

check_cpu() {
    log "CPU Usage:"
    CPU_INFO=$(top -bn1 | grep "Cpu(s)")
    log "$CPU_INFO"
}

check_memory() {
    log "Memory Usage:"
    MEM_INFO=$(free -h)
    log "$MEM_INFO"
}

check_disk() {
    log "Disk Usage:"
    DISK_INFO=$(df -h /)
    log "$DISK_INFO"
}

check_internet() {
    if ping -c 1 google.com &> /dev/null
    then
        log "Internet: ONLINE"
    else
        log "Internet: OFFLINE"
    fi
}

log "===== LINUX HEALTH REPORT ====="
log "Hostname: $(hostname)"
log "Uptime: $(uptime -p)"

check_cpu
check_memory
check_disk
check_internet

log "===== END ====="
