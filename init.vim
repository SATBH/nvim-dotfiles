set termguicolors
set nu rnu

call plug#begin()
	Plug 'morhetz/gruvbox'
	Plug 'Olical/aniseed', { 'tag': 'v3.19.0' }
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'frazrepo/vim-rainbow'
	Plug 'neovim/nvim-lspconfig'
	Plug 'junegunn/vim-easy-align'
	Plug 'sheerun/vim-polyglot'
call plug#end()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:aniseed#env = v:true
colo gruvbox
let g:rainbow_active = 1
