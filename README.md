## Installation

### Clone the repo

```bash
git clone --bare git@github.com:ajetski/dotfiles.git $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
```

<hr>

### Install Neovim Packages

Install plugins in neovim via `:PackerSync`

<hr>

### Install Script using Apt

*not maintained; i mostly use homebrew on mac now, (note to self: is there a way to version control that?)*

Run `install_packages` script on Ubuntu or Pop!_Os systems or read script to see packages that should be installed
