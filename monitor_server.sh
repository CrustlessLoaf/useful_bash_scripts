#!/bin/bash

# Apache 2 current day log file
file_path="/var/log/apache2/access.log"

# Function to check if the day has changed
function is_new_day() {
    [ "$current_day" != "$(date '+%d')" ]
}

# Function to wait until midnight
function wait_until_midnight() {
    local now=$(date +%s)
    local midnight=$(date -d 'tomorrow 00:00:00' +%s)
    local seconds_to_wait=$(( midnight - now ))
    sleep "$seconds_to_wait"
}

# Initial day check
current_day=$(date '+%d')

# Loop to keep tailing the file and check for a new day
while true; do
    # Run tail -f on the file
    tail -n 0 -f "$file_path"

    # Check if the day has changed
    if is_new_day; then
        # If the day has changed, wait until midnight (end of the day)
        wait_until_midnight
        # Update the current day
        current_day=$(date '+%d')
    fi
done
