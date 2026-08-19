{ config, pkgs, ... }:

{
    imports = [
        ./zsh.nix
        ./bash.nix
        ./tmux.nix
    ];
    home.file = {
        ".XCompose".source = ./dotfiles/xcompose;
    };
    xdg = {
      configFile = {
        "alacritty".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/alacritty;
      };
    };
    home.packages = with pkgs; [
        # fonts
        iosevka nerd-fonts.iosevka
        # nerd-fonts.fira-code fira-code fira-code-symbols
    ];
}
