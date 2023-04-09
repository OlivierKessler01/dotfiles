" User defined -------------------------------------------i
" OlivierKessler01 configuration
" Run :PlugInstall to install Plugins

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
set number

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

syntax on
filetype plugin indent on



" Let fzf find hidden files
let $FZF_DEFAULT_COMMAND='find . \! \( -type d -path ./.git -prune \) \! -type d -printf ''%P\n'''


" Arrows keys to navigate
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

:tnoremap <Esc> <C-\><C-n>

nmap <F8> :TagbarToggle<CR>

set splitright
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab
:set colorcolumn =79

" Fzf custom keys
nnoremap <C-p> :Files<Cr>


lua <<EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle', {noremap=true, silent=true})
require('lualine').setup()
EOF



" User defined ------------------------------------------------
