
"{{{ Solarized
"let g:solarized_termcolors=16
let g:solarized_termcolors=256
"let g:solarized_visibility="high"
colorscheme solarized
"}}}

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

"{{{ CTRLP
nmap <leader>l :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v(mutt-soljaris.*|COMMIT.*|TAG.*)$',
            \ }
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

"{{{ Indent Guides
let g:indent_guides_auto_colors = 0
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
hi IndentGuidesOdd  ctermbg=234
hi IndentGuidesEven ctermbg=235
"}}}

" {{{ Markdown
autocmd FileType markdown nmap <leader>to :Toc<CR>
let g:vim_markdown_folding_disabled=1
" }}}

" {{{ airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" }}}
