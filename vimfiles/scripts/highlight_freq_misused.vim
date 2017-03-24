"Create a text highlighting unique for prx files
highlight PRXHL_PTH term=bold guibg=green cterm=bold gui=bold
 
"Build a Vim command to match troublesome words...
let s:m = matchadd(str_l,pat)
let s:words_matcher
\ = 'match PRXHL_PTH /\c\<\(' . join(s:words, '\|') . '\)\>/'
 
"Toggle word checking on or off...
function! WordCheck ()
   "Toggle the flag (or set it if it doesn't yet exist)...
   let w:check_words = exists('w:check_words') ? !w:check_words : 1
 
   "Turn match mechanism on/off, according to new state of flag...
   if w:check_words
      exec s:words_matcher
   else
      match none
   endif
endfunction
 
"Use ;p to toggle checking...
nmap <silent>  ;p  :call WordCheck()<CR>
"its itsii

