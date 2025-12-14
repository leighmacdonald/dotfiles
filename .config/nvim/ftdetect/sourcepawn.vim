function! s:setf(filetype) abort
    if &filetype !=# a:filetype
        let &filetype = a:filetype
    endif
endfunction

au BufNewFile,BufRead *.sp,*.sourcepawn,*.inc call s:setf('sourcepawn')

