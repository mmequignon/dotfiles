{ config, pkgs, ... }:
let
  # Import nixvim
  nixvim = import (
    builtins.fetchGit {
        # temporary fix https://github.com/nix-community/nixvim/issues/3966
        rev = "695b0b80f8452bc584adf23eb58bdc9f599e35eb";
        url = "https://github.com/nix-community/nixvim";
    }
  );
in {
    programs.nixvim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        withPython3 = true;
        extraPython3Packages = (ps: with ps; [
          pynvim
        ]);
    };
    imports = [
      # Propagate nixvim
      nixvim.homeManagerModules.nixvim
      ./settings.nix
      ./colorscheme.nix
      ./plugins.nix
      ./keymaps.nix
      ./commands.nix
      ./branch_notes.nix
    ];
}
