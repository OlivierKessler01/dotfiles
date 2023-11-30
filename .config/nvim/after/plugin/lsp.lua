local lsp = require('lsp-zero').preset("recommanded")
lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)
lsp.ensure_installed({
    'tsserver',
    'eslint',
    'pyright',
    'clangd', 
    'phpactor'
})

local lspconfig = require('lspconfig')

-- nvim-lspconfig provides a nice config that enables the pyrightconfig.json file
lspconfig.pyright.setup({})
lsp.setup()



