{
  programs.nixvim = {
      extraConfigLua = ''
        local function get_branch_name()
            local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null"):gsub("\n", "")
            if branch == "" or branch:match("fatal") then return "main" end
            return branch:gsub("/", "-")
        end

        _G.toggle_branch_notes = function()
            local branch = get_branch_name()
            local notes_dir = vim.fn.getcwd() .. "/notes/"
            local notes_path = notes_dir .. branch .. ".md"

            if vim.fn.isdirectory(notes_dir) == 0 then
                vim.fn.mkdir(notes_dir, "p")
            end

            local buf_nr = vim.fn.bufnr(notes_path, true)
            local winid = vim.fn.bufwinid(buf_nr)

            if winid ~= -1 then
                vim.api.nvim_win_call(winid, function() vim.cmd("silent! write") end)
                vim.api.nvim_win_close(winid, true)
            else
                vim.cmd("vsplit " .. notes_path)
                -- On récupère le buffer actuel pour appliquer des options locales
                vim.opt_local.wrap = true
                vim.opt_local.buflisted = false -- Évite de polluer ton :ls
            end
        end
      '';
      keymaps = [
        {
          mode = "n";
          key = "<F5>"; # Change par ton raccourci préféré
          action = "<cmd>lua _G.toggle_branch_notes()<CR>";
          options = {
            silent = true;
            desc = "Toggle Notes (Branch specific)";
          };
        }
      ];
  };
}
