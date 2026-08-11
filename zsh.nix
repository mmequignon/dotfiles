{ config, pkgs, lib, ...}:

let
  GH_GITHUB_KEY = import ./secrets/superintendent.nix;

in {
    home.file.".zsh/completions/_hub".source = ./dotfiles/_hub;

    programs = {
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        shellAliases = {
          cpr = "rsync -a --info = progress2";
          ls = "ls -sh --color=auto ";
          ll = "ls -lh";
          lla = "ls -lah";
          llas = "ls -laSh";
          grep = "grep --color";
          tmux = "tmux -2";
          timesheet = "source $HOME/bin/set-passwords ; $HOME/bin/gtimelog2odoo/exporter.py -c $HOME/stuff/gtimelogrc";
          doco = "docker-compose";
          docu = "docker-compose up -d";
          docr = "docker-compose run --rm";
          docl = "docker-compose logs";
          docsh = "docker-compose run --rm odoo odoo shell";
          dood = "docker-compose run --rm odoo odoo";
          dp = "docker ps --format json | grep $(basename $(pwd)) | grep postgres | jq '.[\"Ports\"]' | grep -oE '0\.0\.0\.0:([0-9]{5})' | awk -F ':' '{print $2}'";
          dpgcli = "PGPASSWORD=odoo pgcli -p $(dp) -u odoo -h localhost -d";
          dood_test_setup = "docker-compose run --rm -e DB_NAME=testdb odoo testdb-gen -i base";
          dood_test_update = "docker-compose run --rm -e DB_NAME=testdb odoo testdb-update";
          dood_test_run = "docker-compose run --rm -e DB_NAME=testdb odoo pytest -s";
          dood_test_run_odoo = "docker-compose run --rm -e DEMO=True -e DB_NAME=testdb -e MIGRATE=False odoo odoo --workers=0 --test-enable --stop-after-init";
          dood_run_travis = "docker-compose -f travis/docker-compose.yml run --rm -e DEMO=True odoo runtests";
          vimdiff = "nvim -d";
          vfzf = "nvim \"$(fzf)\"";
        };
        sessionVariables = {
          PATH = "/home/mmequignon/bin:/home/mmequignon/.local/bin:$PATH";
          EDITOR = "nvim";
          TERM = "xterm-256color";
          GITHUB_TOKEN = "${GH_GITHUB_KEY}";
        };
        # autoload -U compinit && compinit
        initExtra = ''
            passgen() {
              pass generate "$1" && pass edit "$1";
            }
        '';
        oh-my-zsh.enable = true;
      };

      starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
          add_newline = false;
          line_break.disabled = true;
          username = {
            show_always = true;
            format= "[$user]($style)@";
          };
          directory = {
            style = "bold blue";
            truncate_to_repo = false;
          };
          hostname = {
            ssh_only = false;
            format = "[$hostname]($style) in ";
          };
          cmd_duration.disabled = true;
          git_status.disabled = false;
          format = lib.concatStrings [ "$username" "$hostname" "$directory" "$git_branch" "$git_state" ];
        };
      };
    };
}
