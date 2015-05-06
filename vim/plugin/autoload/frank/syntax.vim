if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax match dir "^[^\/].*\/"

hi def link dir  Comment

let b:current_syntax = "frank"

let &cpo = s:cpo_save
unlet s:cpo_save
