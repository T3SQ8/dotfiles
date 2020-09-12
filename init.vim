execute pathogen#infect()

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
autocmd filetype todo nnoremap <buffer> <c-x> :call Todo_complete()<cr>
nnoremap <leader>n :nohlsearch<cr>
nnoremap Y y$
nnoremap <C-LeftMouse> <LeftMouse>.
nnoremap <leader>x /<++><cr>"_ca<
nnoremap <leader>X ?<++><cr>"_ca<
"}}}

" Functions{{{
nnoremap <leader>t :call Terminal("")<cr>
nnoremap <leader>T :call Terminal("v")<cr>
function! Terminal(position) " Open a small terminal
	if a:position ==? "v"
		vsplit +terminal
	else
		10 split +terminal
	endif
	set nonumber norelativenumber
endfunction

nnoremap <leader>en :call Spellmap("en_us")<cr>
nnoremap <leader>sv :call Spellmap("sv")<cr>
nnoremap <leader>fr :call Spellmap("fr")<cr>
nnoremap <leader>l :call Spellmap("")<cr>
function! Spellmap(lang) " Map n to jump for spellchecking
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

nnoremap <leader>w :call Wraping()<cr>
function! Wraping() " Toggle line wrapping
	if &wrap ==? "nowrap" || &linebreak ==? "nolinebreak"
		set wrap linebreak
	else
		set nowrap
	endif
endfunction

autocmd filetype markdown,tex nnoremap <buffer> <leader>c :call Compiledoc()<cr>
function! Compiledoc()
	write
	if &filetype ==? "markdown"
		execute '!pandoc % -o' expand("%:p:r") . '.html'
	elseif &filetype ==? "tex"
		execute '!pdflatex -output-directory=/tmp %'
		execute '! cp /tmp/' . expand("%:r") . '.pdf ./'
	else
		echo "Invalid filetype"
	endif
endfunction

vnoremap <leader>q :<c-u>call Blockseq("")<cr>
function! Blockseq(startnum)
	if empty(a:startnum)
		let l:num = "1"
	else
		let l:num = a:startnum
	endif
	normal! gv
	if mode() != ""
		echoerr "Not in visualblock mode"
		return
	endif
	execute 'normal! d'
	for i in range(0, get(getpos("'>"), 1) - get(getpos("'<"), 1)) " 0 to the number of selected lines (end of visual block - beginning of visual block)
		let l:startcolumn = col('.') " Save the column to return to it
		execute 'normal! i' . l:num
		call cursor(line('.')+1, l:startcolumn) " Move the cursor down and back to the original column
		let l:num = l:num + 1
	endfor
endfunction

autocmd filetype html,tex nnoremap <buffer> <leader>b :call Begin()<cr>
function! Begin()
	if line('$') == 1 && empty(getline(1))
		if &filetype ==? "html"
			call append(0, "</html>")
			call append(0, "</body>")
			call append(0, "<++>")
			call append(0, "<body>")
			call append(0, "</head>")
			call append(0, "<title><++></title>")
			call append(0, '<link rel="stylesheet" Type="text/css" href="<++>">')
			call append(0, '<meta name="description" content="<++>">')
			call append(0, '<meta charset="UTF-8">')
			call append(0, "<head>")
			call append(0, '<html lang="<++>">')
			call append(0, "<!DOCTYPE html>")
		elseif &filetype ==? "tex"
			call append(0, '\end{document}')
			call append(0, '<++>')
			call append(0, '\begin{document}')
			call append(0, '\documentclass{article}')
		else
			echoerr "Invalid filetype"
		endif
		global/^$/d
		normal! G=gg
	else
		echoerr "File is not empty"
	endif
endfunction

autocmd BufWritePost * call Rmspace()
function! Rmspace()
	if line("$") != 1 && empty(getline("$"))
		echomsg "The last line is empty"
		call cursor("$", "")
	elseif search("[ 	]$")
		echomsg "There is whitespace at end of line(s)"
	elseif search('	 \| 	')
		echomsg "There are mismatched tabs and spaces"
	endif
endfunction "}}}
