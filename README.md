## Installation

### Clone the repo

```bash
git clone --bare gitiea@gitea.ajet.lol:/ajet/dotfiles.git $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
```

<hr>

### Install Neovim Packages
- Install Packer.nvim (it's a one-liner)
- Install plugins in neovim via `:PackerSync`

<hr>

### Install Script using Apt

*not maintained; i mostly use homebrew on mac now, (note to self: is there a way to version control that?)*

Run `install_packages` script on Ubuntu or Pop!_Os systems or read script to see packages that should be installed

## Steps to setup a new macbook
- rustup one-liner
- homebrew one-liner
- oh-my-zsh one-liner
- enable mission control space keybinds
- generate ssh key & add that to github
- clone & setup this repo
- packer one-liner
- brew install all of the things (like neovim, starship, zsh-vi-mode)

