
" always save the buffer when loosing the focus
autocmd FocusLost * :wa

"autocmd FileType mail colorscheme transparent
"
" for tex files only: swich working directory according to to file
autocmd FileType tex lcd %:p:h

autocmd FileType tex setlocal foldmethod=marker

" http://vim.wikia.com/wiki/All_folds_open_when_opening_a_file
" http://stackoverflow.com/questions/5074191/vim-fold-top-level-folds-only
autocmd FileType markdown normal %foldc

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " no line numbering in the outlook window
    autocmd FileType taglist setlocal norelativenumber

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event
    " handler (happens when dropping a file on gvim). Also don't do it when
    " the mark is in the first line, that is the default position when
    " opening a file.
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif

augroup END

" vimrc_on_the_fly from vimcasts
autocmd bufwritepost .vimrc source $MYVIMRC

" turn on wrap for e.g. tex files
autocmd FileType tex set wrap linebreak nolist
autocmd FileType markdown set wrap linebreak nolist
autocmd FileType markdown set textwidth=0
autocmd FileType markdown set wrapmargin=0

" Markdown (no need for modula2 :)
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd FileType markdown nmap <leader>m :silent !open %<CR>

" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
" http://vim.wikia.com/wiki/Encryption
augroup encrypted
  au!

  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a various options which write unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup

  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null

  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END

