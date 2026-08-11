{ config, pkgs, ... }:
let 
  NIX_CONFIG = "/home/mmequignon/.config/nixpkgs";
  NIX_CONFIG_DOTFILES = "${NIX_CONFIG}/dotfiles";
in {
    xdg.configFile = {
        "nvim".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/nvim;
    };
    programs.neovim = {
      enable = true;
      extraPython3Packages = (ps: with ps; [
        pylint
        pynvim
        jedi
        python-lsp-server
        msgpack
        mccabe
      ]);
      extraPackages = with pkgs; [
        ripgrep
        ctags
        gcc
      ];
      plugins = with pkgs.vimPlugins; [
        diffview-nvim
        # colors
        python-syntax
        ## 
        ale
        fzf-vim
        nerdcommenter
        ## NERDTREE
        nerdtree
        # ?
        nvim-tree-lua
        vim-devicons
        tagbar
        ultisnips
        undotree
        # BAR
        vim-airline
        vim-airline-themes
        vim-colorschemes
        vim-nix
        vim-signify
        vim-fugitive
        hop-nvim
        ### completion
        nvim-lspconfig
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp-cmdline
        cmp-nvim-ultisnips
        nvim-cmp
        ## tree
        nvim-web-devicons
      ];
    };
}
