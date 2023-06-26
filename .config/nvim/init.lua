-- User defined -------------------------------------------i
-- Run :PlugInstall to install Plugins

vim.api.nvim_command('filetype plugin indent on')
vim.opt.number = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.splitright = true
vim.opt.tabstop     =4
vim.opt.shiftwidth  =4
vim.opt.expandtab = true
vim.opt.colorcolumn ='79'
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('v', 'jk', '<Esc>', {noremap=true, silent=true})
vim.cmd.packadd('packer.nvim')


vim.g.leetcode_browser='chrome'
vim.api.nvim_set_keymap('n', '<Leader>l', ':LeetCodeList<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>t', ':LeetCodeTest<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>s', ':LeetCodeSubmit<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>si', ':LeetCodeSignIn<CR>', {noremap=true, silent=true})

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
	-- LUALINE
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	require('lualine').setup({
	    options = {
		theme = 'onelight'
	    }
	})

    use {'mbledkowski/neuleetcode.vim'}

	-- TELESCOPE
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<C-P>', builtin.find_files, {})
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

	--NvimTree
	use {'nvim-tree/nvim-tree.lua'}
	use {'nvim-tree/nvim-web-devicons'}
	require("nvim-tree").setup({
	  sort_by = "case_sensitive",
	  renderer = {
	    group_empty = true,
	  },
	  filters = {
	    dotfiles = true,
	  },
	})

	-- Tagbar
	use {'preservim/tagbar'}

	-- GitBlame
	use {'f-person/git-blame.nvim'}
    use { "ellisonleao/gruvbox.nvim" }
    vim.cmd("colorscheme gruvbox")
end)
