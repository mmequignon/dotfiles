{ config, pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      fugitive.enable = true;
      web-devicons.enable = true;
      todo-comments.enable = true;
      tmux-navigator.enable = true;
      # mini -> looks interesting, to check
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-signify
    ];
  };
  imports = [
      ./fzf.nix
      ./treesitter.nix
      ./tree.nix
      ./line.nix
      ./lsp.nix
      ./lexima.nix
      ./ultisnips.nix
      ./tagbar.nix
      ./hop.nix
      ./markdown.nix
      # ./copilot.nix
      # ./obsidian.nix
      # ./image.nix
  ];
}
