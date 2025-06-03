#!/bin/sh
set -xe

bookmarks_file="$XDG_DATA_HOME/bookmarks.txt"
bookmarks_names="$(sed -n 's/^"\([^"]*\)".*/\1/p' "$bookmarks_file")"
echo "$bookmarks_names"

# Choose title from dmenu
chosen_bookmark=$(echo "$bookmarks_names" | dmenu -i -l 10 -p "Choose title")

if [ "$chosen_bookmark" = "+1" ]; then
    new_bookmark_name=$(printf "" | dmenu -i -l 10 -p "Enter bookmark's name:")
    new_bookmark_link=$(printf "" | dmenu -i -l 10 -p "Enter bookmark's link:")
    echo ""\"$new_bookmark_name\""="$new_bookmark_link"" >> $bookmarks_file
elif [ "$chosen_bookmark" = "-1" ]; then
    bookmark2rm=$(echo "$bookmarks_names" | dmenu -i -l 10 -p "Choose a repo 2 remove:")
    tmpfile=$(mktemp /tmp/bookmarks.txt.XXXXXX)
    awk -v target="$bookmark2rm" '$0 !~ target' "$bookmarks_file" > "$tmpfile" && mv "$tmpfile" "$bookmarks_file"
else
    matched_line=$(grep "$chosen_bookmark" "$bookmarks_file")
    url=$(echo "$matched_line" | sed -n 's/^[^=]*=//p')
    [ -n "$url" ] && $BROWSER "$url" && xdotool key $MAINMOD+2
fi

