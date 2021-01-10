" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" nerdtree
Plug 'preservim/nerdtree'

" onedark theme
Plug 'https://github.com/joshdick/onedark.vim.git'

" code highlight
Plug 'sheerun/vim-polyglot'

" plugin for footer status

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"icon
Plug 'ryanoasis/vim-devicons'

"code version control
Plug 'https://github.com/tpope/vim-fugitive.git'

Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

set clipboard=unnamedplus

let g:python3_host_prog = '~/neovim/bin/python'

nmap <silent><leader>+ :vertical resize +10<CR>
nmap <silent><leader>- :vertical resize -10<CR>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent><C-l> :bnext<CR>
nmap <silent><C-h> :bprevious<CR>
nmap <silent><C-b> :bwipe<CR>

nmap <leader>q :NERDTreeToggle<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='violet'                                                                                                             
let g:airline_powerline_fonts = 1 

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

command! -nargs=0 Prettier :CocCommand prettier.formatFile

syntax on
colorscheme gruvbox
