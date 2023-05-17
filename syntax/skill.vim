" Vim syntax file
" Language:     SKILL / SKILL ++
" License:      Same as VIM
" Author:      Vincent S <v.sidot@aniah.fr>
" URL:          http://github.com/vincentSidot/vim-skill
"

if exists("b:current_syntax")
    finish
endif


let b:current_syntax = "skill"


syn keyword skillConstants t nil unbound

syn keyword skillConditional caseq cond if when unless

syn keyword skillKeywords begin declare declareN declareSQN declareLambda defmacro 
            \ defprop defstruct defun define defUserInitProc 
            \ defvar lambda last let letseq letrec 
            \ list procedure prog return
            \ defglobalfun defclass defmethod


syn keyword skillRepeat go for forall foreach while 

" CDF functions
" strings
syn region skillString				start=+"+ skip=+\\"+ end=+"+
syn match skillVarArg                                       "\c\v(\s)@<=[a-z0-9_]+"
syn match skillSymbol                                       "\c\v(\s)@<=['`,][a-z0-9_]+"
syn match skillArrow                                        "\c\v(\-\>)@<=[a-z0-9_]+"
syn match skillSquiggle                                     "\c\v(~\>)@<=[a-z0-9_]+"
syn match skillKeywordArgument                              "\c\v(\?|\@)@<=[a-z0-9_]+"
syn match skillNumber                                       "\v<[-+]?%(0\o*|0x\x+|[1-9]\d*)N?>"
syn match skillNumber                                       "\v<[-+]?%(0|[1-9]\d*|%(0|[1-9]\d*)\.\d*)%(M|[eE][-+]?\d+)?>"
syn match skillNumber                                       "\v<[-+]?%(0|[1-9]\d*)/%(0|[1-9]\d*)>"
syn match skillAtomFunction                                 "\c\v(\(\s?)@<=[a-z0-9_]+"
syn match skillFunctionDefinition                           "\c\v(\(defglobalfun|defun|defclass|defmethod)@<=\s[a-z0-9_]+"
syn match skillCondition                                    "\c\v(\(unless|if|when)@<=\s[a-z0-9_]+"


syn region skillAtom                                    start="(" end=")" 
            \contains=skillString,skillVarArg,skillSymbol,skillArrow,skillSquiggle,
                    \ skillNumber,skillAtomFunction,skillConstants,skillConditional,
                    \ skillRepeat,skillKeywords,skillComment, skillKeywordArgument,
                    \ skillFunctionDefinition, skillCondition

hi def link skillCondition                                  Number
hi def link skillRepeat                                     Repeat
hi def link skillKeywords                                   Define
hi def link skillConditional                                Conditional
hi def link skillAtomFunction                               Function
hi def link skillString                                     String
hi def link skillVarArg                                     Special
hi def link skillSymbol                                     Operator
hi def link skillArrow                                      Keyword
hi def link skillSquiggle                                   Keyword
hi def link skillKeywordArgument                            Keyword
hi def link skillNumber                                     Number
hi def link skillConstants                                  Boolean
hi def link skillFunctionDefinition                         SpecialChar


syn keyword skillTodo contained		TODO FIXME XXX
syn keyword skillNote contained		NOTE IMPORTANT

" comments are either C-style or begin with a semicolon
syn region skillComment				start="/\*" end="\*/" contains=skillTodo,skillNote
syn match skillComment				";.*" contains=skillTodo,skillNote
syn match skillCommentError			"\*/"

hi def link skillComment		     Comment
hi def link skillCommentError                        Error
hi def link skillTodo                                Todo
hi def link skillNote                                Todo

let b:current_syntax = "skill"
