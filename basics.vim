
set nocompatible
filetype indent plugin on
syntax on

set undodir=$HOME/.vim/undos
set undofile        " new feature of undo files

set directory=$HOME/.vim/swap " no more swapfiles in the same directory
set backupdir=$HOME/.vim/backups " no more backupfiles in the same directory
set backupskip=/tmp/*,/private/tmp/* " http://vim.wikia.com/wiki/Editing_crontab

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

set colorcolumn=85 " a ruler to indicate line breaks
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set backup " keep a backup file
set scrolloff=99 " Minimal number of screen lines to keep above and below the cursor
set history=1000 " keep xxx lines of command line history
set showmode
set showcmd " display incomplete commands
set incsearch " do incremental searching

set spelllang=de_20,en_gb

" command-line completion menu
set wildmenu
set wildmode=list:longest,full
"
" ignore list e.g. for command-t plugin
set wildignore+=*.o,*.obj
set wildignore+=*.aux,*.bbl,*.blg,*.toc,*.out,*.bak,*.mtc0,*.maf,*.mtc
set wildignore+=*.dvi,*.pdf
set wildignore+=*.jpg,*.png,*.tiff

set visualbell " no beep but visual bell
set cursorline " Highlight the screen line of the cursor
set cursorcolumn " Highlight the screen column of the cursor
set ttyfast " Indicates a fast terminal connection.
set ruler " Show the line and column number of the cursor position
set laststatus=2 " = always

set relativenumber " Show the line number relative to the line with the cursor
set number         " show absolute number in addition to relative one

set hlsearch " switch on highlighting the last used search pattern.
set ignorecase " case-sensitive search intelligently
set smartcase " all lower -> insensitive, on upper case -> sensitive
" searches use normal regexes
nnoremap / /\v
vnoremap / /\v

set gdefault " applies substitutions globally on lines

" handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1

set list " show some invisible chars
set listchars=nbsp:•,tab:▸\ ,eol:¬,trail:·,extends:↷,precedes:↶

" Stifle many interruptive "Hit Enter" prompts
set shortmess=atI

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
    " shift+L for searching http://vim.wikia.com/wiki/Searching
    set mousemodel=extend
endif

" set font for gvim or macvim
" set guifont=Inconsolata-dz\ for\ Powerline:h15

set t_Co=256 " turn on 256 colors in terminal on dark background
set background=dark
" set background=light

" standard folding is marker based unless changed by plugins
set foldmethod=marker
