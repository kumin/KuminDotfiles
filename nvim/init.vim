syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')
" nerdtree
Plug 'preservim/nerdtree'

" code highlight
Plug 'sheerun/vim-polyglot'

" plugin for footer status
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"icon
Plug 'ryanoasis/vim-devicons'

"code version control
Plug 'https://github.com/tpope/vim-fugitive.git'

"themes
Plug 'sainnhe/everforest'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'shaunsingh/nyoom.nvim'

"search tool
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"check syntax
Plug 'dense-analysis/ale'

"Rus compiler
"Plug 'rust-lang/rust.vim'

"Markdown on nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'voldikss/vim-floaterm'
Plug 'plasticboy/vim-markdown'

"support reading for fun :))
"Plug 'junegunn/limelight.vim'
"Plug 'junegunn/goyo.vim'

" auto complete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip' 
"For vsnip user.
"Plug 'hrsh7th/cmp-vsnip'
"Plug 'hrsh7th/vim-vsnip'

"Color plugin
Plug 'bignimbus/pop-punk.vim'

"for golang
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()
".........................................................................
" NVIM general config
".........................................................................
" clopy config
set clipboard=unnamedplus

"python env config
let g:python3_host_prog = '~/neovim/bin/python'

" resize window
nmap <silent><leader>+ :vertical resize +10<CR>
nmap <silent><leader>- :vertical resize -10<CR>

" buffer mapkey
nmap <silent><C-l> :bnext<CR>
nmap <silent><C-h> :bprevious<CR>
nmap <silent><C-b> :bwipe<CR>

" navigate ale fix
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Rust shortcut
nmap <silent><C-x> :RustRun<CR>
nmap <silent><C-f> :RustFmt<CR>

"Float window
nmap <silent> ft :FloatermNew<CR>

"Autosave on nvim
let g:auto_save = 0  " enable AutoSave on Vim startup

" pop-punk ANSI colors for vim terminal
let g:terminal_ansi_colors = pop_punk#AnsiColors()
".........................................................................
" Asynchoronous Lint Engine config
".........................................................................
let g:ale_disable_lsp = 1
let g:ale_completion_enabled = 0
let g:ale_completion_autoimport = 0
let g:ale_linters = {
  \'go': ['golangci-lint'],
  \'c': ['clangd'],
  \'cpp': ['clangd'],
\}
let g:ale_linters_explicit = 1
let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = "--fast"

".........................................................................
" NERDT tree config
".........................................................................
nmap <leader>q :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeMinimalMenu=1
".........................................................................
" go-vim config
".........................................................................
nmap <silent> gd :GoDef<CR>
nmap <silent> gy :GoDefType<CR>
nmap <silent> gi :GoImplements<CR>
nmap <silent> gr :GoCallers<CR>
nmap <silent> rn :GoRename<CR>
nmap gb :GoBuild<CR>
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
"let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']
"let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
au filetype go inoremap <buffer> . .<C-x><C-o>
set completeopt=menu,menuone,noselect

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

".........................................................................
" airline config (footer's information on nvim)
".........................................................................
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='everforest'
let g:airline_powerline_fonts = 1 

" just for fun
let g:airline_section_c = '🤪🤪🤪🤪🤪%F'

".........................................................................
" markdown preview
".........................................................................
" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 1
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1

".........................................................................
" plasticboy/vim-markdown
".........................................................................
autocmd FileType markdown let b:sleuth_automatic=0
autocmd FileType markdown set conceallevel=0
autocmd FileType markdown normal zR

".........................................................................
" Theme config
".........................................................................
colorscheme everforest
set background=dark

".........................................................................
" Inject Lua script
".........................................................................
lua << EOF
require('autocomplete')
EOF
