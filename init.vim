execute pathogen#infect()

" Functions{{{
function! Compilehtml()
	set fileencoding=utf-8
	write
	!pandoc % -o /home/anime/Desktop/tmp.html
	set fileencoding=latin1
	write
endfunction

" Open a small terminal
function! Terminal()
	4split +terminal
	set nonumber norelativenumber
endfunction

" Spell check
function! Spellmap(lang)
	nnoremap n ]sz=
	nnoremap p [sz=
	set spell
	if a:lang ==? "en_us"
		let spellcheck="on"
		set spelllang=en_us
	else
		unmap n
		unmap p
		set nospell
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
function! Wraping()
	if &wrap ==? "nowrap" || &linebreak ==? "nolinebreak"
		set wrap linebreak
	else
		set nowrap nolinebreak
	endif
endfunction
"}}}

" Settings{{{
" Lines
set number relativenumber

" Open splits at the bottom and right
set splitbelow splitright

" Text wrapping
set nowrap

" Searching
set ignorecase

" Enable mouse for normal, visual and command-line modes
set mouse=nvc

" Indentation
set smartindent

" Folding
set foldmethod=marker

" Key timeout
set notimeout
"}}}

" Key bindings{{{
let mapleader=" "
nnoremap <leader>c :call Compilehtml()<cr>
nnoremap <leader>w :call Wraping()<cr>
nnoremap <leader>t :call Terminal()<cr>
nnoremap <leader>en :call Spellmap("en_us")<cr>
nnoremap <leader>l :call Spellmap("")<cr>
nnoremap <leader>u :call Openurl()<cr>
nnoremap <leader>n :noh<cr>
nnoremap <c-a> ggVG
tnoremap <Esc> <C-\><C-n>
nnoremap k gk
nnoremap j gj

" Disable keys
nnoremap <s-q> <nop>
nnoremap <space> <nop>
nnoremap q: <nop>
"}}}

autocmd filetype markdown set commentstring=<!--%s-->
command! W write
command! Q quit
colorscheme peachpuff
