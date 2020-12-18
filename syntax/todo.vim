if exists("b:current_syntax")
    finish
endif

syntax match Tag     	/\(^\|\s\)[+@]\S\+/
syntax match Date    	/\(^\|\s\)\d\{4}-\d\{2}-\d\{2}/
syntax match Done    	/^[x]\s.*/
syntax match Priority	/^(\u)\s/ contains=Date

highlight default link Date	Comment
highlight default link Done	Comment
highlight default link Priority	Title
highlight default link Tag	Statement

let b:current_syntax = "todo"
