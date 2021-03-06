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
" Spellcheck
nnoremap <leader>le :setlocal spell<cr>
nnoremap <leader>ll :setlocal nospell<cr>
nnoremap <leader>ls :setlocal spell spelllang=sv<cr>
nnoremap m ]sz=<cr>
nnoremap M [sz=<cr>
" Mics
nnoremap <s-q> <nop>
nnoremap <leader>n :nohlsearch<cr>
nnoremap <leader>c :make!<cr>
nnoremap <C-LeftMouse> <LeftMouse>.
nnoremap <leader>x /<++><cr>"_ca<
nnoremap <leader>w :setlocal wrap! linebreak<cr>
nnoremap <leader>i :call fzf#run({'source':split(globpath(g:templateDir,
			\ '*.' . &filetype)), 'sink':'r'})<cr>

" Functions
vnoremap <leader>q :<c-u>call Blockseq()<cr>
function! Blockseq(...)
	let visualrange = [ getpos("'<")[1], getpos("'>")[1] ]
	let fill = getpos("'<")[2] - getpos("'>")[2] + 1
	" Assign the starting counter to the first argument if it exists
	if (a:0 >= 1)
		let num = a:1
	else
		let num = 1
	endif
	echo visualrange fill
	let startcolumn = col('.')
	for i in range(visualrange[0], visualrange[1])
		" Pad the string with zeroes
		let str = repeat(0, fill - len(num)) . num
		execute 'normal! R' . str
		" Move the cursor down and back to the original column
		call cursor(line('.') + 1, startcolumn)
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
