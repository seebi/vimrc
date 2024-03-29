
" <space> is easier than \
let mapleader = " "

" toggle numbers (e.g. for copy and paste to another window)
nmap <leader>tn :set relativenumber!<CR>

" show invisible chars (*t*oggle *l*ist)
nmap <leader>tl :set list!<CR>
"
" Don't use Ex mode, use Q for formatting
map Q gq

" togglq quick fix window
nmap <leader>tq :cwindow<CR>

" fold HTML tag
nnoremap <leader>ft Vatzf

" reselect just pasted text
nnoremap <leader>v V`]

" use an additional ESC key in insert and visual mode
inoremap jj <ESC>
inoremap ZZ <ESC>:wq!<CR>

" open a new vertical split and switch over to it
nnoremap <leader>W <C-w>v<C-w>l

" cursor moves are on displayed lines rather than numbered lines
nmap <up> gk
nmap <down> gj

" better navigation
nnoremap <right> <space>
nnoremap <left> <BS>

" Space +/- will toggle folds / down/up is next/prev fold
nmap <leader>+ zo
nmap <leader>- zc
nmap <leader><down> zj
nmap <leader><up> zk

" remap tab switch commands
nmap <leader><right> :tabnext<CR>
nmap <leader><left> :tabprevious<CR>

" edit vimrc on the fly
nmap <leader>rc :tabedit $MYVIMRC<CR>

" faster exit
nmap <leader>q :q<CR>
nmap <leader>Q :qa<CR>

" faster saving
nnoremap <leader>w :w<CR>

" toggle spelling / switch language
nmap <leader>ts :set spell!<CR>
nmap <leader>sg :set spelllang=en_gb<CR>
nmap <leader>su :set spelllang=en_us<CR>
nmap <leader>sd :set spelllang=de_20<CR>
nmap <leader>sb :set spelllang=de_20,en_gb<CR>

" go/change working directory - (g|G)o (f = file, r = root, h = home)
nmap <leader>gf :lcd %:p:h<CR>:pwd<CR>
nmap <leader>Gf :cd %:p:h<CR>:pwd<CR>
nmap <leader>gh :lcd $HOME<CR>:pwd<CR>
nmap <leader>Gh :cd $HOME<CR>:pwd<CR>

" Move visual block
" https://vimrcfu.com/snippet/77
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" MD: mark as code
xmap <leader>c S`
nmap <leader>c ysiw`
