{ config, pkgs, ... }:
{
    programs.nixvim.userCommands = {
        Copath = {
            desc = "copies relative path in system clipboard";
            command.__raw = ''
            function()
                local path = vim.fn.expand("%")
                vim.fn.setreg("+", path)
                vim.notify('Copied "' .. path .. '" to the clipboard!')
            end
            '';
        };
    };
}
