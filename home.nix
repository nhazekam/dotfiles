{ pkgs, Firefox, ... }: {
  home.homeDirectory = "/Users/nicholashazekamp";
  home.username = "nicholashazekamp";
  home.stateVersion = "22.11";

  programs.home-manager.enable = true;

  home.packages = [
    pkgs.ripgrep
    pkgs.thefuck
    pkgs.asdf
    pkgs.rlwrap
    pkgs.curl
    pkgs.jq
    pkgs.unzip
  ];

  home.file.".tool-versions".source = ./tool-versions
  home.file.".asdfrc".source = ./asdfrc

  programs.firefox.package = Firefox;
    
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    profileExtra = builtins.readFile ./zprofile;
    initExtraBeforeCompInit = builtins.readFile ./pre-zshrc;
    initExtra = builtins.readFile ./zshrc;
    envExtra = builtins.readFile ./zshenv;

    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreDups = true;
      ignoreSpace = true;
      share = false;
    };


    shellAliases = {
      ll = "ls -l";
      rust-book = "rustup docs --book";
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

  programs.bat = {
    enable = true;
    themes = {
      dracula = builtins.readFile (pkgs.fetchFromGitHub {
        owner = "dracula";
        repo = "sublime"; # Bat uses sublime syntax for its themes
        rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
        sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
      } + "/Dracula.tmTheme");
    };
  };

  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    changeDirWidgetCommand = "fd -t d --hidden --follow --exclude \".git\" . $HOME";
    fileWidgetCommand = "fd --hidden --follow --exclude \".git\" . $HOME";
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    includes = [{ path = "~/.config/nixpkgs/gitconfig"; }];
  };

  programs.gpg = {
    enable = true;
  };

  programs.navi = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
  };

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    newSession = true;
  };

  programs.watson = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      options = {
        stop_on_start = true;
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

}
