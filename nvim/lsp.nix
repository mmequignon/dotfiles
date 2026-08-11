{ config, pkgs, ... }:
{
  programs.nixvim = {
    diagnostic.settings.virtual_text = true;
    plugins.lspconfig.enable = true;
    lsp = {
      inlayHints.enable = true;
      servers = {
        ruff = {
          enable = true;
          config = {
            cmd = [ "ruff" "server" ];
            settings = {
                lazy = false;
            };
          };
        };
      };
    };
  };
}
