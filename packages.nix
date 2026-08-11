{ config, pkgs, ... }:


{
  home.packages = with pkgs; with python3Packages; [
    # archive 
    unzip p7zip fsarchiver zip rar
    # network
    nethogs wget rsync curl tcpdump httpie bind
    # system tools
    htop dfc sysfsutils file tree compsize
    # dev tools
    ripgrep jq
    # tools
    imagemagick simplescreenrecorder pastebinit arandr 
  ];
}
