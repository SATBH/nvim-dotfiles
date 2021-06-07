set termguicolors
set nu rnu

call plug#begin()
	Plug 'morhetz/gruvbox'
	Plug 'Olical/aniseed', { 'tag': 'v3.19.0' }
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'frazrepo/vim-rainbow'
call plug#end()

let g:aniseed#env = v:true
colo gruvbox
let g:rainbow_active = 1
