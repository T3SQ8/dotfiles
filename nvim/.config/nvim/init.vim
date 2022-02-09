"
" SETTINGS
"

filetype indent on
syntax on
set ignorecase
set mouse=a
set notimeout
set nowrap
set number relativenumber
set splitbelow splitright
set undofile
set linebreak
let g:templateDir = stdpath('config') . '/snippet/'
let g:tex_flavor = "latex"

augroup savefolds | autocmd!
	autocmd BufWinLeave * silent! mkview
	autocmd BufWinEnter * silent! loadview
augroup END

augroup compilers | autocmd!
	autocmd QuickFixCmdPre make update
augroup END

augroup textyank | autocmd!
	autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=100, on_visual=false}
augroup END

augroup termconf | autocmd!
	autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

"
" KEY BINDINGS
"

let mapleader=" "
" Clipboard
vnoremap <c-c> "+y
nnoremap <c-a> ggVG
inoremap <expr> <c-v> getreg('+')
" Command-line/terminal
command! Q quit
command! W write
command! WQ wq
command! Wq wq
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>t :execute winheight(0)/3 "split +terminal"<cr>
command! -nargs=? ExOpen !xdg-open <args> &
" Mics
nnoremap <s-q> <nop>
nnoremap <leader>c :make %<cr>
nnoremap <C-LeftMouse> <LeftMouse>.
nnoremap <leader>x /<++><cr>"_ca<
nnoremap <leader>w :setlocal wrap!<cr>
nnoremap <leader>i :call fzf#run({'source':split(globpath(g:templateDir,
			\ '*.' . &filetype)), 'sink':'r'})<cr>
nnoremap m ]sz=
nnoremap M [sz=
nnoremap <c-n> :next<cr>
nnoremap <c-p> :previous<cr>

"
" WINDOWS
"

if has('win32')
	call plug#begin()
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'OmniSharp/omnisharp-vim'
	call plug#end()
	colorscheme nord
	set guifont=consolas:h15
	let g:templateDir = tr(g:templateDir, '/', '\')
	command! -nargs=? ExOpen !start <args>
endif

"
" FUNCTIONS
"

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

augroup template | autocmd!
	autocmd BufNewFile * call Template()
augroup END
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

nnoremap <leader>l :call Spellcycle()<cr>
function! Spellcycle(...)
	execute {
			\ '0en': 'setlocal spell spelllang=en',
			\ '0sv': 'setlocal spell spelllang=en',
			\ '1en': 'setlocal spell spelllang=sv',
			\ '1sv': 'setlocal nospell'
			\ }[&spell . &spelllang]
	if &spell
		echo &spelllang
	endif
endfunction

nnoremap <leader>o :call Openbg()<cr>
function! Openbg()
	let files = split(glob('%:r*'))
	call remove(files, index(files, expand('%'))) " Remove current file from list
	call fzf#run({'source':files, 'sink':'ExOpen'})
endfunction
