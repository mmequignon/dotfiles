{ config, pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      tree-sitter
    ];
    plugins.treesitter = {
      enable = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        xml
        python
        comment
        nix
      ];
    };
  };
}
