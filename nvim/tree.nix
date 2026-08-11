{ config, pkgs, ... }:
{
  programs.nixvim = {
    keymaps = [
      {
        key = "<F3>";
        action = "g:NERDTree.IsOpen() ? ':NERDTreeClose<cr>' : bufname('%') == '' ? ':NERDTreeCWD<cr>' : ':NERDTreeFind<cr>'";
        mode = "n";
        options.expr = true;
      }
      # {
      #   key = "<F3>";
      #   action = ":NvimTreeFindFileToggle<CR>";
      #   mode = "n";
      #   options.silent = true;
      # }
    ];
    # plugins.nvim-tree = {
    #     enable = true;
    # };
    extraPlugins = with pkgs.vimPlugins; [
      nerdtree
      vim-devicons
    ];
    globals = {
      NERDTreeDirArrowExpandable = "▸";
      NERDTreeDirArrowCollapsible = "▾";
      # NERDTreeIgnore = [
      #   "~$"
      #   ".pyc$"
      #   ".class$"
      #   ".hi$"
      #   ".o$"
      #   ".aux$"
      #   ".nav$"
      #   ".log$"
      #   ".out$"
      #   ".pdf$"
      #   ".snm$"
      #   ".toc$"
      #   ".sty$"
      #   "__pycache__"
      #   ".egg-info$"
      # ];    # Files to ignore (default = ["\~$"])
      NERDTreeQuitOnOpen = true;
      NERDTreeMinimalUI = true;
      NERDTreeMinimalMenu=true;
      NERDTreeAutoDeleteBuffer = true;
    };
  };
}
