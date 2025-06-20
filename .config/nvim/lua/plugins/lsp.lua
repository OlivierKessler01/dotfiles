return {
    {
        "williamboman/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
          local lspconfig = require("lspconfig")
          local capabilities = require("cmp_nvim_lsp").default_capabilities()

          -- Optional: improve Lua dev experience if working on Neovim config
          require("neodev").setup({})

          lspconfig.pyright.setup({
            capabilities = capabilities,
          })

          -- Diagnostic keymaps (optional but useful)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
          vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float)
          vim.keymap.set("n", "<leader>cl", vim.diagnostic.setloclist)
        end,
        dependencies = {
          "hrsh7th/cmp-nvim-lsp", -- for autocompletion capabilities
          "folke/neodev.nvim",    -- optional: improve Lua LSP for Neovim config
        },
    },
}
