" vim:set ft=vim:

source $pete/Buffer
source $pete/PetroniusTheArbiter

nnoremap ÷ :call PetroniusTheArbiter($PETE_COMMENT_ON)<CR>
vnoremap ÷ :call PetroniusTheArbiter($PETE_COMMENT_ON)<CR>

nnoremap ? :call PetroniusTheArbiter($PETE_COMMENT_OFF)<CR>
vnoremap ? :call PetroniusTheArbiter($PETE_COMMENT_OFF)<CR>

nnoremap ¿ :call PetroniusTheArbiter($PETE_COMMENT_SWITCH)<CR>
vnoremap ¿ :call PetroniusTheArbiter($PETE_COMMENT_SWITCH)<CR>

command! W wall | call PetroniusTheArbiter($PETE_RUN)

command! R call PetroniusTheArbiter($PETE_RELOAD)

command! -nargs=* D call PetroniusTheArbiter($PETE_DEBUG, <f-args>)

" buffer local?
nnoremap <Tab>   <C-w>w
nnoremap <S-Tab> <C-w>W
nnoremap gw      <C-w>w


source $surroundtag/SurroundTag.vim

source $plugin/autoload/todo/configure.vim

command!        -nargs=* -complete=custom,HtmlElements NTag  :              call SurroundTag($SURR_TAG_NORMAL, <f-args>)
command! -range -nargs=* -complete=custom,HtmlElements VTag :<line1>,<line2>call SurroundTag($SURR_TAG_VISUAL, <f-args>)

command! -nargs=? -complete=dir F           call frank#main#open(<f-args>)
command!                        FL          call frank#launcher#selector()
command!                        FP          call frank#launcher#current_project()
command!                        FLConfigure call frank#launcher#configure()
