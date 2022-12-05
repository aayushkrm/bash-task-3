#!/bin/bash

# Parse command line options
N=-1
minsize=1
human=0
dir=$PWD
while [ $# -gt 0 ]; do
    case "$1" in
        --help)
            echo "Usage: topsize [--help] [-h] [-N] [-s minsize] [--] [dir]"
            exit 0
            ;;
        -h)
            human=1
            shift
            ;;
        -N)
            N="$2"
            shift 2
            ;;
        -s)
            minsize="$2"
            shift 2
            ;;
        --)
            shift
            break
            ;;
        *)
            dir="$1"
            shift
            break
            ;;
    esac
done

# Check if the specified directory exists
if [ ! -d "$dir" ]; then
    >&2 echo "Error: directory '$dir' does not exist"
    exit 2
fi

# Find the top N largest files larger than the specified size
files=$(find "$dir" -type f -size +"$minsize"c)
if [ -n "$files" ]; then
    if [ "$human" -eq 1 ]; then
        # Print file sizes in human-readable format
        files=$(du -h "$files" | sort -hr | head -n "$N")
        while read -r size path; do
            printf "%s %s\n" "$size" "$path"
        done <<< "$files"
    else
        # Print file sizes in bytes
        files=$(find "$dir" -type f -size +"$minsize"c -printf "%s %p\n" | sort -hr | head -n "$N")
        while read -r size path; do
            printf "%d %s\n" "$size" "$path"
        done <<< "$files"
    fi
else
    # No files found
    exit 1
fi

# Exit successfully
exit 0

