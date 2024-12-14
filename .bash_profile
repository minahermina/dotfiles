doas loadkeys ~/.config/loadkeysrc/loadkeysrc  

[[ -f ~/.bashrc ]] && . ~/.bashrc
export EDITOR="nvim"
export MAIN_COLOR="#7ba2e1"
export MAINMOD="Super"
export XMONAD_CONFIG_DIR="$XDG_CONFIG_HOME/xmonad/xmonad.hs"
export HISTCONTROL=ignoreboth:erasedups
export EMACSDIR="$HOME/.config/emacs"
export BROWSER="brave"
export REPOS="$HOME/repos"
export DOTFILES="$REPOS/dotfiles"
export SCRIPTS="$HOME/.local/scripts"
export PDFVIEWER="zathura"
export dmenufont="Iosevka Term Nerd Font :style=Medium:size=11"
export TERMINAL="st"
export TERM="st-256color"
export TERM_PROGRAM="st"
export CM_LAUNCHER="dmenu"
export GTK_THEME="Adwaita:dark"
export GTK_FONT_NAME="Cairo:size=10"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export PATH="$PATH:$HOME/.local/bin/"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export PYTHON_HISTORY=$XDG_STATE_HOME/python/history
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#ffffff,fg+:#d0d0d0,bg:-1,bg+:#262626
  --color=hl:'"$MAIN_COLOR"',hl+:'"$MAIN_COLOR"',info:#afaf87,marker:#87ff00
  --color=pointer:#73D936
  --preview-window noborder
  --marker=">" --pointer="◆" --separator="─" --scrollbar="│"'

[ $(tty) = "/dev/tty1" ] && startx


