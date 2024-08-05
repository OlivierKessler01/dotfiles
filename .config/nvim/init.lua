-- User defined -------------------------------------------i
-- Run :PackerInstall to install Plugins

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
vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', 'jk', '<Esc>', { })
vim.cmd.packadd('packer.nvim')

-- Copy to clipboard
vim.api.nvim_set_keymap('n', "<leader>y",  '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "<leader>y",  '"+y', { noremap = true, silent = true })

-- Paste from clipboard
vim.api.nvim_set_keymap('n', "<leader>p",  '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "<leader>p",  '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<leader>P",  '"+P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "<leader>P",  '"+P', { noremap = true, silent = true })

-- Treesitter config
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- LUALINE
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }

    -- Treesitter, language parsers used for features like highlighting
    -- folding, etc.
    use {
        'nvim-treesitter/nvim-treesitter',
        tag = 'v0.9.2',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        config = function()
            require'nvim-treesitter.configs'.setup {
              -- A list of parser names, or "all" (the five listed parsers should always be installed)
              ensure_installed = { 
                  "c","php", "lua", "vim", "vimdoc", "query", 
                  "python", "cpp", "typescript","yaml"},

              -- Install parsers synchronously (only applied to `ensure_installed`)
              sync_install = false,

              -- Automatically install missing parsers when entering buffer
              -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
              auto_install = true,

              highlight = {
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
              },
            }
        end,
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' }, -- Required
        }
    }

    -- TELESCOPE
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-P>', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

    --NvimTree
    use { 'nvim-tree/nvim-tree.lua' }
    use { 'nvim-tree/nvim-web-devicons' }

    -- Tagbar
    use { 'preservim/tagbar' }

    -- GitBlame
    use { 'f-person/git-blame.nvim' }
    use { "ellisonleao/gruvbox.nvim" }
    use { 'tpope/vim-fugitive' }

    vim.cmd("colorscheme gruvbox")
    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = false,
        },
    })
    
    -- gitsigns shows symbols for updated lines
    use {'lewis6991/gitsigns.nvim'}
    require('gitsigns').setup {
        signs = {
            add          = { text = '+' },
            change       = { text = '│' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
    }

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
end)

