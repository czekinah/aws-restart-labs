#!/usr/bin/env bash
# Report the largest files under a directory.
# Usage: topfiles.sh <directory> [count]
set -euo pipefail

usage() { echo "usage: $(basename "$0") <directory> [count]" >&2; exit 2; }

[[ $# -ge 1 && $# -le 2 ]] || usage
DIR=$1
COUNT=${2:-5}

[[ -d $DIR ]]              || { echo "not a directory: $DIR" >&2; exit 3; }
[[ $COUNT =~ ^[1-9][0-9]*$ ]] || { echo "count must be a positive integer: $COUNT" >&2; exit 4; }

mapfile -t rows < <(find "$DIR" -type f -printf '%s\t%p\n' 2>/dev/null | sort -rn | head -n "$COUNT")

if (( ${#rows[@]} == 0 )); then
    echo "no regular files under $DIR" >&2
    exit 5
fi

printf '%10s  %s\n' SIZE PATH
for row in "${rows[@]}"; do
    size=${row%%$'\t'*}
    path=${row#*$'\t'}
    printf '%10s  %s\n' "$(numfmt --to=iec --suffix=B "$size")" "$path"
done
