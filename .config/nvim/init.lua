-- User defined -------------------------------------------i

-- Inspiration comes from here 
-- https://dev.to/slydragonn/ultimate-neovim-setup-guide-lazynvim-plugin-manager-23b7

vim.api.nvim_command('filetype plugin indent on')
vim.opt.number           = true
vim.o.background         = "dark"
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.splitright       = true
vim.opt.tabstop          = 4
vim.opt.shiftwidth       = 4
vim.opt.expandtab        = true
vim.opt.colorcolumn      = '79'
vim.wo.relativenumber    = true
-- set termguicolors to enable highlight groups
vim.opt.termguicolors    = true
vim.api.nvim_set_keymap('n', '<F2>', ':Neotree<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', 'jk', '<Esc>', { })
-- Copy to clipboard
vim.api.nvim_set_keymap('n', "<leader>y",  '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "<leader>y",  '"+y', { noremap = true, silent = true })
-- Paste from clipboard
vim.api.nvim_set_keymap('n', "<leader>p",  '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "<leader>p",  '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>P",  '"+P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "<leader>P",  '"+P', { noremap = true, silent = true })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = "\\"
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" }, -- imports from the plugins folder
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "gruvbox" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.cmd("colorscheme gruvbox")




