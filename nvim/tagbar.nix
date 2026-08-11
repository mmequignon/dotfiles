{ config, pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      ctags
      gcc
    ];
    keymaps = [
      {
        key = "<F4>";
        action = ":TagbarToggle <CR> | :TagbarTogglePause<CR>";
        mode = "n";
        options.silent = true;
      }
    ];
    plugins.tagbar = {
      enable = true;
      settings = {
        autofocus = 1;
        autoclose = 1;
        sort = 0;
        show_linenumbers = 1;
        compact = 1;
      };
    };
  };
}
