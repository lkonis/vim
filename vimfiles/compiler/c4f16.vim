" Vim Compiler File
" Compiler:	c4f16
" Maintainer:	Max Melgaard Rasmussen <mmrasmussen@gnresound.com>
" Last Change:	2015-05-01

if exists("current_compiler")
    finish
endif
let current_compiler = "c4f16"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=iimake.bat\ 

CompilerSet errorformat=Error\ in\ %*[\"]%f%*[\"]\\,\ line\ %l\\,\ column\ %c:\ %m,Error\ in\ %*[\"]%f%*[\"]\\,\ line\ %l:\ %m


let &cpo = s:cpo_save
unlet s:cpo_save
