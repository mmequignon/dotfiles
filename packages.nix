{ config, pkgs, ... }:


{
  home.packages = with pkgs; with python3Packages; [
    pgcli python-lsp-server jq
    # DBEAVER
    dbeaver socat # socat required to forward connections from port to socket
    #
    imagemagick gimp
    lastpass-cli # bugged
    htop dfc arandr mpv-unwrapped
    patchutils zim
    # for raumschmiede
    gnome.networkmanager-openvpn networkmanager-openvpn
    # recording
    simplescreenrecorder tdesktop slack keepassxc
    # docker-compose
    docker-compose

    # azure stuff
    #kubectl azure-cli k9s kubelogin
    #thttpd # for htpasswd
    sops jq
  ];
}
