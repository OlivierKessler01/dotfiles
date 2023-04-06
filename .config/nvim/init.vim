" User defined -------------------------------------------i
" OlivierKessler01 configuration
" Run :PlugInstall to install Plugins

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
set number

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim',
Plug 'nelsyeung/twig.vim'
Plug 'preservim/tagbar'
Plug 'preservim/nerdtree'
Plug 'f-person/git-blame.nvim'
call plug#end()

syntax on
filetype plugin indent on

let NERDTreeShowHidden=1
map <F2> :NERDTreeToggle<CR>
" Close NERDtree if last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")) | q | endif


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

" User defined ------------------------------------------------
