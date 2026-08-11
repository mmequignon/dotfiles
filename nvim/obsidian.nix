{ config, pkgs, ... }:
{
  programs.nixvim = {
    keymaps = [
        {
            key = "C-O";
            action = ":Obsidian search ";
            mode = "n";
        }
    ];
    plugins.obsidian = {
      enable = true;
      settings = {
        legacy_commands = false; # https://github.com/obsidian-nvim/obsidian.nvim/wiki/Commands
        workspaces = [
          {
            name = "vault";
            path = "~/obsidian/Obsidian";
          }
        ];
      };
    };
    extraFiles = { # This enables character substitution only for markdown files
        "after/ftplugin/markdown.lua".text = ''
            vim.opt_local.conceallevel = 2
        '';
    };
  };
}
