" User defined -------------------------------------------i
" OlivierKessler01 configuration
" Run :PlugInstall to install Plugins

call plug#begin()
Plug 'nvim-lualine/lualine.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim',
Plug 'nelsyeung/twig.vim'
Plug 'preservim/tagbar'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'f-person/git-blame.nvim'
call plug#end()

" Let fzf find hidden files
let $FZF_DEFAULT_COMMAND='find . \! \( -type d -path ./.git -prune \) \! -type d -printf ''%P\n'''

" Arrows keys to navigatelight extra whitespace
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

lua <<EOF
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

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap=true, silent=true})

require('lualine').setup({
    options = {
        theme = 'onelight'
    }
})
EOF
" User defined ------------------------------------------------
