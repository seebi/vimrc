" based on the example vimrc file as well as

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
"set modelines=0

" http://vimcasts.org/episodes/tabs-and-spaces/
" 4 spaces expanded and backspace deletes 4 spaces too
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" gvim font
"set guifont=Monospace\ 14
"set guifont=Monaco\ 14
set guifont=Inconsolata\ Medium\ 16

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
set ttyfast         " Indicates a fast terminal connection.
set ruler           " Show the line and column number of the cursor position
set laststatus=2    " = always
set laststatus=2

" Status line
"set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
set statusline=
set statusline+=%-3.3n\                         " buffer number
set statusline+=%f\                             " filename
set statusline+=%h%m%r%w                        " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}]    " file type
set statusline+=%=                              " right align remainder
set statusline+=0x%-8B                          " character value
set statusline+=%-14(%l,%c%V%)                  " line, character
set statusline+=%<%P                            " file position

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


" Show the line number relative to the line with the cursor
set relativenumber
" toggle numbers (e.g. for copy and paste to another window)
nmap <leader>tn :set relativenumber!<CR>

set undofile        " new feature of undo files
set undodir=/home/seebi/.vim/undos

" no more backupfiles in the same directory
set backupdir=/home/seebi/.vim/backups

" no more swapfiles in the same directory
set directory=/home/seebi/.vim/swap

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
set colorcolumn=85

" show invisible chars (*t*oggle *l*ist)
nmap <leader>tl :set list!<CR>
set list
set listchars=tab:▸\ ,eol:¬,trail:·,extends:↷,precedes:↶

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
endif

" turn on 256 colors in terminal
set t_Co=256
colorscheme transparent
"colorscheme darkzen

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" for tex files only: swich working directory according to to file
autocmd FileType tex lcd %:p:h

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

" save files with +x when a shebang is found on line 1
" http://www.commandlinefu.com/commands/view/7039/vi-config-to-save-files-with-x-when-a-shebang-is-found-on-line-1
"au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod +x <afile> | endif | endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" LEADER COMMANDS

"{{{Taglist configuration
" *t*oggle *o*utline
nnoremap <leader>to :TlistToggle<cr>
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Close_On_Select = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Display_Tag_Scope = 1
let tlist_tex_settings='latex;s:section;c:chapter;b:bibitem;c:command;l:label;r:ref'
"}}}


" fold HTML tag
nnoremap <leader>ft Vatzf

" reselect just pasted text
nnoremap <leader>v V`]

" use an additional ESC key in insert and visual mode
inoremap jj <ESC>
vnoremap jj <ESC>
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
    exec "!/home/seebi/bin/scripts/browser.sh ".line
endfunction
" Open Url on this line with the browser \w
map <Leader>b :call Browser ()<CR>
"}}}

" Space will toggle folds!
" nnoremap <space> za

" remap tab switch commands
nmap <leader><right> :tabnext<CR>
nmap <leader><left> :tabprevious<CR>
nmap <leader><Return> :tabnew<CR>

" edit vimrc on the fly
nmap <leader>rc :tabedit $MYVIMRC<CR>

" faster exit
nmap <leader>q :q<CR>

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
set formatprg=par\ q
nmap <leader>j Qip<CR>

" for mails only: format is based on highlightning
autocmd FileType MAIL nmap <leader>j Qiy<CR>
autocmd FileType mail setlocal spell
autocmd FileType mail setlocal spelllang=de_20
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
noremap <leader>tu :GundoToggle<CR>

" NERDTree options
let NERDTreeShowBookmarks=1
nmap <leader>n :lcd %:p:h<CR>:NERDTreeToggle<CR>

" MRU options
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
let MRU_File = '/home/seebi/.vim/mru_files'
nmap <leader>l :MRU<CR>

" Snippets
function! OpenSnippetsForCurrentFile ()
    let filetype = &filetype
    "tabedit "/home/seebi/.vim/snippets/" . filetype
    tabedit /home/seebi/.vim/snippets
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
