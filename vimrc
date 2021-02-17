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

let NVIMHOME = $HOME . "/.config/nvim/"

execute "source " . NVIMHOME . "autocmds.vim"
execute "source " . NVIMHOME . "basics.vim"
execute "source " . NVIMHOME . "mappings.vim"
execute "source " . NVIMHOME . "commands.vim"

execute "source " . NVIMHOME . "addons-setup.vim"
execute "source " . NVIMHOME . "addons-list.vim"
execute "source " . NVIMHOME . "addons-config.vim"

execute "source " . NVIMHOME . "private.vim"

if has('nvim')
    execute "source " . NVIMHOME . "neovim.vim"
endif

