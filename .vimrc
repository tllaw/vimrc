" Maintainer: Tin-Lok Law (@tllaw)

" General
set nocompatible

" Backup Files
set nobackup
set noswapfile
set nowritebackup
set noundofile

" Tabs & Indentation
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftround
set expandtab
filetype plugin indent on

" Screen
set scrolloff=10

" Line Number
set number
set relativenumber

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Syntax Highlight
syntax on

" Menu
set path+=**
set wildmenu

" File Explorer
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=20
let g:netrw_chgwin=winnr()+1

" Cursor Line
set cursorline

" Splitting
set splitbelow
set splitright

" Status Line
let g:modes={
  \'t': '  TERMINAL ',
  \'n': '  NORMAL ',
  \'i': '  INSERT ',
  \'R': '  REPLACE ',
  \'v': '  VISUAL ',
  \}

set statusline=
set statusline+=%#StatusLineHead#
set statusline+=%{get(g:modes,mode(),g:modes['v'])}
set statusline+=%#StatusLineBody#
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %r\ %m\ %Y\ \|
set statusline+=\ %{toupper(&enc)}\ \|
set statusline+=\ %{toupper(&ff)}\ 
set statusline+=%#StatusLineHead#
set statusline+=\ [%l/%L\ %p%%]:\ %c\ 
set laststatus=2
set noshowmode

" Auto Command
autocmd VimEnter * term ++rows=20
autocmd VimEnter * Lex
autocmd VimEnter * wincmd w

" Highlights
highlight StatusLineHead cterm=bold ctermfg=236 ctermbg=15
highlight StatusLineBody ctermfg=15 ctermbg=236
highlight CursorLine cterm=None ctermbg=0
highlight CursorLineNr cterm=None ctermfg=15 ctermbg=0
highlight LineNr ctermfg=238
highlight VertSplit ctermfg=236 ctermbg=236

" Keymaps
let mapleader=','
nnoremap <leader>tc :3resize 0<CR>
nnoremap <leader>to :3resize 20<CR>
