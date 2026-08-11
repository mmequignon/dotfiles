{ config, pkgs, ... }:
{
  # Do not use fzf lua
  # However this is easier to manage this here,
  # as we can reuse the same keymaps later if we want to change.
  programs.nixvim = {
      userCommands = {
        OdooMod = {
          command.__raw = ''
            function(opts)
              local query = opts.args or ""
              vim.fn["fzf#run"](vim.fn["fzf#wrap"]({
                source = "find . -type f -name '__manifest__.py' -o -name '__openerp__.py'",
                sink = "edit",
                options = "--prompt 'Odoo Modules> ' --query " .. vim.fn.shellescape(query),
              }))
            end
          '';
          nargs = "?";
        };
      };
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
      {
        mode = "n";
        key = "M"; # Remplacer par "A" ou "X" si tu préfères
        action = ":OdooMod<CR>";
        # options = {
        #   silent = true;
        #   desc = "Chercher un module Odoo (Manifeste)";
        # };
      }
    ];
  };
}
