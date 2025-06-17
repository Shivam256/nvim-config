" === General ===
syntax on
set number                  " Show line numbers
set relativenumber         " Relative line numbers (like Neovim)
set clipboard=unnamedplus  " Use system clipboard
set mouse=a                " Enable mouse
set cursorline             " Highlight current line
set wildmenu               " Enhanced command menu
set showcmd                " Show last command
set ruler                  " Show cursor position
set noswapfile             " No swap files
set hidden                 " Don't force close files to switch
set updatetime=300         " Faster swap update (for plugins)
set signcolumn=yes         " Space for git gutter or LSP

" === Tabs & Indentation ===
set tabstop=2
set shiftwidth=2
set expandtab              " Use spaces, not tabs
set autoindent
set smartindent

" === Search ===
set ignorecase             " Case insensitive by default
set smartcase              " But smart about it
set incsearch              " Live search as you type
set hlsearch               " Highlight all search results

" === Appearance ===
colorscheme desert         " Use a decent built-in theme
set background=dark        " Dark mode
set termguicolors          " If your terminal supports it

" === Keybinds ===
nmap <C-n> :set invnumber<CR>     " Toggle line numbers
nmap <Space> :nohlsearch<CR>      " Clear search highlights
nmap <C-s> :w<CR>                 " Save with Ctrl+S
imap <C-s> <Esc>:w<CR>i

" === Split Navigation ===
set splitbelow
set splitright
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" === File Explorer ===
nnoremap <leader>e :Explore<CR>

" === Git integration (if gitgutter plugin is later added) ===
" let g:gitgutter_enabled = 1
