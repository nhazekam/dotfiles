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

### Install Rust
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Install NodeJS
```
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add yarn
asdf install
```

### Install Java/Closure
```
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin add clojure https://github.com/asdf-community/asdf-clojure.git
asdf install
```

### Install Haskell
```
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
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

