set nocompatible              " be iMproved, required


let g:python_host_prog = '/usr/bin/python3'
" set the runtime path to include Vundle and initialize
call plug#begin('~/.local/share/nvim/plugged')

" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plug 'tpope/vim-sensible'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plug 'ascenator/L9', {'name': 'newL9'}
Plug 'godlygeek/tabular'
" Arduino plugin
Plug 'jplaut/vim-arduino-ino'
" Tex plugin
Plug 'lervag/vimtex'
Plug 'ntpeters/vim-better-whitespace'

" Generic Programming Support
Plug 'jakedouglas/exuberant-ctags'

" Markdown / Writting
"Plug 'reedes/vim-pencil'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'

" Powerline plugin
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'

" Complition manager
" Plug 'roxma/nvim-completion-manager'
"Plug 'roxma/ncm-clang'

" C/C++ highligther
Plug 'octol/vim-cpp-enhanced-highlight'

" VimWiki
Plug 'vimwiki/vimwiki'

" NerdTree
Plug 'scrooloose/nerdtree'

" tagbar
Plug 'majutsushi/tagbar'

" Syntastic
Plug 'vim-syntastic/syntastic'

" Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

autocmd FileType c if stridx(expand("%:p"), "avr") > -1 |
			\ let b:syntastic_checkers = ["make"] | endif

call plug#end()

syntax on
set tw=0
set tabstop=4
set shiftwidth=4
set nu
set relativenumber
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif

" Markdown ctags support
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
	\ }

map <c-h> :bprevious<cr>
map <c-l> :bnext<cr>

map F9:!make &


" autocmd vimenter * NERDTree
