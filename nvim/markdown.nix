{ config, pkgs, ... }:
{
  programs.nixvim = {
    plugins.render-markdown = {
      enable = true;
    };
    plugins.treesitter = {
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        markdown
        markdown-inline
      ];
    };
    extraFiles = { # This enables character substitution only for markdown files
        "after/ftplugin/markdown.lua".text = ''
            vim.opt_local.conceallevel = 2
        '';
    };
  };
}
