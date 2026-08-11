{ config, pkgs, ... }:

let
  FWZTE_MATTHIEU_ADDRESS = import ./secrets/malignly.nix;
  GPG_SIGNING_KEY = import ./secrets/indented.nix;
  git-autoshare = with pkgs.python3Packages; buildPythonPackage rec {
    pname = "git-autoshare";
    version = "1.0.0b6";
    src = with pkgs.python3Packages; fetchPypi {
      inherit pname version;
      sha256 = "d1dff471af5c8f30676362aa84b6d70c0aedbcc6b57a02e2c84dd4d5062bed7a";
    };
    checkInputs = [ setuptools_scm ];
    propagatedBuildInputs = [ pyyaml appdirs click ];
  };
in {
  home.packages = with pkgs; [
    nix-prefetch-git nix-prefetch-github 
    git-crypt gitAndTools.hub gitAndTools.lab
    git-autoshare meld delta
    gh hub git-absorb
  ];
    xdg.configFile = {
      "git-autoshare/repos.yml".source = ./dotfiles/git_autoshare_repos.yml;
      "gh-dash/config.yml".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/gh-dash-config.yml;
    };

    home = {
      sessionVariables = {
        GIT_AUTOSHARE_GIT_BIN = "${pkgs.git}/bin/git";
      };
    };
    programs.git = {
      package = pkgs.gitAndTools.gitFull;
      enable = true;
      userEmail = "${FWZTE_MATTHIEU_ADDRESS}";
      signing = {
        key = "${GPG_SIGNING_KEY}";
        signByDefault = true;
      };
      ignores = [
        "default.nix"
      ];
      aliases = {
        #log = "--no-pager log --graph --decorate";
        glog = "log --graph --decorate --oneline";
        ci = "commit";
        st = "status";
      };
      extraConfig = {
        core = {
          editor = "nvim";
          excludesfile = "~/.gitignore";
          #pager = "less -FX";
          pager = "${pkgs.delta}/bin/delta";
        };
        pull = {
          rebase = true;
        };
        user = {
          name = "Mmequignon";
        };
        hub = {
          protocol = "ssh";
        };
        init = {
          defaultBranch = "master";
        };
        interactive = {
          diffFilter = "${pkgs.delta}/bin/delta --color-only";
        };
        delta = {
          navigate = true;
          line-numbers = true;
          side-by-side = true;
        };
        merge = {
          conflictstyle = "diff3";
          #tool = "meld";
        };
      };
    };

}
