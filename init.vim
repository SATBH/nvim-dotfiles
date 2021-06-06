set termguicolors
set nu rnu

call plug#begin()
	Plug 'morhetz/gruvbox'
	Plug 'Olical/aniseed', { 'tag': 'v3.19.0' }
call plug#end()

let g:aniseed#env = v:true
colo gruvbox
