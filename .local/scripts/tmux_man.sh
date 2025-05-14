#!/bin/bash

mans_dir="/usr/share/man/"
cache_dir="$HOME/.cache"
cache_file="$cache_dir/man_pages_cache.txt"
cache_timeout=360000  # 1 hour for testing

# Ensure cache directory exists
mkdir -p "$cache_dir"

# Function to generate the cache
generate_cache() {
    find "$mans_dir" -maxdepth 1 -type d | grep "man[0-9]" | while IFS= read -r dir; do
        section_number="${dir##*man}"
        echo $section_number
        find "$dir" -maxdepth 1 -type f | while IFS= read -r file; do
            man_page_name=$(basename "$file" | sed 's/\.[0-9].*$//; s/\..*$//')
            echo "$section_number $man_page_name"
        done
    done > "$cache_file"
}

# Check if cache exists and is recent
if [[ ! -f "$cache_file" || $(find "$cache_file" -mtime +$((cache_timeout / 86400))) ]]; then
    echo "Generating cache..." >&2
    generate_cache
fi

# Stream the cache to fzf with preview
cat "$cache_file" | fzf --preview 'man {1} {2} | col -b | head -n 100' | awk '{print $1, $2}' | xargs -r sh -c 'MANPAGER=cat man "$@"' _ | less

