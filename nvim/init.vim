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

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"code version control
Plug 'https://github.com/tpope/vim-fugitive.git'

" highlight syntax
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'voldikss/vim-floaterm'
Plug 'kevinhwang91/rnvimr'

" Initialize plugin system
call plug#end()

set clipboard=unnamedplus

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:airline#extensions#tabline#enabled = 1
let g:python3_host_prog = '/usr/local/bin/python3'

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" NERDTree plugin specific commands
map <C-g> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


syntax on
colorscheme onedark
command! -nargs=0 Prettier :CocCommand prettier.formatFile
