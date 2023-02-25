# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME="refined"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export VISUAL="$EDITOR"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias shconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

export XDG_CONFIG_HOME="$HOME/.config"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#setup dotfile aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

#vim aliases
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

#devleopment variables
TMUX_CONFIG="~/.config/tmux/.tmux.conf"
TODO_ON_CLEAR=false

#upgrade the commands
alias cat="bat"
alias ls="exa"

#development shortcuts
#git things
alias lg="lazygit"
alias cfg="lazygit --git-dir=$HOME/.cfg --work-tree=$HOME"
#terminal multiplexing things
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"
alias tl="tmux list-sessions"
alias zj="zellij"
#vim searcher
alias o="rg --files . | fzf | xargs nvim"
#being lazy
alias r="ranger"
alias c='clear' #; $TODO_ON_CLEAR && tail -n 10 ~/todo'

#todo things
alias todooff="TODO_ON_CLEAR=false"
alias todoon="TODO_ON_CLEAR=true"
alias shreload="source ~/.zshrc"
alias todo="nvim ~/todo"

alias icat="kitty +kitten icat"

M_DIR="~/private/out"
alias m="find $M_DIR -type f | shuf -n 1 | xargs kitty +kitten icat --scale-up --align left"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

export PATH="/opt/homebrew/opt/cython/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.scripts/utils:$PATH"

export HIGHLIGHT_STYLE=manxome

source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

export STARSHIP_CONFIG=~/.config/starship/starship.toml

_bb_tasks() {
    local matches=(`bb tasks |tail -n +3 |cut -f1 -d ' '`)
    compadd -a matches
    _files # autocomplete filenames as well
}
compdef _bb_tasks bb

#tail -n 10 ~/todo
eval "$(starship init zsh)"
