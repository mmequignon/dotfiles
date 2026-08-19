{ config, pkgs, lib, ...}:

{
    programs = {
        bash = {
            enable = true;
            historySize = 10000;
            historyFileSize = 10000;
            historyFile = "$HOME/.bash_history";
            historyControl = [ "ignoredups" "ignorespace" ];
            shellAliases = {
              cpr = "rsync -a --info = progress2";
              ls = "ls -sh --color=auto ";
              ll = "ls -lh";
              lla = "ls -lah";
              llas = "ls -laSh";
              grep = "grep --color";
              tmux = "tmux -2";
              doco = "docker compose";
              docu = "docker compose up -d";
              docr = "docker compose run --rm";
              docl = "docker compose logs";
              docsh = "docker compose run --rm odoo odoo shell";
              dood = "docker compose run --rm odoo odoo";
              dp = "docker ps --format json | grep $(basename $(pwd)) | grep postgres | jq '.[\"Ports\"]' | grep -oE '0\.0\.0\.0:([0-9]{5})' | awk -F ':' '{print $2}'";
              dpgcli = "PGPASSWORD=odoo pgcli -p $(dp) -u odoo -h localhost -d";
              dood_test_setup = "docker compose run --rm -e DB_NAME=testdb odoo testdb-gen -i base";
              dood_test_update = "docker compose run --rm -e DB_NAME=testdb odoo testdb-update";
              dood_test_run = "docker compose run --rm -e DB_NAME=testdb odoo pytest -s";
              dood_test_run18 = "docker compose run --rm -e DB_NAME=testdb -e ODOO_TEST_FAILURE_RETRIES=-1 odoo pytest -s";
              dood_test_run_odoo = "docker compose run --rm -e DEMO=True -e DB_NAME=testdb -e MIGRATE=False odoo odoo --workers=0 --test-enable --stop-after-init";
              dood_run_travis = "docker compose -f travis/docker compose.yml run --rm -e DEMO=True odoo runtests";
            };
            bashrcExtra = ''
                  # Options de shell
                  shopt -s histappend

                  # Fonction passgen
                  passgen() {
                    pass generate "$1" && pass edit "$1"
                  }

                  # GPG TTY & Agent
                  export GPG_TTY=$(tty)
                  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
                  gpgconf --launch gpg-agent > /dev/null 2>&1
                  gpg-connect-agent --quiet updatestartuptty /bye > /dev/null 2>&1
          '';
        
        };
        navi.enableBashIntegration = true;
        starship = {
          enable = true;
          enableBashIntegration = true;
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
            format = lib.concatStrings ["$direnv" "$username" "$hostname" "$directory" "$git_branch" "$git_state" ];
          };
        };
    };
}
