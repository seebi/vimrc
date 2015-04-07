
"{{{ Tagbar
let g:tagbar_autoclose = 1
" toggle outline
nmap <leader>to :TagbarToggle<CR>
"}}}

"{{{ NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.aux$', '\.log$', '\.lof', '\.lol', '\.lot']
nmap <leader>n :lcd %:p:h<CR>:NERDTreeToggle<CR>
nmap <leader>nn :lcd %:p:h<CR>:NERDTreeToggle<CR>
nmap <leader>nm :NERDTreeMirror<CR>
"}}}

"{{{ MRU
let MRU_Max_Entries=1000
let MRU_Exclude_Files='^/tmp/.*\|^.*tmp$\|^/var/tmp/.*\|^.*mutt.*\|.*COMMIT_EDITMSG$\|.*MERGE_MSG$\|.*fugitiveblame\|.*crontab.*'
let MRU_File=$HOME . '/.vim/mru_files'
nmap <leader>l :MRU<CR>
"}}}

"{{{ toggle graphical undo visualization
nmap <leader>tu :GundoToggle<CR>
"}}}

"{{{ Yankstack specific bindings
" https://github.com/maxbrunsfeld/vim-yankstack
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
"}}}

"{{{ dash
" search for the keyword under the cursor via dash
" nmap <silent> <leader>d <Plug>DashSearch
"}}}
"
"{{{ syntastic options
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=2
"let g:syntastic_quiet_warnings=1
let g:syntastic_phpcs_disable = 1
" http://stackoverflow.com/questions/18270355
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
nmap <leader>tc :SyntasticToggleMode<CR>
"}}}

"{{{ CheckAttach
let g:checkattach_filebrowser='ranger'
let g:checkattach_once='y'
"}}}


