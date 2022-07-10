## Installation

Install the repo
```bash
git clone --bare https://gitlab.com/Ajetski/dotfiles $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
```

Install plugins in neovim via `:PlugInstall`

Run `install_packages` script on Ubuntu or Pop!_Os systems or read script to see packages that should be installed
