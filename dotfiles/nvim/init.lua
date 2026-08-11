local vimrc = vim.fn.stdpath("config") .. "/vimrc"
vim.cmd.source(vimrc)

--require("nvim-tree").setup()
require'hop'.setup()


-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'buffer' },
      { name = 'ultisnips' },
      { name = 'nvim_lsp' },
    })
})
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require'lspconfig'.pylsp.setup{}
require('lspconfig')['pylsp'].setup {
capabilities = capabilities
}
