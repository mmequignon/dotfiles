{ config, pkgs, ... }:
{
  programs.nixvim = {
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = [ pkgs.imagemagick ];
    plugins = {
      snacks = {
        enable = true;
        settings = {
          image.resolve.__raw = ''
            function(path, src)
                if require("obsidian.api").path_is_note(path) then
                    return require("obsidian.api").resolve_image_path(src)
                end
            end
          '';
        };
      };
    };
  };
}
