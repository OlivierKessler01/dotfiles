local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'pyright',
    'clangd'
})

lsp.setup()



