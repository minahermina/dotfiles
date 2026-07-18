#!/usr/bin/env bash

DOTFILES="$HOME/repos/dotfiles"

targets=(
        ".config/nvim"
        ".config/dunst"
        ".config/lf"
        ".config/loadkeysrc"
        ".config/sxhkd"
        ".config/tmux"
        ".config/neomutt"
        ".config/clipmenu"
        ".config/zathura"
        ".config/xmodmap"
        ".config/newsboat"
        ".config/X11"
        ".local/scripts"
        ".local/bin"
        ".local/share/pkglist.txt"
        ".local/share/bookmarks.txt"
        ".local/share/git_repos.txt"
        ".config/screenkey.json"
        ".config/mimeapps.list"
        ".bashrc"
        ".bash_profile"
      )

#ln -s ~/repos/dotfiles/.config/fastfetch ~/.config/fastfetch

for target in "${targets[@]}"; do
    echo "--> Executing rm -rf \"$HOME/$target\""
    rm -rf "${HOME:?}/${target:?}"
    echo "--> Executing ln -s $DOTFILES/$target $HOME/$target"
    ln -s "$DOTFILES/$target" "$HOME/$target"
    echo ""
done
