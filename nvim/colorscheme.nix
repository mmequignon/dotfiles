{ config, pkgs, ... }:
{
  xdg.configFile = {
    "nvim/colors".source = config.lib.file.mkOutOfStoreSymlink ./colors;
  };
# set termguicolors
# colorscheme catppuccin-mocha
  programs.nixvim = {
    opts = {
      termguicolors = true;
      background = "dark";
    };
    # extraConfigLuaPost = ''vim.cmd [[ colorscheme selenized ]]'';
    extraConfigLuaPost = ''vim.cmd [[ colorscheme blue-mood ]]'';
  };
  # programs.nixvim.colorschemes = {
  #   catppuccin = {
  #     enable = true;
  #     settings = {
  #       flavour = "frappe";
  #       integrations = {
  #         treesitter = true;
  #       };
  #     };
  #   };
  # };
}
