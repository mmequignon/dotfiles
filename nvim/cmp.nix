{
  programs.nixvim = {
    plugins = {
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "buffer"; }
          { name = "ultisnips"; }
        ];
      };
    };
  };
}
