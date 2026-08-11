{ config, pkgs, ... }:

let
  ssh_key = import ./secrets/unwithstood.nix;
  gpg_signing_key = import ./secrets/indented.nix;
in 
{
  home.packages = with pkgs; [
    ## GPG
    pinentry-qt
  ];
  programs.gpg = {
    enable = true;
    settings = {
      keyserver = "keys.openpgp.org";
      default-key = "${gpg_signing_key}";
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentryPackage = pkgs.pinentry-qt;
    defaultCacheTtl = 18000;
    maxCacheTtl = 36000;
    defaultCacheTtlSsh = 18000;
    maxCacheTtlSsh = 36000;
    extraConfig = ''
      no-grab
      allow-emacs-pinentry
      allow-loopback-pinentry
    '';
    sshKeys = [
      "${ssh_key}"
    ];
  };
  programs.zsh.initExtra = ''
      export GPG_TTY=$(tty)
  '';
}
