" general {{{
    " Dark powered asynchronous completion framework for neovim/Vim8
    " VAMActivate github:Shougo/deoplete.nvim
    " Fast, Extensible, Async Completion Framework for Neovim
    VAMActivate github:roxma/nvim-completion-manager
    " Ranger integration in vim and neovim
    " VAMActivate github:francoiscabrol/ranger.vim
    " VAMActivate github:airodactyl/neovim-ranger
    " transparent editing of gpg encrypted files
    VAMActivate github:jamessan/vim-gnupg
    " The ultimate snippet solution for python enabled Vim.
    VAMActivate github:SirVer/ultisnips
    " A fixed solarized colorscheme for better truecolor support.
    VAMActivate github:icymind/NeoSolarized
    " Use the repeat command (.) with supported plugins
    VAMActivate github:tpope/vim-repeat
    " Use CTRL-A/X to increment dates, times, and more
    VAMActivate github:tpope/vim-speeddating
    " Press `<ENTER>` in normal mode to select the closest text object
    VAMActivate github:gcmt/wildfire.vim
    " Lean & mean status/tabline for vim that's light as air
    VAMActivate github:vim-airline/vim-airline
    VAMActivate github:vim-airline/vim-airline-themes
    " text filtering and alignment
    VAMActivate github:godlygeek/tabular
    " True Sublime Text style multiple selections
    VAMActivate github:terryma/vim-multiple-cursors
"}}}

" nerd-tree {{{
    " A tree explorer plugin for navigating the filesystem
    VAMActivate github:scrooloose/nerdtree
    " aims at making NERDTree feel like a true panel, independent of tabs
    VAMActivate github:jistr/vim-nerdtree-tabs
    " A plugin of NERDTree showing git status
    VAMActivate github:Xuyuanp/nerdtree-git-plugin
    " A plugin that adds some fugitive functionality directly to nerdtree for vim
    VAMActivate github:low-ghost/nerdtree-fugitive
" }}}

" searching {{{
    " a front for ag, A.K.A. the_silver_searcher.
    VAMActivate github:rking/ag.vim
    " Fold away lines not matching the last search pattern
    VAMActivate searchfold
    " visual mark, then press * or # to search
    VAMActivate github:bronson/vim-visual-star-search
    " Fuzzy file, buffer, MRU, and tag finder with regexp support
    VAMActivate github:ctrlpvim/ctrlp.vim
    " Takes a quickfix list and makes it editable
    VAMActivate github:Wolfy87/vim-enmasse
    " substitute preview
    VAMActivate github:osyo-manga/vim-over
"}}}

" motions / operators {{{
    " Delete/change/add parentheses/quotes/XML-tags/much more with ease
    VAMActivate github:tpope/vim-surround
    " Vim motions on speed!
    VAMActivate github:Lokaltog/vim-easymotion
    " Easy text exchange operator for
    VAMActivate github:tommcdo/vim-exchange
    " plugin to create your own text objects without pain
    VAMActivate github:kana/vim-textobj-user
"}}}

" programming {{{
    " Vim Liquid runtime files with Jekyll enhancements
    VAMActivate github:tpope/vim-liquid
    " Language Server Protocol (LSP) support for vim and neovim.
    VAMActivate github:autozimu/LanguageClient-neovim
    " A plugin for deoplete to get flow autocompletion functionality.
    " VAMActivate github:steelsojka/deoplete-flow
    " provides syntax highlighting, indenting, and some editing commands
    VAMActivate github:tpope/vim-cucumber
    " EditorConfig helps developers define and maintain consistent coding styles between different editors and IDEs
    VAMActivate github:editorconfig/editorconfig-vim
    " Syntax highlighting, matching rules and mappings for the original Markdown and extensions
    VAMActivate github:plasticboy/vim-markdown
    " generate table of contents for Markdown files
    VAMActivate github:mzlogin/vim-markdown-toc
    " Comment stuff out; takes a motion as a target
    VAMActivate github:tpope/vim-commentary
    " A Git wrapper so awesome, it should be illegal
    VAMActivate fugitive
    " A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks.
    VAMActivate github:airblade/vim-gitgutter
    " A Vim plugin for more pleasant editing on commit messages
    VAMActivate github:rhysd/committia.vim
    " Automatic syntax checking
    VAMActivate github:scrooloose/syntastic
    " extended % matching for HTML, LaTeX, and many other languages
    VAMActivate github:Firef0x/matchit
    " Extensible keyword swapper (turn yes to no, True to False and more)
    VAMActivate github:mjbrownie/swapit
    " a plugin for visually displaying indent levels
    VAMActivate github:nathanaelkane/vim-indent-guides
    " Semantic Web vim bundle
    VAMActivate github:niklasl/vim-rdf
    " VAMActivate github:seebi/semweb.vim
    " React JSX syntax highlighting and indenting for vim
    VAMActivate github:mxw/vim-jsx
    " RAML plugin for VIM
    VAMActivate github:kennethzfeng/vim-raml
    " This is a Vim plugin that provides Tern-based JavaScript editing support.
    " VAMActivate github:marijnh/tern_for_vim
    " dockerfile syntax
    VAMActivate github:ekalinin/Dockerfile.vim
"}}}

" mailing {{{
    " Check for attachments when writing mails with mutt
    VAMActivate github:chrisbra/CheckAttach
    " Erase signatures at the end of your replies
    VAMActivate Mail_Sig.set
    " Easily insert references to URLs in emails
    VAMActivate uri-ref
"}}}

" syntaxes {{{
      VAMActivate github:Glench/Vim-Jinja2-Syntax
    " VAMActivate applescript.vim
    " VAMActivate logstash
    " VAMActivate syntaxconkyrc
    VAMActivate github:coddingtonbear/confluencewiki.vim
"}}}

" currently not needed {{{
    " VAMActivate JSON
    " VAMActivate conque
    " VAMActivate vim-abolish
    " VAMActivate vim-orgmode
    " VAMActivate groovy.vim
    " VAMActivate vim-ragtag
    " VAMActivate easychair
    " VAMActivate md5
    " VAMActivate vim-dict
    " VAMActivate utl.vim
    " VAMActivate dash.vim
    " VAMActivate delimitMate
    " VAMActivate MRU           " Plugin to manage Most Recently Used (MRU) files
    " Extra syntax and highlight for nerdtree files
    " VAMActivate github:tiagofumo/vim-nerdtree-syntax-highlight
    " Adds file type glyphs/icons to many popular Vim plugins such as: NERDTree ...
    " VAMActivate github:ryanoasis/vim-devicons
    " Visualize your undo tree
    " VAMActivate github:sjl/gundo.vim
    " lightweight implementation of emacs' kill ring for vim
    " VAMActivate github:maxbrunsfeld/vim-yankstack
    " Supertab allows you to use <Tab> for all your insert completion needs
    " VAMActivate github:ervandew/supertab
    " fast, as-you-type, fuzzy-search code completion engine for Vim
    " VAMActivate github:valloric/youcompleteme
    " The fancy start screen for Vim
    " VAMActivate github:mhinz/vim-startify
"}}}

