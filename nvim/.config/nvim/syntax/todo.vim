syntax match Tag     	/\(^\|\s\)[+@]\S\+/
syntax match Date    	/\d\{4}-\d\{2}-\d\{2}/
syntax match Done    	/^x\s.*/
syntax match Priority	/^(\u)\s/

highlight default link Date	String
highlight default link Done	Comment
highlight default link Priority	Title
highlight default link Tag	Statement
