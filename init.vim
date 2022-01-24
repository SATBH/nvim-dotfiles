call plug#begin()
  Plug 'Olical/aniseed', { 'tag': 'v3.19.0' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'junegunn/vim-easy-align'
  Plug 'voldikss/vim-floaterm'
  Plug 'sainnhe/everforest'
  Plug 'navarasu/onedark.nvim'
  Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'bhurlow/vim-parinfer'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'onsails/diaglist.nvim'
call plug#end()

let mapleader = ' '
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

map <C-F> :FloatermNew fzf --preview "nvim {}"<CR>
nmap <C-J> :m +1<CR>
nmap <C-K> :m -2<CR>
map <leader><leader> <C-^>

let g:aniseed#env = v:true

set list
set expandtab
set tabstop=2
set shiftwidth=2
set termguicolors
set hidden
let g:floaterm_opener = 'edit'
nmap <space>dw <cmd>lua require('diaglist').open_all_diagnostics()<cr>
