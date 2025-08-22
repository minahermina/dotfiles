#!/bin/bash

set -eu
set -x

get_pages() {
    paths=$(echo "/usr/share/man:/usr/man:/usr/local/share/man:/opt/local/share/man:/usr/local/man")

    paths=$(echo "$paths" | tr ':' ' ')

    find $paths -type f \(  \
        -name "*.[1-9]" -o  \
        -name "*.[1-9]*" -o \
        -name "*.gz" -o     \
        -name "*.bz2" -o    \
        -name "*.xz" -o     \
        -name "*.Z"         \
    \) 2>/dev/null | \
    sed -n '
    # Handle compressed files (.gz, .bz2, .xz, .Z)
    s|.*/\([^/]*\)\.\([1-9][^.]*\)\.\(gz\|bz2\|xz\|Z\)$|\1(\2)|p
    # Handle uncompressed files
    s|.*/\([^/]*\)\.\([1-9][^.]*\)$|\1(\2)|p
    ' | \
        sort -u
    }

preview=$(mktemp)
cat > "$preview" << 'EOF'
#!/bin/sh
case "$1" in
    *\(*\)*)
        name=$(echo "$1" | sed 's/^\([^(]*\)(\([^)]*\)).*/\1/')
        section=$(echo "$1" | sed 's/^\([^(]*\)(\([^)]*\)).*/\2/')
        man "$section" "$name" 2>/dev/null || man "$name" 2>/dev/null
        ;;
esac
EOF
chmod +x "$preview"

# Create execute script  
exec_script=$(mktemp)
cat > "$exec_script" << 'EOF'
#!/bin/sh
case "$1" in
    *\(*\)*)
        name=$(echo "$1" | sed 's/^\([^(]*\)(\([^)]*\)).*/\1/')
        section=$(echo "$1" | sed 's/^\([^(]*\)(\([^)]*\)).*/\2/')
        man "$section" "$name" 2>/dev/null || man "$name" 2>/dev/null
        ;;
esac
EOF
chmod +x "$exec_script"

get_pages | fzf \
    --preview="$preview {}" \
    --preview-window=right:60% \
    --bind="enter:execute($exec_script {})+abort" \
    --prompt="Man > " \
    --header="Select man page (ESC to quit)"

rm -f "$preview" "$exec_script"
