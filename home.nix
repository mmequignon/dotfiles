{ config, pkgs, ... }:

let
  MPD_MUSIC_DIRECTORY = "/srv/share/music"; 
  NIX_CONFIG = "/home/mmequignon/.config/nixpkgs";
  NIX_CONFIG_DOTFILES = "${NIX_CONFIG}/dotfiles";
in {
  # Let Home Manager install and manage itself.
  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "mmequignon";
  home.homeDirectory = "/home/mmequignon";

  imports = [
    ./packages.nix
    ./shell.nix
    ./gpg.nix
    ./git.nix
    ./nvim.nix
    ./services.nix
  ];

  xdg = {
    userDirs.enable = true;
    configFile = {
      "awesome".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/awesome;
      "mc".source = "${NIX_CONFIG_DOTFILES}/mc";
    };
  };

  home.file = {
      "bin".source = config.lib.file.mkOutOfStoreSymlink "${NIX_CONFIG}/bin";
  };

  # Installed fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
      iosevka
  ];


  services = {
    udiskie.enable = true;
    flameshot.enable = true;
    caffeine.enable = true;
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
    unclutter.enable = true;
    # screenlocker TODO
    # xsuspender   TODO
  };

  programs = {
      ncmpcpp = {
        enable = true;
        bindings = [
          {key = "j"; command="scroll_down";}
          {key = "k"; command="scroll_up";}
          {key = "h"; command="previous_column";}
          {key = "l"; command="next_column";}
          {key = "L"; command="next_screen";}
          {key = "H"; command="previous_screen";}
          {key = "g"; command="move_home";}
          {key = "G"; command="move_end";}
        ];
        mpdMusicDir = "${MPD_MUSIC_DIRECTORY}";
        settings = {
          mpd_host = "192.168.1.47";
          mpd_port = "6600";
          mpd_crossfade_time = "5";
          discard_colors_if_item_is_selected = "yes";
          header_window_color = "black";
          volume_color = "cyan";
          state_line_color = "green";
          state_flags_color = "red";
          main_window_color = "default";
          color1 = "default";
          color2 = "black";
          current_item_inactive_column_prefix = "$(red)$r";
          current_item_inactive_column_suffix = "$/r$(end)";
          current_item_prefix = "$(red)$r";
          current_item_suffix = "$/r$(end)";
         progressbar_color = "green";
          visualizer_color = "cyan";
        };

      };
      rofi = {
        enable = true;
        location = "top";
        theme = "solarized";
      };
      fzf = {
        enable = true;     # TODO configuration
        enableZshIntegration = false;
      };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
