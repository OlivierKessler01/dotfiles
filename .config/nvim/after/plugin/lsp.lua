require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
        'ts_ls',
        'eslint',
        'pyright',
        'clangd',
        'bashls'
  },
  handlers = {
    -- this first function is the "default handler"
    -- it applies to every language server without a "custom handler"
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,

    -- this is the "custom handler" for `biome`
    pyright = function()
      require('lspconfig').pyright.setup({
        single_file_support = false,
        on_attach = function(client, bufnr)
          print("Pyright Python path:", client.config.settings.python.pythonPath)
        end
      })
    end,
  }
})





