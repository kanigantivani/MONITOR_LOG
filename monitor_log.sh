#!/bin/bash

# Function to monitor log file
monitor_log() {
    echo "Monitoring log file: $1"
    trap 'echo "Monitoring stopped."; exit' INT
    
    tail -f "$1" | while IFS= read -r line; do
        echo "$line"
        analyze_log "$line"
    done
}

# Function to analyze log entries
analyze_log() {
    # Perform basic analysis here
    # Example: count occurrences of specific keywords
    if echo "$1" | grep -qi 'error'; then
        echo "Error found in log entry: $1"
    fi
}

if [ $# -lt 1 ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

log_file=$1
monitor_log "$log_file"
