{ config, pkgs, ... }:

let
  MAIL_ADDR = import ./secrets/malignly.nix;
  GPG_SIGNING_KEY = import ./secrets/indented.nix;
  git-autoshare = with pkgs.python3Packages; buildPythonPackage rec {
    pname = "git-autoshare";
    version = "1.0.0b6";
    src = with pkgs.python3Packages; fetchPypi {
      inherit pname version;
      sha256 = "d1dff471af5c8f30676362aa84b6d70c0aedbcc6b57a02e2c84dd4d5062bed7a";
    };
    pyproject = true;
    build-system = [ setuptools ];
    checkInputs = [ setuptools-scm ];
    propagatedBuildInputs = [ pyyaml appdirs click ];
  };
in {
  home.packages = with pkgs; [
    nix-prefetch-git nix-prefetch-github 
    git-autoshare delta git-absorb
    # CLI tools for git{hub,lab}
    hub lab
  ];
    xdg.configFile = {
      "git-autoshare/repos.yml".source = ./dotfiles/git_autoshare_repos.yml;
    };

    home = {
      sessionVariables = {
        GIT_AUTOSHARE_GIT_BIN = "${pkgs.git}/bin/git";
      };
    };
    programs.git = {
      package = pkgs.gitFull;
      enable = true;
      signing = {
        key = "${GPG_SIGNING_KEY}";
        signByDefault = true;
      };
      ignores = [
        "default.nix"
        ".python-version"
      ];
      settings = {
        alias = {
          glog = "log --graph --decorate --oneline";
          stat = "!git diff $(git merge-base HEAD master) --stat";
        };
        core = {
          editor = "nvim";
          pager = "${pkgs.delta}/bin/delta";
        };
        pull = {
          rebase = true;
        };
        user = {
          email = "${MAIL_ADDR}";
          name = "MmeQuignon";
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
        };
      };
    };

}
