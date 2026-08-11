{ config, pkgs, ... }:
{
  xdg.configFile = {
      "nvim/ultisnips_custom".source = config.lib.file.mkOutOfStoreSymlink ./ultisnips_custom;
  };
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      ultisnips
    ];
    globals = {
      UltiSnipsSnippetDirectories = [ "UltiSnips" "ultisnips_custom" ];
      UltiSnipsExpandTrigger = "<tab>";
      UltiSnipsJumpForwardTrigger = "<c-j>";
      UltiSnipsJumpBackwardTrigger = "<c-k>";
    };
  };
}
