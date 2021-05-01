" Settings{{{
filetype indent on
set foldmethod=marker
set ignorecase
set mouse=a
set notimeout
set nowrap
set number relativenumber
set splitbelow splitright
set undofile
set makeprg=compiledoc\ %
set nojoinspaces
syntax on
autocmd QuickFixCmdPre make update
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *todo.txt set filetype=todo
autocmd TermOpen * setlocal nonumber norelativenumber
autocmd BufNewFile * call Template()
"}}}

" Key bindings{{{
let mapleader=" "
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
command! Q quit
command! W write
command! WQ wq
command! Wq wq
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>t :execute winheight(0)/3 "split +terminal"<cr>
" Mics
nnoremap <s-q> <nop>
nnoremap <leader>n :nohlsearch<cr>
nnoremap <leader>r :w \| !cleandoc %<cr>
nnoremap <leader>c :make<cr>
nnoremap Y y$
nnoremap <C-LeftMouse> <LeftMouse>.
nnoremap <leader>x /<++><cr>"_ca<
nnoremap <leader>X ?<++><cr>"_ca<
nnoremap <c-n> :next<cr>
nnoremap <c-p> :previous<cr>
nnoremap <leader>s :source $MYVIMRC<cr>
"}}}

" Functions{{{
nnoremap <leader>o :call Open()<cr>
function! Open()
	if &filetype == "tex"
		let file = expand("%:r") . ".pdf"
	elseif &filetype == "markdown"
		let file = expand("%:r") . ".html"
	else
		let file = expand("%")
	endif
execute "!xdg-open" file "&"
endfunction

nnoremap <leader>le :call Spellmap("en_us")<cr>
nnoremap <leader>ls :call Spellmap("sv")<cr>
nnoremap <leader>ll :call Spellmap("")<cr>
function! Spellmap(lang)
	if empty(a:lang)
		set nospell
		silent! nunmap <buffer> n
		silent! nunmap <buffer> N
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
		noremap <buffer> k gk
		noremap <buffer> j gj
	else
		set nowrap nolinebreak
		silent! nunmap <buffer> k
		silent! nunmap <buffer> j
	endif
endfunction

vnoremap <leader>q :<c-u>call Blockseq()<cr>
function! Blockseq(...)
	let visualrange = [ getpos("'<")[1], getpos("'>")[1] ] " Beginning and ending lines of visual selection
	if a:0 >= 1 " Assign the starting counter to the first argument if it exists
		let num = a:1
	else
		let num = 1
	endif
	let startcolumn = col('.')
	for i in range(visualrange[0], visualrange[1])
		execute 'normal! R' . num
		call cursor(line('.')+1, startcolumn) " Move the cursor down and back to the original column
		let num += 1
	endfor
endfunction

nnoremap <leader>i :call Snippet()<cr>
function! Snippet()
	call fzf#run({
			\ 'source': split(globpath('~/.config/nvim/snippet',
			\ '*.' . &filetype)), 'sink': 'r'})
endfunction

function! Template()
	let templatefile = expand("~/.config/nvim/templates/skeleton." . expand("%:e"))
	if filereadable(templatefile)
		execute "0r" templatefile
	endif
endfunction "}}}
