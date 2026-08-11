{
  programs.nixvim = {
    keymaps = [
      { # Yanks the whole line with Y
        key = "Y";
        action = "yy";
        mode = "n";
      }
      { # Remove 1 level of indentation for selected block with <
        key = "<";
        action = "<gv";
        mode = "v";
      }
      { # Add 1 level of indentation for selected block with <
        key = ">";
        action = ">gv";
        mode = "v";
      }
      { # Remove highlight for searched word
        key = "<F12>";
        action = ":nohl<cr>";
        mode = "n";
      }
      { # New vim tab
        key = "<C-t>";
        action = ":tabnew<CR>";
        mode = "n";
      }
      # { to check later, copy path:line in +
      #   key = "<leader>cp";
      #   mode = "n";
      #   action = "vim.fn.setreg('+', vim.fn.expand('%:.') .. ':' .. vim.fn.line('.'))";
      #   options = {
      #     expr = true;
      #     silent = true;
      #   };
      # }
    ];
  };
}
