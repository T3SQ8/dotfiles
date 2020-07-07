execute pathogen#infect()

" Functions{{{
" Open a small terminal
function! Terminal(position)
	if a:position ==? "v"
		vsplit +terminal
	else
		10 split +terminal
	endif
	set nonumber norelativenumber
endfunction

" Spell check
function! Spellmap(lang) "Map n to jump when spellchecking
	if empty(a:lang)
		set nospell
		silent! unmap <buffer> n
		silent! unmap <buffer> N
	else
		nnoremap <buffer> n ]sz=
		nnoremap <buffer> N [sz=
		execute "set spell spelllang=" . a:lang
	endif
endfunction

" Toggle text wrapping
function! Wraping() "Toggle line wrapping
	if &wrap ==? "nowrap" || &linebreak ==? "nolinebreak"
		set wrap linebreak
	else
		set nowrap
	endif
endfunction "}}}

" Settings{{{
autocmd BufRead,BufNewFile *.tex set filetype=tex
filetype indent on
set foldmethod=marker
set ignorecase
set mouse=nvci
set notimeout
set nowrap
set number relativenumber cursorline
set smartindent
set splitbelow splitright
set undofile undodir=$HOME/.config/nvim/undodir
hi CursorLine cterm=NONE ctermbg=darkgrey
hi Folded ctermbg=red
syntax on "}}}

" Key bindings{{{
let mapleader=" "
nnoremap <leader>n :nohlsearch<cr>
nnoremap Y y$
" Movement
noremap k gk
noremap j gj
" Disable keys
nnoremap <s-q> <nop>
nnoremap q: <nop>
" Clipboard
vnoremap <c-c> "+y
nnoremap <c-a> ggVG
inoremap <expr> <c-v> getreg('+')
inoremap <expr> <c-f> getreg(':')
" Switching splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" Command-line/terminal
command Q quit
command W write
command WQ wq
command Wq wq
tnoremap <Esc> <C-\><C-n>
" Functions
nnoremap <leader>t :call Terminal("")<cr>
nnoremap <leader>T :call Terminal("v")<cr>
nnoremap <leader>en :call Spellmap("en_us")<cr>
nnoremap <leader>sv :call Spellmap("sv")<cr>
nnoremap <leader>fr :call Spellmap("fr")<cr>
nnoremap <leader>l :call Spellmap("")<cr>
nnoremap <leader>w :call Wraping()<cr>
" Plugins
autocmd filetype todo nnoremap <c-x> :call Complete()<cr>
"}}}
