if [[ -f '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]]; then
  source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
  export NIX_PATH="$HOME/.nix-defexpr"
fi


if [[ -f '/usr/local/bin/brew' ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi
