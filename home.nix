{ pkgs, Firefox, ... }: {
  home.homeDirectory = "/Users/nicholashazekamp";
  home.username = "nicholashazekamp";
  home.stateVersion = "22.11";

  programs.home-manager.enable = true;

  home.packages = [
    pkgs.ripgrep
    pkgs.thefuck
    pkgs.asdf
  ];

  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    profileExtra = builtins.readFile ./zprofile;
    initExtra = builtins.readFile ./zshrc;
    envExtra = builtins.readFile ./zshenv;

    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreDups = true;
      ignoreSpace = true;
      share = false;
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";

      plugins = [
        "git"
        "asdf"
        "aws"
        "fd"
        "fzf"
        "ripgrep"
        "thefuck"
        "rust"
        "vi-mode"
        "yarn"
        "zoxide"
      ];
    };


  };

  programs.git = {
    enable = true;
    includes = [{ path = "~/.config/nixpkgs/gitconfig"; }];
  };

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
  };

  programs.firefox.package = Firefox;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    changeDirWidgetCommand = "fd -t d --hidden --follow --exclude \".git\" . $HOME";
    fileWidgetCommand = "fd --hidden --follow --exclude \".git\" . $HOME";
  };

  programs.zoxide = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
