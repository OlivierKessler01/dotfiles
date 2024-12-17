local lsp = require('lsp-zero').preset({})
lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)
lsp.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
        'ts_ls',
        'eslint',
        'pyright',
        'clangd',
        'bashls',
        'pyright'
  },
  handlers = {
    -- this first function is the "default handler"
    -- it applies to every language server without a "custom handler"
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,

    -- Be careful when working with Python and editable installs
    -- setuptools and pyright suck, they don't agree on Pep 660 modern editable installs : 
    -- https://github.com/microsoft/pyright/issues/6209
    -- https://github.com/microsoft/pyright/issues/3846
    -- 
    --When installing a local package, use : 
    -- pip install --config-settings editable_mode=compat -e ../<yourpackage/
    pyright = function()
      require('lspconfig').pyright.setup({
        single_file_support = true,
        on_attach = function(client, bufnr)
          print("Pyright Python path:", client.config.settings.python.pythonPath)
        end
      })
     end,
  }
})

