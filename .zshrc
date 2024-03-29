export EDITOR=nvim
export VISUAL="$EDITOR"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias shconfig="nvim ~/.zshrc"

export XDG_CONFIG_HOME="$HOME/.config"

#setup dotfile aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

#vim aliases
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

#devleopment variables
TMUX_CONFIG="~/.config/tmux/.tmux.conf"
TODO_ON_CLEAR=true

#upgrade the commands
alias cat="bat"
alias ls="exa"

#development shortcuts
#git things
alias lg="lazygit"
alias ga="git add -A"
alias gr="git reset"
alias gb="git branch"
alias gch="git checkout"
alias gc="git commit -m"
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
alias c='clear; $TODO_ON_CLEAR && cat ~/todo'
alias wt='wiki-tui'
alias kssh="kitty +kitten ssh"
alias server="kitty +kitten ssh root@ajet.lol"
alias dnsconfig="sudo nvim /etc/hosts"
alias b="bore local -t ajet.lol"
alias ht="nvim ~/temp.http"
alias gs="git stash"
alias gsp="git stash pop"

#lazy work things
alias ss="script/server"
alias sb="script/build"
alias ssd="script/server -d"
alias ssp="script/server-proxy"
alias sit="script/integration-playwright-tests"

#todo things
alias todooff="TODO_ON_CLEAR=false"
alias todoon="TODO_ON_CLEAR=true"
alias shreload="source ~/.zshrc"
alias todo="nvim ~/todo"
alias todos="cat ~/todo"

alias icat="kitty +kitten icat"

M_DIR="~/private/out"
alias m="find $M_DIR -type f | shuf -n 1 | xargs kitty +kitten icat --scale-up --align left"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -a'
alias l='ls'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

export PATH="/opt/homebrew/opt/cython/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.scripts/utils:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

export HIGHLIGHT_STYLE=manxome

export STARSHIP_CONFIG=~/.config/starship/starship.toml

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

