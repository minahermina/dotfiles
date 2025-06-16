doas loadkeys ~/.config/loadkeysrc/loadkeysrc  

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="nvim"
export MAIN_COLOR="#8f8f8f"
export MAINMOD="Super"
export HISTCONTROL=ignoreboth:erasedups
export BROWSER="waterfox"
export REPOS="$HOME/repos"
export DOTFILES="$REPOS/dotfiles"
export SCRIPTS="$HOME/.local/scripts"
export PDFVIEWER="zathura"
export TERMINAL="st"
export TERM=st-256color
export COLORTERM=truecolor
export TERM_PROGRAM="st"
export CM_LAUNCHER="dmenu"
export GTK_THEME="Adwaita:dark"
export GTK_FONT_NAME="Cairo:size=10"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="$PATH:$HOME/.local/bin/"
export EMACSDIR="$HOME/.config/emacs"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export GIT_CONFIG_SYSTEM="$XDG_CONFIG_HOME"/git/config
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export PYTHON_HISTORY=$XDG_STATE_HOME/python/history
export BUN_INSTALL="$XDG_DATA_HOME/bun"
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export MANPAGER="nvim +Man!"


export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#ffffff,fg+:#d0d0d0,bg:-1,bg+:#262626
  --color=hl:'"$MAIN_COLOR"',hl+:'"$MAIN_COLOR"',info:#afaf87,marker:#87ff00
  --color=pointer:'"$MAIN_COLOR"'
  --preview-window noborder
  --marker=">" --separator="─" --scrollbar="│"'

[ $(tty) = "/dev/tty1" ] && startx


export IDEA_JDK='/usr/lib/jvm/openjdk21/'
export PYCHARM_JDK='/usr/lib/jvm/openjdk21/'
export PATH=$JAVA_HOME/bin:$PATH

export GPG_TTY=$(tty)
gpgconf --launch gpg-agent
export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_PLUG="p:preview-tui;"

