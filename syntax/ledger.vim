" Vim syntax file
" Language:     Ledger
" Maintainer:   Matus Tejiscak <ziman@functor.sk>
" Last Change:  1 July 2015

if exists("b:current_syntax")
	finish
endif
let b:current_syntax = 'ledger'

syntax clear

" there are no keywords
" syn keyword foo bar baz

syn match lgrTxHead /^\d.*/ transparent contains=lgrDates,lgrDescC,lgrDescU
syn match lgrDates /^[^ ]\+ / contained contains=lgrDate
syn match lgrDate /\d\+\([-/.]\d\+\)*/ contained

syn match lgrDescU /! .*/ contained contains=lgrType
syn match lgrDescC /\* .*/ contained contains=lgrType
syn match lgrType /\([^)]*) \)\?/ contained

syn match lgrTxEntry   /^ .*/ transparent contains=lgrAccount,lgrAmount
syn match lgrTxComment /^ \+[#;].*/
syn match lgrComment   /^[#;].*/

syn match lgrAccount /[^ ]\+\( [^ ]\+\)*/ contained contains=lgrUnknown
syn match lgrAmount /-\?\d\+\(\.\d\+\)\?\( \a\+\)\?/ contained contains=lgrNumber,lgrCurrency
syn match lgrNumber /-\?\d\+\(\.\d\+\)\?/ contained
syn match lgrCurrency /\a\+/ contained

syn match lgrUnknown /Unknown/

hi link lgrDate      Statement
hi link lgrType      Type
hi link lgrClearing  Statement
hi link lgrDescU     Todo
hi link lgrUnknown   Todo
hi link lgrDescC     PreProc

hi link lgrComment   Comment
hi link lgrTxComment SpecialComment
hi link lgrAccount   Identifier
hi link lgrNumber    Number
hi link lgrCurrency  Type

" syn sync clear
