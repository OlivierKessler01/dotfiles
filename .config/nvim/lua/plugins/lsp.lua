return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "pyright" },
      automatic_installation = true,
    },
    dependencies = {
      { "williamboman/mason.nvim" },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("neodev").setup({})

      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
      vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float)
      vim.keymap.set("n", "<leader>cl", vim.diagnostic.setloclist)
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "folke/neodev.nvim",
    },
  },
}
