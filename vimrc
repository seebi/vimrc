" based on the example vimrc file as well as
" 
" - http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" - http://stackoverflow.com/questions/164847/what-is-in-your-vimrc
" - http://weierophinney.net/matthew/archives/249-Vim-Toolbox,-2010-Edition.html
" - http://items.sjbach.com/319/configuring-vim-right
" - http://spf13.com/post/ultimate-vim-config
" - https://github.com/swaroopch/dotvim/blob/master/vimrc
" - http://amix.dk/vim/vimrc.html
"

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" <space> is easier than \
let mapleader = " "

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" prevents some security exploits having to do with modelines in files
" http://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html
set modeline
set modelines=4

" http://vimcasts.org/episodes/tabs-and-spaces/
" 4 spaces expanded and backspace deletes 4 spaces too
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" gvim font
"set guifont=Monospace\ 14
"set guifont=Monaco\ 14
set guifont=Inconsolata\ Medium\ 18

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
    set nobackup      " do not keep a backup file, use versions instead
else
    set backup        " keep a backup file
endif

set scrolloff=99    " Minimal number of screen lines to keep above and below the cursor
set encoding=utf-8  " Sets the character encoding used inside Vim.

set history=1000     " keep xxx lines of command line history

set showmode
set showcmd         " display incomplete commands
set incsearch       " do incremental searching

" command-line completion menu
set wildmenu
set wildmode=list:longest,full


" ignore list e.g. for command-t plugin
set wildignore+=*.o,*.obj
set wildignore+=*.aux,*.bbl,*.blg,*.toc,*.out,*.bak,*.mtc0,*.maf,*.mtc
set wildignore+=*.dvi,*.pdf
set wildignore+=*.jpg,*.png,*.tiff

set visualbell      " no beep but visual bell
set cursorline      " Highlight the screen line of the cursor
set cursorcolumn      " Highlight the screen column of the cursor
set ttyfast         " Indicates a fast terminal connection.
set ruler           " Show the line and column number of the cursor position
set laststatus=2    " = always
set laststatus=2

" Status line
"set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
"set statusline=
"set statusline+=%-3.3n\                         " buffer number
"set statusline+=%f\                             " filename
"set statusline+=%h%m%r%w                        " status flags
"set statusline+=\[%{strlen(&ft)?&ft:'none'}]    " file type
"set statusline+=%=                              " right align remainder
"set statusline+=0x%-8B                          " character value
"set statusline+=%-14(%l,%c%V%)                  " line, character
"set statusline+=%<%P                            " file position

"{{{ Tab line -- refer ':help setting-guitablabel'
if v:version >= 700

    function! GuiTabLabel()
        let label = ''
        let bufnrlist = tabpagebuflist(v:lnum)

        " Add '+' if one of the buffers in the tab page is modified
        for bufnr in bufnrlist
            if getbufvar(bufnr, '&modified')
                let label = '[+] '
                break
            endif
        endfor

        " Append the number of windows in the tab page if more than one
        let wincount = tabpagewinnr(v:lnum, '$')
        if wincount > 1
            let label .= wincount
        endif
        if label != ''
            let label .= ' '
        endif

        return label

    endfunction
    set guitablabel=%{GuiTabLabel()}\ %t
endif
"}}} v:version >= 700


"{{{ 7.3 features
if v:version >= 703
    " Show the line number relative to the line with the cursor
    set relativenumber
    " toggle numbers (e.g. for copy and paste to another window)
    nmap <leader>tn :set relativenumber!<CR>

    set undofile        " new feature of undo files
    set undodir=$HOME/.vim/undos

    set colorcolumn=85
endif
"}}} v:version >= 703

" no more backupfiles in the same directory
set backupdir=$HOME/.vim/backups

" no more swapfiles in the same directory
set directory=$HOME/.vim/swap

" case-sensitive search intelligently
set ignorecase
set smartcase       " all lower -> insensitive, on upper case -> sensitive

" searches use normal regexes
nnoremap / /\v
vnoremap / /\v

" applies substitutions globally on lines
set gdefault

" handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1

" show invisible chars (*t*oggle *l*ist)
nmap <leader>tl :set list!<CR>
set list
set listchars=nbsp:•,tab:▸\ ,eol:¬,trail:·,extends:↷,precedes:↶

" Stifle many interruptive "Hit Enter" prompts
set shortmess=atI

" no help while aiming for esc :)
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" always save the buffer when loosing the focus
autocmd FocusLost * :wa

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
    " shift+L for searching http://vim.wikia.com/wiki/Searching
    set mousemodel=extend
endif

" Switch syntax highlighting on
syntax on

" turn on 256 colors in terminal on dark background
set t_Co=256
set background=dark
"set background=light

"let g:solarized_termcolors=16
let g:solarized_termcolors=256
"let g:solarized_visibility="high"
colorscheme solarized
"autocmd FileType mail colorscheme transparent

"{{{ Toggle dark/light background for solarized
nmap <leader>tb :call ToggleSolarized()<CR>
function! ToggleSolarized()
    if &background == "dark"
        set background=light
        colorscheme solarized
    else
        set background=dark
        colorscheme solarized
    endif
endfunc
"}}}


" switch on highlighting the last used search pattern.
set hlsearch

" for tex files only: swich working directory according to to file
autocmd FileType tex lcd %:p:h

autocmd FileType tex setlocal foldmethod=marker

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

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif


" LEADER COMMANDS

"{{{Tagbar configuration
let g:tagbar_autoclose = 1
" *t*oggle *o*utline
nmap <leader>to :TagbarToggle<CR>
"}}}


" fold HTML tag
nnoremap <leader>ft Vatzf

" reselect just pasted text
nnoremap <leader>v V`]

" use an additional ESC key in insert and visual mode
inoremap jj <ESC>
inoremap ZZ <ESC>:wq!<CR>

" open a new vertical split and switch over to it
nnoremap <leader>W <C-w>v<C-w>l

" better navigation
nnoremap <right> <space>
nnoremap <left> <BS>

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
    exec "!~/bin/scripts/browser.sh ".line
endfunction
" Open Url on this line with the browser \w
map <Leader>b :call Browser ()<CR>
"}}}

" Space +/- will toggle folds / down/up is next/prev fold
nmap <leader>+ zo
nmap <leader>- zc
nmap <leader><down> zj
nmap <leader><up> zk

" remap tab switch commands
nmap <leader><right> :tabnext<CR>
nmap <leader><left> :tabprevious<CR>
nmap <leader><Return> :tabnew<CR>

" edit vimrc on the fly
nmap <leader>rc :tabedit $MYVIMRC<CR>

" faster exit
nmap <leader>q :q<CR>
nmap <leader>Q :qa<CR>

" faster saving
nnoremap <leader>w :w<CR>

" Indent XML readably
function! DoPrettyXML()
    1,$!xmllint --format --recover -
endfunction
command! PrettyXML call DoPrettyXML()

" Version Controll stuff
nmap <leader>vA :VCSAnnotate<CR>
nmap <leader>vd :VCSDiff<CR>
nmap <leader>vl :VCSLog<CR>

" format stuff, nano emulation:)
"set formatprg=par\ q
nmap <leader>j Qip<CR>

" for mails only: format is based on highlightning
autocmd FileType MAIL nmap <leader>j Qiy<CR>
autocmd FileType mail setlocal spell
autocmd FileType mail setlocal spelllang=de_20,en_gb
nmap <C-J> Qipj<CR>

"{{{ prepare mail texts
function! MailPrepareText ()
    %s/>\n/\r/ge
    %s/> \n/\r/ge
endfunction
"}}}
"autocmd BufReadPost pico* call MailPrepareText ()

" *t*oggle *s*pelling / switch language
nmap <leader>ts :set spell!<CR>
set spelllang=en_gb
nmap <leader>sg :set spelllang=en_gb<CR>
nmap <leader>su :set spelllang=en_us<CR>
nmap <leader>sd :set spelllang=de_20<CR>


" turn on wrap for e.g. tex files
command! -nargs=* Wrap set wrap linebreak nolist
autocmd FileType tex Wrap
autocmd FileType markdown Wrap

" handy uppercase commands for german keyboards (: is used with shift)
command! -nargs=* Q q
command! -nargs=* W w

" Save a file you edited in vim without the needed permissions
" http://www.commandlinefu.com/commands/view/1204/save-a-file-you-edited-in-vim-without-the-needed-permissions
command! Sudow :w !sudo tee %

" remove trailing whitespaces in the complete file
command! -nargs=* StripTrailingWhitespaces :%s/\s\+$//

" cursor moves are on displayed lines rather than numbered lines
nmap <up> gk
nmap <down> gj

" PIV: no default folding
"let g:DisableAutoPHPFolding = 1

" toggle graphical undo visualization
nmap <leader>tu :GundoToggle<CR>

" NERDTree options
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.aux$', '\.log$']
nmap <leader>n :lcd %:p:h<CR>:NERDTreeToggle<CR>
nmap <leader>nn :lcd %:p:h<CR>:NERDTreeToggle<CR>
nmap <leader>nm :NERDTreeMirror<CR>

" MRU options
let MRU_Max_Entries=1000
let MRU_Exclude_Files='^/tmp/.*\|^/var/tmp/.*\|mutt-soljaris14.*\|COMMIT_EDITMSG$'
let MRU_File=$HOME . '/.vim/mru_files'
nmap <leader>l :MRU<CR>

" Snippets
function! OpenSnippetsForCurrentFile ()
    let filetype = &filetype
    "tabedit "~/.vim/snippets/" . filetype
    tabedit $HOME/.vim/snippets
endfunction

nmap <leader>rs :call OpenSnippetsForCurrentFile()<CR>
autocmd bufwritepost *.snippets call ReloadAllSnippets()

" To save, ctrl-w.
imap <c-w> <Esc>:w<CR>a

" Say a message
function! Say(msg)
    echohl IncSearch
    echo a:msg
    echohl None
endfunction

" Copy full buffer to OS clipboard.
function! CopyAll()
    normal mzggVG"+y'z
    call Say("Copied.")
endfunction
command! CopyAll call CopyAll()

" Delete buffer contents and Paste from OS clipboard.
function! PasteClipboard()
    normal ggVGd"+p1Gdd
    call Say("Pasted.")
endfunction
command! PasteClipboard call PasteClipboard()

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

" Markdown (no need for modula2 :)
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd FileType markdown nmap <leader>m :silent !viewMarkdown.sh %<CR>

" http://vim.wikia.com/wiki/Editing_crontab
set backupskip=/tmp/*,/private/tmp/*

" Precise Jump shortcut
nmap <leader><leader> _f

" go/change working directory - (g|G)o (f = file, r = root, h = home)
nmap <leader>gf :lcd %:p:h<CR>:pwd<CR>
nmap <leader>Gf :cd %:p:h<CR>:pwd<CR>
nmap <leader>gr :lcd $HOME/.vim/scripts/vcsroot.sh<CR>:pwd<CR>
nmap <leader>Gr :cd $HOME/.vim/scripts/vcsroot.sh<CR>:pwd<CR>
nmap <leader>gh :lcd $HOME<CR>:pwd<CR>
nmap <leader>Gh :cd $HOME<CR>:pwd<CR>

" PHP Specific options
" http://stackoverflow.com/questions/5130406/how-to-i-display-results-of-phpcs-in-vim
let php_sql_query=1     " Highlight sql in php strings
let php_htmlInStrings=1 " Highlight HTML in php strings
let php_noShortTags=1   " Disable PHP Short Tags
let php_folding=1       " Enable Ability to FOLD html Code

function! RunPhpcs()
    let l:filename=@%
    let l:phpcs_output=system('phpcs --report=csv --standard=Zend '.l:filename)
    let l:phpcs_list=split(l:phpcs_output, "\n")
    unlet l:phpcs_list[0]
    cexpr l:phpcs_list
    cwindow
endfunction

set errorformat+=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\"
command! Phpcs execute RunPhpcs()

" vim session config
" https://github.com/xolox/vim-session
let g:session_autoload="no"
let g:session_default_to_last=0
let g:session_autosave="no"

" syntastic options
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=2
"let g:syntastic_quiet_warnings=1
let g:syntastic_phpcs_disable = 1
nmap <leader>tc :SyntasticToggleMode<CR>

" CheckAttach
let g:checkattach_filebrowser='ranger'
let g:checkattach_once='y'

" http://vim.wikia.com/wiki/Encryption
" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
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

" source my private vimrc
source $HOME/.vim/vimrc.private
