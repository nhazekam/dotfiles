
# prevent duplicates in zsh history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

# fzf setup
bindkey "^A" fzf-cd-widget
export FZF_COMPLETION_TRIGGER="''"

_fzf_compgen_path() {
  fd --hidden --follow --exclude .git . "$1"
}
_fzf_compgen_dir() {
  fd --type d . "$1"
}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fuck / f
alias f="fuck"
eval $(thefuck --alias)

pu() {
  open "http://punchit.atomicobject.com/login.php?employee=217"
}

# obvi
why() {
  osascript -e "set Volume 3"
  open "https://www.youtube.com/watch?v=shbxUe-S2V8"
}

# mute
mute() {
  osascript -e "set Volume 0"
}

# transform a markdown file into a pdf with a table of contents
mdtopdf() {
  markdown-toc -i $1
  md-to-pdf $1
}

# list ports being listened on
listening() {
  lsof -i -n -P | grep TCP | grep LISTEN
}

# clear branchs that have been removed on remote
gpurge() {
  git fetch -p && git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -D
}

# totally reset WIP of current branch
gnuke() {
  git reset --hard
  gco .
  git clean -fd
}

unalias gg
# checkout branch with fzf
gg() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# tig
t() {
  tig
}

# tig all branches
ta() {
  tig --all
}

# direnv
eval "$(direnv hook zsh)"

# ASDF
if [[ -f $HOME/.asdf/asdf.sh ]]; then
  . $HOME/.asdf/asdf.sh
fi

# Nix
if [[ -f '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]]; then
  source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
  export NIX_PATH="$HOME/.nix-defexpr"
fi


# End Nix
