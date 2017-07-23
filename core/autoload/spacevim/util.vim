function! spacevim#util#ToggleCursorColumn()
  if &cursorcolumn
    setlocal nocursorcolumn
  else
    setlocal cursorcolumn
  endif
endfunction

function! spacevim#util#ToggleColorColumn()
  if &colorcolumn
    setlocal colorcolumn=
  else
    setlocal colorcolumn=80
  endif
endfunction

function! spacevim#util#CompileAndRun()
  exec 'w'
  if &filetype == 'c'
    exec "AsyncRun! gcc % -o %<; time ./%<"
  elseif &filetype == 'cpp'
    exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
  elseif &filetype == 'go'
    exec "! go run %"
  elseif &filetype == 'java'
    exec "AsyncRun! javac %; time java %<"
  elseif &filetype == 'python'
    exec "AsyncRun! time python %"
  elseif &filetype == 'ruby'
    exec "AsyncRun! time ruby %"
  elseif &filetype == 'rust'
    exec "AsyncRun! rustc % -o %<; time ./%<"
  elseif &filetype == 'sh'
    exec "AsyncRun! time bash %"
  endif
endfunction

function! spacevim#util#Runtimepath()
  for path in split(&runtimepath, ',')
    echo path
  endfor
endfunction
