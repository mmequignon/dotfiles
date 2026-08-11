{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "solarized_dark";
        component_separators = {
          left = "";
          right = "";
        };
        section_separators = {
          left = "";
          right = "";
        };
      };
    };
  };
}
