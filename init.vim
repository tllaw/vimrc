" Maintainer: Tin-Lok Law (@tllaw)

" General
set nocompatible

" Tabs & Indentation
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smartindent
set shiftround
set expandtab
filetype plugin indent on

" Screen
set scrolloff=10

" Line Number
set number
set relativenumber
set noshowmode

" Search
set ignorecase
set smartcase

" Cursor Line
set cursorline

" Splitting
set splitbelow
set splitright

" Space
set listchars=trail:·
set list

set clipboard=unnamed,unnamedplus

function! WrapRegion(region_name) range
  execute "normal " .. a:firstline .. "GV" .. a:lastline .. "GdO#region " .. a:region_name .. "\<CR>\<BS>\<CR>\<CR>#endregion " .. a:region_name .. "\<ESC>2kp"
endfunction

" Plugins
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/plenary.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ollykel/v-vim'
Plug 'sbdchd/neoformat'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'easymotion/vim-easymotion'
Plug 'kshenoy/vim-signature'
Plug 'jeetsukumaran/vim-buffergator'
call plug#end()

" Theme
colorscheme onedark

" Enable automatically formatting file via "v fmt -" before writing buffer.
let g:v_autofmt_bufwritepre = 1

" buffergator
let g:buffergator_autodismiss_on_select=0
let g:buffergator_autoupdate=1
let g:buffergator_viewport_split_policy='R'
let g:buffergator_suppress_keymaps=1
let g:buffergator_show_full_directory_path=0

" Auto Command
autocmd VimEnter * BuffergatorOpen
autocmd VimEnter * sp
autocmd VimEnter * terminal
autocmd VimEnter * wincmd J
autocmd VimEnter * normal ,to
autocmd VimEnter * NERDTreeToggle
autocmd VimEnter * wincmd w

nnoremap \ ,

" Key Maps
let mapleader=","
let g:twid=1002
nnoremap <leader>tc :call win_execute(g:twid, 'resize 0')<CR>
nnoremap <leader>to :call win_execute(g:twid, 'resize 20')<CR>
" NERDTree
nnoremap <leader>/ :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
tnoremap <Esc> <C-\><C-n>
" fzf
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fg :Rg<cr>
nnoremap <leader>fw :Windows<cr>
nnoremap <leader>fb :Buffers<cr>

nn <leader>ci i#include <bits/stdc++.h><CR>using namespace std;<CR><CR>int main() {<CR>return 0;<CR>}<ESC>kO

vnoremap <leader>wr :call WrapRegion(input('Region Name? '))<cr>

set listchars=eol:↵,tab:>·,trail:▓,extends:>,precedes:<,space:·
set list

:lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "cpp", "css", "dart", "html", "javascript", "tsx", "typescript", "ruby" },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require'lspconfig'.dartls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.phpactor.setup{}

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local servers = { 'dartls', 'clangd', 'pyright', 'phpactor' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF
