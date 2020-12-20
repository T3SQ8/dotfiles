" Settings{{{
filetype indent on
set foldmethod=marker
set ignorecase
set mouse=nvci
set notimeout
set nowrap
set number relativenumber cursorline
set smartindent
set splitbelow splitright
set undofile undodir=$HOME/.cache/nvim/undodir
highlight CursorLine cterm=bold
highlight Folded ctermbg=darkblue ctermfg=white
syntax on "}}}

" Key bindings{{{
let mapleader=" "
" Movement
noremap k gk
noremap j gj
" Disable keys
nnoremap <s-q> <nop>
" Clipboard
vnoremap <c-c> "+y
nnoremap <c-a> ggVG
inoremap <expr> <c-v> getreg('+')
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
" Mics
nnoremap <leader>n :nohlsearch<cr>
nnoremap <leader>r :w \| !cleandoc %<cr>
nnoremap <leader>c :w \| !compiledoc %<cr>
nnoremap Y y$
nnoremap <C-LeftMouse> <LeftMouse>.
nnoremap <leader>x /<++><cr>"_ca<
nnoremap <leader>X ?<++><cr>"_ca<
nnoremap <leader>o :!xdg-open '%'<cr>
nnoremap <c-n> :next<cr>
nnoremap <c-p> :previous<cr>
nnoremap <leader>i :r !cat ~/.config/nvim/templates/
"}}}

" Functions{{{
nnoremap <leader>t :call Terminal("")<cr>
nnoremap <leader>T :call Terminal("v")<cr>
function! Terminal(position)
	if a:position ==? "v"
		vsplit +terminal
	else
		execute winheight(0)/3 "split +terminal"
	endif
	set nonumber norelativenumber
endfunction

nnoremap <leader>en :call Spellmap("en_us")<cr>
nnoremap <leader>sv :call Spellmap("sv")<cr>
nnoremap <leader>fr :call Spellmap("fr")<cr>
nnoremap <leader>l :call Spellmap("")<cr>
function! Spellmap(lang)
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

nnoremap <leader>w :call ToggleWraping()<cr>
function! ToggleWraping()
	if &wrap ==? "nowrap" || &linebreak ==? "nolinebreak"
		set wrap linebreak
	else
		set nowrap
	endif
endfunction

vnoremap <leader>q :<c-u>call Blockseq("")<cr>
function! Blockseq(startnum)
	" Get beginning and ending lines of visual selection
	let visualrange = [ getpos("'<")[1], getpos("'>")[1] ]
	if empty(a:startnum)
		let num = 1
	else
		let num = a:startnum
	endif
	normal! gvd
	let startcolumn = col('.')
	for i in range(visualrange[0], visualrange[1])
		execute 'normal! i' . num
		call cursor(line('.')+1, startcolumn) " Move the cursor down and back to the original column
		let num = num + 1
	endfor
endfunction

" Filetypes
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *todo.txt set filetype=todo
