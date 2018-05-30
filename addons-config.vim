
"{{{ deoplete
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#flow#flow_bin = 'flow'
"}}}

"{{{ LanguageClient-neovim
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
"}}}
"
"{{{ nvim-completion-manager
" let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
" smart tab for auto complete
inoremap <expr> <silent> <Tab>  pumvisible()?"\<C-n>":"\<TAB>"
inoremap <expr> <silent> <S-TAB>  pumvisible()?"\<C-p>":"\<S-TAB>"
"}}}

"{{{ UltiSnips
let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsSnippetsDir = '/Users/seebi/.vim/UltiSnips'
" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
"}}}
"
"{{{ rdf
au! BufNewFile,BufRead *.ttl,*.nt,*.nq  set filetype=turtle
au! BufNewFile,BufRead *.trig  set filetype=trig
au! BufNewFile,BufRead *.n3  set filetype=n3
au! BufNewFile,BufRead *.jsonld  set filetype=jsonld
"}}}

"{{{ Solarized
" set background=dark
" colorscheme solarized
colorscheme NeoSolarized
"}}}

"{{{ Tagbar
let g:tagbar_autoclose = 1
" toggle outline
nmap <leader>to :TagbarToggle<CR>
"}}}

"{{{ NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.aux$', '\.log$', '\.lof', '\.lol', '\.lot']
nmap <leader>n :lcd %:p:h<CR>:NERDTreeTabsToggle<CR>
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
" https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
let g:syntastic_javascript_checkers = ['eslint']
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
autocmd FileType markdown nmap <leader>to :Toch<CR>
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_toc_autofit = 1
" }}}

" {{{ airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" }}}

" {{{ editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" }}}

" {{{ fugitive
" just git status
nnoremap <leader>gs :Gstatus<CR>
" commit from the current staging area
nnoremap <leader>gc :Gcommit -v -q<CR>
" commit from the current file
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
" diff of current file
nnoremap <leader>gd :Gdiff<CR>
" just fugititve git edit
nnoremap <leader>ge :Gedit<CR>
" just fugititve git read
nnoremap <leader>gr :Gread<CR>
" just fugititve git write
nnoremap <leader>gw :Gwrite<CR><CR>
" git log
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
" }}}

" {{{ gitgutter
" add current hunk to stage
nnoremap <leader>ga :GitGutterStageHunk<CR><CR>
" toggle line highlights
nnoremap <leader>tg :GitGutterLineHighlightsToggle<CR><CR>
" }}}
