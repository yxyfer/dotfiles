" Turn on function highlighting
syn match dfunction display "\<\h\w*\>\s*("me=e-1  
highlight link dFunction Function 



" C math operators
syn match       cMathOperator     display "[-+\*/%=]"
" C pointer operators - address of and dereference are context sensitive
syn match       cPointerOperator  display "->\|\."
" C logical   operators - boolean results
syn match       cLogicalOperator  display "[!<>]=\="
syn match       cLogicalOperator  display "=="
" C bit operators
syn match       cBinaryOperator   display "\(&\||\|\^\|<<\|>>\)=\="
syn match       cBinaryOperator   display "\~"
syn match       cBinaryOperatorError display "\~="
" More C logical operators - highlight in preference to binary
syn match       cLogicalOperator  display "&&\|||"
syn match       cLogicalOperatorError display "\(&&\|||\)="

hi link cPointerOperator Operator
hi link cMathOperator    Operator
hi link cLogicalOperator    Operator

hi link cBinaryOperator    Operator
hi link cBinararyOperatorError    Operator

hi link cLogicalOperator    Operator
hi link cLogicalOperatoError    Operator

