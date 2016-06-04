" based on the example vimrc file as well as
"
" - http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" - http://stackoverflow.com/questions/164847/what-is-in-your-vimrc
" - http://weierophinney.net/matthew/archives/249-Vim-Toolbox,-2010-Edition.html
" - http://items.sjbach.com/319/configuring-vim-right
" - http://spf13.com/post/ultimate-vim-config
" - https://github.com/swaroopch/dotvim/blob/master/vimrc
" - http://amix.dk/vim/vimrc.html

let NVIM_LISTEN_ADDRESS=$NVIM_LISTEN_ADDRESS

source $HOME/.vim/basics.vim
source $HOME/.vim/mappings.vim
source $HOME/.vim/autocmds.vim
source $HOME/.vim/commands.vim

source $HOME/.vim/addons-setup.vim
source $HOME/.vim/addons-list.vim
source $HOME/.vim/addons-config.vim

source $HOME/.vim/private.vim

if has('nvim')
    source $HOME/.vim/neovim.vim
endif

