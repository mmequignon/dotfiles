{ config, pkgs, ... }:
{
  # Do not use fzf lua
  # However this is easier to manage this here,
  # as we can reuse the same keymaps later if we want to change.
  programs.nixvim = {
    extraPackages = with pkgs; [
      ripgrep
      bat
      delta
      fzf
    ];
    extraPlugins = with pkgs.vimPlugins; [
      fzf-vim
    ];
    keymaps = [
      {
        key = "K";
        action = ":Rg <C-r><C-w>";
      }
      {
        key = "F";
        action = ":FZF<CR>";
        mode = "n";
      }
    ];
  };
}
