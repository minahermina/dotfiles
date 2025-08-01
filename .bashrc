source ~/.local/scripts/fzf-git.sh
shopt -s autocd 
shopt -s histappend
stty -ixon
stty quit '^q'
HISTSIZE=100000000
HISTFILESIZE=100000000
HISTFILE=~/.bash_history
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
HISTCONTROL=ignoredups

alias 2..='../..'
alias 3..='../../..'
alias ll='ls -lah'
alias cs='clear'
alias t='tmux'
alias lf='lfub'
alias sz='du -sh'
alias lg='lazygit'
alias v='nvim'
alias pdf='zathura'
alias mutt='mbsync -a && neomutt'
alias emacs='emacs --init-directory=$XDG_CONFIG_HOME/emacs/'
alias notes='nvim ~/.local/mine/notes/'
alias dk='docker'
alias dcon='docker container'
alias dimg='docker image'
alias dvol='docker volume'
alias dnet='docker network'


alias vbr='nvim $HOME/.bashrc'
alias so='source ./venv/bin/activate'
alias vbp='nvim $HOME/.bash_profile'
alias sb='source $HOME/.bashrc && source $HOME/.bashrc'
alias vt='nvim $XDG_CONFIG_HOME/tmux/tmux.conf'
alias gh='_fzf_git_hashes'

# Package manager Aliases
case "$(uname)" in
    Linux)
        alias i='doas xbps-install -S'
        alias s='doas xbps-query -Rs'
        alias u='doas xbps-install -Su; doas xbps-install -u xbps; doas xbps-install -u'
        alias r='doas xbps-remove -R'
        alias q='doas xbps-query -s'
        alias qr='doas xbps-query -s'
        alias qf='doas xbps-query -f'
        ;;
    OpenBSD)
        alias i='doas pkg_add'
        alias s='doas pkg_info -a -Q'
        alias r='doas pkg_delete'
        alias q='doas pkg_info -a | grep'
        ;;
    FreeBSD)
        alias i='doas pkg install '
        alias s='doas pkg search'
        alias r='doas pkg delete'
        alias q='doas pkg info'
        ;;
    *)
        echo "Unknown OS: $(uname)"
        ;;
esac


goto(){
    local file=$(find . | fzf --reverse --height=50% --header="Jump to location"  )
    [ -f "$file" ] && xdg-open "$file" || cd $(dirname "$file")
}

alias ff=goto
alias transa='trans :en+ara'
alias gput='nvidia-settings -q gpucoretemp -t'
alias dot='cd $REPOS/dotfiles/'
alias pkgs='tmux neww "nvim $HOME/.local/share/pkglist.txt" '
alias zed='~/temp/zed.app/bin/zed'


parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

fzf_history(){
    local selected_command=$(tac ~/.bash_history | fzf --reverse --height=40% )
    READLINE_LINE="${READLINE_LINE:+$READLINE_LINE }$selected_command"
    READLINE_POINT=${#READLINE_LINE}
}

fzf_dir() {
    local selected_dir=$(find "$HOME" -type d | fzf --reverse --height=50% )
    cd "$selected_dir" && echo "cd $selected_dir"
}  

parse_venv() {
    echo "$VIRTUAL_ENV_PROMPT"
}


bind -m emacs-standard -x '"\C-r": fzf_history'
bind -m vi-command -x '"\C-r": fzf_history'
bind -m vi-insert -x '"\C-r": fzf_history'

bind -m emacs-standard -x '"\C-o": fzf_dir'
bind -m vi-command -x '"\C-o": fzf_dir'
bind -m vi-insert -x '"\C-o": fzf_dir'

bind '"\C-b": backward-delete-char'
bind -m vi-insert '"\C-b": backward-delete-char'

export PS1="\n\[\e[32m\]\w\[\033[33m\]\$(parse_git_branch) \$(parse_venv) \[\033[37m\] \n< "

set -o vi
eval "$(zoxide init bash)"
