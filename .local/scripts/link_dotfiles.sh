#!/bin/bash
DOTFILES="$HOME/repos/dotfiles"
dirs=(  
        ".config/nvim"
        ".config/dunst"
        ".config/lf"
        ".config/loadkeysrc"
        ".config/nvim"
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
     )
files=(
        ".local/share/pkglist.txt"
        ".local/share/bookmarks.txt"
        ".local/share/git_repos.txt"
        ".config/screenkey.json"
        ".config/mimeapps.list"
        ".bashrc"
        ".bash_profile"
      )
         
#ln -s ~/repos/dotfiles/.config/fastfetch ~/.config/fastfetch
for dir in "${dirs[@]}"; do
    echo "--> Executing rm -rf "$HOME/$dir""
    rm -rf "$HOME/$dir"
    echo "--> Executing ln -s $DOTFILES/$dir $HOME/$dir"
    ln -s $DOTFILES/$dir $HOME/$dir
    echo ""
done

for file in "${files[@]}"; do
    echo "--> Executing rm -rf $HOME/$file"
    rm -rf "$HOME/$file"
    echo "--> Executing ln -s $DOTFILES/$file $HOME/$file"
    ln -s $DOTFILES/$file $HOME/$file
done
