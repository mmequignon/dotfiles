{ config, pkgs, ... }:
{
  xdg.configFile = {
    "nvim/colors".source = config.lib.file.mkOutOfStoreSymlink ./colors;
  };
# set termguicolors
  programs.nixvim = {
    opts = {
      termguicolors = true;
      background = "dark";
    };
    extraConfigLuaPost = ''vim.cmd [[ colorscheme selenized ]]'';
    # extraConfigLuaPost = ''vim.cmd [[ colorscheme blue-mood ]]'';
  };
}
