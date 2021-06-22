" Settings
filetype indent on
syntax on
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
autocmd QuickFixCmdPre make update
autocmd TermOpen * setlocal nonumber norelativenumber

" Key bindings
let mapleader=" "
" Clipboard
vnoremap <c-c> "+y
nnoremap <c-a> ggVG
inoremap <expr> <c-v> getreg('+')
nnoremap Y y$
" Switching splits/files
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-n> :next<cr>
nnoremap <c-p> :previous<cr>
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
nnoremap <leader>c :make!<cr>
nnoremap <C-LeftMouse> <LeftMouse>.
nnoremap <leader>x /<++><cr>"_ca<

" Functions
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
		execute "setlocal spell spelllang=" . a:lang
	endif
endfunction

nnoremap <leader>w :call ToggleWraping()<cr>
function! ToggleWraping()
	if &wrap ==? "nowrap" || &linebreak ==? "nolinebreak"
		setlocal wrap linebreak
		noremap <buffer> k gk
		noremap <buffer> j gj
	else
		setlocal nowrap nolinebreak
		silent! nunmap <buffer> k
		silent! nunmap <buffer> j
	endif
endfunction

vnoremap <leader>q :<c-u>call Blockseq()<cr>
function! Blockseq(...)
	" Beginning and ending lines of visual selection
	let visualrange = [ getpos("'<")[1], getpos("'>")[1] ]
	" Assign the starting counter to the first argument if it exists
	if (a:0 >= 1)
		let num = a:1
	else
		let num = 1
	endif
	let startcolumn = col('.')
	for i in range(visualrange[0], visualrange[1])
		execute 'normal! R' . num
		" Move the cursor down and back to the original column
		call cursor(line('.')+1, startcolumn)
		let num += 1
	endfor
endfunction

let g:templateDir = expand("~/.config/nvim/snippet/")
autocmd BufNewFile * call Template()
function! Template()
	let templatefile = g:templateDir . "skeleton." . &filetype
	if filereadable(templatefile)
		execute "0r" templatefile
	endif
endfunction

nnoremap <leader>i :call Snippet()<cr>
function! Snippet()
	call fzf#run({
			\ 'source':
			\ split(globpath(g:templateDir, '*.' . &filetype)),
			\ 'sink': '-1r'
			\ })
endfunction

function! Visualwrap(...)
	let startPos = getpos("'<")[1:2]
	let endPos = getpos("'>")[1:2]
	if exists("a:1")
		let startText = a:1
	else
		let startText = input("What to insert before?: ")
	endif
	if exists("a:2")
		let endText = a:2
	else
		let endText = input("What to insert after?: ")
	endif
	call cursor(endPos)
	execute 'normal! a' . endText
	call cursor(startPos)
	execute 'normal! i' . startText
endfunction
