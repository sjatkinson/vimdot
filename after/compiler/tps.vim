if exists(":CompilerSet") != 2
    echom "darn it"
    command -nargs=* CompilerSet setlocal <args>
endif

let s:keepcpo= &cpo
set cpo&vim

:let current_compiler = "tpstool"
CompilerSet errorformat&		" use the default 'errorformat'
CompilerSet makeprg=tps\ build\ $*

let &cpo = s:keepcpo
unlet s:keepcpo

