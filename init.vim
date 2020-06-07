" Plugings{{{
execute pathogen#infect()
let g:linkhandler_browser = "xdg-open"
nnoremap <leader>o :call Openurl()<cr>
autocmd filetype todo nnoremap <c-x> :call Complete()<cr>
"}}}

" Settings{{{
autocmd BufRead,BufNewFile *.tex set filetype=tex
"autocmd filetype markdown set commentstring=<!--%s-->
colorscheme peachpuff
filetype indent on
set foldmethod=marker " Folding
set ignorecase " Searching
set mouse=nvc " Enable mouse for normal, visual and command-line modes
set notimeout " Key timeout
set nowrap " Text wrapping
set number relativenumber "cursorline " Lines
set smartindent " Indentation
set splitbelow splitright " Open splits at the bottom and right
set undofile undodir=$HOME/.config/nvim/undodir "Set an undofile
syntax on "}}}

" Key bindings{{{
let mapleader=" "
nnoremap <leader>n :nohlsearch<cr>
nnoremap Y y$

" Movement
nnoremap k gk
vnoremap k gk
nnoremap j gj
vnoremap j gj

" Disable keys
nnoremap <s-q> <nop>
nnoremap <space> <nop>
nnoremap q: <nop>

" Clipboard
cnoremap <c-v> <c-r>+
vnoremap <c-c> "+y
nnoremap <c-a> ggVG
inoremap <expr> <c-v> getreg('+')
inoremap <expr> <s-insert> getreg(':')

"Switching splits
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
"}}}

" Functions{{{
" Open a small terminal
nnoremap <leader>t :call Terminal()<cr>
function! Terminal()
	4split +terminal
	set nonumber norelativenumber
endfunction

" Spell check
nnoremap <leader>en :call Spellmap("en_us")<cr>
nnoremap <leader>sv :call Spellmap("sv")<cr>
nnoremap <leader>fr :call Spellmap("fr")<cr>
nnoremap <leader>l :call Spellmap("")<cr>
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

" Open links in a web browser
function! Openurl()
	let s:link = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*\|www.[a-z.]*[^ >,;]*')
	if s:link != ""
		execute "!firefox" s:link "&"
	endif
endfunction

" Toggle text wrapping
nnoremap <leader>w :call Wraping()<cr>
function! Wraping() "Toggle line wrapping
	if &wrap ==? "nowrap" || &linebreak ==? "nolinebreak"
		set wrap linebreak
	else
		set nowrap
	endif
endfunction "}}}
