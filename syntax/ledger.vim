if exists("b:current_syntax")
	finish
endif
let b:current_syntax = 'ledger'

syntax clear

" there are no keywords
" syn keyword foo bar baz

syn match lgrTxHead    /^\d.*/ transparent
syn match lgrTxEntry   /^ .*/ transparent contains=lgrAccount,lgrAmount
syn match lgrTxComment /^ \+[#;].*/
syn match lgrComment   /^[#;].*/

syn match lgrAccount /\a\+\(:\a\+\)\+/ contained
syn match lgrAmount /-\?\d\+\(\.\d\+\)\?\( \a\+\)\?/ contained contains=lgrNumber,lgrCurrency
syn match lgrNumber /-\?\d\+\(\.\d\+\)\?/ contained
syn match lgrCurrency /\a\+/ contained

syn match lgrDate /^\d\+\([-/.]\d\+\)\*/

hi link lgrComment   Comment
hi link lgrTxComment Special
hi link lgrAccount   Identifier
hi link lgrNumber    Number
hi link lgrCurrency  Type

syn sync clear
