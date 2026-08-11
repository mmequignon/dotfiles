{ config, pkgs, ... }:

let 
     bg_0 = "#103c48";
     bg_1 = "#174956";
     bg_2 = "#325b66";
     dim_0 = "#72898f";
     fg_0 = "#adbcbc";
     fg_1 = "#cad8d9";
     red = "#fa5750";
     green = "#75b938";
     yellow = "#dbb32d";
     blue = "#4695f7";
     magenta = "#f275be";
     cyan = "#41c7b9";
     orange = "#ed8649";
     violet = "#af88eb";
     br_red = "#ff665c";
     br_green = "#84c747";
     br_yellow = "#ebc13d";
     br_blue = "#58a3ff";
     br_magenta = "#ff84cd";
     br_cyan = "#53d6c7";
     br_orange = "#fd9456";
     br_violet = "#bd96fa";
in {
    imports = [
        ./zsh.nix
    ];
    home.file = {
        "Xresources.extra".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/Xresources;
    };
    xdg = {
      configFile = {
        "terminator/config".source = ./dotfiles/terminator.conf;
      };
    };
    programs = {
        tmux = {
            enable = true;
            mouse = true;
            plugins = with pkgs; [
                {
                    plugin = tmuxPlugins.catppuccin;
                    extraConfig = ''
                        set -g @catppuccin_window_status_enable "yes"
                        set -g @catppuccin_window_status_icon_enable "yes"
                    '';
                }
            ];
            extraConfig = ''
                set-option status on
            '';
        };
        urxvt = {
            enable = true;
            iso14755 = true;
            extraConfig = {
                background = "${bg_0}";
                foreground = "${fg_0}";
                perl-ext-common = "default,matcher,resize-font";
                fading = "40";
                fadeColor = "${bg_0}";
                cursorColor = "${fg_1}";
                pointerColorBackground = "${bg_2}";
                pointerColorForeground = "${fg_1}";
                color0 = "${bg_1}";
                color1 = "${red}";
                color2 = "${green}";
                color3 = "${yellow}";
                color4 = "${blue}";
                color5 = "${magenta}";
                color6 = "${cyan}";
                color7 = "${dim_0}";
                color8 = "${bg_2}";
                color9 = "${br_red}";
                color10 = "${br_green}";
                color11 = "${br_yellow}";
                color12 = "${br_blue}";
                color13 = "${br_magenta}";
                color14 = "${br_cyan}";
                color15 = "${fg_1}";
                scrollBar = false;
                scrollBar_right = false;
                urgentOnBell = true;
            };
            keybindings = {
                "Control-equal" = "resize-font:bigger";
                "Control-minus" = "resize-font:smaller";
                "Control-0" = "resize-font:reset";
            };
            fonts = [
                "xft:Fira Mono Medium:size=11"
                "xft:3270 Nerd Font Mono:size=15"
            ];
        };
    };
    home.file = {
        ".local/share/konsole/selenized.colorscheme".source = ./dotfiles/konsole/selenized.colorscheme;
        ".local/share/konsole/selenized.profile".source = ./dotfiles/konsole/selenized.profile;
        ".local/share/konsole/zenburn.colorscheme".source = ./dotfiles/konsole/zenburn.colorscheme;
        ".local/share/konsole/zenburn.profile".source = ./dotfiles/konsole/zenburn.profile;
        ".XCompose".source = ./dotfiles/xcompose;
    };
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
        # fonts
        fira-mono fira-code fira-code-symbols jetbrains-mono terminus_font_ttf
        # tools
        ## network
        nethogs wget rsync curl tcpdump httpie bind
        ## archive
        unzip p7zip unrar fsarchiver
        ## system
        lm_sensors
        ## FS
        mc file zip  sysfsutils ext4magic tree ack silver-searcher compsize
        # TE
        terminator konsole
        ## ?
        pastebinit xorg.xev xorg.xmodmap
    ];
}
