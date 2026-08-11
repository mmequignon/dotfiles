{
  programs.nixvim = {
    opts = {
      compatible = false;
      title = true;
      splitbelow = true;
      splitright = true;
      foldmethod = "syntax";
      foldlevel = 1;
      encoding = "utf-8";
      fileencoding = "utf-8";
      number = true;
      wrap = false;
      mouse = "n";
      showmatch = true;
      termguicolors = true;
      incsearch = true;
      hlsearch = true;
      ignorecase = true;
      smartcase = true;
      expandtab = true; #enter spaces when tab is pressed
      tabstop = 4; # use 4 spaces to represent tab
      softtabstop = 4; 
      shiftwidth = 4; # number of spaces to use for auto indent
      showcmd = true; # show (partial) command in status line
      colorcolumn = "89";
      cul = true;
      cuc = true;
      fileformat = "unix";
      hid = true;
      swapfile = false;
      laststatus = 2;
      # rtp+=~/.fzf doesn't seem like I need this anymore
    };
    highlight = {
      CursorColumn.bg = "#2a2b3c";
      CursorLine.bg = "#2a2b3c";
    };
  };
}
