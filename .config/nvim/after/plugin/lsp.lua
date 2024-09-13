local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
    'ts_ls',
    'eslint',
    'pyright',
    'clangd',
    'terraform-ls',
    'bashls'
})

lsp.setup()




