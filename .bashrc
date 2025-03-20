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
alias ls='ls --group-directories-first'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias cs='clear'
alias t='tmux'
alias lf='lfub'
alias sz='du -sh'
alias lg='lazygit'
alias v='nvim'


alias vbr='nvim $HOME/.bashrc'
alias so='source ./venv/bin/activate'
alias vbp='nvim $HOME/.bash_profile'
alias sb='source $HOME/.bashrc && source $HOME/.bashrc'
alias vt='nvim $XDG_CONFIG_HOME/tmux/tmux.conf'

# Pacman Aliases
alias i='doas pacman -S'
alias s='doas pacman -Ss'
alias u='doas pacman -Syu'
alias r='doas pacman -Rs'
alias q='doas pacman -Qe'
alias qi='doas pacman -Qi'
qf() {
    pacman -Qlq "$1" | grep -v '/$' | xargs -r du -h | sort -h
}

# yay Aliases
alias yi='yay -S'
alias ycc='yay -Scc ; doas pacman -Sc'
alias yq='yay -Qs'
alias yu='yay -Syu'
alias ys='yay -Ss'

goto(){
    local file=$(find . | fzf --header="Jump to location"  )
    [ -d "$file" ] && cd $file || cd $(dirname "$file")
}

alias ff=goto
alias transa='trans :en+ara'
alias gput='nvidia-settings -q gpucoretemp -t'
alias dot='cd $REPOS/dotfiles/'
alias pkgs='tmux neww "nvim $HOME/.local/share/pkglist.txt" '

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

export PS1="\n\[\e[32m\]\w\[\033[33m\]\$(parse_git_branch) \$(parse_venv) \[\033[37m\] \n❯❯ "

set -o vi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
