syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')
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

"themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'shaunsingh/moonlight.nvim'

"search tool
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"check syntax
Plug 'dense-analysis/ale'

"Code rust on nvim
Plug 'rust-lang/rust.vim'

Plug 'projekt0n/github-nvim-theme'
Plug 'bignimbus/pop-punk.vim'

"Markdown on nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'voldikss/vim-floaterm'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

"support reading for fun :))
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
" auto complete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" For vsnip user.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()
".........................................................................
" github-theme for nvim
".........................................................................
lua require('github-theme').setup()

".........................................................................
" config NVIM
".........................................................................
" clopy config
set clipboard=unnamedplus
"python env config
let g:python3_host_prog = '~/neovim/bin/python'
" resize window
nmap <silent><leader>+ :vertical resize +10<CR>
nmap <silent><leader>- :vertical resize -10<CR>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" buffer mapkey
nmap <silent><C-l> :bnext<CR>
nmap <silent><C-h> :bprevious<CR>
nmap <silent><C-b> :bwipe<CR>
" NERDTree
nmap <leader>q :NERDTreeToggle<CR>
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" navigate ale fix
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
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

let g:gitgutter_max_signs = -1
" pop-punk ANSI colors for vim terminal
let g:terminal_ansi_colors = pop_punk#AnsiColors()
" Rust shortcut
nmap <silent><C-x> :RustRun<CR>
nmap <silent><C-f> :RustFmt<CR>
"Float window
nmap <silent> ft :FloatermNew<CR>
"Autosave on nvim
let g:auto_save = 0  " enable AutoSave on Vim startup

".........................................................................
" airline config (footer's information on nvim)
".........................................................................
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='pop_punk'                                                                                                             
let g:airline_powerline_fonts = 1 
" just for fun
let g:airline_section_c = '🎸 🥶 🥑🥑🥑💋💋💋%F'

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
" NERDTree
".........................................................................
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

".........................................................................
" Coc
".........................................................................
command! -nargs=0 Prettier :CocCommand prettier.formatFile

".........................................................................
" hrsh7th
".........................................................................
set completeopt=menu,menuone,noselect
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body)

        -- For `luasnip` user.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },

      -- For vsnip user.
      { name = 'vsnip' },

      -- For luasnip user.
      -- { name = 'luasnip' },

      -- For ultisnips user.
      -- { name = 'ultisnips' },

      { name = 'buffer' },
    }
  })

  -- Setup lspconfig.
  require 'lspconfig'.gopls.setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
EOF
colorscheme pop-punk
