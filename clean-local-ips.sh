#!/bin/bash
# clean-local-ips.sh
# Remove local/private IP addresses from a log file

clean_local_ips() {
    local infile="$1"
    local outfile="${2:-${infile}.cleaned}"

    grep -Ev '(^|[^0-9])((10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})|(172\.(1[6-9]|2[0-9]|3[0-1])\.[0-9]{1,3}\.[0-9]{1,3})|(192\.168\.[0-9]{1,3}\.[0-9]{1,3})|(127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})|(169\.254\.[0-9]{1,3}\.[0-9]{1,3}))' \
        "$infile" > "$outfile"

    echo "Cleaned log written to $outfile"
}

# --- main entry point ---
# Usage: ./clean-local-ips.sh /path/to/sources.log [optional-output-file]
clean_local_ips "$@"