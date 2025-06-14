#!/bin/sh
set -x

file="$XDG_DATA_HOME/bookmarks.txt"
bookmarks_names="$(sed -n 's/^"\([^"]*\)".*/\1/p' "$file")"
echo "$bookmarks_names"

# Choose title from dmenu
chosen_bookmark=$(echo "$bookmarks_names" | dmenu -i -l 10 -p "Choose title")

[ -z "$chosen_bookmark" ] && exit 0

case "$chosen_bookmark" in
    "+1")
        new_bookmark_link=$(printf "" | dmenu -i -l 10 -p "Enter bookmark's link:")
        [ -z "$new_bookmark_link" ] && exit 0

        if grep "$new_bookmark_link" "$file" ;then
            notify-send "This is already bookmarked"
        else
            new_bookmark_name=$(printf "" | dmenu -i -l 10 -p "Enter bookmark's name:")
            [ -z "$new_bookmark_name" ] && exit 0
            echo ""\"$new_bookmark_name\""="$new_bookmark_link"" >> $file
        fi

        ;;
    "-1")
        bookmark2rm=$(echo "$bookmarks_names" | dmenu -i -l 10 -p "Choose a repo 2 remove:")
        [ -z "$bookmark2rm" ] && exit 0

        tmpfile=$(mktemp /tmp/bookmarks.txt.XXXXXX)
        awk -v target="$bookmark2rm" '$0 !~ target' "$file" > "$tmpfile" && mv "$tmpfile" "$file"
        ;;
    *)
        matched_line=$(grep "$chosen_bookmark" "$file")
        if [ -n "$matched_line" ]; then
            url=$(echo "$matched_line" | sed -n 's/^[^=]*=//p')
            $BROWSER "$url" && xdotool key $MAINMOD+2
        else
            $BROWSER https://www.google.com/search?q="$chosen_bookmark" && xdotool key $MAINMOD+2
        fi 
        ;;
esac
