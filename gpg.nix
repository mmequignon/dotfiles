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

    programs.browserpass = {
      enable = true;
      browsers = [
        "firefox"
      ];
    };

    programs.password-store = {
      enable = true;
      settings = {
        PASSWORD_STORE_DIR = "$HOME/password-store";
      };
      package = pkgs.pass.withExtensions (exts: [
        exts.pass-import
      ]);
    };

    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
      defaultCacheTtl = 18000;
      maxCacheTtl = 36000;
      defaultCacheTtlSsh = 18000;
      maxCacheTtlSsh = 36000;
      extraConfig = ''
        pinentry-program ${pkgs.pinentry-qt}/bin/pinentry
        allow-emacs-pinentry
        allow-loopback-pinentry
      '';
      sshKeys = [
        "${ssh_key}"
      ];
    };
}
