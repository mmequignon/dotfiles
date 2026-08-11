{ config, pkgs, ... }:
{
    programs.tmux = {
        enable = true;
        terminal = "screen-256color";
        historyLimit = 20000;
        plugins = with pkgs.tmuxPlugins; [
          vim-tmux-navigator
          tmux-which-key
          {
            plugin = catppuccin;
            extraConfig = ''
              set-option -g status-position top
              set -g @catppuccin_flavor "frappe"
              set -g @catppuccin_window_status_style "slanted"
            '';
          }
        ];
        extraConfig = ''
            set -as terminal-features ",xterm-256color:RGB"

            # vim tmux navigator config
            is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
            bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
            bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
            bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
            bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
            bind-key -n 'C-\' if-shell "$is_vim" 'send-keys C-\\' 'select-pane -l'
            bind-key -T copy-mode-vi 'C-h' select-pane -L
            bind-key -T copy-mode-vi 'C-j' select-pane -D
            bind-key -T copy-mode-vi 'C-k' select-pane -U
            bind-key -T copy-mode-vi 'C-l' select-pane -R
            bind-key -T copy-mode-vi 'C-\' select-pane -l


            # Set home and end keys
            bind-key -n Home send Escape "OH"
            bind-key -n End send Escape "OF"

            # New windows and panes opens in the same folder
            # h for horizontal split
            # v for vertical split
            # t for new window (tab)
            bind h split-window -c "#{pane_current_path}"
            bind v split-window -h -c "#{pane_current_path}"
            bind t new-window -c "#{pane_current_path}"

            # Scroll up/down with C-PGUP,C-PGDOWN
            bind-key -r -T prefix       Up              resize-pane -U 5
            bind-key -r -T prefix       Down            resize-pane -D 5
            bind-key -r -T prefix       Left            resize-pane -L 5
            bind-key -r -T prefix       Right           resize-pane -R 5

            # Nvim suggestions regarding tmux
            set-option -sg escape-time 10
            set-option -g focus-events on

            # Required for image.nvim
            set -gq allow-passthrough on
            set -g visual-activity off
        '';

    };
}
