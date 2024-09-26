{ config, pkgs, ... }:

{
  home.username = "drekar";
  home.homeDirectory = "/home/drekar";

  # Packages
  # --------
  home.packages = with pkgs; [
  ];

  # Programs
  # --------
  programs.gpg.enable = true;
  programs.direnv.enable = true;
# Services
  # --------
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "curses";
    enableSshSupport = true;
    sshKeys = [
      "5872E22381D2CAE544BD397B797F6E7B29918FEB"
      "615BE46F36051855D6DB15CFF5AE172AA9F14E97"
    ];
  };

  # Dotfiles
  # --------
  home.file = {
    ".config/dunst/dunstrc".source = dunst/dunstrc;

    ".config/foot/foot.ini".source = foot/foot.ini;

    ".config/git/config".source = git/config;
    ".config/git/ignore".source = git/ignore;

    ".config/hypr/hyprland.conf".source = hypr/hyprland.conf;
    ".config/hypr/monitors.ng.sh".source = hypr/monitors.ng.sh;
    ".config/hypr/monitors.sh".source = hypr/monitors.sh;
    ".config/hypr/start.sh".source = hypr/start.sh;
    ".config/hypr/suspend.sh".source = hypr/suspend.sh;

    ".config/kitty/kitty.conf".source = kitty/kitty.conf;

    ".config/mako/config".source = mako/config;

    # NOTE: nvim NOT sourced into store via home-manager because it includes
    # a package manager (lazy.nvim) which attempts to mutate the RO fs.
    # ".config/nvim".source = ./nvim;
    # symlink ~/.config/nvim is created manually.

    ".rgcfg".source = ripgrep/rgcfg;

    # ".config/rofi/config.rasi".source = rofi/config.rasi;
    ".config/fuzzel/fuzzel.ini".source = fuzzel/fuzzel.ini;

    ".ssh/config".source = ssh/config;
    ".ssh/id_ed25519_drekar.pub".source = ssh/id_ed25519_drekar.pub;
    ".ssh/id_ed25519_lkingland.pub".source = ssh/id_ed25519_lkingland.pub;

    ".config/waybar/config.jsonc".source = waybar/config.jsonc;
    ".config/waybar/style.css".source = waybar/style.css;

    ".config/wezterm/wezterm.lua".source = wezterm/wezterm.lua;

    ".zshenv".source = zsh/zshenv; # must be in home dir
    # ".config/zsh/.zshenv".source = zsh/zshenv;
    ".config/zsh/.zshrc".source = zsh/zshrc;
    ".config/zsh/completion.zsh".source = zsh/completion.zsh;
    ".config/zsh/.p10k.zsh".source = zsh/p10k.zsh;
    ".config/zsh/plugins".source = ./zsh/plugins;
    ".config/zsh/zoxide.zsh".source = zsh/zoxide.zsh;

    ".config/tmux/tmux.conf".source = tmux/tmux.conf;

    # # Example Inlined Config
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.shellAliases = {
    # k = "kubectl";
  };

  home.sessionPath = [
    # "$HOME/src/exe" ;
  ];

  home.stateVersion = "23.05";         # see docs
  programs.home-manager.enable = true; # self-manage

  # TODO:
  # programs.afew/alot/notmuch (email)
  # aria2, asteroid, autojump, autorandr, beets, broot, cava,
  # darcs, dircolors, eza, feh, fuzzel,
  # foot, fzf, fish, gallery-dl, gh, gh-dash, git-cliff, gitui,
  # hexchat, himalaya, havoc, hstr, imv, irssi, joshuto, k9s,
  # keychain, khal, khard, lazygit, ledger, lf, librewolf,
  # lieer (for notmuch), lsd, mcfly, mpv, powerline-go, qcal,
  # rbw, ripgrep, senpai, skim, starship, thefuck, thunderbird,
  # tiny (irc TUI), tmux, xplr, yazi, yt-dlp, zathura, zoxide,
  #
  # barrier, batsignal, betterlockscreen, caffeine, cbatticon,
  # cliphist, clipman, clipmenu, comodoro, copyq,  easyeffects,
  # flameshot, gpg-agent, hound, kbfs, mbsync, megasync, 
  # nextcloud-client, pantalaimon, parcellite,
  # pass-secret-service, pbgopy, playerctld, polybar,
  # poweralertd, redshift, safeeyes, sctd, ssh-agent,
  # swayidle, udiskie, unclutter,  volnoti, wlsunset, 
  # systemd.user.mounts/paths/services/slices etc.
  # xdg.enable/cacheHome/...
}
