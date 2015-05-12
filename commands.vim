
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif


"{{{ Show syntax highlighting groups for word under cursor
" http://vimcasts.org/episodes/creating-colorschemes-for-vim/
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
"}}}

"{{{ Open URL in browser
function! Browser ()
    let line = getline (".")
    let line = matchstr (line, "http[^   ]*")
    exec "!~/.local/bin/browser.sh ".line
endfunction
" Open Url on this line with the browser \w
map <Leader>b :call Browser ()<CR>
"}}}

" Save a file you edited in vim without the needed permissions
" http://www.commandlinefu.com/commands/view/1204/save-a-file-you-edited-in-vim-without-the-needed-permissions
" command! Sudow :w !sudo tee %

" remove trailing whitespaces in the complete file
command! -nargs=* StripTrailingWhitespaces :%s/\s\+$//

" little brother database autocompletion for mails
" http://paste.dollyfish.net.nz/576ec0?filetype=vim
function! LBDBCompleteFn(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '[^:,]'
            let start -= 1
        endwhile
        while start < col('.') && line[start] =~ '[:, ]'
            let start += 1
        endwhile
        return start
    else
        let res = []
        let query = substitute(a:base, '"', '', 'g')
        let query = substitute(query, '\s*<.*>\s*', '', 'g')
        for m in LbdbQuery(query)
            call add(res, printf('"%s" <%s>', escape(m[0], '"'), m[1]))
        endfor
        return res
    endif
endfun
autocmd FileType mail set completefunc=LBDBCompleteFn

