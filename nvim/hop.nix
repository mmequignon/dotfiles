{ config, pkgs, ... }:
{
    programs.nixvim = {
        keymaps = [
            {
                key = "W";
                action = ":HopWord<CR>";
                mode = "n";
            }
        ];
        extraPlugins = with pkgs.vimPlugins; [
          hop-nvim
        ];
        extraConfigLua = "require('hop').setup()";
    };
}
