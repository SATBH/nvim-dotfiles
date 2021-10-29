set termguicolors
set nu rnu
set hidden
call plug#begin()
	Plug 'morhetz/gruvbox'
	Plug 'Olical/aniseed', { 'tag': 'v3.19.0' }
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'frazrepo/vim-rainbow'
	Plug 'neovim/nvim-lspconfig'
	Plug 'junegunn/vim-easy-align'
	Plug 'sheerun/vim-polyglot'
	Plug 'nvim-lua/completion-nvim'
	Plug 'nvim-treesitter/playground'
	Plug 'voldikss/vim-floaterm'
	Plug 'navarasu/onedark.nvim'
	Plug 'tiagovla/tokyodark.nvim'
	Plug 'arcticicestudio/nord-vim'
	Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
	Plug 'jbyuki/instant.nvim'
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

let g:rainbow_active = 1

let g:floaterm_opener = 'edit'
"let g:instant_username = 'satbh'
