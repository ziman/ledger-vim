if exists("b:current_syntax")
	finish
endif
let b:current_syntax = 'ledger'

syntax clear

" there are no keywords
" syn keyword foo bar baz

syn match lgrTxHead    /^\d.*/ transparent contains=lgrDates
syn match lgrDates /^[^ ]\+ / contained contains=lgrDate nextgroup=lgrType
syn match lgrDate /\d\+\([-/.]\d\+\)*/ contained
syn match lgrType /\([^)]*) \)\?/ contained nextgroup=lgrPayee skipwhite
syn match lgrPayee /.*/ contained contains=lgrTodoPayee,lgrClearedPayee
syn match lgrTodoPayee /! .*/ contained
syn match lgrClearedPayee /\* .*/ contained

syn match lgrTxEntry   /^ .*/ transparent contains=lgrAccount,lgrAmount
syn match lgrTxComment /^ \+[#;].*/
syn match lgrComment   /^[#;].*/

syn match lgrAccount /[^ ]\+\( [^ ]\+\)*/ contained
syn match lgrAmount /-\?\d\+\(\.\d\+\)\?\( \a\+\)\?/ contained contains=lgrNumber,lgrCurrency
syn match lgrNumber /-\?\d\+\(\.\d\+\)\?/ contained
syn match lgrCurrency /\a\+/ contained

hi link lgrDate      Statement
hi link lgrType      Type
hi link lgrClearing  Statement
hi link lgrTodoPayee Todo
hi link lgrClearedPayee     PreProc

hi link lgrComment   Comment
hi link lgrTxComment SpecialComment
hi link lgrAccount   Identifier
hi link lgrNumber    Number
hi link lgrCurrency  Type

syn sync clear
