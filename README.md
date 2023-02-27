## Quick Start

### Get this Repo
```
mkdir -p ~/.config
git clone git@github.com:nhazekam/dotfiles.git ~/.config/nixpkgs
```

### Install Nix
```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

### Update flakes.nix and home.nix to match your system
[Example](https://juliu.is/tidying-your-home-with-nix/)

### Enable Home Manager via Nix
```
cd ~/.config/nixpkgs
nix run . switch
```

### Install Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/usr/local/bin/brew shellenv)"
brew tap Homebrew/bundle
brew bundle install
brew bundle --file=~/.config/nixpkgs/Brewfile
```

## Update config

### Changes to flakes.nix or home.nix
```
home-manager switch
```

### Dump Brewfile
```
brew bundle dump --file=~/.config/nixpkgs/Brewfile
```

