#!/bin/sh

set -xe

git_repos_file="$XDG_DATA_HOME/git_repos.txt"
repos=$(sed -E 's#.*/([^/]+/[^/]+)/*$#\1#' "$git_repos_file")
choice=$(echo "$repos" | dmenu -i -l 10 -p "Choose a repo:")

if [ "$choice" = "'new" ]; then
    new_repo=$(printf "" | dmenu -i -l 10 -p "Enter repo's link:")
    echo $new_repo >> "$git_repos_file"
elif [ "$choice" = "'rm" ]; then
    repo2rm=$(echo "$repos" | dmenu -i -l 10 -p "Choose a repo 2 remove:")
    tmpfile=$(mktemp /tmp/test.txt.XXXXXX)
    awk -v target="$repo2rm" '$0 !~ target' "$git_repos_file" > "$tmpfile" && mv "$tmpfile" "$git_repos_file"
else
    repo_url="$(grep "$choice" "$git_repos_file")"
    $BROWSER "$repo_url" && xdotool key "$MAINMOD"+2
fi
