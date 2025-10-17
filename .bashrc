# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#setup dotfile aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

#vim aliases
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

#upgraded commands
#alias cat="bat"
#alias ls="exa"

#devleopment variables
TMUX_CONFIG="~/.config/tmux/.tmux.conf"

#edit config aliases
alias termconfig="nvim ~/.config/alacritty/alacritty.yml"
alias shconfig="nvim ~/.bashrc"
alias shellconfig="nvim ~/.bashrc"
alias vimconfig="nvim ~/.vim/vimrc"
alias nvimconfig="nvim ~/.config/nvim/init.lua"
alias tmuxconfig="nvim $TMUX_CONFIG"
alias i3config="nvim ~/.config/i3/config"
alias i3blocksconfig="nvim ~/.config/i3blocks/config"

#development shortcuts
alias lg="lazygit"
alias cfg='lazygit --git-dir=$HOME/.cfg --work-tree=$HOME'
alias nt="alacritty&"
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"
alias tl="tmux list-sessions"
alias o="rg --files . | fzf | xargs nvim"
alias c="clear"
alias z="zoxide"
alias b="bore local -t ajet.lol"
alias devbox="ssh root@192.168.1.45"

#enable vim mode
set -o vi

#startup eyecandy
#wal -i ~/Pictures/Wallpapers/bg.jpg -q
#pfetch

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

. "$HOME/.cargo/env"
export PATH=$PATH:/snap/bin/zig:~/.scripts/utils:~/.scripts/setup

export STARSHIP_CONFIG=~/.config/starship/starship.toml

eval "$(zoxide init bash)"
eval "$(starship init bash)"

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

