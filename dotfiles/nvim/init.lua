local vimrc = vim.fn.stdpath("config") .. "/vimrc"
vim.cmd.source(vimrc)
require'hop'.setup()
vim.lsp.enable("ruff")
require('lualine').setup(
    {
        options = {
            theme = 'catppuccin',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
        }
    }
)
vim.diagnostic.config({ virtual_text = true })
